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
      body: SafeArea(
        child: SingleChildScrollView(
           child: Column(
             children: [Text('このアプリは、自分が作った料理を追加していくことで、後からどんな料理を作ったか見返せるアプリです。\n\n'),
               Container(
             width: double.infinity,
             child:
             Text('料理名を追加する時',style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline))),
               Container(width: double.infinity,
                   child:const Text(
                     "画面中央の下にある、オレンジの＋ボタンを押します"),),
               Image.asset('assets/images/button.JPEG'),
               Text(  "次に、８つのカテゴリの中から追加したい料理が当てはまるカテゴリを選びます。"),
               Image.asset('assets/images/appIcon.png'),
               Text("入力が終わったら✅ボタンを押し、料理の追加は完了です。"),
               Image.asset('assets/images/appIcon.png'),
               Container(
                   width: double.infinity,
                   child:Text('料理名を選択する時', textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline))),
               Image.asset('assets/images/appIcon.png'),
          Container(
              width: double.infinity,
              child:Text('もっと活用するために', textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline)),),
                Text('日付が表示されている画面の、左上の三本線のボタンを押してみてください。'),
               Container(
              width: double.infinity,
              child:Text('・メモ機能を使ってみましょう',style: TextStyle(color:Colors.lightBlueAccent,fontSize:18))),

               Image.asset('assets/images/appIcon.png'),
          Container(
              width: double.infinity,
              child:Text('使い方の例\n',style: TextStyle(decoration: TextDecoration.underline,fontSize: 16))),
                   Text('・賞味期限が近い食材を入力しておいて、外出先で見る事ができるようにする\n'
                   '・食べたい物リストを作り、献立時に参考にする\n\n'
                   '',textAlign: TextAlign.left),
               Text('この他にも、自分だけのメモ機能の使い方を見つけてみましょう。\n\n\n'),
              Container(
               width: double.infinity,
               child:Text('・ぶたのちょきんばこ機能を使ってみましょう',style: TextStyle(color:Colors.lightBlueAccent,fontSize:18))),
               Image.asset('assets/images/appIcon.png'),
               Container(
               width: double.infinity,
               child:Text('使い方の例\n')),
          Container(
              width: double.infinity,
              child:Text('・検索機能を使ってみましょう',style: TextStyle(color:Colors.lightBlueAccent,fontSize:18))),
               Text('ボタンを押す事で、それぞれのリンクの検索画面に飛ぶ事ができます。'),
               Container(height:200)
             ]
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







