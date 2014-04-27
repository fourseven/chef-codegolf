#
# Cookbook Name:: codegolf
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Global recipes

include_recipe "codegolf::database"

# Build the required user(s)
include_recipe "codegolf::users"


include_recipe "codegolf::ruby"

include_recipe "codegolf::app"
