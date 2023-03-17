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

- 상위 **Widget** 의 **theme** 설정을 잘 가져온 모습
