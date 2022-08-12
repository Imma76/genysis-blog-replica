
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsWidget extends StatelessWidget {
  final double? height, width, textWidth;
  const NewsWidget(
      {Key? key, this.height = 365, this.width = 523, this.textWidth = 530})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/peter_obi.png', height: 365, width: 523),
        const Gap(24),
        const Text('June 24, 2022'),
        const Gap(15),
        const TitleWidget(width: 530),
        const Gap(15),
        SizedBox(
          width: textWidth,
          child: Text(
              'Malesuada vel arcu arcu aliquam sed sagittis nisi, viverra.Sapien amet velit et non eleifend vulputate sed at. Adipiscing mauris pellentesque purus ut proin. Velit  pulvinar amet elit fames pretium vitae sed ',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: black,
                fontWeight: FontWeight.w400,
              )),
        ), Text('Read More',
                                            style:
                                                TextStyle(color: lightBlue)),
      ],
    );
  }
}


class TitleWidget extends StatelessWidget {
  final double? width;
  final double? fontSize;
  const TitleWidget({Key? key, this.width, this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
          'Malesuada vel arcu arcu aliquam sed sagittis nisi, viverra.Sapien amet velit et non eleifend vulputate sed at. Adipiscing mauris pellentesque purus ut proin. Velit  pulvinar amet elit fames pretium vitae sed ',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: black,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}



class UserPostsWidget extends StatelessWidget {
  const UserPostsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: 391,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Imperdiet posuere tellus est mi fames sit tincidunt magna bibendum.',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  color: black, fontWeight: FontWeight.w500, fontSize: 16)),
          const Gap(8),
          Text('Published 10 jan',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  color: lightGrey, fontWeight: FontWeight.w400, fontSize: 12)),
          const Gap(12),
          Row(
            children: [
              Image.asset('assets/views.png', width: 14, height: 12),
              Text('4',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Gap(7),
              Image.asset('assets/comments.png', width: 14, height: 12),
              Text('12',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Spacer(),
              Text('Edit',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Gap(20),
              Text('Delete',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(border: Border.all(color: lightGrey)),
    );
  }
}
