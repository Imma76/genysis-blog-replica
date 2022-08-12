import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Center(
        child: SingleChildScrollView(
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
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: black,
                        ),
                      ),
                    ),
                    const Gap(43),
                    Text('First Name',
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
                         hintText: 'first name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: black,
                                ))),
                      ),
                    ),
                    const Gap(13),
                    Text('Last Name',
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
                            hintText: 'last name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: black, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: black, width: 1))),
                      ),
                    ),
                     const Gap(13),
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
                            hintText: 'email',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: black, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: black, width: 1))),
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
                  
                    Text('Confirm Password',
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
                            hintText: 'confirm password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: black, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: black, width: 1))),
                      ),
                    ),
                    const Gap(24),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                          primary: darkBlueColor, fixedSize: const Size(480, 52)),
                    ),
                    const Gap(8),
                   
                  ],
                ),
                width: 614,
                height: 791,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
