import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text("這是我的自傳？"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
                             type: BottomNavigationBarType.fixed,
                             backgroundColor: Colors.blue,
                             selectedItemColor: Colors.white,
                             selectedFontSize: 18,
                             unselectedFontSize: 14,
                             iconSize: 30,
                             currentIndex: currentIndex,
                             items: [
                               BottomNavigationBarItem(icon: currentIndex==0? Image.asset('assets/a1.png', width: 40, height: 40,):Image.asset('assets/a11.png', width: 30, height: 30,), label:"自我介紹",),
                               BottomNavigationBarItem(icon: currentIndex==1? Image.asset('assets/a2.png', width: 40, height: 40,):Image.asset('assets/a21.png', width: 30, height: 30,), label:"學習歷程",),
                               BottomNavigationBarItem(icon: currentIndex==2? Image.asset('assets/a3.jpg', width: 40, height: 40,):Image.asset('assets/a31.jpg', width: 30, height: 30,), label:"學習計畫",),
                               BottomNavigationBarItem(icon: currentIndex==3? Image.asset('assets/a4.png', width: 40, height: 40,):Image.asset('assets/a41.png', width: 30, height: 30,), label:"專業方向",),
                             ],
                             onTap: (index) {
                               setState(() {
                                 previousIndex=currentIndex;
                                 currentIndex=index;
                                 if (index==0) {
                                    if (previousIndex==currentIndex) player.resume();
                                    player.stop();
                                    player.play(AssetSource("1.mp3"));
                                 }
                                 if (index==1) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("2.mp3"));
                                 }
                                 if (index==2) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("3.mp3"));
                                 }
                                 if (index==3) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("4.mp3"));
                                 }
                               });
                             },
                           ),
    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1="你知道嗎？\n"
      "學生有三大挑戰：學分、愛情、經濟力。而在這三大挑戰之中，"
      "因為學分是滿足學生生存需求的挑戰，所以，獲得學分的行為，"
      "在這三者之中，優先是第一位的。如果能在翹課的過程中，得到了甜美的學分，"
      "也能使人類無比愉快。而在現實生活中，存在著這種對快感執著追求的人，"
      "我們通常把這種人稱之為躺分仔。而本學校則專門為那些厭倦世間常見學分的學生，"
      "量體裁衣，叫他們明年回來給我重修。";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //標題
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Text("Who am I", style: TextStyle(fontSize: 32,
                                                     fontWeight: FontWeight.bold),
                   ),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3,),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6,6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20,)),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/a1.png'),
            width: 200,
            height: 200,
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/a2.png'), fit: BoxFit.cover),
                ),
              ),
              //SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/a3.jpg'), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Screen2');
  }
}
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("大一時期", style: TextStyle(fontSize: 24,)),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 140,
                //width: 200,
                child: ListView(
                  children: [
                    Text("1. 學好英文", style: TextStyle(fontSize: 20,)),
                    Text("2. 組合語言", style: TextStyle(fontSize: 20,)),
                    Text("3. 考取證照", style: TextStyle(fontSize: 20,)),
                    Text("4. 人際關係", style: TextStyle(fontSize: 20,)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(),
          SizedBox(height: 10,),
          Row(),
          SizedBox(height: 10,),
          Row(),
        ],
      ),
    );
  }
}
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Screen4');
  }
}
