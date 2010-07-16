# Helpers for easy usage of SyntaxHighlighter2 in your views.
#
module SyntaxHighlighterHelper

  SH2_BRUSHES = {
    :bash    => 'Bash',
    :cpp     => 'Cpp',
    :csharp  => 'CSharp',
    :css     => 'Css',
    :delphi  => 'Delphi',
    :diff    => 'Diff',
    :groovy  => 'Groovy',
    :java    => 'Java',
    :jscript => 'JScript',
    :perl    => 'Perl',
    :php     => 'Php',
    :plain   => 'Plain',
    :python  => 'Python',
    :ruby    => 'Ruby',
    :scala   => 'Scala',
    :sql     => 'Sql',
    :vb      => 'Vb',
    :xml     => 'Xml'
  }

  SH2_THEMES = {
    :default      => 'Default',
    :django       => 'Django',
    :emacs        => 'Emacs',
    :midnight     => 'Midnight',
    :rdark        => 'RDark',
    :fade_to_gray => 'FadeToGrey'
  }

  def include_syntax_highlighter_assets(args = {})
    theme = args[:theme] || :default
    brushes = args[:brushes] || :all

    if brushes == :all
      brushes = SH2_BRUSHES.values
    elsif brushes.is_a? Array
      brushes = SH2_BRUSHES.find_all { |key,val| args[:brushes].include? key }.collect { |e| e[1] }
    end

    output ||= []
    output << javascript_include_tag('sh2/shCore')
    brushes.each { |brush| output << javascript_include_tag("sh2/shBrush#{brush}") }
    output << stylesheet_link_tag('sh2/shCore')
    output << stylesheet_link_tag("sh2/shTheme#{SH2_THEMES[theme]}")
    output.join("\n")
  end

  def sh2_highlight_code
    '<script>SyntaxHighlighter.all();</script>'
  end

end
