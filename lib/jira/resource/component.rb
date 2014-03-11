module JIRA
  module Resource

    class ComponentFactory < JIRA::BaseFactory # :nodoc:
    end

    class Component < JIRA::Base
      def lead()
        url = client.options[:rest_base_path] + '/component/' + self.id
        response = client.get(url)
        json = self.class.parse_json(response.body)
        json["realAssignee"] ? json["realAssignee"]["name"] : nil
      end
    end

  end
end
