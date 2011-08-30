class Redmine < Thor
  include Thor::Shell
  
  desc "install", "install and configure Redmine"
  method_option :backlog,  :aliases => "-b",  :type => :boolean, :desc => "Include the Redmine Backlog plugin"
  method_option :gmail,    :aliases => "-g",  :type => :boolean, :desc => "Set up Redmine to use Gmail as delivery option"
  method_option :themes,   :aliases => "-t",  :type => :boolean, :desc => "Include some themes"
  method_option :sudo,     :aliases => "-s",  :type => :boolean, :desc => "Use 'sudo' to install the required gems"
  method_option :database, :aliases => "-d",  :type => :string, :required => true, :default => "mysql", :desc => "Preferred database [mysql, psql, sqlite]"
    
  def install
    say "Bye!" and return if no?("This will install Redmine, do you wish to proceed?")
    
    options.each_pair do |k, v|
      puts "#{k} => #{v}"
    end
      
  end
  
  
  private
  def install_backlog
    puts "install_backlog"
  end
end