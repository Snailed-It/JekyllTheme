Shortcuts actions can be added to any page as follows:

{% shortcuts_action %}
action: Execute shortcut_choice on server time_choice
icon: pushcut
variables:
  shortcut_choice: My Super Cool Shortcut
  time_choice: now
extended_options:
- name: Action Type
  type: select
  value: Shortcut
- name: Input
  type: text
  value: "Life? Don't talk to me about Life"
- name: Another Input
  type: text
  placeholder: "I am a placeholder!"
- name: Wait for Result
  type: select
  value: "No"
- name: Toggle Off
  type: toggle
  value: 'false'
- name: Toggle On
  type: toggle
  value: 'true'
{% endshortcuts_action %}

Note: the contents must be valid YAML!

`variables` replace the keys with the values in the action, they are highlighted blue (as in Shortcuts variables)
`extended_options` is a list, rendered in the order you add. Types available are `text` or `select` (`extended-text` is planned to come later). `select` will be highlighted in blue.