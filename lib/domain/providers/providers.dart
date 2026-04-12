import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/i_topic_repository.dart';
import '../repositories/i_snippet_repository.dart';
import '../../data/repositories/isar_topic_repository.dart';
import '../../data/repositories/isar_snippet_repository.dart';
import '../../data/models/topic.dart';
import '../../data/models/snippet.dart';

// ── Dependency Injection ──
final topicRepositoryProvider = Provider<ITopicRepository>((ref) {
  return IsarTopicRepository();
});

final snippetRepositoryProvider = Provider<ISnippetRepository>((ref) {
  return IsarSnippetRepository();
});

// ── Topics (kept alive — small dataset, reused everywhere) ──
final allTopicsProvider = FutureProvider<List<Topic>>((ref) async {
  ref.keepAlive();
  return ref.watch(topicRepositoryProvider).getAllTopics();
});

// ── Topic by ID ──
final topicByIdProvider =
    FutureProvider.autoDispose.family<Topic?, String>((ref, topicId) async {
  return ref.watch(topicRepositoryProvider).getTopicById(topicId);
});

// ── Snippets by topic ──
final topicSnippetsProvider =
    FutureProvider.autoDispose.family<List<Snippet>, String>((ref, topicId) async {
  return ref.watch(snippetRepositoryProvider).getSnippetsByTopic(topicId);
});

// ── Filtered snippets ──
final filteredSnippetsProvider = FutureProvider.autoDispose
    .family<List<Snippet>, ({String topicId, String difficulty})>(
        (ref, params) async {
  final repo = ref.watch(snippetRepositoryProvider);
  if (params.difficulty == 'all') {
    return repo.getSnippetsByTopic(params.topicId);
  }
  return repo.getSnippetsByTopicAndDifficulty(params.topicId, params.difficulty);
});

// ── Snippet by ID ──
final snippetByIdProvider =
    FutureProvider.autoDispose.family<Snippet?, String>((ref, snippetId) async {
  return ref.watch(snippetRepositoryProvider).getSnippetById(snippetId);
});

// ── Search State Notifier ──
class SearchNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }
}

final searchQueryProvider = NotifierProvider<SearchNotifier, String>(SearchNotifier.new);

final searchResultsProvider =
    FutureProvider.autoDispose<List<Snippet>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  return ref.watch(snippetRepositoryProvider).searchSnippets(query);
});

// ── Saved (stream — instant updates) ──
final savedSnippetsProvider =
    StreamProvider.autoDispose<List<Snippet>>((ref) {
  return ref.watch(snippetRepositoryProvider).watchSavedSnippets();
});

// ── Recent ──
final recentSnippetsProvider =
    FutureProvider.autoDispose<List<Snippet>>((ref) async {
  return ref.watch(snippetRepositoryProvider).getRecentlyViewed(limit: 5);
});

// ── Snippet Count ──
final snippetCountProvider = FutureProvider<int>((ref) async {
  ref.keepAlive();
  return ref.watch(snippetRepositoryProvider).snippetCount();
});

// No legacy theme provider needed

// ── Sections ──
final topicSectionsProvider =
    FutureProvider.autoDispose.family<List<String>, String>((ref, topicId) async {
  return ref.watch(snippetRepositoryProvider).getSectionsByTopic(topicId);
});

final sectionSnippetsProvider = FutureProvider.autoDispose
    .family<List<Snippet>, ({String topicId, String section})>(
        (ref, params) async {
  return ref
      .watch(snippetRepositoryProvider)
      .getSnippetsBySection(params.topicId, params.section);
});
