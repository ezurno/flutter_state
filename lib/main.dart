import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0; // state 기 때문에 final x
  bool showTitle = true;

  void onClicked() {
    setState(() {
      counter = counter + 1;
    }); // setState 는 state가 변경 됐을 시 알려주는 함수
  }

  void toggleShow() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ), // MaterialApp 내 자체 css를 주는 법
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MainTitle() : const Text("nothing"),
              IconButton(
                  onPressed: toggleShow,
                  icon: const Icon(Icons.remove_red_eye_outlined))
            ],
          ),
        ),
      ),
    );
  }
}

class MainTitle extends StatefulWidget {
  const MainTitle({
    super.key,
  });

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {
  @override
  void initState() {
    // State 상태값을 초기화 하는데 사용
    // initState가 build 보다 먼저 나와야 함
    // API update 에 사용함
    super.initState();
    print("init State!");
  }

  @override
  void dispose() {
    // widget이 사라질 때 호출되는 함수
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("build!");

    // context는 부모의 값을 가져올때 사용
    // 상위 위젯의 데이터를 가져올 때 사용 가능함
    return Text(
      "Main Title",
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        color: Theme.of(context).textTheme.titleLarge?.color,
        //Theme.of() 로 context를 가져옴 >> 상위 위젯의 설정을 가져옴
      ),
    );
  }
}
