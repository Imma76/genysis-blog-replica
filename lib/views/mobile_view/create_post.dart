import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_editor/super_editor.dart';
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
  // A MutableDocument is an in-memory Document. Create the starting
// content that you want your editor to display.
//
// Your MutableDocument does not need to contain any content/nodes.
// In that case, your editor will initially display nothing.
final myDoc = MutableDocument(
  nodes: [
    ParagraphNode(
      id: DocumentEditor.createNodeId(),
      text: AttributedText(text: 'This is a header'),
      metadata: {
        'blockType': header1Attribution,
      },
    ),
    ParagraphNode(
      id: DocumentEditor.createNodeId(),
      text: AttributedText(text:'This is the first paragraph'),
    ),
  ],
);

// With a MutableDocument, create a DocumentEditor, which knows how
// to apply changes to the MutableDocument.

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height:400,
              decoration: BoxDecoration(border: Border.all(color:black), borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: SuperEditor.custom(
                        editor: DocumentEditor(document: myDoc),
                        selectionStyle: /** INSERT CUSTOMIZATION **/ null,
                        stylesheet: defaultStylesheet.copyWith(
                            addRulesAfter: [
                                // Add any custom document styles, for example, you might
                                // apply styles to a custom Task node type.
                                StyleRule(
                                    const BlockSelector("task"),
                                    (document, node) {
                                        // if (node is! TaskNode) {
                                        //     return {};
                                        // }
                  
                                        return {
                                            "padding": const CascadingPadding.only(top: 24),
                                        };
                                    },
                                )
                            ],
                        ),
                        componentBuilders: [
                          ...defaultComponentBuilders,
                          // Add any of your own custom builders for document
                          // components, e.g., paragraphs, images, list items.
                        ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
