
## Prerequisites

- Ruby 3.0.0
- Rails 7.0.4.3
- mysql

## Installation

Clone the github repository

```bash
git clone https://github.com/ZamanWork/minesweepersgame.git
```

Install dependencies

```bash
bundle install
```


### Database setup

In order to setup **Postgres** for local machine, add the required environment variables in
`/config/environment_variables.yml`.

For required variables see `database.yml` file.

```bash
rails db:create
rails db:migrate
```

### Start the server

```bash
rails server
```