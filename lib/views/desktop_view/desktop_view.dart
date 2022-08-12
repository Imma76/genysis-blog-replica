
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/home_page_provider.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({
    Key? key,
   
  }) : super(key: key);

  //final HomePageProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 114,
                width: double.infinity,
                color: darkBlueColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    const Gap(18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                         //   homeProvider.changeIndex(1);
                          },
                          child: Text('News',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: white)),
                        ),
                        GestureDetector(
                          onTap: () {
                            //homeProvider.changeIndex(2);
                          },
                          child: Text('Politics',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: white)),
                        ),
                        GestureDetector(
                          onTap: () {
                          //  homeProvider.changeIndex(3);
                          },
                          child: Text('Entertainment',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: white)),
                        ),
                        Text('Technology',
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: white)),
                        Text('Sports',
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: white)),
                        Text('Education',
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: white))
                      ],
                    )
                  ],
                )),
            const Gap(58),
            Padding(
               padding: const EdgeInsets.only(left: 60.0, right:60),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            const Gap(40),
            Padding(
                padding: const EdgeInsets.only(left: 60.0, right:60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: NewsWidget(),
                  ),
                  SizedBox(
                    height: 500,
                    width: 600,
                    child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,

                        /// padding: EdgeInsets.all(20),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 150,
                                width: 246,
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  //  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/peter_obi.png',
                                      width: 246,
                                      height: 170,
                                    ),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('June 24, 2022'),
                                        const TitleWidget(
                                            width: 327, fontSize: 14),
                                        Text('Read More',
                                            style:
                                                TextStyle(color: lightBlue)),
                                      ],
                                    )
                                  ],
                                )),
                          );
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right:60),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,mainAxisExtent: 692, mainAxisSpacing: 70),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: NewsWidget(
                        height: 170,
                        width: 246,
                        textWidth: 355,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}