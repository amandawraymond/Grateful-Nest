class ListItem < ActiveRecord::Base
    include GratefulNest::MarkdownConverter

    belongs_to :list
    before_save :markdownify

    validates :original_text, presence: true, allow_blank: false

    def as_displayable
        @as_displayable ||= rendered_html
    end

    def self.json_opts(opts = {})
        opts = opts.merge({
            except: [:markdown_text],
            methods: [:as_displayable],
            include: []
        })
        return opts
    end

    def as_json(opts = {}) 
        return super(ListItem.json_opts)
    end
end
