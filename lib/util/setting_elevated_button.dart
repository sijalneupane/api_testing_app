import 'package:api_testing_app/util/custom_icons.dart';
import 'package:api_testing_app/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingElevatedButton extends StatelessWidget {
  String data;
  Widget Function(BuildContext) builder;
  bool? logout;
  IconData? icon;
  Color? backgroundColor;
  SettingElevatedButton(
      {super.key,
      required this.data,
      required this.builder,
      this.logout,
      this.icon,
      this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.03),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton(
          onPressed: () async {
            if (logout ?? false) {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove("authToken");
              prefs.remove("isLoggedIn");
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: builder,
                ));
          },
          child: Row(
            children: [
              CustomIcons(icon: icon),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              CustomText(
                data: data,
                color: Colors.white,
                size: 16,
              ),
              Spacer(),
              CustomIcons(icon: Icons.arrow_forward_ios)
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor, foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),)
        ),
      ),
    );
  }
}
