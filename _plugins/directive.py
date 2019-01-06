from docutils import nodes
from docutils.utils import SystemMessagePropagation
from docutils.parsers.rst import directives, Directive
from docutils.parsers.rst.directives import tables


class ResponsiveTable(tables.Table):
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
        table_node['classes'] += self.options.get(
            'class', [
                'table', 'table-responsive-sm', 'table-sm', 'table-striped'])
        self.add_name(table_node)
        if title:
            table_node.insert(0, title)
        return [table_node] + messages



#directives.register_directive('table', Table)
directives.register_directive('table', ResponsiveTable)
