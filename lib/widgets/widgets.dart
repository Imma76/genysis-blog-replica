
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
