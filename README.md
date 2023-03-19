# 🛠️플러터 State 배우기

## 시작하기 전에...

- **Flutter**는 **Dart**를 사용하므로 [다트 문법 다시보기](https://github.com/ezurno/dart-learn)
- ⚙️INSTALLATION 참고
- flutter doctor 로 파일 생성시 문제가 없는지 issue check
- powershell 에서 flutter create projectName
- projectName 은 [Naming 규칙](https://dart.dev/tools/pub/pubspec#name)을 따라야 함
- Vscode를 바로 실행하면 간혹 AVD가 켜지지 않으므로 powershell 에서 `code .` 를 사용해야 함

<br/>
<hr/>

###### 20230316

> ## Stateful Widget

<br/>

- **Stateful Widget**은 **Stateless** 와는 다르게 State를 사용해 ui 와 상호작용을 하는 widget

<img src ="md_resources\resource_1.png" width="400"/>
<br/>

- `st` 를 입력하면 바로 **Stateful Widget** 과 **Stateless Widget** 을 생성할 수 있음

<br/>
<p>
<img src ="md_resources\resource_3.png" height="200"/>
<img src ="md_resources\resource_4.png" height="200"/>
</p>
<br/>

- **flutter** 는 **State** 값이 바뀌는걸 알려주지 않으면 바로 적용이 되지 않음
- `setState()` 를 사용해줘서 **State**에게 **state**가 바뀌었음을 알려주어야 함
- 그 후 클릭하면 제대로 반응하는 모습

<br/>
<hr/>

###### 20230317

> ## Context 는 무엇인가?

<br/>

- **Context**는 상위 **Widget**의 값을 가져올 떄 사용
- 가장 최근 Widget의 값을 가져옴 (상속)

<br/>

```Dart

Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),

/* 중략 */

// 하위 Widget 의 build
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

```

<br/>
<img src ="md_resources\resource_5.png" width="400"/>
<br/>
<br/>

- 상위 **Widget** 의 **theme** 설정을 잘 가져온 모습

<br/>

> ## Widget의 Lifecycle

<br/>
<img src ="md_resources\resource_6.png" width="400"/>
<br/>
<br/>

- 생명주기를 확인해보기 위해 `print`를 달아서 확인

<br/>

**initState**

- State 상태값을 초기화 하는데 사용
- initState가 build 보다 먼저 나와야 함
- API update 에 사용함

**build**

- Widget을 실행할 때 실행 되는 함수

**dispose**

- **Widget**이 사라질 때 실행되는 함수

<br/>

<br/>
<img src ="md_resources\resource_7.png" width="400"/>
<br/>
<br/>

- **widget**이 사라지는 **toggle** 버튼을 만들어 widget의 생명주기를 확인해봄

<br/>
<hr/>

###### 20230318

> ## Jumodoro 만들기 ( Pomodoro-Clone )

<br/>

- **Setting** 초기화
- **theme** 을 지정, **flutter** 업데이트로 사용법이 바뀌었으므로 참고
- `alignment` 로 `child`의 위치를 지정해 줄 수 있음

```Dart
 MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          // 배경화면 세팅
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    );
```

<br/>

## Flexible

<br/>

- **Flexible** 은 `css` 의 **grid** 와 비슷함
- UI에 맞춰서 화면을 분할하기 편함
- `flex`는 화면을 분할 할 시 그 배율 값을 지정

<br/>
<br/>
<img src ="md_resources\resource_8.png" width="400"/>
<br/>
<br/>

- 화면을 분할 적용한 모습

<br/>
<br/>

## Expanded

<br/>

- **Expanded** 는 `widget`을 확장해 줄 때 사용
- **Row** 와 함께 써서 가로축 방향으로 화면 끝까지 확장

<br/>
<br/>
<p>
<img src ="md_resources\resource_9.png" width="250"/>
<img src ="md_resources\resource_10.png" width="250"/>
<img src ="md_resources\resource_11.png" width="250"/>
<p/>
<br/>
<br/>

<br/>
<br/>

## Timer 생성하기

<br/>

- **Timer** 는 타이머를 만들기 위해 사용
- `Timer.periodic`은 **duration** 과 **timer** args를 갖는데, **duration**은 특정 함수가 실행되는 주기 이며 **timer** 는 실행 되는 함수임

<br/>
<br/>
<img src ="md_resources\resource_12.png" height="250"/>

- 주기마다 실행 되는 함수는 매개변수로 `Timer args`를 가져야 하므로 args 에 `Timer timer` 를 넣어주어야 함

```Dart
  void onTick(Timer timer) {
    setState(() {
      if (totalSecond != 0) {
        totalSecond -= 1;
      }
    });
  } // Timer timer args 를 넣어주어 해결
```

<br/>
<br/>
<img src ="md_resources\resource_13.png" height="250"/>

- 각 변수와 실행 함수 위치에 `totalSecond` `onStarted` 를 적절히 사용하여 정상 작동하는 모습

<br/>
<hr/>

###### 20230319

> ## 세부설정 하기

<br/>

## Pause button 생성

<img src="md_resources\resource_14.png" width="200"/>

<br/>

- 일시정지를 하기 위해 **Pause** 버튼을 `toggle` 시 보이게끔 설정
- 버튼을 눌러 실행 시 정상적으로 일시정지 버튼이 보이는 모습

<br/>
<br/>

## lap-counter 세기

<img src="md_resources\resource_15.png" width="200"/>

<br/>

- 타이머가 시간을 다 쟀을 경우 `totalLap` 을 세어 줌
- 빠르게 체크하기 위해 상단의 `totalSecond` 를 10으로 줄였음
- 하단에 `lap-counter`가 정상적으로 출력 됨

<br/>
<br/>

## Fomatter 로 시간 형태로 나타내기

<br/>

- 상단의 시간이 시간의 형태로 나타내고 싶음
- fomatter 라는 함수를 만들어 `Duration` 을 사용해 세팅
- `Duration`은 각 타입에 맞춰서 형태를 변환 할 수 있음

<br/>

```Dart
  String formatter(int time) {
    var duration = Duration(seconds: time);
    print(duration);
    return "$duration".toString().substring(2, 7);
  }
```

<br/>

<img src="md_resources\resource_16.png" width="200"/>

<br/>

- 상단의 시간이 정상적으로 시간의 형태를 나타냄

<br/>

<br/>

<br/>
