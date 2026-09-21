# Contributing

Thanks for helping maintain `acts_as_favable`.

## Setup

```bash
bundle install
bundle exec rake test
```

The default development bundle uses Rails 8.1 on Ruby 3.2+ and Rails 7.2 on Ruby 3.1.

To exercise another supported Rails series explicitly:

```bash
RAILS_VERSION=7.2 bundle exec rake test
RAILS_VERSION=8.0 bundle exec rake test
RAILS_VERSION=8.1 bundle exec rake test
```

## Expectations

Changes should preserve the small public API unless a breaking change is intentional and documented. Bug fixes should include a regression test. Generator changes should include generator coverage and should work with every Rails series in the CI matrix.

Keep Active Record behavior delegated to Rails where possible, especially for associations, STI, polymorphic types, and migrations. Avoid introducing application-level dependencies that are not required by the gem itself.

## Pull requests

Please include:

- A concise description of the problem and approach.
- Tests for behavior changes.
- Documentation updates when public behavior changes.
- An entry under `Unreleased` in `CHANGELOG.md` for user-visible changes.

Run `bundle exec rake test` before opening a pull request.
