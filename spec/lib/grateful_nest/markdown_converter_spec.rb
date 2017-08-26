require 'spec_helper'

describe GratefulNest::MarkdownConverter do 
    describe 'Markdown converter should create markdown links' do 
        before do
            @list = FactoryGirl.create(:list)
            @item = FactoryGirl.create(:list_item, list: @list)
        end
        it 'should recognize naked link in text ' do 
            @item.original_text = "This is a naked url linkedin.com/in/amandawraymond"
            @item.save
            expect(@item.markdown_text).to eq("This is a naked url [linkedin.com](http://linkedin.com/in/amandawraymond)")
        end

        it 'should recognize http:// link in text ' do 
            @item.original_text = "This is a naked url http://www.linkedin.com/in/amandawraymond"
            @item.save
            expect(@item.markdown_text).to eq("This is a naked url [linkedin.com](http://www.linkedin.com/in/amandawraymond)")
        end

        it 'should recognize https:// link in text ' do 
            @item.original_text = "This is a naked url https://www.linkedin.com/in/amandawraymond"
            @item.save
            expect(@item.markdown_text).to eq("This is a naked url [linkedin.com](https://www.linkedin.com/in/amandawraymond)")
        end

        it 'should recognize www link in text ' do 
            @item.original_text = "This is a naked url www.linkedin.com/in/amandawraymond"
            @item.save
            expect(@item.markdown_text).to eq("This is a naked url [linkedin.com](http://www.linkedin.com/in/amandawraymond)")
        end

        it 'should not recognize broken link in text ' do 
            @item.original_text = "This is a naked url linkedin. com/in/amandawraymond"
            @item.save
            expect(@item.markdown_text).to eq("This is a naked url linkedin. com/in/amandawraymond")
        end
    end
end
