import '../../data/models/topic.dart';

abstract class ITopicRepository {
  Future<List<Topic>> getAllTopics();
  Future<Topic?> getTopicById(String topicId);
  Future<void> seedTopics(List<Topic> topics);
}
