class Redmine < Thor
  include Thor::Shell
  include Thor::Actions
  
  REPOS = "http://redmine.rubyforge.org/svn/branches/1.2-stable"
  GEMS  = { "rails" => "2.3.11", "rake" => "0.8.7", "i18n" => "0.4.2" }
  
  
  desc "install", "install and configure Redmine"
  method_option :backlog,  :aliases => "-b",  :type => :boolean, :desc => "Include the Redmine Backlog plugin"
  method_option :gmail,    :aliases => "-g",  :type => :boolean, :desc => "Set up Redmine to use Gmail as delivery option"
  method_option :themes,   :aliases => "-t",  :type => :boolean, :desc => "Include some themes"
  method_option :sudo,     :aliases => "-s",  :type => :boolean, :desc => "Use 'sudo' to install the required gems"
  method_option :database, :aliases => "-db",  :type => :string, :required => true, :default => "mysql", :desc => "Preferred database [mysql, psql, sqlite]"
  
  def install
    say "Bye!" and return if no?("This will install Redmine 1.2, do you wish to proceed?")
    
    say "Checking out the repository, please wait..."
    checkout
    
    say "Installing the required gems..."
    install_gems options[:sudo]
    
    #options.each_pair do |k, v|
    #  puts "#{k} => #{v}"
    #end
      
  end
  
  
  private
  def checkout
    run("svn co #{REPOS} redmine", :verbose => false, :capture => true)
  end
  
  def install_gems(run_sudo=false)
    sudo = run_sudo ? "sudo" : ""
    
    GEMS.each_pair do |g, v|
      run("#{sudo} gem install #{g} --version=#{v} --no-rdoc --no-ri", :verbose => false, :capture => true)
    end
    
  end  
end