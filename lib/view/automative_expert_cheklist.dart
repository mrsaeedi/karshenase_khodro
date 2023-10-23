import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:karshenase_khodro/controllers/AutomativeExpertController.dart';
import 'package:karshenase_khodro/home.dart';
import 'package:karshenase_khodro/models/automative_expert_cheklist_model.dart';

class AutomativeExpertCheklist extends StatelessWidget {
  AutomativeExpertCheklist({super.key});
  AutomativeExpertController automativeExpertController =
      Get.put(AutomativeExpertController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              automativeExpertController.isEditingMode
                  ? 'ویرایش'
                  : 'افزودن آیتم جدید',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
//! chek list part
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: automativeExpertController.automativeExpert.length,
                  itemBuilder: (context, index) {
                    String catTitle = automativeExpertController
                        .automativeExpert.keys
                        .toList()[index];
                    List<AutomativeExpertModel> catItems =
                        automativeExpertController.automativeExpert.values
                            .toList()[index];
                    return index ==
                            automativeExpertController.automativeExpert.length -
                                1
//! full description input
                        ? AddFullDesceiptionWidget(
                            automativeExpertController:
                                automativeExpertController)
//! Specifications
                        : (index == 0)
                            ? SpecificationsWidget(
                                automativeExpertController:
                                    automativeExpertController)
//! check list items
                            : Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Color.fromARGB(255, 235, 241, 252)),
                                child: ExpansionTile(
                                  leading: automativeExpertController
                                      .expertsIcon[index],
                                  title: Text(catTitle),
                                  children: [
                                    ...catItems.map<Widget>((item) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    width: 1,
                                                    color: Color.fromARGB(
                                                        66, 158, 158, 158)))),
                                        child: ListTile(
                                          dense: true,
                                          title: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Text(item.title),
                                                IconButton(
                                                  onPressed: () {
                                                    automativeExpertController
                                                        .itemDescription
                                                        .clear();
                                                    //! show bottom sheet for add new item
                                                    showBottomSheetForAddItemsDescrieption(
                                                        item);
                                                  },
                                                  icon: const Icon(
                                                    Icons.post_add,
                                                    color: Color.fromARGB(
                                                        255, 0, 185, 161),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          subtitle: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // item descreiption list
                                              ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount:
                                                    item.description.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          automativeExpertController
                                                                  .isEditingMode
                                                              ? IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    item.description
                                                                        .removeAt(
                                                                            index);
                                                                    automativeExpertController
                                                                        .automativeExpert
                                                                        .refresh();
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .delete_forever_outlined),
                                                                )
                                                              : SizedBox(),
                                                          Text(
                                                            item.description[
                                                                index],
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          trailing: Container(
                                            margin:
                                                const EdgeInsets.only(left: 0),
                                            //chech box row
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Checkbox(
                                                  activeColor: Colors.green,
                                                  value: item.isHealthy == true
                                                      ? true
                                                      : false,
                                                  onChanged: (value) {
                                                    item.isHealthy == null
                                                        ? item.isHealthy = true
                                                        : item.isHealthy = null;
                                                    automativeExpertController
                                                        .automativeExpert
                                                        .refresh();
                                                  },
                                                ),
                                                Checkbox(
                                                  activeColor: Colors.red,
                                                  value: item.isHealthy == false
                                                      ? true
                                                      : false,
                                                  onChanged: (value) {
                                                    item.isHealthy == null
                                                        ? item.isHealthy = false
                                                        : item.isHealthy = null;
                                                    automativeExpertController
                                                        .automativeExpert
                                                        .refresh();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ],
                                ),
                              );
                  },
                )),
          ),
