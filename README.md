# Escola LMS

Laravel Headless LMS REST API.

[![swagger](https://img.shields.io/badge/documentation-swagger-green)](https://escola-lms-api.stage.etd24.pl/api/documentation)
[![phpunit](https://github.com/EscolaLMS/API/actions/workflows/phpunit-tests.yml/badge.svg)](https://github.com/EscolaLMS/API/actions/workflows/phpunit-tests.yml)
[![downloads](https://img.shields.io/packagist/dt/escolalms/api)](https://packagist.org/packages/escolalms/api)
[![downloads](https://img.shields.io/packagist/v/escolalms/api)](https://packagist.org/packages/escolalms/api)
[![downloads](https://img.shields.io/packagist/l/escolalms/api)](https://packagist.org/packages/escolalms/api)
[![Maintainability](https://api.codeclimate.com/v1/badges/68b4fbde49bcd465e482/maintainability)](https://codeclimate.com/github/EscolaLMS/API/maintainability)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FEscolaLMS%2FAPI.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FEscolaLMS%2FAPI?ref=badge_shield)
[![Known Vulnerabilities](https://snyk.io/test/github/EscolaLMS/API/badge.svg)](https://snyk.io/test/github/EscolaLMS/API)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=EscolaLMS_API&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=EscolaLMS_API)

## Packages

List of all packages is available at [packagist.org/?query=escolalms](https://packagist.org/?query=escolalms).

## Tests

Just run `phpunit` to test all the packages.

Summary code coverage from all the packages:

[![cc](https://raw.githubusercontent.com/EscolaLMS/.github/main/api-tests/cc-badge.svg)](https://github.com/EscolaLMS/API/actions/workflows/phpunit-cc.yml)
[![Tests Code Coverage](https://github.com/EscolaLMS/API/actions/workflows/phpunit-cc.yml/badge.svg)](https://github.com/EscolaLMS/API/actions/workflows/phpunit-cc.yml)
[![cc](https://raw.githubusercontent.com/EscolaLMS/.github/main/api-tests/cc-tests.svg)](https://github.com/EscolaLMS/API/actions/workflows/phpunit-cc.yml)
[![cc](https://raw.githubusercontent.com/EscolaLMS/.github/main/api-tests/cc-assertions.svg)](https://github.com/EscolaLMS/API/actions/workflows/phpunit-cc.yml)

## Installation

You should consider install with our [installation package](https://docs.wellms.io/getting-started/guide.html).

To install default docker environment either clone this repo or use

```bash
composer create-project escolallms/api escola-lms
```

### Postgres (default)

```sh
make init
```

### Mysql

```
make init-mysql
```

## Demo & Credentials

| Role    | Email ID              | Password |
| ------- | --------------------- | -------- |
| Admin   | admin@escolalms.com   | secret   |
| Tutor   | tutor@escolalms.com   | secret   |
| Student | student@escolalms.com | secret   |

## Demo

[https://api-stage.escolalms.com/api/documentation](https://api-stage.escolalms.com/api/documentation)

This is fully working demo. **Note** that content is regenerated every day - it's a seeder that is not persistent, every day database and files are cleared and rebuilt from skratch.

## Test

There are hundreds of tests in the packages and they are divided into:

### Integration packages test

Each packge contains their own php integration test this repo runs all of the

To run use `./vendor/bin/phpunit`

### End-to-end tests

[Cypress.io](https://docs.cypress.io/) is running end-to-end tests

To launch those use `yarn && yarn run cypress open`

You can see the results in the [cypress dashboard](https://dashboard.cypress.io/projects/kmx5cw/runs) including video artifacts

## Tasks

See [makefile](makefile) for all available devops tasks

- `make test-phpunit`
- `make bash`
- `make composer-update`
- `make swagger-generate`
- `make migrate-fresh`
- `make switch-to-postgres`
- `make switch-to-mysql`
- `make migrate-mysql`
- `make migrate-postgres`
- `make test-phpunit-postgres`
- `make test-phpunit-mysql`
- `make init`
- `make init-mysql`
- `make init-postgres`

## License

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FEscolaLMS%2FAPI.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FEscolaLMS%2FAPI?ref=badge_large)
