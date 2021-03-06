
default[:gitlab][:gitlab_shell] = {
  :url => "git://github.com/gitlabhq/gitlab-shell.git",
  :reference => "v1.7.8",
  :repositories => "/opt/repositories",
  :user => "git",
  :group => "git",
  :path => "/opt/gitlab-shell",
  :self_signed_cert => false,
  :gitlab_url => 'http://localhost/',
}

default[:gitlab][:config] = {
  :location => "/",
  :hostname => %x{hostname}.strip,
  :https => false,
  :port => 80,
  :email_from => "notify@localhost",
  :default_projects_limit => 10,
  :default_can_create_group => true,
  :signup_enabled => false,
  :configure_nginx => true,
  :email_domain => false,
}

default[:gitlab][:gitlab] = {
  :url => "git://github.com/gitlabhq/gitlabhq.git",
  :reference => "e48313f709e8d99e954a98bc569cfaccd65efa4d", # tag v6.2.4
  :path => "/opt/gitlab",
  :user => "gitlab",
}

default[:gitlab][:database] = {
  :host => "localhost",
  :database => "gitlab",
  :username => "gitlab",
  :mysql_wrapper => {
    :file => default[:gitlab][:gitlab][:path] + "/shared/mysql.sh",
    :owner => "gitlab"
  }
}

default[:gitlab][:omniauth] = {
    :enabled => false,
    :allow_single_sign_on => false,
    :block_auto_created_users => true,
    :providers => [],
}
