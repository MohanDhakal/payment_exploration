import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_exploration/routes/route_names.dart';
import 'package:payment_exploration/views/change_address.dart';
import 'package:payment_exploration/views/edit_address.dart';
import 'package:payment_exploration/views/favourite_products.dart';
import 'package:payment_exploration/views/filter_page.dart';
import 'package:payment_exploration/views/first_page.dart';
import 'package:payment_exploration/views/home.dart';
import 'package:payment_exploration/views/my_bag.dart';
import 'package:payment_exploration/views/my_orders.dart';
import 'package:payment_exploration/views/order_placed.dart';
import 'package:payment_exploration/views/payment.dart';
import 'package:payment_exploration/views/product_detail.dart';
import 'package:payment_exploration/views/product_rating.dart';
import 'package:payment_exploration/views/profile_page.dart';
import 'package:payment_exploration/views/second_page.dart';
import 'package:payment_exploration/views/select_brand_page.dart';
import '../views/checkout_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
final routerInstance = GoRouter(
  initialLocation: RouteName.first,
  navigatorKey: _rootNavigatorKey,
  routes: [
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
                ]),
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
              path: RouteName.orderDetail.substring(1),
              builder: (BuildContext context, GoRouterState state) {
                return const MyOrders();
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
