import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:google_fonts/google_fonts.dart';


class MobileSignIn extends ConsumerStatefulWidget {
  const MobileSignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<MobileSignIn> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserController _userController = ref.read(userProvider);
  }


  @override
  Widget build(BuildContext context) {
     UserController _userController = ref.watch(userProvider);
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left:24.w, right:22.w),
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
              ),Gap(10.h),
               SizedBox(
                    height: 46,
                    child: TextField(
                     controller: _userController.firstNameController,
                      //  maxLines: 0,
                      decoration: InputDecoration(
                   //       hintText: 'e.g johdoe@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: black,
                              ))),
                    ),
                  ),
                  Gap(20.h),
                    Text(
                'Last name',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),Gap(10.h),
               SizedBox(
                    height: 46,
                    child: TextField(
                     controller: _userController.lastNameController,
                      //  maxLines: 0,
                      decoration: InputDecoration(
                    //      hintText: 'e.g johdoe@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: black,
                              ))),
                    ),
                  ),
                  Gap(20.h),
                    Text(
                'Email Address',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),Gap(10.h),
               SizedBox(
                    height: 46,
                    child: TextField(
                      controller: _userController.emailController,
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
                  Gap(20.h),
                    Text(
                'Password',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),Gap(10.h),
               SizedBox(
                    height: 46,
                    child: TextField(
                      controller: _userController.passwordController,
                      //  maxLines: 0,
                      decoration: InputDecoration(
                         // hintText: 'e.g johdoe@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: black,
                              ))),
                    ),
                  ),
                  Gap(20.h),
                    Text(
                'Confirm Password',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),Gap(10.h),
               SizedBox(
                    height: 46,
                    child: TextField(
                      controller: _userController.confirmPasswordController,
                      //  maxLines: 0,
                      decoration: InputDecoration(
                   //       hintText: 'e.g johdoe@gmail.com',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: black,
                              ))),
                    ),
                  ),
                  Gap(20.h),
                  ElevatedButton(
                    onPressed: () async {
                      if (_userController.validateSignIn()) {
                        await _userController.loginUser(context);
                      }
                    },
                    child:  _userController.load
                        ? Center(
                            child: CircularProgressIndicator(color: white),
                          )
                        : const Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                        primary: darkBlueColor, fixedSize: const Size(480, 52)),
                  ),
          ],
        ),
      ),
    );
  }
}