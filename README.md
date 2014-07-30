#ShellBoard 
This is a full free and open source based on ruby on rails web application. it focus on the minority programing languages jobs (eg: ruby, go, lua ..) in china.

you can visit http://ruby.shellboard.com to see demo.

ref: 

1. http://jobs.rubynow.com/   
2. http://jobs.ruby.tw/   

#Requirements

1. Ruby 2.x
2. Rails4.x
3. Redis/Sidekiq
4. Bunlder


## How to develop?

```
cp config/database.yml.example config/database.yml
cp config/application.yml.example config/application.yml
bundle
rake db:create
rake db:migrate
rails server
```
add `127.0.0.1   shellbaord.com` to `/etc/hosts`
####



