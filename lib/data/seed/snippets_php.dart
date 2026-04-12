import '../models/snippet.dart';

List<Snippet> getPhpSnippets() {
  List<Snippet> snippets = [];
  for (int i = 1; i <= 40; i++) {
    snippets.add(Snippet()
      ..snippetId='php_${i.toString().padLeft(3, '0')}'
      ..topicId='php'
      ..title='PHP Concept ${i}'
      ..description='Description for PHP concept ${i}.'
      ..code='<?php\\n\\necho "Hello World ${i}";\\n?>'
      ..language='php'
      ..difficulty=(i % 4 == 0 ? 'very_hard' : (i % 3 == 0 ? 'hard' : (i % 2 == 0 ? 'medium' : 'very_easy')))
      ..isSaved=false
      ..lastViewedAt=null
    );
  }
  
  // Customizing a few to be realistic
  snippets[0].title = 'Hello World';
  snippets[0].description = 'Basic PHP output using echo.';
  snippets[0].code = '<?php\\n\\necho "Hello, World!";\\n\\n?>';
  
  snippets[1].title = 'Variables & Data Types';
  snippets[1].description = 'PHP variables start with \$ and are dynamically typed.';
  snippets[1].code = '<?php\\n\$name = "Alice";\\n\$age = 30;\\n\$isActive = true;\\necho "\$name is \$age years old.";\\n?>';

  snippets[2].title = 'Arrays';
  snippets[2].description = 'PHP arrays can be indexed or associative.';
  snippets[2].code = '<?php\\n\$colors = ["Red", "Green", "Blue"];\\n\$user = ["name" => "Bob", "age" => 25];\\n\\nforeach (\$user as \$key => \$value) {\\n    echo "\$key: \$value\\n";\\n}\\n?>';

  snippets[3].title = 'Functions';
  snippets[3].description = 'Define functions with optional type hints.';
  snippets[3].code = '<?php\\nfunction greet(string \$name): string {\\n    return "Hello, " . \$name;\\n}\\necho greet("World");\\n?>';

  return snippets;
}
