import 'package:flutter/material.dart';
import 'package:student_lsit/DetailPage.dart';
import 'package:student_lsit/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
      Student("ธนบดี สวัสดี", "643450325-4", "image/Thanabodee.jpg", "thanabodee.s.s@kkkumail.com", "ชอบลักเธอ เพราะเธอน่ารัก", "FB: Arun Srisawad"),
      Student("อภิทุน ดวงจันทร์คล้อย", "643450096-3", "image/Apitun.jpg", "aphithun.d@kkumail.com", "สนใจการทำ เว็บไซต์", "FB: Pond TH"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My App"),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return displayItem(context: context, student: datas[index]);
        },
      ),
    );
  }

  Widget displayItem({
    required BuildContext context,
    required Student student,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              data: student,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipOval(
              child: Image(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                image: AssetImage(student.image),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  student.studentid,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
