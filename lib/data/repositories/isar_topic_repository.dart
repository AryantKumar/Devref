import '../../domain/repositories/i_topic_repository.dart';
import '../datasources/isar_datasource.dart';
import '../models/topic.dart';

class IsarTopicRepository implements ITopicRepository {
  @override
  Future<List<Topic>> getAllTopics() async {
    return IsarDatasource.getAllTopics();
  }

  @override
  Future<Topic?> getTopicById(String topicId) async {
    return IsarDatasource.getTopicById(topicId);
  }

  @override
  Future<void> seedTopics(List<Topic> topics) async {
    return IsarDatasource.seedTopics(topics);
  }
}
