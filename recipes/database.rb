include_recipe 'postgresql'
include_recipe 'postgresql::server'
include_recipe 'postgresql::libpq'

pg_user "golfer" do
  privileges superuser: true, createdb: true, login: true
  password "golferpassword"
end
