import 'package:flutter/widgets.dart';
import 'package:payment_exploration/utils/order_status.dart';
import 'package:payment_exploration/views/widgets/order_list_item.dart';

class OrderDetails extends StatelessWidget {
  final OrderStatus status;
  const OrderDetails({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: const EdgeInsets.only(top: 12),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return OrderListItem(
          status: status,
        );
      }),
    );
  }
}
