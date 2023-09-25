[![CI/CD](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml/badge.svg)](https://github.com/rontosoft/noir-json-parser-tests/actions/workflows/main.yml)

# noir-json-parser-tests
A library of tests covering the functionality provided by the `noir-json-parser` library. The tests are written in the Noir programming language and are designed to ensure the correct parsing and conversion of JSON data.

<br>

## Structure

Here is [an UML diagram](https://www.plantuml.com/plantuml/umla/VL9VYnCn47_FfnZkGRPuVT0N9PRb52gSIa_edQ1IZjnshYwcIKXcJnVnkpl99ZILqgTDPdv_VZkPgq3Aqx3NGdHQXG2VlNNeQLnyN7wzNrz_Mrx2bxUVxfRftC8V0V0SVk8euVlm-WqKr2RLdvGUC7SAg_GC_cfc4jQe7yNVudPdEci2UTKRt1Rh_qngwNAVrtBfxdnlg7cs7mW2rsO7Zm_hczMYJlym4eQSyZXV85RPIU3ln2WE4R13EZsKXfDEdDWklFE3ZF6SjsGxgu5dyCJG74-5TzRgnQfjwg2h3MlUEEgjMJnmlytOzptgxJbm0XJqjI7SeJ-7xr-yV7KSpoaVSCgMZcaqzppMeW9PfjHPBfPEFkxcy33Py7PwboWVx1xvtjnEpptBPMCDHbgKbdA71FFv54NAz66tJcaTe1LrES9EXeXuZugG6I1EGvXRmrKWNXmuH6Yi1_nDw0qxZxDBg4GYSWZevxrn0q7P051cMoq1foqEKgOVPjEsR0ERNWI7NVyu0lr0eD7XXIXD1kRv2N65PZlizJy0) detailing library interface, methods, structs and information flow. Note that it is still being refined.

The tests are organized into two main modules: `parse` and `convert`

<br>

### Parse

The `parse` module contains tests for parsing JSON data. It includes tests for different types of JSON data such as:

- Single property in `src/parse/single_property.nr`
- Multiple properties in `src/parse/multi_property.nr`
- Various types of numbers, including exponents in `src/parse/number.nr`, `src/parse/exponent.nr`, and `src/parse/fractional.nr`
- Literal values `null`, `true`, and `false` in `src/parse/literal.nr`
- Strings, including those with special characters in `src/parse/string.nr`

<br>

### Convert

The `convert` module contains tests for converting JSON data into different types. It includes tests for:

- `bool` in `src/convert/asBool.nr`
- `i127` in `src/convert/asInteger.nr`
- `Field` in `src/convert/asField.nr`

<br>

## Running Tests

Tests run automatically on a PR to the `main` branch. See below for contributing.

<br>

## Contributing

If you want to run specific tests on the private repo, get in touch with the owners via Discord to get approved as a collaborator. You can then create a PR to the `main` branch with your custom tests and the Github action will execute them.

<br>

## License

This project is yet unlicensed.
