import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopViewNewsPage extends ConsumerStatefulWidget {
  const DesktopViewNewsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopViewNewsPageState();
}

class _DesktopViewNewsPageState extends ConsumerState<DesktopViewNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 114,
              width: double.infinity,
              color: darkBlueColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(17),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text('Genesys Blog',
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: white)),
                  ),
                ],
              )),
          const Gap(45),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Image.asset('assets/peter_obi.png',
                height: 400, width: 800, fit: BoxFit.fill),
          ),
          const Gap(66),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/comments.png',
                      height: 20,
                      width: 20,
                    ),
                    const Text('15 comments'),
                  ],
                ),
                const Gap(24),
                Column(
                  children: const [
                    SizedBox(height: 20, width: 20, child: Text('103')),
                    Text('VIEWS'),
                  ],
                ),
                const Gap(24),
                Container(
                  width: 257,
                  height: 47,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/facebook.png',
                        height: 24,
                        width: 24,
                      ),
                      const Gap(10),
                      Text('Share on facebook',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: darkBlueColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const Gap(24),
                Container(
                  width: 257,
                  height: 47,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/twitter.png',
                        height: 24,
                        width: 24,
                      ),
                      const Gap(10),
                      Text('Share on twitter',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: lightBlue, borderRadius: BorderRadius.circular(5)),
                )
              ],
            ),
          ),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: SizedBox(
                height: 379,
                child: Text(
                  'Lorem lorem dignissim est sit libero. Quis commodo accumsan nam eros, pellentesque posuere. Pulvinar in consequat ultrices sed cursus. Cras neque, egestas sodales quis interdum sed. In auctor amet, metus egestas. Condimentum ut congue ac in facilisi at sem dolor. Mauris neque fames vulputate amet, dignissim vulputate. Ridiculus vitae, purus nisi, placerat cras tristique. Aliquam ac suscipit sed tincidunt. Rhoncus eu etiam mattis egestas accumsan nunc orci. Ut laoreet bibendum sed sed adipiscing tortor. Suspendisse quisque massa consectetur nulla tempus sit hac nisi, diam. Accumsan ultrices dui tristique arcu. At blandit egestas aliquet eu at ut aliquet viverra. Sed est at dignissim lacus, tristique. Id consequat semper cras faucibus. Lobortis erat diam tortor diam tempor auctor. Eu ipsum integer viverra feugiat cras. Senectus ultrices tempus, adipiscing sem sed dignissim. Sit consequat sem mauris, dis lorem euismod morbi. Turpis ac nunc nunc odio quisque mi augue sagittis. Euismod adipiscing gravida imperdiet convallis eget. Mauris, a, in sed diam molestie commodo. Sit vitae tristique laoreet enim faucibus quam tellus massa. Lacus urna nunc, nibh odio. Quis dui vel iaculis nunc ultricies. Fermentum proin nisl nisi eleifend ultricies sagittis amet, amet pretium. Fringilla sit congue vestibulum faucibus integer tempus. Leo diam enim morbi pellentesque facilisis ante ipsum nibh laoreet. Ipsum mi aliquam bibendum vulputate eget. Nisl, in quam hendrerit arcu ipsum sodales donec. Sollicitudin cursus metus justo, quisque. Mi, vel ut sit dignissim ultrices. Sem potenti integer sem et. Sed suspendisse elit, dictum odio et mi facilisis est. Ac non, pellentesque lacus vestibulum. Laoreet aliquet nunc vel facilisi laoreet. Semper eget morbi pellentesque id pellentesque id. Ipsum neque leo amet ultrices. Massa convallis egestas morbi eget tellus non sit. Blandit eu eu nunc dolor tellus pharetra. Vel nec nec neque, elementum. Amet dolor quam tellus, id pellentesque interdum sit pretium. Volutpat malesuada volutpat sapien parturient faucibus. Sed massa massa eleifend est facilisi erat quam ullamcorper erat. Aenean viverra ultrices mattis massa in. Nunc sit suspendisse velit vel fermentum, aenean consequat. Aenean elit sollicitudin est bibendum neque leo, sapien purus turpis. Egestas dictumst lorem quis semper leo risus. In accumsan duis feugiat integer ornare nec, praesent viverra.',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
          ),
          const Gap(73),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Text('Leave a Reply',
                style: GoogleFonts.poppins(
                    fontSize: 24, color: black, fontWeight: FontWeight.w500)),
          ),
          const Gap(17),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Text(
                'Your email address will not be published. Required fields are marked *',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: black, fontWeight: FontWeight.w400)),
          ),
          const Gap(33),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Text('Comment',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: black, fontWeight: FontWeight.w400)),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: TextField(
              maxLines: 20,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(color: black))),
            ),
          ), const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Text('Name',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: black, fontWeight: FontWeight.w400)),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(color: black))),
            ),
          ), const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: Text('Email',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: black, fontWeight: FontWeight.w400)),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(color: black))),
            ),
          ),
          const Gap(31),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Post comment'),
              style: ElevatedButton.styleFrom(
                  primary: darkBlueColor, fixedSize: const Size(214, 72)),
            ),
          ),
          const Gap(100),
          Center(
            child: Text('blog @2022 copyright All rights reserved',
                style: GoogleFonts.poppins(
                    fontSize: 20, color: black, fontWeight: FontWeight.w400)),
          ),Gap(150),
        ]),
      ),
    );
  }
}
