module Nesta
  class App
    not_found do
       haml("404".to_sym)
    end
  end
end