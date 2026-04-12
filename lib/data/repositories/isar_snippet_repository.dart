import '../../core/errors/app_exception.dart';
import '../../domain/repositories/i_snippet_repository.dart';
import '../datasources/isar_datasource.dart';
import '../models/snippet.dart';

class IsarSnippetRepository implements ISnippetRepository {
  @override
  Future<List<Snippet>> getSnippetsByTopic(String topicId) async {
    try {
      return await IsarDatasource.getSnippetsByTopic(topicId);
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch snippets for topic $topicId', stackTrace: stack);
    }
  }

  @override
  Future<List<Snippet>> getSnippetsByTopicAndDifficulty(String topicId, String difficulty) async {
    try {
      return await IsarDatasource.getSnippetsByTopicAndDifficulty(topicId, difficulty);
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch snippets', stackTrace: stack);
    }
  }

  @override
  Future<Snippet?> getSnippetById(String snippetId) async {
    try {
      return await IsarDatasource.getSnippetById(snippetId);
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch snippet $snippetId', stackTrace: stack);
    }
  }

  @override
  Future<List<Snippet>> searchSnippets(String query) async {
    try {
      return await IsarDatasource.searchSnippets(query);
    } catch (e, stack) {
      throw DatabaseException('Failed to perform search', stackTrace: stack);
    }
  }

  @override
  Future<List<Snippet>> getSavedSnippets() async {
    try {
      return await IsarDatasource.getSavedSnippets();
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch saved snippets', stackTrace: stack);
    }
  }

  @override
  Stream<List<Snippet>> watchSavedSnippets() {
    return IsarDatasource.watchSavedSnippets();
  }

  @override
  Future<void> toggleSave(String snippetId) async {
    try {
      return await IsarDatasource.toggleSave(snippetId);
    } catch (e, stack) {
      throw DatabaseException('Failed to toggle save for $snippetId', stackTrace: stack);
    }
  }

  @override
  Future<void> updateLastViewed(String snippetId) async {
    try {
      return await IsarDatasource.updateLastViewed(snippetId);
    } catch (e, stack) {
      throw DatabaseException('Failed to update recently viewed', stackTrace: stack);
    }
  }

  @override
  Future<List<Snippet>> getRecentlyViewed({int limit = 5}) async {
    try {
      return await IsarDatasource.getRecentlyViewed(limit: limit);
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch recently viewed snippets', stackTrace: stack);
    }
  }

  @override
  Future<void> seedSnippets(List<Snippet> snippets) async {
    try {
      return await IsarDatasource.seedSnippets(snippets);
    } catch (e, stack) {
      throw DatabaseException('Failed to seed snippets', stackTrace: stack);
    }
  }

  @override
  Future<int> snippetCount() async {
    try {
      return await IsarDatasource.snippetCount();
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch snippet count', stackTrace: stack);
    }
  }
}
