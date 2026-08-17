import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'validators.dart';
import 'start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const StartPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? m  ;
  double? f;
  double? b;
  final _formKey = GlobalKey<FormState>();

  // เพิ่ม controllers
  final TextEditingController mController = TextEditingController();
  final TextEditingController flController = TextEditingController();
  final TextEditingController bController = TextEditingController();

  void goToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilePage()),
    );
  }

  void showMessagedialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("OK", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget textFormFieldElement() {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          controller: mController,
          decoration: const InputDecoration(
            labelText: 'ระยะทาง(กิโลเมตร)',
            prefixIcon: Icon(Icons.route,color: Color.fromARGB(255, 255, 251, 0)),
          ),
          validator: Validators.multiValidator([
            Validators.required(errorMessage: 'กรุณากรอกระยะทาง'),
            Validators.numberValidator(errorMessage: 'กรอกเป็นตัวเลขเท่านั้น'),
            Validators.minValue(minValue: 0, errorMessage: "ค่าต้องไม่ติดลบ"),
          ]),
          onChanged: (value) {
            m = double.tryParse(value);
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: flController,
          decoration: const InputDecoration(
            labelText: 'อัตราสิ้นเปลือง(กม./ลิตร)',
            prefixIcon: Icon(Icons.timeline,color: Color.fromARGB(255, 85, 255, 0)),
          ),
          validator: Validators.multiValidator([
            Validators.required(errorMessage: 'กรุณากรอกอัตราสิ้นเปลือง'),
            Validators.numberValidator(errorMessage: 'กรอกเป็นตัวเลขเท่านั้น'),
            Validators.minValue(minValue: 0, errorMessage: "ค่าต้องไม่ติดลบ"),
          ]),
          onChanged: (value) {
            f = double.tryParse(value);
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: bController,
          decoration: const InputDecoration(
            labelText: 'ราคาน้ำมัน(บาท/ลิตร)',
            prefixIcon: Icon(Icons.local_gas_station ,color: Color.fromARGB(255, 255, 0, 0)),
          ),
          validator: Validators.multiValidator([
            Validators.required(errorMessage: 'กรุณากรอกราคาน้ำมัน'),
            Validators.numberValidator(errorMessage: 'กรอกเป็นตัวเลขเท่านั้น'),
            Validators.minValue(minValue: 0, errorMessage: "ค่าต้องไม่ติดลบ"),
          ]),
          onChanged: (value) {
            b = double.tryParse(value);
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.calculate, color: Colors.white),
              label: const Text('คำนวณ', style: TextStyle(color: Colors.white)),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                double max = m!/f!;
                double totalcost =  max * b!;

                showMessagedialog(
                  "ผลการคำนวณ",
                  " ปริมาณน้ำมันที่ต้องใช้= ${max.toStringAsFixed(2)} ลิตร\n"
                  " ค่าใช้จ่ายรวม  = ${totalcost.toStringAsFixed(2)} บาท",
                );
              },
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              icon: const Icon(Icons.clear, color: Colors.white),
              label: const Text('ล้างค่า', style: TextStyle(color: Colors.white)),
              onPressed: () {
                mController.clear();
                flController.clear();
                bController.clear();
                setState(() {
                  m = null;
                  f = null;
                  b = null;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    mController.dispose();
    flController.dispose();
    bController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 247, 251),
        title: const Text("เดินทางด้วยรถน้ำมัน 🚗"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: goToProfile,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: textFormFieldElement(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
