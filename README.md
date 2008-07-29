Wrappits
========

*This extension was rolled into the Radiant core for version 0.6.8.*

Wrappits are an enhanced version of Radiant's native Snippets. This extension enables you to call a snippet as a double tag: 

    <r:snippet name="wrapper">
      Content between opening and closing tags
    </r:snippet>

The "Content between opening and closing tags" can be inserted anywhere within the "wrapper" snippet itself by calling the tag `<r:yield/>`.

For example, the following could be saved in a Snippet called "rounded-corners":

    <div class="top-left rounded">
      <div class="top-right rounded">
        <div class="bottom-left rounded">
          <div class="bottom-right rounded">
            <r:yeild/>
          </div>
        </div>
      </div>
    </div>

The snippet above could then be called, from any Page or Layout, as follows:

    <r:snippet name="rounded-corners">
      This lorem ipsum has rounded corners, dolor sit amet...
    </r:snippet>

In this example, the `<r:snippet>` opening tag would correspond to the four opening div tags, and the `</r:snippet>` closing tag would correspond to the four closing div tags.

If you are familiar with Ruby, you may find a resemblance between the pattern used above and Ruby's blocks. A similar approach to this is advocated in [designing helpers and partials in Rails with a block](http://www.pathf.com/blogs/2008/07/pretty-blocks-in-rails-views/).

A few points to note:

* you can still call snippets as a single tag
* the `<r:yield/>` tag will output nothing if called from a single tag, or from an empty double-tag
* you can use `<r:yield/>` as many times as you like within a snippet. In each case, it will output the contents of the calling snippet tags.

By installing this extension, you should not see any change in the behaviour of existing snippets in your Radiant project.

Installation
------------

Just copy this extension to the `/vendor/extensions` directory of your Radiant project, and restart your server. 

You don't need to run any rake tasks.