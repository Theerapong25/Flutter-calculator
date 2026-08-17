import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 247, 251),
        title: const Text("ข้อมูลผู้พัฒนา"),
      ),
      body: Container(
        
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Image.asset('assets/images/SP003.png',
                        width: 150, 
                        height: 150, 
                        fit: BoxFit.cover
                        ),
                  
                  const SizedBox(height: 15),
                  const Text("รหัสนิสิต: 6621600925 ", style: TextStyle(fontSize: 18)),
                  const Text("ชื่อ-นามสกุล: นายธีรพงศ์ กลิ่นฟุ้ง ", style: TextStyle(fontSize: 18)),
                  const Text("เบอร์โทร: 098 - 4702119 ", style: TextStyle(fontSize: 18)),
                  const Text("Email: threeapong.kl@ku.th ",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
