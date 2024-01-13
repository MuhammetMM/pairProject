import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_formfield_profile.dart';

class SettingsEdit extends StatefulWidget {
  const SettingsEdit({super.key});

  @override
  State<SettingsEdit> createState() => _SettingsEditState();
}

class _SettingsEditState extends State<SettingsEdit> {
  EdgeInsets horizontalF = const EdgeInsets.symmetric(horizontal: 10.0);
  TextEditingController ownPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

  Widget buildUserInfoFormField({
    required String labelText,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    int? maxLines,
    bool? obscureText,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Padding(
        padding: horizontalF,
        child: CustomTextFormField(
          labelText: labelText,
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          obscureText: obscureText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: "Mevcut Şifre*",
            controller: ownPasswordController,
            hintText: "Mevcut Şifrenizi Giriniz",
            obscureText: true,
            maxLines: 1,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: "Yeni Şifre*",
            controller: newPasswordController,
            hintText: "Yeni Şifrenizi Giriniz",
            obscureText: true,
            maxLines: 1,
          ),
          Padding(padding: paddingMedium),
          buildUserInfoFormField(
            labelText: "Yeni Şifre Tekrar*",
            controller: newPasswordAgainController,
            hintText: "Yeni Şifrenizi Tekrar Giriniz",
            obscureText: true,
            maxLines: 1,
          ),
          Padding(padding: paddingMedium),
          CustomElevatedButton(text: "Şifre Değiştir", onPressed: () {}),
          Padding(padding: paddingSmall),
          CustomElevatedButton(
              text: "Üyeliği Sonlandır",
              onPressed: () {},
              buttonColor: Colors.red),
        ],
      )),
    );
  }
}