import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';


class MobileSignIn extends ConsumerStatefulWidget {
  const MobileSignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<MobileSignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left:24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
                'Genesys Blog',
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              Gap(60.h),
               Text(
                'Sign Up',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
              Gap(24.h),
               Text(
                'First name',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
               SizedBox(
                    height: 50,
                    child: TextField(
                     // controller: _userController.emailController,
                      //  maxLines: 0,
                      decoration: InputDecoration(
                          hintText: 'e.g johdoe@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: black,
                              ))),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}