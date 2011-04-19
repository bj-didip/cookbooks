#
# Cookbook Name:: emacs-starter-kit
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "git"
include_recipe "emacs"

search( :users, "editor:emacs" ).each do |u|
  user_id = u["id"]

  git "/home/#{user_id}/.emacs.d" do
    repository "https://github.com/technomancy/emacs-starter-kit.git"
    reference "master"
    user user_id
    group user_id
    action :sync
  end
end