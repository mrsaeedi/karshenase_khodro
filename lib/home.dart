import 'package:flutter/material.dart';

import 'view/added_cars.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
            child: Column(
          children: [Text('نسخه اپلیکیشن')],
        )),
        appBar: AppBar(
          title: const Text('کارشناسی خودرو'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 134, 139),
          elevation: 0,
        ),
        body: AddedCars(),
      ),
    );
  }
}
