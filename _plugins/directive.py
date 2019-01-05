from docutils import nodes
from docutils.utils import SystemMessagePropagation
from docutils.parsers.rst import directives, Directive


class Table(Directive):

    optional_arguments = 1
    final_argument_whitespace = True
    option_spec = {'class': directives.class_option,
                   'name': directives.unchanged}
    has_content = True

    def make_title(self):
        if self.arguments:
            title_text = self.arguments[0]
            text_nodes, messages = self.state.inline_text(title_text,
                                                          self.lineno)
            title = nodes.title(title_text, '', *text_nodes)
            (title.source,
             title.line) = self.state_machine.get_source_and_line(self.lineno)
        else:
            title = None
            messages = []
        return title, messages

    def check_table_dimensions(self, rows, header_rows, stub_columns):
        if len(rows) < header_rows:
            error = self.state_machine.reporter.error(
                '%s header row(s) specified but only %s row(s) of data '
                'supplied ("%s" directive).'
                % (header_rows, len(rows), self.name), nodes.literal_block(
                    self.block_text, self.block_text), line=self.lineno)
            raise SystemMessagePropagation(error)
        if len(rows) == header_rows > 0:
            error = self.state_machine.reporter.error(
                'Insufficient data supplied (%s row(s)); no data remaining '
                'for table body, required by "%s" directive.'
                % (len(rows), self.name), nodes.literal_block(
                    self.block_text, self.block_text), line=self.lineno)
            raise SystemMessagePropagation(error)
        for row in rows:
            if len(row) < stub_columns:
                error = self.state_machine.reporter.error(
                    '%s stub column(s) specified but only %s columns(s) of '
                    'data supplied ("%s" directive).' %
                    (stub_columns, len(row), self.name), nodes.literal_block(
                        self.block_text, self.block_text), line=self.lineno)
                raise SystemMessagePropagation(error)
            if len(row) == stub_columns > 0:
                error = self.state_machine.reporter.error(
                    'Insufficient data supplied (%s columns(s)); no data remaining '
                    'for table body, required by "%s" directive.'
                    % (len(row), self.name), nodes.literal_block(
                        self.block_text, self.block_text), line=self.lineno)
                raise SystemMessagePropagation(error)

    def run(self):
        if not self.content:
            warning = self.state_machine.reporter.warning(
                'Content block expected for the "%s" directive; none found.'
                % self.name, nodes.literal_block(
                    self.block_text, self.block_text), line=self.lineno)
            return [warning]
        title, messages = self.make_title()
        node = nodes.Element()  # anonymous container for parsing
        self.state.nested_parse(self.content, self.content_offset, node)
        if len(node) != 1 or not isinstance(node[0], nodes.table):
            error = self.state_machine.reporter.error(
                'Error parsing content block for the "%s" directive: exactly '
                'one table expected.' % self.name, nodes.literal_block(
                    self.block_text, self.block_text), line=self.lineno)
            return [error]
        table_node = node[0]
        table_node['classes'] += self.options.get('class', ['table', 'table-responsive-sm', 'table-sm', 'table-striped', 'flex-grow-0'])
        self.add_name(table_node)
        if title:
            table_node.insert(0, title)
        return [table_node] + messages


directives.register_directive('table', Table)
