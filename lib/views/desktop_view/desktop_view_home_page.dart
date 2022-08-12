import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/views/desktop_view/read_news_page.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopViewHomePage extends ConsumerStatefulWidget {
  const DesktopViewHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopViewPageState();
}

class _DesktopViewPageState extends ConsumerState<DesktopViewHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomePageProvider _homePageProvider = ref.read(homePageProvider);
    _homePageProvider.loadNews();
  }

  @override
  Widget build(BuildContext context) {
    HomePageProvider _homePageProvider = ref.watch(homePageProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: _homePageProvider.load
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(100),
                  CircularProgressIndicator(
                    color: darkBlueColor,
                  ),
                ],
              ))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 157.h,
                      width: double.infinity,
                      color: darkBlueColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(17.h),
                          Padding(
                            padding: EdgeInsets.only(left: 120.w),
                            child: Text('Genesys Blog',
                                style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                    color: white)),
                          ),
                          Gap(18.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _homePageProvider.loadNews(category: 'news');
                                },
                                child: Text('News',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp, color: white)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _homePageProvider.loadNews(
                                      category: 'politics');
                                },
                                child: Text('Politics',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp, color: white)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _homePageProvider.loadNews(
                                      category: 'entertainment');
                                },
                                child: Text('Entertainment',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp, color: white)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _homePageProvider.loadNews(
                                      category: 'technology');
                                },
                                child: Text('Technology',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp, color: white)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _homePageProvider.loadNews(
                                      category: 'sports');
                                },
                                child: Text('Sports',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp, color: white)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _homePageProvider.loadNews(
                                      category: 'education');
                                },
                                child: Text('Education',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.sp, color: white)),
                              ),
                              //Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, bottom: 5),
                                child: Row(
                                  children: [
                                    const CircleAvatar(),
                                    const Gap(10),
                                    Text('Benard',
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: white)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                  Gap(58.h),
                  _homePageProvider.newsList!.isEmpty
                      ? Center(
                          child: Text(
                              'No News Available for this catgory \n check back later!',
                              style: GoogleFonts.poppins(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: black)))
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60.0, right: 60),
                              child: SizedBox(
                                height: 60.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                            ),
                            const Gap(40),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60.0, right: 60),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: NewsWidget(
                                      image:
                                          _homePageProvider.newsList![0]!.image,
                                      body:
                                          _homePageProvider.newsList![0]!.body,
                                      title:
                                          _homePageProvider.newsList![0]!.title,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 700,
                                    width: 600,
                                    child: ListView.builder(
                                        itemCount: 3,
                                        shrinkWrap: true,

                                        /// padding: EdgeInsets.all(20),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return DesktopViewNewsPage();
                                              }));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                  height: 150,
                                                  width: 250,
                                                  child: Row(
                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            _homePageProvider
                                                                .newsList![
                                                                    index]!
                                                                .image
                                                                .toString(),
                                                        width: 246,
                                                        height: 170,
                                                      ),
                                                      Gap(10.h),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Gap(20),
                                                          const Text(
                                                              'June 24, 2022'),
                                                          TitleWidget(
                                                            width: 333.w,
                                                            fontSize: 14,
                                                            title:
                                                                _homePageProvider
                                                                    .newsList![
                                                                        index]!
                                                                    .title,
                                                          ),
                                                          Text('Read More',
                                                              style: TextStyle(
                                                                  color:
                                                                      lightBlue)),
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60.0, right: 60),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisExtent: 692,
                                          mainAxisSpacing: 70),
                                  itemCount: _homePageProvider.newsList!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NewsWidget(
                                        height: 170,
                                        width: 246,
                                        textWidth: 355,
                                        image: _homePageProvider
                                            .newsList![index]!.image,
                                        body: _homePageProvider
                                            .newsList![index]!.body,
                                        title: _homePageProvider
                                            .newsList![index]!.title,
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                ],
              ),
      ),
    );
  }
}
