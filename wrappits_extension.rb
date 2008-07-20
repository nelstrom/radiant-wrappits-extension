# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class WrappitsExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/wrappits"
  
  # define_routes do |map|
  #   map.connect 'admin/wrappits/:action', :controller => 'admin/wrappits'
  # end
  
  def activate
    # admin.tabs.add "Wrappits", "/admin/wrappits", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Wrappits"
  end
  
end