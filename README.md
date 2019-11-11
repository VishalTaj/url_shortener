# README

## Setup

```
 $ bundle install
```

### Setup Database

add database configuration to `database.yml`

```
 $ rake db:create
```

```
 $ rake db:migrate
```

### Adding application constants

add `settings.yml` to app's `config/` folder and then amend your offset value to it

```
 offset: 98
```


### Starting Application


```
 $ rails s
```


