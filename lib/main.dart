import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  printDynamicParams(12.33);
  printDynamicParams('liyahong');
  printDynamicParams("Dart Method test");
  printDynamicParams(10);
  printDynamicParams(true);
  // numTest();
  typeTest();
}

void symbolTest() {
  Map test = new Map();
  test[#t] = 'symbol test  ';
  print(test);
  print(test[#t]);
  print(test[Symbol('t')]);
  print(#t);
  // symbol 在dart中是反射的概念 不是唯一的
  // 说明 symbol字面量是编译时常量，在标识符前面加#。如果是动态确定，则使用Symbol构造函数，通过new来实例化。
}

void typeTest() {
//  弱类型   var object dynamic
// var   在第一次 类型声明时会绑定 类型 例如 var t = '133'  ;之后 在对t进行赋值 t=123 就会 报错，因为 变量 t已经绑定string类型了；
  // var t;
//  var t = '123';
//   t = 12;
// print(t);
// object 无约束,可以 进行任何类型赋值，类型js的var ，会对调用时进行一定的判断,减少使用
  Object a = '134';
// dynamic 也减少使用
// print(a.length);//
  String b = '134';
  print('${b.length},  b+:123'); //
  //  dart是强类型数据 dart  中 无=== 运算符
  //  简介写法如下
//   ？？运算符 ，比如t??'test' 是t!=null?t:'test'  缩写
// 级联操作，允许对 同一 对象或者同一函数 进行一系列操作，类似 与jq
// 例如 testObj.add('t')..delete('d)..show()
}

void numTest() {
  var number;
  int num2;
  num num1;
  double num3;
  print(
      'number is  var:$number,num2 is int  $num2, num1 is  num $num1 ,num3  is  double $num3 $double');
  // 未被 赋值的变量都会是null

  // 类似 模板字符串 在字符串里面$变量就行 ，注意与模板字符串的差别：1 引号 2单个的话可以无{},如果表达式或者需要拼接则用 {};
  //  如果此时变量名写错了 没有此变量会 报错 如果此时  是类型的话则原样 输出 不会报错，
  //   dart 是静态脚本 语言，dart没有定义一个变量是无法通过编译的
}

void printDynamicParams(dynamic params) {
  print(params);
}

fun5([int i, int j = 2]) {
  print(i);
  print(j);
  return i;
}

class Dog {
  String color;
  Dog.red() {
    this.color = 'red';
  }
  Dog.black() {
    this.color = 'black';
  }
  void main(List<String> args) {
    Dog redDog = new Dog.red();
    print(redDog.color);
    Dog blackDog = new Dog.black();
    print(blackDog.color);
  }
}

// 一个类可以实现多个构造函数，
//  访问控制 默认情况下都 是public,如果需要设置为私有属性 ，则在方法或者属性前使用_
// 抽象类和泛型类  抽象类无法实例化

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '123',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击按钮的次数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
