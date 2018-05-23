- Docstrings were written in Google style. Sphinx supports them via Napoleon.
  - http://google.github.io/styleguide/pyguide.html#Comments
  - http://sphinxcontrib-napoleon.readthedocs.io/en/latest/index.html#id1
  - http://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html#example-google

- Optional arguments are indicated with brackets [] in Python's documentation.
  With Sphinx autodoc extension this seems not to be possible.
  - https://stackoverflow.com/questions/17380701/make-sphinxs-autodoc-show-default-values-in-parameters-description

- Type hints in function signatures where considered for documentation but not used
  because Sphinx did not produce desired output (tried with different extensions) and
  the type hint syntax is rather verbose and does not blend in well with Python.
