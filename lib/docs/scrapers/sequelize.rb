module Docs
  class Sequelize < UrlScraper
    self.name = 'Sequelize'
    self.slug = 'sequelize'
    self.type = 'simple'
    self.release = '5.21.1'
    self.base_url = 'https://sequelize.org/master/'
    self.links = {
      home: 'https://sequelize.org/',
      code: 'https://github.com/sequelize/sequelize'
    }

    # List of content filters (to be applied sequentially)
    html_filters.push 'sequelize/entries', 'sequelize/clean_html'

    # Skip the source files, the license page and the "Who's using Sequelize" page
    options[:skip_patterns] = [/\.js\.html/, /manual\/legal\.html/, /manual\/whos-using\.html/]

    # License information that appears appears at the bottom of the entry page
    options[:attribution] = <<-HTML
      Copyright &copy; 2014&ndash;present Sequelize contributors<br>
      Licensed under the MIT License.
    HTML

    # Method to fetch the most recent version of the project
    def get_latest_version(opts)
     get_npm_version('sequelize', opts)
    end
  end
end
