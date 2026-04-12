import 'package:isar/isar.dart';

part 'snippet.g.dart';

@collection
class Snippet {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String snippetId;

  @Index()
  late String topicId;

  late String title;
  late String description;
  late String code;
  late String language;

  @Index()
  late String difficulty;

  late bool isSaved;
  late DateTime? lastViewedAt;
}
