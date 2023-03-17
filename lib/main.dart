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

  void onClicked() {
    setState(() {
      counter = counter + 1;
    }); // setState 는 state가 변경 됐을 시 알려주는 함수
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
      home: const Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
