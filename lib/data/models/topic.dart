import 'package:isar/isar.dart';

part 'topic.g.dart';

@collection
class Topic {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String topicId;

  late String name;
  late String? iconPath;
  late String colorHex;
  late int snippetCount;
}
