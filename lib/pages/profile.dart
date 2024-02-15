import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/api/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/pages/profile_edit_page.dart';
import 'package:flutter_application_1/widgets/custom_circular_progress.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/profile_page/about_me.dart';
import 'package:flutter_application_1/widgets/profile_page/education.dart';
import 'package:flutter_application_1/widgets/profile_page/profile_information.dart';
import 'package:flutter_application_1/widgets/profile_page/social_media.dart';
import 'package:flutter_application_1/widgets/profile_page/work_experience.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: CustomAppBarWidget(brightness: brightness),
      drawer: const MyDrawer(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitialState) {
            context
                .read<UserBloc>()
                .add(UserFetchEvent(userId: "ZzcuO4ud6U6BtxHrYhRy"));
            return const Text("Initial.");
          } else if (state is UserFetchLoadingState) {
            return const Center(child: CustomCircularProgress());
          } else if (state is UserFetchErrorState) {
            return Text(state.errorMessage);
          } else if (state is UserFetchedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton.outlined(
                                onPressed: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfileEditPage()))
                                    },
                                icon: const Icon(Icons.edit)),
                            IconButton.outlined(
                              onPressed: () => {},
                              icon: const Icon(Icons.share_outlined),
                            ),
                          ],
                        ),
                      ),
                      const ProfileInformationWidget(),
                      Padding(padding: paddingMedium),
                      const AboutMeWidget(),
                      Padding(padding: paddingMedium),
                      const EducationWidget(),
                      Padding(padding: paddingMedium),
                      const WorkExperienceWidget(),
                      Padding(padding: paddingMedium),
                      const SocialMediaWidget(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
