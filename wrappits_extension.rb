# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class WrappitsExtension < Radiant::Extension
  version "0.1"
  description "Allows you to create snippets as a double tag, whose contents may be inserted inside a snippet with the <r:yield/> tag."
  url "http://github.com/nelstrom/radiant-wrappits-extension/"
  
  def activate
    Page.send :include, WrappitTags
  end
  
  def deactivate
  end
  
end