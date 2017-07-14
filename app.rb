

module Nesta
  module Navigation
    module Renderers
      def current_menu_item_class
              'active'
            end
            
      def display_menu_item(item, options = {})
             if item.respond_to?(:each)
               if (options[:levels] - 1) > 0
                 haml_tag :li do
                   display_menu(item, levels: (options[:levels] - 1))
                 end
               end
             else
               html_class = current_item?(item) ? current_menu_item_class : nil
               haml_tag :li, class: "nav-item #{html_class}" do
                 haml_tag :a, :<, href: path_to(item.abspath), class: "nav-link" do
                   haml_concat link_text(item)
                 end
               end
             end
           end
    end
  end
  class App
    Haml::TempleEngine.disable_option_validator!  # disable the outvar messages.  comment this out to check to see if still needed
    not_found do
       haml("404".to_sym)
    end
  end
end