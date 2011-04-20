set :user, 'myoungblood'  # Your dreamhost account's username
set :domain, 'moran.dreamhost.com'  # Dreamhost servername where your account is located 
set :project, 'portfolio'  # Your application as its called in the repository
set :application, 'michaelyoungblood.net'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup

# version control config
set :scm_username, 'joesak'
set :scm_password, 'June1983!'
set :repository, "http://db.michaelyoungblood.net/svn/#{project}/"

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false