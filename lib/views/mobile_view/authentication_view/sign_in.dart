import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';


class SignIn extends ConsumerStatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Text(
              'Welcome to  Genesys Blog',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: black,
              ),
            ),
        ],
      ),
    );
  }
}