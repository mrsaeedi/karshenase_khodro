import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:karshenase_khodro/models/automative_expert_cheklist_model.dart';

class AutomativeExpertController extends GetxController {
  bool isEditingMode = false;
  int? selectedItemIndex;
  RxList<Car> carList = <Car>[].obs;
  // RxList<Car> newCar = Hive.box<Car>('carBox').values.toList().obs;
  RxBool? expansionTileOpenCheack;

  ///
  RxMap<String, List<AutomativeExpertModel>> automativeExpert =
      <String, List<AutomativeExpertModel>>{
    '': [],
    'بدنه و شاسی': [
      AutomativeExpertModel(
          title: 'در جلو راننده', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'کاپوت', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'در  جلو شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'در عقب راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'در عقب شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'گلگیر جلو راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'گلگیر عقب راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'گلگیر جلو شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'گلگیر عقب شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'سقف', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'در صندوق', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ستون جلو سمت شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ستون وسط شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ستون عقب سمت شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ستون جلو سمت راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ستون وسط راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ستون عقب سمت راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'شاسی جلو', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'شاسی عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کف صندوق عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کلاف سمت شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کلاف سمت راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'سینی فن و جاچراغی', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'سپر جلو', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'سپر عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'رکاب سمت راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'رکاب سمت شاگرد', description: [], isHealthy: null),
    ],
    'فنی': [
      AutomativeExpertModel(
          title: 'تطبیق کارکرد با ظاهر خودرو',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'جلو بندی', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'پلوس', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'دیسک چرخ', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کمک جلو سمت راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کمک عقب سمت راننده', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کمک جلو سمت شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کمک عقب سمت شاگرد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت عملکرد موتور', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'دسته موتور', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تست دیاگ سنسور اکسیژن', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تسمه دینام و هرز گردها', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تست دیاگ سنسور دور موتور', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تست دیاگ سنسور فشار هوا منیفولد',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'تست دیاگ سیستم احتراق', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تعویض دنده ها', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت ظاهری گیربکس (پوسته گیربکس)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'یونیت ABS', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت لنت ها', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'ترمز دستی (ترمز پارک)', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'جعبه فرمان', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'فرمان برقی', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت باتری', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'منبع اگزوز', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کاتالیزور', description: [], isHealthy: null),
    ],
    'آپشن و رفاهی': [
      AutomativeExpertModel(
          title: 'سنسور فاصله عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'دوربین دنده عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'شیشه جلو', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'شیشه عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'آینه های بغل (برقی-مکانیکی)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'چراغ جلو', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'چراغ خطر عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'مه شکن جلو', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'برف پاک کن جلو', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'برف پاک کن عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'آب پاش برف پاک کن', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'دی لایت (Daylights)', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'سیستم روشنایی اتومات (اتولایت)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(title: 'بوق', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'جک و آچار چرخ', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'در بازکن باک بنزین', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تست دیاگ ایربگ', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'سیستم تهویه', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'سنسور باران', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'تنظیمات صندلی راننده (برقی-مکانیکی)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'تنظیمات صندلی سرنشین جلو(برقی-مکانیکی)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'سرد کن صندلی ها', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'گرم کن صندلی', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'روکش صندلی ها', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'مولتی مدیا و سیستم صوتی', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت داشبورد', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کمربند ایمنی', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کلیدهای کنترل صوتی روی فرمان',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'قفل مرکزی', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کروز کنترل', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'عملکرد بازکننده درب صندوق (برقی-مکانیکی)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'تنظیم محل قرارگیری فرمان (برقی-مکانیکی)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'کلیدهای تنظیم حالات رانندگی ( درایو مد)',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'سیستم سانروف', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'گرم کن شیشه عقب', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کی لس (keyless)', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت غربیلک فرمان', description: [], isHealthy: null),
    ],
    'رینگ و لاستیک': [
      AutomativeExpertModel(
          title: 'میزان آج لاستیک جلو سمت راننده',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'میزان آج لاستیک جلو سمت شاگرد',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'میزان آج لاستیک عقب سمت راننده',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'میزان آج لاستیک عقب سمت شاگرد',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت ظاهری رینگ جلو راننده',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت ظاهری رینگ جلو شاگرد',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت ظاهری رینگ عقب راننده',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'وضعیت ظاهری رینگ عقب شاگرد',
          description: [],
          isHealthy: null),
      AutomativeExpertModel(
          title: 'لاستیک زاپاس', description: [], isHealthy: null),
    ],
    'اسناد و مدارک': [
      AutomativeExpertModel(
          title: 'مانده بیمه شخص ثالث', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'نوع سند', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'برگه سبز', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'کارت ماشین', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'سند خودرو', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'سند کمپانی', description: [], isHealthy: null),
      AutomativeExpertModel(
          title: 'معاینه فنی', description: [], isHealthy: null),
      AutomativeExpertModel(title: 'گارانتی', description: [], isHealthy: null),
    ],
    ' ': []
  }.obs;
  //
  TextEditingController carNameController = TextEditingController();
  TextEditingController carDescription = TextEditingController();
  TextEditingController fullDescrption = TextEditingController();
  TextEditingController itemDescription = TextEditingController();
  List expertsIcon = const [
    Icon(Icons.no_crash),
    Icon(Icons.no_crash),
    Icon(Icons.energy_savings_leaf),
    Icon(Icons.airline_seat_recline_extra_sharp),
    Icon(Icons.circle),
    Icon(Icons.edit_document),
    Icon(Icons.edit_document),
  ];
  RxList<Car> addedCarsRevers = <Car>[].obs;
  RxList<Car> addedCars = <Car>[].obs;

  List trueCount = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  List falseCount = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  void updateCarInHive(
      {index, expert, name, fullDescription, other, t, f}) async {
    await Hive.box<Car>('carBox').putAt(
        index,
        Car(
            trueCounter: t,
            falseCounter: f,
            expert: expert,
            name: name,
            fullDescription: fullDescription,
            other: other));
  }

  void loadCarsFromHive() {
    final carBox = Hive.box<Car>('carBox');
    addedCars.assignAll(carBox.values.toList());
  }

  void deleteCarFromHive(index) {
    Hive.box<Car>('carBox').deleteAt(index);
  }

  @override
  void onInit() async {
    super.onInit();
    loadCarsFromHive();

    // اضافه کردن یک واچر برای تغییرات در باکس Hive
    Hive.box<Car>('carBox').watch().listen((event) {
      // اگر داده‌ها در باکس تغییر کنند، آنها به لیست carList اضافه می‌شوند
      loadCarsFromHive();
    });
  }
}
