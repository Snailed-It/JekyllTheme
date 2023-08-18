module Jekyll
  class ShortcutsActionTagBlock < Liquid::Block

    def render(context)
      shortcut_details = YAML.load(super)
      shortcut_title = shortcut_details['action'].to_s
      if shortcut_details['variables']
        shortcut_details['variables'].each { |key, value|
          shortcut_title = shortcut_title.gsub("#{key}", "<span class='shortcuts-variable'>#{value}</span>") }
      end

      shortcut_extended = ''
      if shortcut_details['extended_options']
        shortcut_details['extended_options'].each_with_index { |extended_option, index|
          type_class = extended_option['type']
          row_class = ''
          if index == 0
            row_class = " shortcuts-action-extended"
          end
          value = ''
          if extended_option['value']
            if extended_option['type'] == 'toggle'
              if extended_option['value'] == 'true'
                type_class += '-on'
                value = '<i class="fa-solid fa-toggle-on"></i>'
              else
                type_class += '-off'
                value = '<i class="fa-solid fa-toggle-off"></i>'
              end
            elsif extended_option['type'] == 'variable'
              value = <<-HTML
<span class='shortcuts-variable'>
  <img class='variable-icon' src='/assets/shortcut-action-icons/#{extended_option['variable_icon']}.png' alt='#{extended_option['variable_icon']}' />
  #{extended_option['value']}
</span>
HTML
            else
              value = extended_option['value']
            end
          elsif extended_option['placeholder']
            value = "<span class='shortcuts-action-placeholder'>#{extended_option['placeholder']}</span>"
          end
          shortcut_extended += <<-HTML
<div class="shortcuts-action-row shortcuts-action-extended-detail#{row_class}">
  <span class="shortcuts-action-extended-title">#{extended_option['name']}</span>
  <span class="shortcuts-action-extended-value shortcuts-action-extended-detail-#{type_class}">#{value}</span>
</div>
          HTML
        }
      end

      json_output = JSON.pretty_generate(shortcut_details)
      html_output = <<-HTML
<div class="reset-all ">
  <div class="shortcuts-action-block float-center">
    <div class="shortcuts-action-row shortcuts-action-header">
    <img class="shortcut-action-icon" src="/assets/shortcut-action-icons/#{shortcut_details['icon']}.png" alt="#{shortcut_details['icon']}" />&nbsp;
    #{shortcut_title}
    </div>
      #{shortcut_extended}
    </div>
</div>
      HTML
      html_output
    end
  end
end

Liquid::Template.register_tag('shortcuts_action', Jekyll::ShortcutsActionTagBlock)