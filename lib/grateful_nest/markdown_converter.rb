module GratefulNest
  module MarkdownConverter

    def markdownify
      self.markdown_text = convert_to_markdown(self.original_text)
    end

    def rendered_html
      @rendered_html ||= convert_to_html(self.markdown_text)
    end

      private

        def convert_to_markdown(text)
          return if text.nil?

          text.match(/\[([^\]]+)\]\(([^)]+)\)/)
          markdown_link_match = $2

          filter = Bypass::TextFilter.new(text)
          filter.replace do |url|
              string_url = url.to_s
              unless markdown_link_match
                  clean_string_url = (string_url).gsub((/([,.!?:;])$/), "")
                  punctuation = $1.to_s
                  host = (url.host).gsub('www.','')
                  host = host.gsub((/([,.!?:;])$/), "")
                  url = markdown_url(clean_string_url, host) + punctuation
              end
              markdown_link_match = nil
              url 
          end
          filter.content
        end

        def markdown_url(url, host)
          long_url = "(" + url + ")"
          short_url = "[" + host + "]"
          short_url + long_url
        end

        def convert_to_html(text)        
          redcarpet_options = {
              link_attributes: { rel: 'nofollow noopener', target: "_blank", class: "external-link"},
              hard_wrap: true
          }

          extensions = {
              no_intra_emphasis: true,
              fenced_code_blocks: true,
              disable_indented_code_blocks: true,
              tables: true,
              strikethrough: true,
              superscript: true,
          }

          renderer = Redcarpet::Render::HTML.new(redcarpet_options)
          markdown = Redcarpet::Markdown.new(renderer, extensions)

          html_text = markdown.render(text)
          html_text.html_safe
        end
  end
end
