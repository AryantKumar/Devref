import '../models/snippet.dart';

List<Snippet> getCsharpSnippets() {
  List<Snippet> snippets = [];
  for (int i = 1; i <= 40; i++) {
    snippets.add(Snippet()
      ..snippetId='csharp_${i.toString().padLeft(3, '0')}'
      ..topicId='csharp'
      ..title='C# Concept ${i}'
      ..description='Description for C# concept ${i}.'
      ..code='using System;\\n\\nclass Program {\\n    static void Main() {\\n        Console.WriteLine("Hello Concept ${i}");\\n    }\\n}'
      ..language='csharp'
      ..difficulty=(i % 4 == 0 ? 'very_hard' : (i % 3 == 0 ? 'hard' : (i % 2 == 0 ? 'medium' : 'very_easy')))
      ..section=(i <= 10 ? 'Introduction to C#' : (i <= 20 ? 'Classes and LINQ' : (i <= 30 ? 'Async and Collections' : 'Advanced Topics')))
      ..isSaved=false
      ..lastViewedAt=null
    );
  }
  
  snippets[0].title = 'Hello World';
  snippets[0].description = 'Basic C# console output.';
  snippets[0].code = 'using System;\\n\\nclass Program {\\n    static void Main() {\\n        Console.WriteLine("Hello, World!");\\n    }\\n}';
  
  snippets[1].title = 'LINQ Basics';
  snippets[1].description = 'Language Integrated Query to filter and transform data.';
  snippets[1].code = 'using System;\\nusing System.Linq;\\n\\nint[] scores = { 90, 71, 82, 93, 75, 82 };\\nvar highScores = scores.Where(s => s > 80).OrderBy(s => s);\\n\\nforeach (var score in highScores) {\\n    Console.WriteLine(score);\\n}';

  snippets[2].title = 'Properties';
  snippets[2].description = 'Auto-implemented properties with getters and setters.';
  snippets[2].code = 'public class Person {\\n    public string Name { get; set; }\\n    public int Age { get; private set; }\\n\\n    public Person(string name, int age) {\\n        Name = name;\\n        Age = age;\\n    }\\n}';

  snippets[3].title = 'Async/Await';
  snippets[3].description = 'Asynchronous programming using Task and async/await keywords.';
  snippets[3].code = 'using System;\\nusing System.Threading.Tasks;\\n\\nclass Program {\\n    static async Task Main() {\\n        Console.WriteLine("Start");\\n        await Task.Delay(1000);\\n        Console.WriteLine("Done");\\n    }\\n}';

  return snippets;
}
