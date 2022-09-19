import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/post_controller.dart';
import 'package:genesys_blog/widgets/category.dart';
import 'package:super_editor/super_editor.dart';

import '../../controllers/all_providers/all_providers.dart';

class MobileCreatePost extends ConsumerStatefulWidget {
  const MobileCreatePost({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileCreatePostState();
}

class _MobileCreatePostState extends ConsumerState<MobileCreatePost> {
  List filterOption = [];
  bool selected = false;

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
        text: AttributedText(text: 'This is the first paragraph'),
      ),
    ],
  );

// With a MutableDocument, create a DocumentEditor, which knows how
// to apply changes to the MutableDocument.
  TextStyle textStyle = const TextStyle();
  TextAlign textAlign = TextAlign.center;
  // QuillController _controller = QuillController.basic();
  String description = 'My great package';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    PostController postController = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: black), onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //           Expanded(child: Container(
              //             height:500,
              //             child: QuillToolbar.basic(controller: _controller,))),
              // Expanded(
              //   child: Container(
              //   height:400,
              //   child: QuillEditor.basic(
              //     controller: _controller,
              //     readOnly: false, // true for view only mode
              //   ),
              //   ),
              // ),
              //         Padding(
              //               padding: const EdgeInsets.symmetric(vertical: 100),
              //               child: Column(
              //                 mainAxisSize: MainAxisSize.min,
              //                 crossAxisAlignment: CrossAxisAlignment.stretch,
              //                 children: <Widget>[
              //                   MarkdownTextInput(
              //                     (String value) => setState(() => description = value),
              //                     description,
              //                     label: 'Description',
              //                     maxLines: 10,
              //                     actions: MarkdownType.values,
              //                     controller: controller,
              //                   ),
              //                   // TextButton(
              //                   //   onPressed: () {
              //                   //     controller.clear();
              //                   //   },
              //                   //   child: Text('Clear'),
              //                   // ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(top: 10),
              //                     child: MarkdownBody(
              //                       data: description,
              //                       shrinkWrap: true,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),

              //         Container(  height: 500,
              //         child: TextField(
              //           maxLines: 100,
              //           style: textStyle,

              //         ),
              //          decoration: BoxDecoration(
              //                 border: Border.all(color: black),
              //                 borderRadius: BorderRadius.circular(10)

              //                 ),),
              //         Container(
              //             height: 200,

              //             decoration: BoxDecoration(
              //                 // border: Border.all(color: black),
              //                 // borderRadius: BorderRadius.circular(10)

              //                 ),
              //             child: TextStyleEditor(
              //               fonts: const [
              //                 'Montserrat-Medium.ttf',
              //                 'Monteserrat-Regular.ttf',
              //                 'Monteserrat-SemiBold.ttf',
              //               ],
              //               textStyle: textStyle,
              //               textAlign: textAlign,
              //               paletteColors: const [
              //                 Colors.red,
              //                 Colors.blue,
              //                 Colors.green,
              //                 Colors.yellow,
              //               ],
              //               onTextAlignEdited: (align) {
              //                 setState(() {
              //                   textAlign = align;
              //                 });
              //               },
              //               onTextStyleEdited: (style) {
              //                 setState(() {
              //                   textStyle = textStyle.merge(style);
              //                 });
              //               },
              //               onCpasLockTaggle: (caps) {
              //                 // Uppercase or lowercase letters
              //               },
              //             )
              //             // SingleChildScrollView(
              //             //   child: SuperEditor.custom(
              //             //     editor: DocumentEditor(document: myDoc),
              //             //     selectionStyle: /** INSERT CUSTOMIZATION **/ null,
              //             //     stylesheet: defaultStylesheet.copyWith(
              //             //       addRulesAfter: [
              //             //         // Add any custom document styles, for example, you might
              //             //         // apply styles to a custom Task node type.
              //             //         StyleRule(
              //             //           const BlockSelector("task"),
              //             //           (document, node) {
              //             //             // if (node is! TaskNode) {
              //             //             //     return {};
              //             //             // }

              //             //             return {
              //             //               "padding": const CascadingPadding.only(top: 24),
              //             //             };
              //             //           },
              //             //         )
              //             //       ],
              //             //     ),
              //             //     componentBuilders: [
              //             //       ...defaultComponentBuilders,
              //             //       // Add any of your own custom builders for document
              //             //       // components, e.g., paragraphs, images, list items.
              //             //     ],
              //             //   ),
              //             // ),
              //             ),
              //         const Gap(10),
              TextField(
                //  maxLines: 3,
                controller: postController.titleController,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    border: InputBorder.none),
              ),
              TextField(  controller: postController.bodyController,
                maxLines: 20,
                decoration: InputDecoration(
                    hintText: '\nwhats on your mind?',
                    hintStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    border: InputBorder.none),
              ),
              Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: Category.values.map((option) {
                    return FilterChip(
                      showCheckmark: false,
                      checkmarkColor: Colors.white,
                      side: BorderSide(
                          color: filterOption.contains(option.name)
                              ? Colors.white
                              : darkBlueColor,
                          width:
                              filterOption.contains(option.name) ? 3.0 : 1.0),
                      backgroundColor: Colors.white,
                      disabledColor: white,
                      selectedColor: darkBlueColor,
                      selected: filterOption.contains(option.name),
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            filterOption.clear();

                            filterOption.add(option.name);
                            selected = true;
                          } else {
                            selected = false;
                            // filterOptions.remove(option.name.obs);
                          }
                        });
                      },
                      labelStyle: const TextStyle(color: Colors.red),
                      label: Text(option.name,
                          style: TextStyle(
                              color: filterOption.contains(option.name)
                                  ? Colors.white
                                  : darkBlueColor)),
                    );
                  }).toList()),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        File file = File(result.files.single.path.toString());
                        await postController.createPost(image: file, category:filterOption[0]);
                      } else {
                        return;
                        // User canceled the picker
                      }
                    },
                    child: const Text('Post'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: darkBlueColor,
                        fixedSize: const Size(65, 42)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
