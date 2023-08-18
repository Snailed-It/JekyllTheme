Pictures which adjust to light and dark mode can be added to any page as follows:

```liquid
{% render_picture %}
class: floating-picture # this property is optional
include_webp: true # this property is optional, defaults to false
light: /assets/light.ext
dark: /assets/dark.ext
alt: "Alt text for image"
{% endrender_picture %}
```

Note: the contents must be valid YAML!

This outputs a `<picture>` element in HTML similar to the following:

```html
<picture class="floating-image">
    <source
            media="(prefers-color-scheme: dark)"
            srcset="/assets/dark.ext"/>
    <img
          src="/assets/light.ext"
          alt="Alt text for image" />
</picture>
```