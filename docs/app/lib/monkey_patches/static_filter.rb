module Sinatra
  class Base
    class_eval do
      alias :org_static! :static!
      def static!
        case request.path_info
        when "/index.html"
          filter! :before
        when "/swagger_doc.yml"
          filter! :before
        end
        org_static!
      end
    end
  end
end