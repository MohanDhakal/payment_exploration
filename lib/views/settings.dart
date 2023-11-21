// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:payment_exploration/utils/app_colors.dart';
import 'package:payment_exploration/views/widgets/change_password.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            FormWidget(),
          ],
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool _toggleValue1 = false;
  bool _toggleValue2 = false;
  bool _toggleValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 36),
        Text(
          'Personal Information',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.0),
        TextFormFieldWidget(
            labelText: 'Full Name', hintText: 'Enter your full name'),
        SizedBox(height: 20.0),
        TextFormFieldWidget(labelText: 'Date of Birth', hintText: '12/7/2013'),
        SizedBox(height: 36),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return ChangePassword();
                    });
              },
              child: Text(
                'Change',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  color: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        TextFormFieldWidget(
          labelText: 'Your Password',
          hintText: '***********',
        ),
        SizedBox(height: 20),
        Text(
          'Notifications',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sales',
              style: TextStyle(fontSize: 14.0),
            ),
            Transform.scale(
              scale: 1,
              child: Switch(
                value: _toggleValue1,
                onChanged: (value) {
                  setState(() {
                    _toggleValue1 = value;
                  });
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.grey[400],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Arrivals',
              style: TextStyle(fontSize: 14.0),
            ),
            Transform.scale(
              scale: 1,
              child: Switch(
                value: _toggleValue2,
                onChanged: (value) {
                  setState(() {
                    _toggleValue2 = value;
                  });
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.grey[400],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Status Changes',
              style: TextStyle(fontSize: 14.0),
            ),
            Transform.scale(
              scale: 1,
              child: Switch(
                value: _toggleValue3,
                onChanged: (value) {
                  setState(() {
                    _toggleValue3 = value;
                  });
                },
                activeColor: Colors.green,
                activeTrackColor: Colors.grey[400],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
