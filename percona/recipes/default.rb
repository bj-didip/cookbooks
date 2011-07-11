case platformwhen "redhat","centos","fedora"  remote_file "/etc/pki/rpm-gpg/RPM-GPG-KEY-percona" do    source "http://www.percona.com/downloads/RPM-GPG-KEY-percona"    checksum "ac0aafe3"  end  execute "install percona key" do    command "rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-percona"    not_if "rpm -qi gpg-pubkey-* | grep percona"  endwhen "debian","ubuntu"  execute "request percona key" do    command "gpg --keyserver pool.sks-keyservers.net --recv-keys 1C4CBDCDCD2EFD2A"    not_if "gpg --list-keys CD2EFD2A"  end  execute "install percona key" do    command "gpg -a --export CD2EFD2A | apt-key add -"    not_if "apt-key list | grep CD2EFD2A"  end  template "/etc/apt/sources.list.d/percona.list"  execute "update apt" do    command "apt-get update"    subscribes :run, resources(:template => "/etc/apt/sources.list.d/percona.list"), :immediately    action :nothing  endend