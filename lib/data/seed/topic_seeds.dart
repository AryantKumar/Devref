import '../models/topic.dart';

List<Topic> getTopicSeeds() {
  return [
    Topic()
      ..topicId = 'kotlin'
      ..name = 'Kotlin'
      ..iconPath = 'assets/languages/kotlin.png'
      ..colorHex = '#7F52FF'
      ..snippetCount = 40,
    Topic()
      ..topicId = 'python'
      ..name = 'Python'
      ..iconPath = 'assets/languages/python.png'
      ..colorHex = '#3572A5'
      ..snippetCount = 40,
    Topic()
      ..topicId = 'javascript'
      ..name = 'JavaScript'
      ..iconPath = 'assets/languages/javascript.png'
      ..colorHex = '#F1E05A'
      ..snippetCount = 40,
    Topic()
      ..topicId = 'java'
      ..name = 'Java'
      ..iconPath = 'assets/languages/java.png'
      ..colorHex = '#B07219'
      ..snippetCount = 40,
    Topic()
      ..topicId = 'dart'
      ..name = 'Dart'
      ..iconPath = 'assets/languages/dart.png'
      ..colorHex = '#00B4AB'
      ..snippetCount = 40,
    Topic()..topicId='cpp'..name='C++'..iconPath='assets/languages/cpp.png'..colorHex='#F34B7D'..snippetCount=40,
    Topic()..topicId='go'..name='Go'..iconPath='assets/languages/go.png'..colorHex='#00ADD8'..snippetCount=40,
    Topic()..topicId='rust'..name='Rust'..iconPath='assets/languages/rust.png'..colorHex='#DEA584'..snippetCount=40,
    Topic()..topicId='typescript'..name='TypeScript'..iconPath='assets/languages/typescript.png'..colorHex='#3178C6'..snippetCount=40,
    Topic()..topicId='swift'..name='Swift'..iconPath='assets/languages/swift.png'..colorHex='#F05138'..snippetCount=40,
    Topic()..topicId='dsa'..name='DSA'..iconPath='assets/languages/dsa.png'..colorHex='#58A6FF'..snippetCount=40,
    Topic()..topicId='linux'..name='Linux'..iconPath='assets/languages/linux.png'..colorHex='#89E051'..snippetCount=40,
    Topic()..topicId='git'..name='Git'..iconPath='assets/languages/git.png'..colorHex='#F1502F'..snippetCount=40,
    Topic()..topicId='sql'..name='SQL'..iconPath='assets/languages/sql.png'..colorHex='#336791'..snippetCount=40,
    Topic()..topicId='php'..name='PHP'..iconPath='assets/languages/php.png'..colorHex='#777BB4'..snippetCount=40,
    Topic()..topicId='csharp'..name='C#'..iconPath='assets/languages/csharp.png'..colorHex='#178600'..snippetCount=40,
    Topic()..topicId='ruby'..name='Ruby'..iconPath='assets/languages/ruby.png'..colorHex='#CC342D'..snippetCount=40,
  ];
}
