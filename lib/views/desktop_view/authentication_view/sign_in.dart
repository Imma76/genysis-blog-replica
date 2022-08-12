import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
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
      backgroundColor: darkBlueColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(69),
            Text(
              'Welcome to  Genesys Blog',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
            const Gap(66),
            Container(
              padding: const EdgeInsets.only(left: 77, right: 77),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(56),
                  Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ),
                  const Gap(43),
                  Text('Email Address',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.w400)),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    child: TextField(
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
                  const Gap(13),
                  Text('Password',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: black,
                          fontWeight: FontWeight.w400)),
                  const Gap(10),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      //  maxLines: 0,
                      decoration: InputDecoration(
                          hintText: 'Enter password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: black, width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: black, width: 1))),
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 320,
                    ),
                    child: Text('forgot password?',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Gap(24),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                        primary: darkBlueColor, fixedSize: const Size(480, 52)),
                  ),
                  const Gap(8),
                  const Center(child: Text('Or')),
                  const Gap(8),
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
                  ), const Gap(8),
                  Center(
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
                  )
                ],
              ),
              width: 614,
              height: 566,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}
