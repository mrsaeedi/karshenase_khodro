import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karshenase_khodro/controllers/AutomativeExpertController.dart';
import 'package:karshenase_khodro/view/automative_expert_cheklist.dart';
import 'package:karshenase_khodro/view/car_item.dart';

class AddedCars extends StatelessWidget {
  AddedCars({super.key});
  AutomativeExpertController automativeExpertController =
      Get.put(AutomativeExpertController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'لیست خودرو های کارشناسی شده',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: automativeExpertController.addedCars.isEmpty
                  ? const Center(
                      child: Text(
                      'هنوز آیتمی وجود ندارد',
                      style: TextStyle(fontSize: 16),
                    ))
                  : Obx(() => ListView.builder(
                        itemCount: automativeExpertController.addedCars.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                            onLongPress: () {
                              {}
                              Get.defaultDialog(
                                title:
                                    '« ${automativeExpertController.addedCars.reversed.toList()[index].name} » حذف شود؟ ',
                                middleText: '',
                                textCancel: 'لغو',
                                textConfirm: 'حذف',
                                onConfirm: () {
                                  automativeExpertController.deleteCarFromHive(
                                      (automativeExpertController
                                                  .addedCars.length -
                                              1) -
                                          index);
                                  automativeExpertController.addedCars.removeAt(
                                      (automativeExpertController
                                                  .addedCars.length -
                                              1) -
                                          index);
                                  Get.back();
                                },
                              );
                            },
                            onTap: () {
                              automativeExpertController.selectedItemIndex =
                                  (automativeExpertController.addedCars.length -
                                          1) -
                                      index;
                              Get.to(CarItem());
                            },
                            title: Text(automativeExpertController
                                .addedCars.reversed
                                .toList()[index]
                                .name),
                            leading: Text('${index + 1}'),
                          ));
                        },
                      )),
            ),
            ElevatedButton(
                onPressed: () async {
                  automativeExpertController.carNameController.clear();
                  automativeExpertController.carDescription.clear();
                  automativeExpertController.fullDescrption.clear();
                  automativeExpertController.itemDescription.clear();
                  automativeExpertController.isEditingMode = false;
                  for (int i = 0;
                      i < automativeExpertController.trueCount.length;
                      i++) {
                    automativeExpertController.trueCount[i] = 0;
                  }
                  for (int i = 0;
                      i < automativeExpertController.falseCount.length;
                      i++) {
                    automativeExpertController.falseCount[i] = 0;
                  }

                  automativeExpertController.automativeExpert
                      .forEach((key, value) {
                    for (var item in value) {
                      item.isHealthy = null;
                    }
                  });
                  automativeExpertController.automativeExpert
                      .forEach((key, value) {
                    for (var item in value) {
                      item.description.clear();
                    }
                  });
                  await Future.delayed(Duration.zero, () {
                    Get.to(AutomativeExpertCheklist());
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'اضافه کردن',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
