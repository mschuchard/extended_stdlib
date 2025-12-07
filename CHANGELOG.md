# 1.3.1
- Fix docstrings issues.
- Input parameter validation for `drop`, `center`, `sqrt`, `sample`, `transpose`, and `log` functions.
- Error when `intersect` and `start_with` are not supported in Ruby version.
- Minor code optimization.

# 1.3.0
- Add functions: http_get.
- Fix config file assignment in `csr_attributes` task.
- Correct `imperative` return type and validate resource declaration when input type is Array.
- Validate current `csr_attributes` exist (if necessary) in its task.
- Fix `script` DRT `command` and add sane default for `file_attr`.

# 1.2.1
- Fixes for imperative function.
- Update intersect function for removal in Ruby 3.0.
- Officially support Puppet 8.

# 1.2.0
- Add functions: truncate, exp, log, next, sqrt, translate.
- Add fact: powershell_version.

# 1.1.1
- Expand `script` DRT functionality.
- Improve and cleanup custom functions.
- Expand `imperative` function experimental functionality.

# 1.1.0
- Add functions: end_with, center, start_with, ascii_only.
- Add defined resource types: script.
- Add Puppet functions: imperative (beta).

# 1.0.0
- Full initial release.

# 0.9.2
- Release candidate release.

# 0.9.1
- Second beta release.

# 0.9.0
- Initial beta release.
