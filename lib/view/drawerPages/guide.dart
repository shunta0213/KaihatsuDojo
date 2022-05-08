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
             children: [Text('このアプリは、自分が作った料理を追加していくことで、後からどんな料理を作ったかを見返せるアプリです。\n\n'),
               Container(
             width: double.infinity,
             child:
             Text('料理名を追加する時',style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline))),
               Container(width: double.infinity,
                   child:const Text(
                     "画面中央の下にある、オレンジの＋ボタンを押します"),),
               Image.asset('assets/images/button.JPEG'),
               Text(  "次に、追加したい料理が当てはまるジャンルを選び、メニュー名を入力し、その料理に関するメモがあればメモを残します。"),
               Image.asset('assets/images/ジャンル.JPEG'),
               Text("入力が終わったら✅ボタンを押し、料理の追加は完了です。\n"),
               Image.asset('assets/images/checkbutton2.JPEG'),
               Container(
                   width: double.infinity,
                   child:Text('料理名を選択する時', textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline))),
          Container(
              width: double.infinity,
              child:Text('まず、画面右下のlistボタンを押します。')),
               Image.asset('assets/images/list.JPEG'),
              Text('\n\n次に、その料理のジャンルを、以下の８個の中から選びます。'),
               Image.asset('assets/images/選択.JPEG'),
               Text('すると、以前自分が追加していた料理が出て来るため、料理の選択ができます。\n\n'),
          Container(
              width: double.infinity,
              child:Text('もっと活用するために', textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color:Colors.blueAccent,decoration: TextDecoration.underline)),),
                Text('日付が表示されている画面の、左上の三本線のボタンを押してください。'),
               Image.asset('assets/images/三本線2.JPEG'),
               Container(
              width: double.infinity,
              child:Text('・メモを使ってみましょう\n',style: TextStyle(color:Colors.lightBlueAccent,fontSize:18))),
          Container(
              width: double.infinity,
              child:Text('メモを押します。')),
               Image.asset('assets/images/メモ2.JPEG'),
          Container(
              width: double.infinity,
              child:Text('\n使い方の例\n',style: TextStyle(decoration: TextDecoration.underline,fontSize: 16))),
                   Text('・賞味期限が近い食材を入力しておいて、外出先で見る事ができるようにする\n'
                   '・食べたい物リストを作り、献立時に参考にする\n\n'
                   '',textAlign: TextAlign.left),
               Text('この他にも、自分だけのメモ機能の使い方を見つけてみましょう。\n\n\n'),
              Container(
               width: double.infinity,
               child:Text('・検索や、電子書籍、記事を使ってみましょう',style: TextStyle(color:Colors.lightBlueAccent,fontSize:18))),
               Text('ボタンを押す事で、それぞれのリンクの画面に飛ぶ事ができます。'),
               Image.asset('assets/images/検索.JPEG'),
          Container(
              width: double.infinity,
              child:Text('\n料理を作るときに参考にしてみてください。')),
          Container(height: 100),
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







