import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/topic.dart';
import '../models/snippet.dart';

class IsarDatasource {
  static Isar? _isar;

  static Future<Isar> get instance async {
    if (_isar != null && _isar!.isOpen) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [TopicSchema, SnippetSchema],
      directory: dir.path,
    );
    return _isar!;
  }

  // ── Topics ──
  static Future<List<Topic>> getAllTopics() async {
    final isar = await instance;
    return isar.topics.where().findAll();
  }

  static Future<Topic?> getTopicById(String topicId) async {
    final isar = await instance;
    return isar.topics.filter().topicIdEqualTo(topicId).findFirst();
  }

  // ── Snippets ──
  static Future<List<Snippet>> getSnippetsByTopic(String topicId) async {
    final isar = await instance;
    return isar.snippets.filter().topicIdEqualTo(topicId).findAll();
  }

  static Future<List<Snippet>> getSnippetsByTopicAndDifficulty(
      String topicId, String difficulty) async {
    final isar = await instance;
    return isar.snippets
        .filter()
        .topicIdEqualTo(topicId)
        .and()
        .difficultyEqualTo(difficulty)
        .findAll();
  }

  static Future<Snippet?> getSnippetById(String snippetId) async {
    final isar = await instance;
    return isar.snippets.filter().snippetIdEqualTo(snippetId).findFirst();
  }

  static Future<List<Snippet>> searchSnippets(String query) async {
    final isar = await instance;
    if (query.isEmpty) return [];
    
    return isar.snippets
        .filter()
        .titleContains(query, caseSensitive: false)
        .or()
        .descriptionContains(query, caseSensitive: false)
        .or()
        .codeContains(query, caseSensitive: false)
        .findAll();
  }

  static Future<List<Snippet>> getSavedSnippets() async {
    final isar = await instance;
    return isar.snippets.filter().isSavedEqualTo(true).findAll();
  }

  static Stream<List<Snippet>> watchSavedSnippets() async* {
    final isar = await instance;
    yield* isar.snippets
        .filter()
        .isSavedEqualTo(true)
        .watch(fireImmediately: true);
  }

  static Future<void> toggleSave(String snippetId) async {
    final isar = await instance;
    await isar.writeTxn(() async {
      final snippet =
          await isar.snippets.filter().snippetIdEqualTo(snippetId).findFirst();
      if (snippet != null) {
        snippet.isSaved = !snippet.isSaved;
        await isar.snippets.put(snippet);
      }
    });
  }

  static Future<void> updateLastViewed(String snippetId) async {
    final isar = await instance;
    await isar.writeTxn(() async {
      final snippet =
          await isar.snippets.filter().snippetIdEqualTo(snippetId).findFirst();
      if (snippet != null) {
        snippet.lastViewedAt = DateTime.now();
        await isar.snippets.put(snippet);
      }
    });
  }

  static Future<List<Snippet>> getRecentlyViewed({int limit = 5}) async {
    final isar = await instance;
    final all = await isar.snippets
        .filter()
        .lastViewedAtIsNotNull()
        .sortByLastViewedAtDesc()
        .limit(limit)
        .findAll();
    return all;
  }

  // ── Seeding ──
  static Future<void> seedTopics(List<Topic> topics) async {
    final isar = await instance;
    await isar.writeTxn(() async {
      await isar.topics.putAll(topics);
    });
  }

  static Future<void> seedSnippets(List<Snippet> snippets) async {
    final isar = await instance;
    await isar.writeTxn(() async {
      await isar.snippets.putAll(snippets);
    });
  }

  static Future<int> snippetCount() async {
    final isar = await instance;
    return isar.snippets.count();
  }

  // ── Sections ──
  static Future<List<String>> getSectionsByTopic(String topicId) async {
    final isar = await instance;
    final snippets = await isar.snippets
        .filter()
        .topicIdEqualTo(topicId)
        .findAll();
    final sections = snippets.map((s) => s.section).toSet().toList();
    return sections;
  }

  static Future<List<Snippet>> getSnippetsBySection(
      String topicId, String section) async {
    final isar = await instance;
    return isar.snippets
        .filter()
        .topicIdEqualTo(topicId)
        .and()
        .sectionEqualTo(section)
        .findAll();
  }
}
