import '../../data/models/snippet.dart';

abstract class ISnippetRepository {
  Future<List<Snippet>> getSnippetsByTopic(String topicId);
  Future<List<Snippet>> getSnippetsByTopicAndDifficulty(String topicId, String difficulty);
  Future<Snippet?> getSnippetById(String snippetId);
  Future<List<Snippet>> searchSnippets(String query);
  Future<List<Snippet>> getSavedSnippets();
  Stream<List<Snippet>> watchSavedSnippets();
  Future<void> toggleSave(String snippetId);
  Future<void> updateLastViewed(String snippetId);
  Future<List<Snippet>> getRecentlyViewed({int limit = 5});
  Future<void> seedSnippets(List<Snippet> snippets);
  Future<int> snippetCount();
}
