// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/model/serach_model.dart';
import '../controller/marks_controller.dart';

class SearchMarks extends SearchDelegate {
  final List<SearchModel> searchTerms;

  SearchMarks({required this.searchTerms});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SearchModel> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return GetBuilder<MarksController>(
          builder: (sceondController) => ListTile(
            title: Text(result.name),
            onTap: () async => {
              await sceondController
                  .fetchMarkOfStudent('${sceondController.students[index].id}'),
              Get.dialog(
                AlertDialog(
                  title: const Text(
                    "Title",
                    textAlign: TextAlign.start,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: Theme.of(context).textTheme.titleLarge,
                        underline: const Text(''),
                        dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                        borderRadius: BorderRadius.circular(15),
                        items: sceondController.markTypeDropdownItems.map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        value: sceondController.markTypeSelectedValue,
                        onChanged: (
                          value,
                        ) =>
                            sceondController.onMarkTypeDropdownChanged(value!,
                                '${sceondController.students[index].id}'),
                      ),
                      DropdownButton(
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: Theme.of(context).textTheme.titleLarge,
                        underline: const Text(''),
                        dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                        borderRadius: BorderRadius.circular(15),
                        items: sceondController.coursesDropdownItems.map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        value: sceondController.coursesSelectedValue,
                        onChanged: (
                          value,
                        ) =>
                            sceondController.onCoursesDropdownChanged(value!,
                                '${sceondController.students[index].id}'),
                      ),
                      Form(
                        key: sceondController.formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('Mark'),
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: sceondController.markController,
                                  validator: (
                                    value,
                                  ) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Mark is required';
                                    } else if (int.tryParse(
                                              value,
                                            ) !=
                                            null &&
                                        int.tryParse(
                                              value,
                                            )! <=
                                            100 &&
                                        int.tryParse(
                                              value,
                                            )! >=
                                            0) {
                                      return null;
                                    } else {
                                      return 'between 0 and 100';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: 'Enter your text here',
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => {
                            if (sceondController.formKey.currentState!
                                .validate())
                              {sceondController.sendData('${result.id}')}
                          },
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                  // actions: [
                  //   MyTextButton(
                  //     onP: () {
                  //       Get.back();
                  //     },
                  //     childWidget: const Text('Close'),
                  //   ),
                  // ],
                ),
                transitionCurve: Curves.easeInOut,
                transitionDuration: const Duration(milliseconds: 450),
              ),
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SearchModel> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return GetBuilder<MarksController>(
          builder: (sceondController) => ListTile(
            title: Text(result.name),
            onTap: () async => {
              await sceondController
                  .fetchMarkOfStudent('${sceondController.students[index].id}'),
              Get.dialog(
                AlertDialog(
                  title: const Text(
                    "Title",
                    textAlign: TextAlign.start,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: Theme.of(context).textTheme.titleLarge,
                        underline: const Text(''),
                        dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                        borderRadius: BorderRadius.circular(15),
                        items: sceondController.markTypeDropdownItems.map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        value: sceondController.markTypeSelectedValue,
                        onChanged: (
                          value,
                        ) =>
                            sceondController.onMarkTypeDropdownChanged(value!,
                                '${sceondController.students[index].id}'),
                      ),
                      DropdownButton(
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        style: Theme.of(context).textTheme.titleLarge,
                        underline: const Text(''),
                        dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                        borderRadius: BorderRadius.circular(15),
                        items: sceondController.coursesDropdownItems.map((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        value: sceondController.coursesSelectedValue,
                        onChanged: (
                          value,
                        ) =>
                            sceondController.onCoursesDropdownChanged(value!,
                                '${sceondController.students[index].id}'),
                      ),
                      Form(
                        key: sceondController.formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('Mark'),
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: sceondController.markController,
                                  validator: (
                                    value,
                                  ) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Mark is required';
                                    } else if (int.tryParse(
                                              value,
                                            ) !=
                                            null &&
                                        int.tryParse(
                                              value,
                                            )! <=
                                            100 &&
                                        int.tryParse(
                                              value,
                                            )! >=
                                            0) {
                                      return null;
                                    } else {
                                      return 'between 0 and 100';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: 'Enter your text here',
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: TextButton(
                      //     onPressed: () => {
                      //       if (sceondController.formKey.currentState!
                      //           .validate())
                      //         {sceondController.sendData('${result.id}')}
                      //     },
                      //     child: const Text('Add'),
                      //   ),
                      // ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => {
                        if (sceondController.formKey.currentState!.validate())
                          {sceondController.sendData('${result.id}')}
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
                transitionCurve: Curves.easeInOut,
                transitionDuration: const Duration(milliseconds: 450),
              ),
            },
          ),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
