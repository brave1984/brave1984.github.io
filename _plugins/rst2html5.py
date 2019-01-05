#!/usr/bin/env python3
# -*- coding: utf8 -*-
# :Copyright: © 2015 Günter Milde.
# :License: Released under the terms of the `2-Clause BSD license`_, in short:
#
#    Copying and distribution of this file, with or without modification,
#    are permitted in any medium without royalty provided the copyright
#    notice and this notice are preserved.
#    This file is offered as-is, without any warranty.
#
# .. _2-Clause BSD license: http://www.spdx.org/licenses/BSD-2-Clause
#
# Revision: $Revision: 7847 $
# Date: $Date: 2015-03-17 17:30:47 +0000 (Tue, 17 Mar 2015) $

"""
A minimal front end to the Docutils Publisher, producing HTML 5 documents.

The output also conforms to XHTML 1.0 transitional
(except for the doctype declaration).
"""

try:
    import locale  # module missing in Jython

    locale.setlocale(locale.LC_ALL, '')
except locale.Error:
    pass

import sys

from docutils.core import publish_parts

import directive  # 导入自定义指令

settings = {'syntax_highlight': 'short',
            'initial_header_level': 2,
            'raw_enabled': False, }


def converter(source, part="html_body"):
    parts = publish_parts(
        source,
        writer_name='html5',
        settings_overrides=settings)
    return parts.get(part, '')


if __name__ == "__main__":
    print(converter(sys.stdin.read()))