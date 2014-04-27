directory "/codegolf" do
  owner "vagrant"
  group "vagrant"
  mode 00644
  action :create
end

user "golfer" do
  supports :manage_home => true
  home "/home/golfer"
  comment "Oh hey a golfer"
  gid "vagrant"
  shell "/bin/bash"
  password "$1$JJsvHslV$szsCjVEroftprNn4JHtDi."
end

directory "/home/golfer/.ssh" do
  user  "golfer"
  group "golfer"
  mode 00644
  action :create
end

template "/home/golfer/.ssh/authorized_keys" do
  user "golfer"
end
