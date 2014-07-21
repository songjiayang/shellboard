#GDIZServer 


### Deploy with capistrano+nginx+puma+rvm
```ruby
# Deploy server with capistrano, https://github.com/capistrano/capistrano
gem 'capistrano', '~> 3.2.1', require: false
gem 'capistrano-rvm', '~> 0.1.1'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano3-puma', '~> 0.6.1'
```


## Code Structure

### DB tables structure
<table>
  <td> users </td> 
  <td></td> 
  <td> id </td> 
  <td> nickname </td>
  <td> identifier </td>
</table>
<table>
  <td> topics </td>
  <td></td>
  <td> id </td>
  <td> title </td> 
  <td> description </td> 
  <td> creator_id </td> 
  <td> code </td>
</table>
<table>
  <td> topic_participants </td>
  <td></td>
  <td> topic_id </td> 
  <td> user_id </td>
</table>
<table>
  <td> points </td>
  <td></td>
  <td> id </td>
  <td> title </td>
  <td> description </td>
  <td> topic_id </td>
  <td> user_id </td>
</table>
<table>
  <td> votes </td>
  <td></td>
  <td> user_id </td> 
  <td> point_id </td>
  <td> kind </td> 
</table>

### Apicontroller Structure

#### routes
```ruby
namespace :api  do
  namespace :v0  do
    scope ":sub_version" do
      resources :topics
    end
  end
end
``` 
#### controllers

```
api
  |_ v0
     |_ api_controller.rb
     |_ topic_controller.rb
  |_ api_controller.rb
```

1. Api::ApiController is the all api_controllers base.
2. Api::V0::ApiController is all V0 api_controllers base, and it inherited from Api::ApiController
3. Api::V0::TopicsController is V0 topics_controller, it inherited from Api::V0::ApiController
4. sub version can be used for small changes in big version controller. eg:
```ruby
class  Api::V0::TopicsController < Api::V0::ApiController
  def index
    sub_version = params[:sub_version].to_i
    case sub_verson
    when 1
      render json: Topic.all
    when 2
      render json: Topic.latest
    end
  end
end
```
