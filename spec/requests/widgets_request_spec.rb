require 'rails_helper'

RSpec.describe "Widgets", type: :request do
  describe 'PUT update' do
    it 'update Widget' do # it works with specific field not "have_attributes"
      widget = Widget.create(name: 'widget', package: 1)
      form_attributes = {
        widget: {
          name: 'A new name',
          package: 2,
        }
      }

      expect { patch(widget_url(widget), params: form_attributes) }
        .to change{ widget.reload.name }
        .to('A new name')
        .and change{ widget.package }
        .to(2)
    end

    it 'update Widget' do # it pass
      widget = Widget.create(name: 'widget', package: 1)
      form_attributes = {
        widget: {
          name: 'A new name',
          package: 2,
        }
      }

      expect { patch(widget_url(widget), params: form_attributes) }
        .to change{ widget.reload.attributes.with_indifferent_access } # do no work without .with_indifferent_access
        .to(a_hash_including({name: 'A new name', package: 2}))
    end

    it 'update Widget' do # do not work
      widget = Widget.create(name: 'widget', package: 1)
      form_attributes = {
        widget: {
          name: 'A new name',
          package: 2,
        }
      }

      expect {
        patch(widget_url(widget), params: form_attributes)
      }.to change{ Widget.find(widget.id) }.to have_attributes(
        name: 'A new name',
        package: 'bulk',
      )
    end
  end
end
