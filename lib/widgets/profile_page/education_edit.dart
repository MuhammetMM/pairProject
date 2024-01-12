import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/profile_page/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/profile_page/custom_text_formfield_profile.dart';

class EducationEdit extends StatefulWidget {
  const EducationEdit({super.key});

  @override
  State<EducationEdit> createState() => _EducationEditState();
}

class _EducationEditState extends State<EducationEdit> {
  EdgeInsets paddingFormField = const EdgeInsets.symmetric(vertical: 10.0);
  EdgeInsets horizontalF = const EdgeInsets.symmetric(horizontal: 10.0);
  TextEditingController educationStatusController = TextEditingController();
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  Widget buildUserInfoFormField({
    required String labelText,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    int? maxLines,
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
            Padding(padding: paddingFormField),
            buildUserInfoFormField(
                labelText: "Eğitim Durumu*",
                controller: educationStatusController,
                hintText: "Eğitim Durumu Giriniz"),
            Padding(padding: paddingFormField),
            buildUserInfoFormField(
                labelText: "Okul Adı*",
                controller: schoolNameController,
                hintText: "Okul Adı Giriniz"),
            Padding(padding: paddingFormField),
            buildUserInfoFormField(
                labelText: "Bölüm*",
                controller: departmentController,
                hintText: "Bölüm Giriniz"),
            Padding(padding: paddingFormField),
            buildUserInfoFormField(
                labelText: "Başlangıç Tarihi*",
                controller: startDateController,
                hintText: "Başlangıç Tarihi Giriniz"),
            Padding(padding: paddingFormField),
            buildUserInfoFormField(
                labelText: "Bitiş Tarihi*",
                controller: endDateController,
                hintText: "Bitiş Tarihi Giriniz"),
            Padding(padding: paddingFormField),
            CustomElevatedButton(text: "Kaydet", onPressed: () => {}),
          ],
        ),
      ),
    );
  }
}
