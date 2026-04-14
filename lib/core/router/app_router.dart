import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/shell/app_shell.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/browse/browse_screen.dart';
import '../../presentation/browse/topic_detail_screen.dart';
import '../../presentation/browse/section_detail_screen.dart';
import '../../presentation/roadmap/roadmap_screen.dart';
import '../../presentation/roadmap/roadmap_detail_screen.dart';
import '../../presentation/quiz/quiz_screen.dart';
import '../../presentation/quiz/quiz_play_screen.dart';
import '../../presentation/quiz/quiz_result_screen.dart';
import '../../presentation/saved/saved_screen.dart';
import '../../presentation/snippet/snippet_detail_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../../presentation/search/search_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/browse',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BrowseScreen()),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/quiz',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: QuizScreen()),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/saved',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SavedScreen()),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/roadmap',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RoadmapScreen()),
          ),
        ]),
      ],
    ),
    GoRoute(
      path: '/search',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SearchScreen()),
    ),
    GoRoute(
      path: '/roadmap/:id',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return CustomTransitionPage(
          child: RoadmapDetailScreen(roadmapId: id),
          transitionsBuilder: (context, animation, _, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
    ),
    GoRoute(
      path: '/browse/:topicId',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final topicId = state.pathParameters['topicId']!;
        return CustomTransitionPage(
          child: TopicDetailScreen(topicId: topicId),
          transitionsBuilder: (context, animation, _, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
    ),
    GoRoute(
      path: '/browse/:topicId/section',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final topicId = state.pathParameters['topicId']!;
        final section = state.extra is String ? state.extra as String : 'General';
        return CustomTransitionPage(
          child: SectionDetailScreen(topicId: topicId, section: section),
          transitionsBuilder: (context, animation, _, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
    ),
    GoRoute(
      path: '/snippet/:snippetId',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final snippetId = state.pathParameters['snippetId']!;
        return CustomTransitionPage(
          child: SnippetDetailScreen(snippetId: snippetId),
          transitionsBuilder: (context, animation, _, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
    ),
    GoRoute(
      path: '/quiz/:topicId/play',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final topicId = state.pathParameters['topicId']!;
        return CustomTransitionPage(
          child: QuizPlayScreen(topicId: topicId),
          transitionsBuilder: (context, animation, _, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
    ),
    GoRoute(
      path: '/quiz/:topicId/result',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final topicId = state.pathParameters['topicId']!;
        final extra = state.extra as Map<String, dynamic>;
        return CustomTransitionPage(
          child: QuizResultScreen(
            topicId: topicId,
            score: extra['score'] as int,
            total: extra['total'] as int,
            answers: extra['answers'] as List<Map<String, dynamic>>,
          ),
          transitionsBuilder: (context, animation, _, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
                parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
    ),
  ],
);
