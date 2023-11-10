[![CI/CD](https://github.com/RontoSOFT/noir-json-parser-tests/actions/workflows/main.yml/badge.svg)](https://github.com/RontoSOFT/noir-json-parser-tests/actions/workflows/main.yml)
# noir-json-parser-tests
A library of tests covering the functionality provided by the `noir-json-parser` library. The tests are written in the Noir programming language and are designed to ensure the correct parsing and conversion of JSON data.

<br>

## Structure

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

- `bool` in `src/convert/boolean.nr`
- `i127` in `src/convert/integer.nr`
- `Field` in `src/convert/field.nr`

<br>

## Running Tests

Tests run automatically on a PR to the `main` branch. See below for contributing.

<br>

## Contributing

If you want to run specific tests on the private repo, get in touch with the owners via Discord to get approved as a collaborator. You can then create a PR to the `main` branch with your custom tests and the Github action will execute them.

<br>

## License

This project is yet unlicensed.
