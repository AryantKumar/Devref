import '../models/snippet.dart';

List<Snippet> getRubySnippets() {
  List<Snippet> snippets = [];
  for (int i = 1; i <= 40; i++) {
    snippets.add(Snippet()
      ..snippetId='ruby_${i.toString().padLeft(3, '0')}'
      ..topicId='ruby'
      ..title='Ruby Concept ${i}'
      ..description='Description for Ruby concept ${i}.'
      ..code='def concept_${i}\\n  puts "Concept ${i}"\\nend'
      ..language='ruby'
      ..difficulty=(i % 4 == 0 ? 'very_hard' : (i % 3 == 0 ? 'hard' : (i % 2 == 0 ? 'medium' : 'very_easy')))
      ..section=(i <= 10 ? 'Introduction to Ruby' : (i <= 20 ? 'Blocks and Methods' : (i <= 30 ? 'Classes and Modules' : 'Advanced Topics')))
      ..isSaved=false
      ..lastViewedAt=null
    );
  }
  
  snippets[0].title = 'Hello World';
  snippets[0].description = 'Basic Ruby output using puts.';
  snippets[0].code = 'puts "Hello, World!"\\n\\nname = "Ruby"\\nputs "Hello #{name}"';
  
  snippets[1].title = 'Blocks and Yield';
  snippets[1].description = 'Blocks are anonymous functions passed to methods.';
  snippets[1].code = 'def greet\\n  puts "Before"\\n  yield\\n  puts "After"\\nend\\n\\ngreet { puts "Inside block" }';

  snippets[2].title = 'Classes and Modules';
  snippets[2].description = 'Object-oriented ruby with mixins.';
  snippets[2].code = 'module Swimmable\\n  def swim\\n    puts "Swimming"\\n  end\\nend\\n\\nclass Duck\\n  include Swimmable\\nend\\n\\nDuck.new.swim';

  snippets[3].title = 'Enumerable';
  snippets[3].description = 'Powerful collection methods using blocks.';
  snippets[3].code = 'numbers = [1, 2, 3, 4, 5]\\n\\nevens = numbers.select { |n| n.even? }\\nsquares = numbers.map { |n| n ** 2 }\\nsum = numbers.reduce(0, &:+)';

  return snippets;
}
