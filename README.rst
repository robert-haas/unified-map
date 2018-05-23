Unified Map
###########

Unified
    *Many implementations, one way of access.*
Map
    *Apply a function to a list of arguments and collect the results
    -- serial, parallel or distributed.*

This package provides reasonably simple syntax for a frequent programming task
which is implemented in various places (built-in, standard library, external libraries).
Here are three descriptions of this task:

- `Map <https://en.wikipedia.org/wiki/Map_(higher-order_function)>`_
  a list of inputs to a list of results via a user-provided function.
- `Apply <https://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.apply.html>`_
  a given function to a list of arguments to get a list of return values in the same order.
- `A black-box function <https://en.wikipedia.org/wiki/Black_box>`_
  is evaluated with different inputs and the outputs are collected.

In general, this is a so-called
`"pleasingly parallel problem" <https://en.wikipedia.org/wiki/Embarrassingly_parallel>`_
(aka "embarrassingly parallel" or "pleasingly parallel")
because it is straightforward to separate it into independend subtasks.
For this reason, and due to its frequent occurrence, it is recognized as a
`programming idiom <https://en.wikipedia.org/wiki/Map_(parallel_pattern)>`_
("parallel map", "parallel for loop")
in **parallel computing** that can equally simple be applied in **distributed computing**.
This package allows to do so with a focus on simplicity of use.


Project references
==================

+----------------+-------------------------------------------------------------------------------------------------+
| Documentation  | `GitHub Page <https://robert-haas.github.io/unified-map>`_                                      |
+----------------+-------------------------------------------------------------------------------------------------+
|                | .. image:: https://img.shields.io/badge/built-with%20Sphinx-blue.svg                            |
|                |    :target: http://www.sphinx-doc.org                                                           |
|                |    :alt: Built with Sphinx                                                                      |
+----------------+-------------------------------------------------------------------------------------------------+
| Source code    | `GitHub <https://github.com/robert-haas/unified-map>`_                                          |
+----------------+-------------------------------------------------------------------------------------------------+
|                | .. image:: https://img.shields.io/badge/license-Apache%202.0-blue.svg                           |
|                |    :target: https://www.apache.org/licenses/LICENSE-2.0                                         |
|                |    :alt: License Apache 2.0 |                                                                   |
|                |                                                                                                 |
|                | .. image:: https://img.shields.io/github/release/robert-haas/unified-map.svg                    |
|                |    :target: https://github.com/robert-haas/unified-map/releases                                 |
|                |    :alt: Release version |                                                                      |
|                |                                                                                                 |
|                | .. image:: https://img.shields.io/github/release-date/robert-haas/unified-map.svg               |
|                |    :target: https://github.com/robert-haas/unified-map/releases                                 |
|                |    :alt: Release date                                                                           |
+----------------+-------------------------------------------------------------------------------------------------+
| Package        | `PyPI <https://pypi.org/project/unified_map>`_                                                  |
+----------------+-------------------------------------------------------------------------------------------------+
|                | .. image:: https://img.shields.io/pypi/pyversions/unified_map.svg                               |
|                |    :target: https://pypi.org/project/unified_map                                                |
|                |    :alt: Python versions |                                                                      |
|                |                                                                                                 |
|                | .. image:: https://img.shields.io/pypi/status/unified_map.svg                                   |
|                |    :target: https://pypi.org/project/unified_map                                                |
|                |    :alt: Status |                                                                               |
|                |                                                                                                 |
|                | .. image:: https://img.shields.io/pypi/format/unified_map.svg                                   |
|                |    :target: https://pypi.org/project/unified_map                                                |
|                |    :alt: Format                                                                                 |
+----------------+-------------------------------------------------------------------------------------------------+
| Authors        | `Robert Haas <https://github.com/robert-haas>`_                                                 |
+----------------+-------------------------------------------------------------------------------------------------+
|                | .. image:: https://img.shields.io/badge/profile-on%20GitHub-brightgreen.svg                     |
|                |    :target: https://github.com/robert-haas                                                      |
|                |    :alt: Profile on GitHub |                                                                    |
|                |                                                                                                 |
|                | .. image:: https://img.shields.io/badge/email-at%20protonmail-brightgreen.svg                   |
|                |    :target: mailto:robert.haas@protonmail.com                                                   |
|                |    :alt: e-Mail: robert.haas@protonmail.com                                                     |
+----------------+-------------------------------------------------------------------------------------------------+
