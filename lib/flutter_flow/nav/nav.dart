import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'createAccount',
          path: '/createAccount',
          builder: (context, params) => CreateAccountWidget(),
        ),
        FFRoute(
          name: 'homePage_MAIN',
          path: '/homePageMAIN',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'homePage_MAIN')
              : HomePageMAINWidget(),
        ),
        FFRoute(
          name: 'Community_tab',
          path: '/communityTab',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Community_tab')
              : NavBarPage(
                  initialPage: 'Community_tab',
                  page: CommunityTabWidget(),
                ),
        ),
        FFRoute(
          name: 'Growthtrackerloginpage',
          path: '/growthtrackerloginpage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: GrowthtrackerloginpageWidget(),
          ),
        ),
        FFRoute(
          name: 'changePassword',
          path: '/changePassword',
          asyncParams: {
            'userProfile': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChangePasswordWidget(
            userProfile: params.getParam('userProfile', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'firstpage',
          path: '/firstpage',
          builder: (context, params) => FirstpageWidget(),
        ),
        FFRoute(
          name: 'growth_tracker',
          path: '/growthTracker',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'growth_tracker')
              : NavBarPage(
                  initialPage: 'growth_tracker',
                  page: GrowthTrackerWidget(),
                ),
        ),
        FFRoute(
          name: 'Info_page_growth_tracker',
          path: '/infoPageGrowthTracker',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: InfoPageGrowthTrackerWidget(),
          ),
        ),
        FFRoute(
          name: 'List2Products',
          path: '/list2Products',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: List2ProductsWidget(),
          ),
        ),
        FFRoute(
          name: 'articlehome1',
          path: '/articlehome1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Articlehome1Widget(),
          ),
        ),
        FFRoute(
          name: 'sleepguidepage',
          path: '/sleepguidepage',
          builder: (context, params) => SleepguidepageWidget(),
        ),
        FFRoute(
          name: 'product1page',
          path: '/product1page',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Product1pageWidget(),
          ),
        ),
        FFRoute(
          name: 'article2',
          path: '/article2',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Article2Widget(),
          ),
        ),
        FFRoute(
          name: 'article3cleansing_tips',
          path: '/article3cleansingTips',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Article3cleansingTipsWidget(),
          ),
        ),
        FFRoute(
          name: 'yt_vid_01',
          path: '/ytVid01',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: YtVid01Widget(),
          ),
        ),
        FFRoute(
          name: 'yt_vid_02',
          path: '/ytVid02',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: YtVid02Widget(
              textField: params.getParam('textField', ParamType.String),
            ),
          ),
        ),
        FFRoute(
          name: 'Entering_more_data_gt',
          path: '/enteringMoreDataGt',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: EnteringMoreDataGtWidget(),
          ),
        ),
        FFRoute(
          name: 'pregnancy_article1',
          path: '/pregnancyArticle1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PregnancyArticle1Widget(),
          ),
        ),
        FFRoute(
          name: 'infancy_article1',
          path: '/infancyArticle1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: InfancyArticle1Widget(),
          ),
        ),
        FFRoute(
          name: 'pregnacy_week_by_week_article',
          path: '/pregnacyWeekByWeekArticle',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PregnacyWeekByWeekArticleWidget(),
          ),
        ),
        FFRoute(
          name: 'pregnancy_third_tremerster',
          path: '/pregnancyThirdTremerster',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: PregnancyThirdTremersterWidget(),
          ),
        ),
        FFRoute(
          name: 'baby_planning_article1',
          path: '/babyPlanningArticle1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BabyPlanningArticle1Widget(),
          ),
        ),
        FFRoute(
          name: 'baby_planning_article2',
          path: '/babyPlanningArticle2',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BabyPlanningArticle2Widget(),
          ),
        ),
        FFRoute(
          name: 'baby_planning_article3',
          path: '/babyPlanningArticle3',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BabyPlanningArticle3Widget(),
          ),
        ),
        FFRoute(
          name: 'guide_page',
          path: '/guidePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'guide_page')
              : GuidePageWidget(),
        ),
        FFRoute(
          name: 'feeding_guide_page',
          path: '/feedingGuidePage',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FeedingGuidePageWidget(),
          ),
        ),
        FFRoute(
          name: 'is_your_baby_getting_enough',
          path: '/isYourBabyGettingEnough',
          builder: (context, params) => IsYourBabyGettingEnoughWidget(),
        ),
        FFRoute(
          name: 'age_by_age_feeding_guide',
          path: '/ageByAgeFeedingGuide',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AgeByAgeFeedingGuideWidget(),
          ),
        ),
        FFRoute(
          name: 'massage_quest',
          path: '/massageQuest',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MassageQuestWidget(),
          ),
        ),
        FFRoute(
          name: 'massage_routine',
          path: '/massageRoutine',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: MassageRoutineWidget(),
          ),
        ),
        FFRoute(
          name: 'cleansing_guide',
          path: '/cleansingGuide',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CleansingGuideWidget(),
          ),
        ),
        FFRoute(
          name: 'FAQs',
          path: '/fAQs',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FAQsWidget(),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Screenshot_2023-05-22_151118.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
