module Web::Views::Messages
  class New
    include Web::View

    def accordion_options

      html.div(class: 'panel-group', id: 'accordion') do
        div(class: 'panel') do

          button 'Set Hours', class: 'btn btn-primary btn-block btn-sm', 'data-toggle': 'collapse',
                 'data-parent': '#accordion', 'href': '#collapse1', id: 'time-button'


          div(id: 'collapse1', class: 'panel-collapse collapse') do
            div class: 'panel-body' do
              div class: 'input-group' do
                span 'Hours', class: 'input-group-addon'
                input name: '', type: 'number', id: 'time-input', class: 'form-control',
                      placeholder: 'Please enter humber of hours here', min: 1
              end
            end
          end

        end

        div(class: 'panel') do

          button 'Set Views', class: 'btn btn-primary btn-block btn-sm', 'data-toggle': 'collapse',
                  'data-parent': '#accordion', 'href': '#collapse2', id: 'visits-button'

          div(id: 'collapse2', class: 'panel-collapse collapse in') do
            div( class: 'panel-body') do
              div class: 'input-group' do
                span 'Views', class: 'input-group-addon'
                input name: 'message[visits_remains]', type: 'number', id: 'visit-input', class: 'form-control',
                      placeholder: 'Please enter humber of views here', min: 1, required: true
              end
            end
          end

        end

      end
    end
  end
end
