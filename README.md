# codegolf-cookbook

This is a chef and test-kitchen wrapper around the codegolf source that Daniel Fone built for Railscamp NZ 2014. The original repository is [Here](https://github.com/danielfone/railscamp-codegolf).

This currently installs rbenv, ruby 2.1.0, the required user and pulls in the other repo. It also links that to /vagrant/webapp and runs bundle install, and db migrations.

There are further commands (yet) to automate, which are referenced in the original repo.

## Supported Platforms

The test kitchen config currently uses ubuntu 12.04.

## Usage

### codegolf::default

Include `codegolf` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[codegolf::default]"
  ]
}
```

This should do all of the work for you.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Mathew Hartley (<matt@route66.sytes.net>)
