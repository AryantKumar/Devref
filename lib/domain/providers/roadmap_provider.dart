import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoadmapNotifier extends Notifier<Set<String>> {
  static const _key = 'completed_roadmap_steps';

  @override
  Set<String> build() {
    _loadProgress();
    return {};
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    state = list.toSet();
  }

  bool isCompleted(String roadmapId, int stepIndex) {
    return state.contains('${roadmapId}_$stepIndex');
  }

  void toggleStep(String roadmapId, int stepIndex) async {
    final stepKey = '${roadmapId}_$stepIndex';
    final newState = Set<String>.from(state);
    
    if (newState.contains(stepKey)) {
      newState.remove(stepKey);
    } else {
      newState.add(stepKey);
    }
    
    state = newState;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, state.toList());
  }
}

final roadmapProgressProvider = NotifierProvider<RoadmapNotifier, Set<String>>(RoadmapNotifier.new);
