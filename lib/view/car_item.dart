import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:karshenase_khodro/controllers/AutomativeExpertController.dart';
import 'package:karshenase_khodro/models/automative_expert_cheklist_model.dart';
import 'package:karshenase_khodro/view/automative_expert_cheklist.dart';

class CarItem extends StatelessWidget {
  CarItem({super.key});
  AutomativeExpertController automativeExpertController =
      Get.put(AutomativeExpertController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      'نام خودور: ${automativeExpertController.addedCars[automativeExpertController.selectedItemIndex!].name}',
                      style: const TextStyle(color: Colors.black, fontSize: 24),
                    )),
              ],
            ),
            // car descieption
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'مشخصات: ${automativeExpertController.addedCars[automativeExpertController.selectedItemIndex!].other}',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: automativeExpertController
                    .addedCars[automativeExpertController.selectedItemIndex!]
                    .expert
                    .length,
                itemBuilder: (context, index) {
                  List catItems = automativeExpertController
                      .addedCars[automativeExpertController.selectedItemIndex!]
                      .expert
                      .values
                      .toList()[index];
                  return index == 0
                      ? const SizedBox()
                      : index ==
                              automativeExpertController
                                      .addedCars[automativeExpertController
                                          .selectedItemIndex!]
                                      .expert
                                      .length -
                                  1
                          ?
                          // full description for car
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(6)),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(96, 158, 158, 158),
                                        width: 2,
                                      )),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: Text(
                                    automativeExpertController
                                        .addedCars[automativeExpertController
                                            .selectedItemIndex!]
                                        .fullDescription,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                  width: 150,
                                  child: EditButton(
                                      automativeExpertController:
                                          automativeExpertController),
                                ),
                              ],
                            )
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
                                title: Row(
                                  children: [
                                    Text(automativeExpertController
                                        .addedCars[automativeExpertController
                                            .selectedItemIndex!]
                                        .expert
                                        .keys
                                        .toList()[index]),
                                    Spacer(),
                                    const Icon(
                                      Icons.check_circle,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(automativeExpertController
                                        .trueCount[index]
                                        .toString()),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    automativeExpertController
                                                .trueCount[index] ==
                                            0
                                        ? SizedBox()
                                        : const Icon(
                                            Icons
                                                .do_not_disturb_on_total_silence_outlined,
                                            color: Colors.red,
                                            size: 16,
                                          ),
                                    automativeExpertController
                                                .trueCount[index] ==
                                            0
                                        ? SizedBox()
                                        : Text(automativeExpertController
                                            .falseCount[index]
                                            .toString()),
                                  ],
                                ),
                                children: catItems.map<Widget>((item) {
                                  return Container(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: Color.fromARGB(
                                                      110, 158, 158, 158),
                                                  width: 1))),
                                      child: ListTile(
                                        title: Text(item.title),
                                        subtitle: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  item.description.length,
                                              itemBuilder: (context, index) {
                                                return Text(
                                                    item.description[index]);
                                              },
                                            ),
                                          ],
                                        ),
                                        trailing: (item.isHealthy == true)
                                            ? const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                            : (item.isHealthy == false)
                                                ? const Icon(
                                                    Icons
                                                        .do_not_disturb_on_total_silence_outlined,
                                                    color: Colors.red,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .do_not_disturb_alt_outlined,
                                                    color: Colors.yellow,
                                                  ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.automativeExpertController,
  });

  final AutomativeExpertController automativeExpertController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
          style: ButtonStyle(),
          // edit button
          onPressed: () {
            // فرض می‌کنیم که selectedItemIndex مقدار اندیس مورد نظر را دارد

            if (automativeExpertController.selectedItemIndex != null) {
              // دریافت نام دسته فعلی
              String currentCategory = automativeExpertController
                  .automativeExpert.keys
                  .toList()[automativeExpertController.selectedItemIndex!];

              // دریافت لیست مدل‌های متعلق به دسته فعلی
              List<AutomativeExpertModel> currentCategoryModels =
                  automativeExpertController
                          .automativeExpert[currentCategory] ??
                      [];

              // انتخاب مقدار isHealthy از مدل‌های دسته فعلی
              bool? selectedIsHealthy = currentCategoryModels
                  .map((model) => model.isHealthy)
                  .firstWhere((isHealthy) => isHealthy != null,
                      orElse: () => null);

              if (selectedIsHealthy != null) {
                // تنظیم مقدار isHealthy برای تمام مدل‌های Car
                for (var car in automativeExpertController.carList) {
                  car.expert[currentCategory]?.forEach((model) {
                    model.isHealthy = selectedIsHealthy;
                  });
                }
              }
            }

            automativeExpertController.isEditingMode = true;
            automativeExpertController.carNameController.text =
                automativeExpertController
                    .addedCars[automativeExpertController.selectedItemIndex!]
                    .name;
            automativeExpertController.carDescription.text =
                automativeExpertController
                    .addedCars[automativeExpertController.selectedItemIndex!]
                    .other;
            automativeExpertController.fullDescrption.text =
                automativeExpertController
                    .addedCars[automativeExpertController.selectedItemIndex!]
                    .fullDescription;
            Get.to(AutomativeExpertCheklist());
          },
          child: const Row(
            children: [
              Text(
                'ویرایش',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.edit_document),
            ],
          )),
    );
  }
}
