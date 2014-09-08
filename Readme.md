# editable_content

This gem wraps the mercury-rails gem (a very cool full page wysiwyg text editor, check out [the demo](http://jejacks0n.github.com/mercury/)) to make it much easier to use with Rails.

editable_content makes very simple to create an editable block of text or image. First, include this two gems on your Gemfile:

    gem 'mercury-rails', github: 'jejacks0n/mercury', ref: '1cc637b'
	gem 'editable_content', github: 'rogeriochaves/editable_content'

Then, run the following command to install the migrations and the authentication.rb file

    rails generate editable_content:install

You can now run the migrations

    rake db:migrate

The authentication.rb file is where you can control if the user is allowed to edit anything on the page, you may want to edit that file later.

Now, on your erb, define an editable block, like that:

    <%= editable_content 'content-optional-identifier' do %>
    	<p>
    		Lorem ipsum dolor sit amet, edit me please
    	</p>
    <% end %>

Create an editable image too, let's go:

    <%= editable_image_tag("rails.png", size: "150x150") %>

Now, go to [http://localhost:3000/editor](http://localhost:3000/editor), you should already be able to change things around, and drag-and-drop images from your computer to upload, isn't that awesome!?

To add an edit link that gets the user to the /editor page (only if the user has permission) on the top of the page, add this before the closing body tag on your application.html.erb

    <%= render 'editable_content/edit_link' %>

One more thing, when using editable_image_tag you have to specify the size of the image, if your intention is to leave free for the user to upload images of any size, just use a regular image_tag inside an editable_content block, like we did with the Lorem ipsum.

Have fun ;)