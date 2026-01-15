# mk

A CLI tool to create new projects from templates.

## Install

```bash
gem install mk
```

## Usage

```bash
mk <template_name> <project_name>
```

This will:
1. Copy the template to `./<project_name>`
2. Replace `ExampleGem` with your project's constant name (e.g., `MyProject`)
3. Replace `examplegem` with your project name (e.g., `my_project`)
4. Rename any files containing these placeholders

### Example

```bash
mk ruby my_awesome_gem
```

Creates a new directory `my_awesome_gem` from the `ruby` template with all placeholders replaced.

## Templates

Templates are searched in this order:

1. `~/templates/<template_name>` - Your local templates (takes priority)
2. Bundled templates included with the gem

To override a bundled template, create one with the same name in `~/templates/`.

### Creating Templates

Templates are regular directories containing your project boilerplate. Use these placeholders:

- `ExampleGem` - Replaced with the constant name (e.g., `MyAwesomeGem`)
- `examplegem` - Replaced with the project name (e.g., `my_awesome_gem`)

Placeholders work in both file contents and file/directory names.

## Contributing

Bug reports and pull requests are welcome on GitHub.

## Development

After checking out the repo:

```bash
bin/setup
bundle exec rake test
```

Generate documentation:

```bash
bundle exec yard doc
bundle exec yard server  # Browse at http://localhost:8808
```

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).
