module Web::Views::Messages
  class New
    include Web::View

    def accordion_options

      html.div(class: 'panel-group', id: 'accordion') do
        div(class: 'panel panel-default') do

          div(class: 'panel-heading') do
            h4 class: 'panel-title'
              a 'Destroy by Hours', 'data-toggle': 'collapse',
                'data-parent': '#accordion', 'href': '#collapse1', id: 'time_panel'
          end

          div(id: 'collapse1', class: 'panel-collapse collapse') do
            div class: 'panel-body' do
              div class: 'input-group' do
                span 'Hours', class: 'input-group-addon'
                input name: 'message[time_remains]', type: 'number', id: 'time_input', class: 'form-control',
                      placeholder: 'Please enter humber of hours here', min: 1
              end
            end
          end

        end

        div(class: 'panel panel-default') do

          div(class: 'panel-heading') do
            h4 class: 'panel-title'
             a 'Destroy by Views', 'data-toggle': 'collapse',
                'data-parent': '#accordion', 'href': '#collapse2', id: 'visits_panel'
          end

          div(id: 'collapse2', class: 'panel-collapse collapse in') do
            div( class: 'panel-body') do
              div class: 'input-group' do
                span 'Views', class: 'input-group-addon'
                input name: 'message[visits_remains]', type: 'number', id: 'visit_input', class: 'form-control',
                      placeholder: 'Please enter humber of views here', min: 1
              end
            end
          end

        end

      end
    end
  end
end
