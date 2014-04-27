git "/opt/codegolf" do
  repository "https://github.com/danielfone/railscamp-codegolf.git"
  revision "master"
  action :sync
  # user  'golfer'
  # group 'vagrant'
end

execute "fixup /opt/codegolf owner" do
  command "chown -Rf golfer /opt/codegolf"
  only_if { Etc.getpwuid(File.stat('/opt/codegolf').uid).name != "golfer" }
end

directory '/vagrant' do
  user  'golfer'
  group 'vagrant'
end

link "/vagrant/webapp" do
  to "/opt/codegolf/webapp"
end

template "/vagrant/webapp/config/database.yml" do
  source 'database.yml.erb'
  owner  'golfer'
  group  'vagrant'
  mode   0664
end

execute "bundle install" do
  command "sudo -i -u golfer bundle install --gemfile=#{File.join "/vagrant/webapp", 'Gemfile'}"
end

%w{development production}.each do |env|
  rbenv_execute "RAILS_ENV=#{env} rake db:create && rake db:migrate" do
    cwd "/vagrant/webapp"
    user 'golfer'
  end
end
