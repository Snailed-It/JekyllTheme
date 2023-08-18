module Jekyll
  class RenderPictureTagBlock < Liquid::Block

    def render(context)
      picture_details = YAML.load(super)
      use_implicit_webp = picture_details&.fetch("include_webp", false)

      source_tags = []
      webp_dark_picture = find_webp_variant(context, picture_details['dark'], ".webp") if use_implicit_webp
      source_tags.push make_source_tag(webp_dark_picture, colour_scheme="dark") if webp_dark_picture
      webp_light_picture = find_webp_variant(context, picture_details['light'], ".webp") if use_implicit_webp
      source_tags.push make_source_tag(webp_light_picture, colour_scheme="light") if webp_light_picture

      html_output = <<-HTML
<picture class="#{picture_details['class']}">
    #{source_tags.join}
    <source
            media="(prefers-color-scheme: dark)"
            srcset="#{picture_details['dark']}" />
    <img
          src="#{picture_details['light']}"
          alt="#{picture_details['alt']}" />
</picture>
      HTML
      html_output
    end

    private

    def find_variants(context, path)
      context["site"].static_files.filter { |file|
        static_file_path_no_extension = file.path.delete_suffix(file.extname)
        path_no_extension = path.rpartition('.').first
        static_file_path_no_extension.end_with? path_no_extension
      }
    end

    def find_webp_variant(context, path, extension)
      find_variants(context, path).find { |file| file.extname == extension }
    end

    def make_source_tag(webp_file, colour_scheme)
      <<-HTML
      <source
              media="(prefers-color-scheme: #{colour_scheme})"
              type="image/webp"
              srcset="#{webp_file.relative_path}" />
        HTML
    end
  end
end

Liquid::Template.register_tag('render_picture', Jekyll::RenderPictureTagBlock)