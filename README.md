SW-Tutor
========

**SW-Tutor** is a Windows application that is part of an educational project that includes a book entitled *O Jovem Programador* (The Young Programmer) and the SW-Tutor program. It provides an integrated programming environment, with facilities to edit, execute and debug programs. It implements an interpreter of the programming language used in the book, *Lume-br*, which is a mix of Pascal and C, using words in Portuguese. The idea is: the student reads the book, and practices everything using the SW-Tutor program.

Interacting with the SW-Tutor application, the student optionally can see the so called "Memory Diagram". To facilitate the understanding of important dynamic aspects of the execution of a program, the SW-Tutor memory diagram shows the current value of variables, activation and deactivation of routines, passing of arguments, etc. In combination with the step by step execution, it is an interesting resource.

See the site [O Jovem Programador] (www.ojovemprogramador.com.br) describes the project. It is written in Portuguese.

0. Use Windows' search engine to find and run the *RAD Studio Command Prompt*. A command window will open, with some environment variables set appropriately.
0. Using the command window, change the current directory (`cd`) to your working directory.
0. Syntax highlighting is performed on code blocks. See [github/linguist](https://github.com/github/linguist#syntax-highlighting) for more information about syntax highlighting.
0. The HTML is passed through other filters in the [html-pipeline](https://github.com/jch/html-pipeline) that add special sauce, such as [emoji](https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/emoji_filter.rb), [task lists](https://github.com/github/task_list/blob/master/lib/task_list/filter.rb), [named anchors](https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/toc_filter.rb), [CDN caching for images](https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/camo_filter.rb), and  [autolinking](https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/autolink_filter.rb).
0. The resulting HTML is rendered on GitHub.com.

Please see our [contributing guidelines](CONTRIBUTING.md) before reporting an issue.

Markups
-------

The following markups are supported.  The dependencies listed are required if
you wish to run the library. You can also run `script/bootstrap` to fetch them all.

* [.markdown, .mdown, .mkdn, .md](http://daringfireball.net/projects/markdown/) -- `gem install redcarpet` (https://github.com/vmg/redcarpet)
* [.textile](http://www.textism.com/tools/textile/) -- `gem install RedCloth`
* [.rdoc](http://rdoc.sourceforge.net/) -- `gem install rdoc -v 3.6.1`
* [.org](http://orgmode.org/) -- `gem install org-ruby`
* [.creole](http://wikicreole.org/) -- `gem install creole`
* [.mediawiki, .wiki](http://www.mediawiki.org/wiki/Help:Formatting) -- `gem install wikicloth`
* [.rst](http://docutils.sourceforge.net/rst.html) -- `easy_install docutils`
* [.asciidoc, .adoc, .asc](http://asciidoc.org/) -- `gem install asciidoctor` (http://asciidoctor.org)
* [.pod](http://search.cpan.org/dist/perl/pod/perlpod.pod) -- `Pod::Simple::HTML`
  comes with Perl >= 5.10. Lower versions should install [Pod::Simple](http://search.cpan.org/~dwheeler/Pod-Simple-3.28/lib/Pod/Simple.pod) from CPAN.

Installation
-----------

    gem install github-markup

Usage
-----

    require 'github/markup'
    GitHub::Markup.render('README.markdown', "* One\n* Two")

Or, more realistically:

    require 'github/markup'
    GitHub::Markup.render(file, File.read(file))

Contributing
------------

See [Contributing](CONTRIBUTING.md)