//! submit button part
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () async {
                  if (automativeExpertController
                      .carNameController.text.isNotEmpty) {
                    if (automativeExpertController.isEditingMode) {
                      updateCarItem();
                    } else {
                      //
                      // counterTrueFalsetest();
                      counterTrueFalse();
                      addItemsToHive();
                    }
                    // automativeExpertController.automativeExpert.values;
                    Get.offAll(HomePage());
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                      message: ' نام خودرو را وارد کنید',
                      duration: Duration(milliseconds: 2000),
                    ));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                  child: Text(
                    'ثبت',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          )
        ],
      )),
    );
  }

  //add to hive
  void addItemsToHive() async {
    await Hive.box<Car>('carBox').add(Car(
      falseCounter: automativeExpertController.falseCount,
      trueCounter: automativeExpertController.trueCount,
      expert: automativeExpertController.automativeExpert,
      name: automativeExpertController.carNameController.text,
      other: automativeExpertController.carDescription.text,
      fullDescription: automativeExpertController.fullDescrption.text,
    ));
  }

  //update
  void updateCarItem() {
    automativeExpertController.updateCarInHive(
        // index // insert car description for edit
        index: automativeExpertController.selectedItemIndex,
        //expert
        expert: automativeExpertController.automativeExpert,
        //name
        name: automativeExpertController.carNameController.text,
        // full descrieption
        fullDescription: automativeExpertController.fullDescrption.text,
        // ohter
        other: automativeExpertController.carDescription.text,
        // true counter
        t: automativeExpertController.trueCount,
        // false counter
        f: automativeExpertController.falseCount);

    automativeExpertController.isEditingMode = false;
  }

//counter
  void counterTrueFalse() {
    automativeExpertController.automativeExpert.forEach((key, value) {
      if (key == 'بدنه و شاسی') {
        for (var model in value) {
          if (model.isHealthy == true) {
            automativeExpertController.trueCount[1]++;
          } else if (model.isHealthy == false) {
            automativeExpertController.falseCount[1]++;
          }
        }
      } else if (key == 'فنی') {
        for (var model in value) {
          if (model.isHealthy == true) {
            automativeExpertController.trueCount[2]++;
          } else if (model.isHealthy == false) {
            automativeExpertController.falseCount[2]++;
          }
        }
      } else if (key == 'آپشن و رفاهی') {
        for (var model in value) {
          if (model.isHealthy == true) {
            automativeExpertController.trueCount[3]++;
          } else if (model.isHealthy == false) {
            automativeExpertController.falseCount[3]++;
          }
        }
      } else if (key == 'رینگ و لاستیک') {
        for (var model in value) {
          if (model.isHealthy == true) {
            automativeExpertController.trueCount[4]++;
          } else if (model.isHealthy == false) {
            automativeExpertController.falseCount[4]++;
          }
        }
      } else if (key == 'اسناد و مدارک') {
        for (var model in value) {
          if (model.isHealthy == true) {
            automativeExpertController.trueCount[5]++;
          } else if (model.isHealthy == false) {
            automativeExpertController.falseCount[5]++;
          }
        }
      }
    });
  }

//
  void showBottomSheetForAddItemsDescrieption(item) {
    Get.bottomSheet(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: automativeExpertController.itemDescription,
                      decoration: const InputDecoration(
                          label: Text('توضیح جدید'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  // Container(
                  //   height: 60,
                  //   width: 60,
                  //   margin: const EdgeInsets.only(right: 10),
                  //   decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(4)),
                  //       color: Color.fromARGB(0, 0, 130, 153)),
                  //   child: IconButton(
                  //       onPressed: () {},
                  //       icon: const Icon(
                  //         Icons.add,
                  //         color: Color.fromARGB(255, 0, 95, 150),
                  //         size: 24,
                  //       )),
                  // )
                ],
              ),
            ),
            // add new itesm of check list descrieption
            ElevatedButton(
                onPressed: () {
                  item.description
                      .add(automativeExpertController.itemDescription.text);
                  automativeExpertController.automativeExpert.refresh();
                  Get.back();
                },
                child: const Text(
                  'اضافه کن',
                  style: TextStyle(fontSize: 18),
                )),
            const SizedBox(
              height: 15,
            )
          ],
        ),
        backgroundColor: Colors.white);
  }
}

class AddFullDesceiptionWidget extends StatelessWidget {
  const AddFullDesceiptionWidget({
    super.key,
    required this.automativeExpertController,
  });

  final AutomativeExpertController automativeExpertController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: TextField(
        controller: automativeExpertController.fullDescrption,
        maxLines: 3,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text('توضیحات تکمیلی')),
      ),
    );
  }
}

// add name and Specifications Widget
class SpecificationsWidget extends StatelessWidget {
  const SpecificationsWidget({
    super.key,
    required this.automativeExpertController,
  });

  final AutomativeExpertController automativeExpertController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: TextField(
            controller: automativeExpertController.carNameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('نام خودرو')),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: TextField(
            controller: automativeExpertController.carDescription,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text('سایر مشخصات')),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('سالم'),
              Checkbox(
                activeColor: Colors.green,
                value: true,
                onChanged: (value) {},
              ),
              Text('دارای ایراد'),
              Checkbox(
                activeColor: Colors.red,
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
