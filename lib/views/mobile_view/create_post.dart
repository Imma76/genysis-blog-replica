import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_style_editor/text_style_editor.dart';

class MobileCreatePost extends ConsumerStatefulWidget {
  const MobileCreatePost({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileCreatePostState();
}

class _MobileCreatePostState extends ConsumerState<MobileCreatePost> {
  TextAlign textAlign = TextAlign.center;
  TextStyle textStyle = TextStyle();
   List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  List<Color> paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          children: <Widget>[
            Gap(20),
             Text('Create New Post',
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: black)),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: TextFormField( style: textStyle,
                  textAlign: textAlign,
                  maxLines: 10,),
                 
                
              ),
            ),
            Expanded(
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextStyleEditor(
                      fonts: fonts,
                      paletteColors: paletteColors,
                      textStyle: textStyle,
                      textAlign: textAlign,
                      initialTool: EditorToolbarAction.fontFamilyTool,
                      onTextAlignEdited: (align) {
                        setState(() {
                          textAlign = align;
                        });
                      },
                      onTextStyleEdited: (style) {
                        setState(() {
                          textStyle = textStyle.merge(style);
                        });
                      },
                      onCpasLockTaggle: (caps) {
                        print(caps);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}
