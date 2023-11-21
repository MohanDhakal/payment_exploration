import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/dependencies/app_state.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/utils/app_states.dart';
import 'package:payment_exploration/views/category_page.dart';
import 'package:payment_exploration/views/change_address.dart';
import 'package:payment_exploration/views/edit_address.dart';
import 'package:payment_exploration/views/favourite_products.dart';
import 'package:payment_exploration/views/filter_page.dart';
import 'package:payment_exploration/views/first_page.dart';
import 'package:payment_exploration/views/home.dart';
import 'package:payment_exploration/views/login.dart';
import 'package:payment_exploration/views/my_bag.dart';
import 'package:payment_exploration/views/my_orders.dart';
import 'package:payment_exploration/views/order_detail.dart';
import 'package:payment_exploration/views/order_placed.dart';
import 'package:payment_exploration/views/payment.dart';
import 'package:payment_exploration/views/product_detail.dart';
import 'package:payment_exploration/views/product_rating.dart';
import 'package:payment_exploration/views/profile_page.dart';
import 'package:payment_exploration/views/all_new_items.dart';
import 'package:payment_exploration/views/select_brand_page.dart';
import 'package:payment_exploration/views/settings.dart';
import 'package:payment_exploration/views/visual_search.dart';
import 'package:provider/provider.dart';
import '../views/checkout_page.dart';
import '../views/pick_image.dart';
import '../views/search_product.dart';
import '../views/signup.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final routerInstance = GoRouter(
  initialLocation: RouteName.home,
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) {
    final auth = Provider.of<AppStateProvider>(context, listen: false);
    if (auth.state == AppStates.unauthenticated) {
      return RouteName.login;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: RouteName.home,
      builder: (context, state) {
        return const VisualSearchPage();
      },
    ),
    GoRoute(
      path: RouteName.clickImage,
      builder: (context, state) {
        return const PickImage();
      },
    ),
    GoRoute(
      path: RouteName.signup,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: RouteName.searchProduct,
      builder: (context, state) => const SearchProduct(),
    ),
    GoRoute(
      path: RouteName.login,
      builder: (context, state) {
        return LoginPage(onLogin: (loggedIn) {});
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: <RouteBase>[
        /// Displayed when the first item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: RouteName.dashboard,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: FirstPage(),
            );
          },
        ),
        GoRoute(
          path: RouteName.first,
          builder: (context, state) => const FirstPage(),
          routes: [
            GoRoute(
              path: RouteName.category.substring(1),
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return CategoryPage(
                  onSearch: () {},
                );
              },
            ),
          ],
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: RouteName.second,
          builder: (BuildContext context, GoRouterState state) {
            return const AllNewItems();
          },
          routes: [
            GoRoute(
              path: RouteName.productDetail.substring(1),
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const ProductDetail();
              },
              routes: [
                GoRoute(
                  path: RouteName.productRating.substring(1),
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const ProductRating();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: RouteName.third,
          builder: (BuildContext context, GoRouterState state) {
            return const MyBag();
          },
          routes: <RouteBase>[
            GoRoute(
              path: RouteName.checkout.substring(1),
              builder: (BuildContext context, GoRouterState state) {
                return const CheckoutPage();
              },
              routes: [
                GoRoute(
                  path: RouteName.address.substring(1),
                  builder: (BuildContext context, GoRouterState state) {
                    return const ChangeAddress();
                  },
                  routes: [
                    GoRoute(
                      path: RouteName.edit.substring(1),
                      builder: (BuildContext context, GoRouterState state) {
                        return const EditAddress();
                      },
                    )
                  ],
                ),
                GoRoute(
                  path: RouteName.payment.substring(1),
                  builder: (BuildContext context, GoRouterState state) {
                    return const PaymentPage();
                  },
                )
              ],
            ),
          ],
        ),
        GoRoute(
          path: RouteName.fourth,
          builder: (BuildContext context, GoRouterState state) {
            return const FavouritesPage();
          },
          routes: [
            GoRoute(
              path: RouteName.filterPage.substring(1),
              builder: (BuildContext context, GoRouterState state) {
                return const FilterPage();
              },
              routes: [
                GoRoute(
                  path: RouteName.brandPage.substring(1),
                  builder: (BuildContext context, GoRouterState state) {
                    return const SelectBrand();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: RouteName.fifth,
          builder: (BuildContext context, GoRouterState state) {
            return const CustomerProfile();
          },
          routes: [
            GoRoute(
              path: RouteName.myOrders.substring(1),
              builder: (BuildContext context, GoRouterState state) {
                return const MyOrders();
              },
              routes: [
                GoRoute(
                  path: RouteName.orderDetails.substring(1),
                  builder: (context, state) {
                    return const OrderDetail();
                  },
                ),
              ],
            ),
            GoRoute(
              path: RouteName.settings.substring(1),
              builder: (context, state) {
                return const UserSettings();
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RouteName.orderPlaced,
      builder: (context, state) => const OrderPlacedScreen(),
    ),
  ],
);
