class List < ActiveRecord::Base
    has_many :items, class_name: 'ListItem', dependent: :destroy

    scope :with_items, -> {
        joins(:items).uniq
    }

    scope :recent_order, -> {
        order('created_at asc')
    }

    def items_count
        items.count
    end

    def has_items
        items.count > 0
    end

    def self.json_opts(opts = {})
        items_include = {
            items: ListItem.json_opts
        }
        opts = opts.merge({
            methods: [:items_count],
            include: items_include
        })

        return opts
    end

    def as_json(opts = {})
        return super(List.json_opts(opts))
    end
end
