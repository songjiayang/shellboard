#ShellBoard 
This is a full free and open source based on ruby on rails web application. it focus on the minority programing languages jobs (eg: ruby, go, lua ..) in china.

Reference sites: 

1. http://jobs.rubynow.com/   
2. http://jobs.ruby.tw/   

###Requirements

1. Ruby 2.x
2. Rails4.x
3. Redis/Sidekiq
4. Bunlder


### How to get started ?

```
cp config/database.yml.example config/database.yml
cp config/application.yml.example config/application.yml
bundle
rake db:create
rake db:migrate
rails server
```
add `127.0.0.1   shellbaord.dev` to `/etc/hosts`


### How to deploy to production ?
```
cap productin deploy
```


### User Stories

1. Post a job with a language by admin.
2. List all jobs with a language.
3. Add email to subscription list.
4. Sent new job email to the list users.
5. Different themes for different lanuage page.
6. comming soon ...


### Contributors

- songjiayang <a href="mailto:songjiayang1@gmail.com">songjiayang1@gmail.com</a>
- UnkelTao <a href="mailto:wangyue121519@gmail.com">wangyue121519@gmail.com</a>


### New fetures you want or talk about?

https://github.com/songjiayang/shellboard/issues


### License

- The code is licensed under the MIT License




