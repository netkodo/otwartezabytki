# otwarte zabytki

### application init
 - brew search elasticsearch postgresql
 - cp config/database.yml.example config/database.yml
 - create database and database users for dev and testing
 - bundle install
 - bundle exec rake db:migrate
 - gunzip -c db/dump/%m_%d_%Y.sql.gz | script/rails db
 - script/rails s

### db dump command
```bash:
  pg_dump -h localhost -cOWU user_name db_name | gzip > db/dump/$(date +"%m_%d_%Y").sql.gz
```

### elastic search
 - install according to this: https://github.com/karmi/tire#installation
 - index the data:

 ```bash:
  rake environment tire:import CLASS='Relic' FORCE=true
 ```

### testing

 We're using spork for faster tests.

 - ```bundle exec guard```
 - hit enter to rerun all tests

 For running single specs just type:

```bash
bundle exec rspec spec/controllers/relics_controller_spec.rb
```

