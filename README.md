# Extended Stdlib

- [Overview](#overview)
- [Module Description](#module-description)
- [Setup](#setup)
- [Usage](#usage)
- [Reference](#reference)
  - [Facts](#facts)
- [Limitations](#limitations)
- [Contributing](#contributing)

## Overview

This module provides an extra set of extensions and expanded functionality for Puppet modules beyond that which is covered by `stdlib`.

## Module Description

This Puppet module adds extra facts, functions, types and providers, defined resource types, tasks, and plans to Puppet. These should not overlap with the functionality provided by the `stdlib` module or core Puppet. These are also likely to be overall at least slightly less useful than those provided in `stdlib`.

## Setup

[Install](https://puppet.com/docs/puppet/latest/modules_installing.html) the `extended_stdlib` module to add the functionality to Puppet. Pluginsync will automatically ensure the functionality prior to the next catalog application.

If you are authoring a module that depends on `extended_stdlib`, then be sure to [specify dependencies](https://puppet.com/docs/puppet/latest/modules_installing.html) in your `metadata.json`.

## Usage

These are all automatically loaded by Puppet via pluginsync.

## Reference

Please see the [Reference](REFERENCE.md) for generated documentation.

### Facts

#### `powershell_version`

Returns the semantic Powershell version on a Windows system.

#### `subnet`

Returns the ipv4-based subnet for the system.

## Limitations

The Ruby code is tested primarily with versions synced with Puppet 7 and 8. Compatibility with Ruby versions synced with 5 and 6 is desired, but not guaranteed. Please open an issue if an incompatibility is encountered.

## Contributing

Code should pass all current tests. New features should include new tests. Adherence to Ruby and Puppet style standards is expected where not overly onerous or where the check is of dubious cost/benefit.

Please consult the GitHub Project for the current development roadmap.
