// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spaces/map_screen.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F2B3E),
      body: Column(
        children: [
          selectedIndex == 0 ? HomePage() : ProfilePage(),  // استدعاء الصفحات بناءً على العنصر المحدد
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              navItem(0, 'assets/svg/home.svg', 'Home'),  // استدعاء وظيفة navItem مع الإشارة للصفحة الرئيسية
              navItem(1, 'assets/svg/person.svg', 'Profile'),  // استدعاء وظيفة navItem مع الإشارة لصفحة البروفايل
            ],
          )
        ],
      ),
    );
  }
  Widget navItem(int index, String assetName, String label) {  // وظيفة لإنشاء العناصر المنقولة
    bool isActive = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 160,
        height: 70,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.16),  // تغيير اللون بناءً على العنصر النشط
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetName,
            width: 30,
            color: isActive ? Colors.black : Colors.white,  // تغيير لون الأيقونة
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/svg/setting.svg'
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'خدماتي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen())
                );
              },
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/cont.svg'
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5.0,left: 130),
                    child: Text(
                      'اكتشف\nالمواقع',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/wallet.svg',
                          width: 100,
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'التصاريح',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    )
                  ],
                ),
                SizedBox(width: 35,),
                Column(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/helpself.svg',
                          width: 100,
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'المساعد الشخصي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}