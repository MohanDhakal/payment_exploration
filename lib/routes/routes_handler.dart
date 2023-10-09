import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/views/detail_page.dart';
import 'package:payment_exploration/views/first_page.dart';
import 'package:payment_exploration/views/home.dart';
import 'package:payment_exploration/views/search_page.dart';
import 'package:payment_exploration/views/second_page.dart';
import 'package:payment_exploration/views/third_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final routerInstance = GoRouter(
  initialLocation: RouteName.first,
  navigatorKey: _rootNavigatorKey,
  routes: [
    // GoRoute(
    //   path: RouteName.visualSearch,
    //   builder: (context, state) => const VisualSearchPage(),
    // ),
    // GoRoute(
    //   path: RouteName.login,
    //   builder: (context, state) => const LoginPage(),
    // ),
    // GoRoute(
    //   path: RouteName.signup,
    //   builder: (context, state) => const SignupPage(),
    // ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: <RouteBase>[
        /// Displayed when the first item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: RouteName.first,
          builder: (context, state) => const FirstPage(),
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: RouteName.second,
          builder: (BuildContext context, GoRouterState state) {
            return const SecondPage();
          },
        ),
        GoRoute(
          path: RouteName.third,
          builder: (BuildContext context, GoRouterState state) {
            return ThirdPage(
              onDetail: () {
                GoRouter.of(context).go(RouteName.third + RouteName.detailPage);
              },
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: RouteName.detailPage.substring(1),
              builder: (BuildContext context, GoRouterState state) {
                return DetailPage(
                  onSearch: () {
                    GoRouter.of(context).go(RouteName.third +
                        RouteName.detailPage +
                        RouteName.categorySearch);
                  },
                );
              },
              routes: [
                GoRoute(
                  path: RouteName.categorySearch.substring(1),
                  builder: (BuildContext context, GoRouterState state) {
                    return const CategorySearch();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: RouteName.forgotPassword,
    //   builder: (context, state) => const ForgotPasswordPage(),
    // ),
    // GoRoute(
    //   path: RouteName.clickImage,
    //   builder: (context, state) => const PickImage(),
    // ),
    // GoRoute(
    //   path: RouteName.searchProduct,
    //   builder: (context, state) => const SearchProduct(),
    // ),
  ],
);
