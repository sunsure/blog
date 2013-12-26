module MarkdownHelper

  # Let us embed code segments inside a markdown document
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        begin
          Pygments.highlight(code, lexer: language)
        rescue Exception => e
          # If they give us some garbage language for the lexer, it shouldn't blow up
          Pygments.highlight(code, lexer: 'text')
        end
      end
    end
  end

  def to_markdown(text)
    if text.present?
      renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
      options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        tables: true,
      }
      markdown = Redcarpet::Markdown.new(renderer, options).render(text).html_safe
    end
  end

end
