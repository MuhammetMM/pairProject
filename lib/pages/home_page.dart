// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_state.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_event.dart';
import 'package:flutter_application_1/logic/blocs/user_bloc/user_state.dart';
import 'package:flutter_application_1/pages/sign_in_page.dart';
import 'package:flutter_application_1/widgets/custom_circular_progress.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/exams_widget.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/gradientcard_widget.dart';
import 'package:flutter_application_1/widgets/home_page/header_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/tabbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      required this.userAnnouncementList,
      required this.lessonList});
  final List<Map<String, dynamic>> userAnnouncementList;
  final List<String> lessonList;

  @override
  Widget build(BuildContext context) {
    final String userId;
    final userState = context.read<AuthBloc>().state;

    if (userState is Authenticated) {
      userId = userState.userId!;
    } else {
      return const SignInPage();
    }
    // Dummy data yükleyiciyi tetiklemek için kullanılan kodlar
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // for (var edu in dummyEducationsList) {
    //   firestore.collection('education').doc(edu.id).set(edu.toMap());
    // }
    Brightness brightness = Theme.of(context).brightness;
    return ChangeNotifierProvider<StateData>(
      //Bildirim güncellenmesi için ChangeNotifierProvider ile sarmalladım
      create: (context) => StateData(),
      child: Scaffold(
        appBar: CustomAppBarWidget(brightness: brightness),
        drawer: const MyDrawer(),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitialState) {
              print("UserInitialState : HomePage");
              context.read<UserBloc>().add(UserFetchEvent(userId: userId));
              return const CircularProgressIndicator();
            } else if (state is UserFetchLoadingState) {
              print("UserFetchLoadingState : HomePage");
              return const Center(child: CustomCircularProgress());
            } else if (state is UserFetchErrorState) {
              print("UserFetchErrorState : HomePage");
              return Text(state.errorMessage);
            } else if (state is UserDeletedState) {
              print("UserDeletedState : HomePage");
              return const SignInPage();
            } else if (state is UserFetchedState) {
              print("UserFetchedState : HomePage");
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    HeaderWidget(name: state.user!.nameSurname),
                    TabBarWidget(
                        userAnnouncementList: userAnnouncementList,
                        lessonList: lessonList),
                    const ExamsWidget(),
                    GradientCardWidget(
                      title: "Profilini oluştur",
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFFbda6fe),
                          Color(0xFF1d0b8c),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    GradientCardWidget(
                        title: 'Kendini değerlendir',
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF0e0b93),
                            Color(0xFF5eb6ca),
                          ],
                        ),
                        onPressed: () {}),
                    GradientCardWidget(
                        title: 'Öğrenmeye başla',
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF3c0b8c),
                            Color(0xFFe3a6fe),
                          ],
                        ),
                        onPressed: () {}),
                    const FooterWidget(),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
