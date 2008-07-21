module WrappitTags
  include Radiant::Taggable
  desc %{   
       *Usage:*
       <pre><code><r:snippet name="snippet_name" /></code></pre>

    When used as a double tag, the part in between both tags may be used within the
    snippet itself, being substituted in place of @<r:yield/>@. 
    
    *Usage:*
    <pre><code><r:snippet name="snippet_name">Lorem ipsum dolor...</r:snippet></code></pre>
     }
  tag 'snippet' do |tag|
    if name = tag.attr['name']
      if snippet = Snippet.find_by_name(name.strip)
        tag.locals.yield = tag.expand if tag.double?
        tag.globals.page.render_snippet(snippet)
      else
        raise TagError.new('snippet not found')
      end
    else
      raise TagError.new("`snippet' tag must contain `name' attribute")
    end
  end
  
  
  desc %{ 
    Used within a snippet as a placeholder for substitution of child content, when 
    the snippet is called as a double tag.
    
    *Usage (within a snippet):*
    <pre><code>
    <div id="outer">
      <p>before</p>
      <r:yield/>
      <p>after</p>
    </div>
    </code></pre>
    
    If the above snippet was called as a double tag, the opening @<r:snippet>@ would 
    correspond to everything *before* @<r:yield/>@, while the closing @</r:snippet>@
    corresponds to everything *after*. Calling the same snippet as a single tag would 
    cause @<r:yield/>@ to output nothing.
  }
  tag 'yield' do |tag|
    tag.locals.yield
  end
  
end