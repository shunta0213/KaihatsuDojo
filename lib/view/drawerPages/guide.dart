import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('このアプリの使い方', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
           child: Column(
             children: [Container(
             width: double.infinity,
             child:
             Text('料理名を追加する時',style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline))),
               Container(color: Colors.white,width: double.infinity,
                   child:const Text(
                     "画面中央の下にある、オレンジの＋ボタンを押します。"),),
               Image.asset('assets/images/appIcon.png'),
               Text(  "次に、８つのカテゴリの中から追加したい料理が当てはまるカテゴリを選びます。"),
               Image.asset('assets/images/appIcon.png'),
               Text("入力が終わったら✅ボタンを押し、料理の追加は完了です。"),
               Image.asset('assets/images/appIcon.png'),
               myContainer(color: Colors.white),
               myContainer(color: Colors.white),
               const Text('料理名を選択する時',style: TextStyle(fontSize: 25,decoration: TextDecoration.underline)),
               myContainer(color: Colors.white),
               myContainer(color: Colors.white),
               myContainer(color: Colors.white),]
               ),
           ),
         ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      );
    }
}
    Widget myContainer( { double size = 300,required Color color, String text = ''}) {
      return Container(
        color: color,
        height: size,

        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      );
    }






