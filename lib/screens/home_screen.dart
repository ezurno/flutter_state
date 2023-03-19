import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSecond = 1500;
  late Timer timer;
  // 사용자가 버튼을 눌렀을 시에만 timer가 작동해야 하므로 late

  bool isRun = false;

  void onTick(Timer timer) {
    setState(() {
      if (totalSecond != 0) {
        totalSecond -= 1;
      }
    });
  }

  void onStated() {
    /**
     * periodic 함수는 특정 주기마다 함수를 싱행
     */
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRun = true;
    });
  }

  void onPaused() {
    timer.cancel();
    // timer를 멈추는 함수

    setState(() {
      isRun = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            // UI를 기반으로 더 유연하게 해주는 Widget
            flex: 1,
            // flex 는 각 flexible 당 할당하는 화면 배율의 크기
            child: Container(
              alignment: Alignment.bottomCenter,
              // alignment 는 child 가 시작할 align의 위치를 정해줌 (하단 중앙에 시작)
              child: Text(
                "$totalSecond",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                color: Theme.of(context).cardColor,
                iconSize: 100,
                onPressed: isRun ? onPaused : onStated,
                icon: isRun
                    ? const Icon(
                        Icons.pause_circle_outline_rounded,
                      )
                    : const Icon(
                        Icons.play_circle_outline_rounded,
                      ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        // 테두리를 둥글게 해줌
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Jumodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
