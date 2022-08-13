import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genesys_blog/views/desktop_view/authentication_view/sign_in.dart';
import 'package:genesys_blog/views/desktop_view/authentication_view/sign_up.dart';
import 'package:genesys_blog/views/desktop_view/desktop_view_home_page.dart';
import 'package:genesys_blog/views/desktop_view/read_news_page.dart';
import 'package:genesys_blog/views/desktop_view/user_post.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';
import 'package:genesys_blog/views/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
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
      desktop: ScreenUtilInit(designSize: const Size(1446,1112),
        
        builder: (context, c) {
          return const SignUp();
        }
      ),
      mobile: Scaffold(
        body: Container(
          child: Column(
            children: const [Text('Genesys Blog')],
          ),
        ),
      ),
    )
      ),
    );
  }
}
