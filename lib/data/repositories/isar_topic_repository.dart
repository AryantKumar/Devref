import '../../core/errors/app_exception.dart';
import '../../domain/repositories/i_topic_repository.dart';
import '../datasources/isar_datasource.dart';
import '../models/topic.dart';

class IsarTopicRepository implements ITopicRepository {
  @override
  Future<List<Topic>> getAllTopics() async {
    try {
      return await IsarDatasource.getAllTopics();
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch topics', stackTrace: stack);
    }
  }

  @override
  Future<Topic?> getTopicById(String topicId) async {
    try {
      return await IsarDatasource.getTopicById(topicId);
    } catch (e, stack) {
      throw DatabaseException('Failed to fetch topic $topicId', stackTrace: stack);
    }
  }

  @override
  Future<void> seedTopics(List<Topic> topics) async {
    try {
      return await IsarDatasource.seedTopics(topics);
    } catch (e, stack) {
      throw DatabaseException('Failed to seed topics', stackTrace: stack);
    }
  }
}
