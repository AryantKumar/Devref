import '../../domain/repositories/i_snippet_repository.dart';
import '../datasources/isar_datasource.dart';
import '../models/snippet.dart';

class IsarSnippetRepository implements ISnippetRepository {
  @override
  Future<List<Snippet>> getSnippetsByTopic(String topicId) async {
    return IsarDatasource.getSnippetsByTopic(topicId);
  }

  @override
  Future<List<Snippet>> getSnippetsByTopicAndDifficulty(String topicId, String difficulty) async {
    return IsarDatasource.getSnippetsByTopicAndDifficulty(topicId, difficulty);
  }

  @override
  Future<Snippet?> getSnippetById(String snippetId) async {
    return IsarDatasource.getSnippetById(snippetId);
  }

  @override
  Future<List<Snippet>> searchSnippets(String query) async {
    return IsarDatasource.searchSnippets(query);
  }

  @override
  Future<List<Snippet>> getSavedSnippets() async {
    return IsarDatasource.getSavedSnippets();
  }

  @override
  Stream<List<Snippet>> watchSavedSnippets() {
    return IsarDatasource.watchSavedSnippets();
  }

  @override
  Future<void> toggleSave(String snippetId) async {
    return IsarDatasource.toggleSave(snippetId);
  }

  @override
  Future<void> updateLastViewed(String snippetId) async {
    return IsarDatasource.updateLastViewed(snippetId);
  }

  @override
  Future<List<Snippet>> getRecentlyViewed({int limit = 5}) async {
    return IsarDatasource.getRecentlyViewed(limit: limit);
  }

  @override
  Future<void> seedSnippets(List<Snippet> snippets) async {
    return IsarDatasource.seedSnippets(snippets);
  }

  @override
  Future<int> snippetCount() async {
    return IsarDatasource.snippetCount();
  }
}
