import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:genesys_blog/views/desktop_view/authentication_view/sign_up.dart';
import 'package:genesys_blog/views/desktop_view/desktop_view_home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'controllers/all_providers/all_providers.dart';

void main() async {
  runApp(const InitApp());
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MyApp());
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserController _userController = ref.read(userProvider);
    _userController.init();
  }

  @override
  Widget build(BuildContext context) {
    UserController _userController = ref.watch(userProvider);
    return MaterialApp(
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: ScreenTypeLayout(
          desktop: ScreenUtilInit(
              designSize: const Size(1446, 1112),
              builder: (context, c) {
                return _userController.email != null
                    ? const DesktopViewHomePage()
                    : const SignUp();
              }),
          mobile: Scaffold(
            body: Container(
              child: Column(
                children: const [Text('Genesys Blog')],
              ),
            ),
          ),
        ));
  }
}
