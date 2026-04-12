import 'package:flutter/material.dart';
import '../../data/models/topic.dart';

class TopicIcon extends StatelessWidget {
  final Topic topic;
  final double size;

  const TopicIcon({
    super.key,
    required this.topic,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    // DERIVED PATH: Makes logo addition truly automatic.
    // Just drop a file named <topicId>.png into assets/languages/
    final derivedPath = 'assets/languages/${topic.topicId}.png';

    return SizedBox(
      height: size,
      width: size,
      child: Image.asset(
        derivedPath,
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/languages/placeholder.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
