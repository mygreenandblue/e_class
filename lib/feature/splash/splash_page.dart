// ignore_for_file: library_private_types_in_public_api

import 'package:eclass/accessibility/accessibility_page.dart';
import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/wave_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 6500));
    final Animation<double> curve = CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutSine,
        reverseCurve: Curves.easeInOutSine);
    animation = Tween<double>(begin: 0, end: 1).animate(curve);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(
        reverse: true, period: const Duration(milliseconds: 6500));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = -MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Expanded(
            flex: 1,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Transform.translate(
                offset: Offset(animation.value * 0 * width, 0),
                child: SizedBox(
                  height: 200,
                  width: 1000,
                  child: CustomPaint(
                    painter: WavePainter(
                      realSize: Size(-width * 12, 200),
                      colors: const [
                        Color(0xFF001719),
                        Color(0xFF1B807C),
                        Color(0xFF8DD3CB),
                        // Color(0xFF016D69),
                      ],
                      pick: 20,
                      amount: 8,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/logos/logo.png'),
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Xin chào,',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '0987 490 560',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: Colors.white),
                          onPressed: () {
                            // Notifications action
                          },
                        ),
                      ],
                    ).paddedOnly(top: 0.0, left: 20.0, right: 20.0),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(animation.value * 10 * width, 0),
                child: SizedBox(
                  height: 50,
                  width: -width * 6,
                  child: CustomPaint(
                    painter: WavePainter(
                      realSize: Size(-width * 20, 50),
                      colors: const [
                        Color(0xFF001719),
                        Color(0xFF1B807C),
                        Color(0xFF8DD3CB),
                        // Color(0xFF016D69),
                      ],
                      pick: 30,
                      amount: 10,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bạn muốn\nxem thông tin của con:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      buildChildCard(
                        context,
                        'Nguyễn Phương Anh',
                        'Lớp Lá',
                        'Trường mầm non Hoa sen',
                        Colors.green,
                        'assets/logos/logo.png',
                      ),
                      buildChildCard(
                        context,
                        'Nguyễn Ngọc Anh',
                        'Lớp 2A3',
                        'Trường Tiểu học Ngọc Khánh',
                        Colors.purple,
                        'assets/logos/logo.png',
                      ),
                      buildChildCard(
                        context,
                        'Nguyễn Văn Minh',
                        'Lớp 6A5',
                        'Trường THCS Lý Thường Kiệt',
                        Colors.orange,
                        'assets/logos/logo.png',
                      ),
                      buildChildCard(
                        context,
                        'Nguyễn Vân Anh',
                        'Lớp 11A4',
                        'Trường THPT Giảng Võ',
                        Colors.lightBlue,
                        'assets/logos/logo.png',
                      ),
                    ],
                  ),
                ),
              ],
            ).padded(16.0),
          ),
        ],
      ),
    );
  }

  Widget buildChildCard(BuildContext context, String name, String grade,
      String school, Color color, String avatar) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.homePath),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  grade,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  school,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
