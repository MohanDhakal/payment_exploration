import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';

class ShippingAddress extends StatefulWidget {
  final String personName;
  final String addressDetail;
  final bool selection;
  final void Function() onChanged;
  final void Function()? onEdit;

  const ShippingAddress({
    super.key,
    required this.personName,
    required this.addressDetail,
    required this.onChanged,
    this.selection = false,
    this.onEdit,
  });

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 24,
            spreadRadius: 4,
            offset: Offset(0, 1),
            color: Colors.black12,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              SizedBox(
                width: size.width * 0.6,
                child: Text(
                  widget.personName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: size.width * 0.6,
                child: Text(
                  widget.addressDetail,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              widget.selection
                  ? Row(
                      children: [
                        Checkbox(
                            value: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value ?? false;
                              });
                            }),
                        const Text("Use as the Shipping address")
                      ],
                    )
                  : const SizedBox()
            ],
          ),
          widget.selection
              ? MaterialButton(
                  onPressed: widget.onEdit,
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                )
              : MaterialButton(
                  onPressed: widget.onChanged,
                  child: const Text(
                    "Change",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
