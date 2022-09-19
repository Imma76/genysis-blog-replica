import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/widgets/category.dart';
import 'package:super_editor/super_editor.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    border: Border.all(color: black),
                    borderRadius: BorderRadius.circular(10)),
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
              const Gap(10),
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
                  Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Post'),
                    style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
