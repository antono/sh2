# Sh2

Client-side syntax highligher for Rails.
Based on [SyntaxHighlighter2](http://alexgorbatchev.com/wiki/SyntaxHighlighter) by Alex Gorbatchev.

## Example

In your layout:

     <head>
       <%= include_syntax_highlighter_assets(:theme => :midnight, :brushes => :all) %>
       <%= include_syntax_highlighter_assets(:theme => :midnight, :brushes => [:ruby, :shell, :jscript, :sql, :xml, :css]) %>
     </head>

Brushes stands for lang plugins. See PLUGIN\_ROOT/assets/javascripts/shBrush\* for supported languages.
Themes located in PLUGIN\_ROOT/assets/stylesheets/shTheme\*

At the bottom of page (or after all to-be-highlighted-code-blocks) call sh2\_highlight\_code helper

     <%= sh2_highlight_code %> 

Code like this will be highlighted:

     <pre class="brush: js;"> 
     function onThemeChange(sender)
     {
       var parts = sender.value.split('|');
       document.getElementById("theme").href = "Styles/" + parts[1];
       document.body.style.backgroundColor = parts[0];
     }
     </pre> 

Availible code-brushes and themes:

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


Copyright (c) 2009 Antono Vasiljev, released under LGPLv3 license
