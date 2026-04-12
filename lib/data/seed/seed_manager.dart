import 'package:shared_preferences/shared_preferences.dart';
import '../datasources/isar_datasource.dart';
import '../models/snippet.dart';
import '../models/topic.dart';
import 'topic_seeds.dart';
import 'snippets_kotlin.dart';
import 'snippets_python.dart';
import 'snippets_javascript.dart';
import 'snippets_java.dart';
import 'snippets_dart.dart';
import 'snippets_cpp.dart';
import 'snippets_go.dart';
import 'snippets_rust.dart';
import 'snippets_typescript.dart';
import 'snippets_swift.dart';
import 'snippets_dsa.dart';
import 'snippets_git.dart';
import 'snippets_linux.dart';
import 'snippets_sql.dart';
import 'snippets_php.dart';
import 'snippets_csharp.dart';
import 'package:flutter/foundation.dart';
import 'snippets_ruby.dart';

List<dynamic> _gatherSnippets(dynamic _) {
  return <dynamic>[
    ...getKotlinSnippets(),
    ...getPythonSnippets(),
    ...getJavaScriptSnippets(),
    ...getJavaSnippets(),
    ...getDartSnippets(),
    ...getCppSnippets(),
    ...getGoSnippets(),
    ...getRustSnippets(),
    ...getTypeScriptSnippets(),
    ...getSwiftSnippets(),
    ...getDsaSnippets(),
    ...getGitSnippets(),
    ...getLinuxSnippets(),
    ...getSqlSnippets(),
    ...getPhpSnippets(),
    ...getCsharpSnippets(),
    ...getRubySnippets(),
  ];
}

class SeedManager {
  static const _seedKey = 'seeded_v5';

  static Future<void> seedIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_seedKey) == true) return;

    final isar = await IsarDatasource.instance;

    // Clear existing data before re-seeding (handles version upgrades)
    await isar.writeTxn(() async {
      await isar.snippets.clear();
      await isar.topics.clear();
    });

    // Bulk insert ALL topics in one transaction
    final allTopics = getTopicSeeds();
    await isar.writeTxn(() async {
      await isar.topics.putAll(allTopics);
    });

    // Bulk insert ALL snippets in one transaction offloaded to an Isolate
    final allSnippets = await compute(_gatherSnippets, null);
    await isar.writeTxn(() async {
      await isar.snippets.putAll(allSnippets.cast());
    });

    await prefs.setBool(_seedKey, true);
  }
}
