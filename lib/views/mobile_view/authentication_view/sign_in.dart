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
            Gap(100.h),
            Center(child: Image.asset('assets/logo.png', height:51.h, width:51.w)),
            Gap(5.h),
             Center(
               child: Text(
                  'Welcome to Genesys Blog',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                ),
             ),
              Gap(60.h),
              
                    Text(
                'Email Address',textAlign: TextAlign.left,
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
                   Padding(
                    padding:  EdgeInsets.only(
                      left: 250.w,
                    ),
                    child: Text('forgot password?',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w400)),
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
                  ), Gap(24.h),
                  const Center(child: Text('Or')),
                   Gap(24.h),
                  Container(
                    width: 480,
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          width: 20,
                          height: 20,
                        ),
                        const Gap(8),
                        const Text('Sign in with google'),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: black)),
                  ),
                  Gap(24.h),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const SignUp();
                      // }));
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Dont have an account?',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: black,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: ' Sign up',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: lightBlue,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}