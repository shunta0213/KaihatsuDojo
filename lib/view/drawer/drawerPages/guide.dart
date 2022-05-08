import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter)),
        ),
        centerTitle: true,
        title: const Text('アプリの使い方',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const Text(
                  'このアプリは、自分が作った料理を追加していくことで、後からどんな料理を作ったかを見返せるアプリです。\n\n'),
              Container(
                  width: double.infinity,
                  child: const Text('料理名を追加する時',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ))),
              Divider(
                color: Colors.blue[600],
                thickness: 1.3,
                height: 13,
              ),
              Container(
                width: double.infinity,
                child: const Text("画面中央の下にある、オレンジの＋ボタンを押します"),
              ),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/button.JPEG')),
              const Text(
                  "次に、追加したい料理が当てはまるジャンルを選び、メニュー名を入力します。また、その料理に関してメモをしたいことがあればメモを残すことができます。"),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/ジャンル.JPEG')),
              const Text("入力が終わり次第✅ボタンを押すと、料理の追加が完了します。\n"),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/checkbutton2.JPEG')),
              Container(
                  width: double.infinity,
                  child: const Text('追加した料理を見たいとき',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ))),
              Divider(
                color: Colors.blue[600],
                thickness: 1.3,
                height: 13,
              ),
              Container(
                  width: double.infinity,
                  child: const Text('まず、画面右下のlistボタンを押します。')),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/list.JPEG')),
              const Text('次に、見たい料理のジャンルを、以下の８個の中から選び、そのアイコンを押します。'),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/選択.JPEG')),
              const Text(
                'アイコンはそれぞれ以下のジャンルを表しています',
                style: TextStyle(height: 1.5),
              ),
              SizedBox(
                height: 4,
              ),
              const Text(
                '牛肉　　豚肉\n鶏肉　　魚類\n副菜　　汁物\n麺類　　その他 \n',
                style: TextStyle(height: 1.5),
              ),
              const Text(
                  'すると、今までに自分が追加してきた料理名を閲覧でき、自分が作ったことのある料理を思い出すことができます。\n'),
              Container(
                  width: double.infinity,
                  child: const Text('もっと活用するために',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ))),
              Divider(
                color: Colors.blue[600],
                thickness: 1.3,
                height: 13,
              ),
              const Text('日付が表示されている画面の、左上の三本線のボタンを押してください。'),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/三本線2.JPEG')),
              Container(
                  width: double.infinity,
                  child: const Text('・メモを使ってみましょう\n',
                      style: TextStyle(
                          color: Colors.lightBlueAccent, fontSize: 16))),
              Container(width: double.infinity, child: const Text('メモを押します.')),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/メモ2.JPEG')),
              Container(
                  width: double.infinity,
                  child: const Text('\n使い方の例',
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 16))),
              SizedBox(
                height: 3,
              ),
              const Text(
                  '・賞味期限が近い食材を入力しておいて、外出先で見る事ができるようにする\n'
                  '・食べたい物リストを作り、献立時に参考にする\n'
                  '・買う必要がある食材等を忘れないようにメモをしておく\n',
                  style: TextStyle(height: 1.5),
                  textAlign: TextAlign.left),
              const Text('この他にも、自分だけのメモ機能の使い方を見つけてみましょう。\n\n'),
              Container(
                  width: double.infinity,
                  child: const Text('・検索や、電子書籍、記事を利用してみましょう',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 16,
                          height: 1.5))),
              const Text('ボタンを押す事で、それぞれのリンクの画面に飛ぶ事ができます。'),
              Container(
                  margin: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 10, color: Colors.black26)),
                  child: Image.asset('assets/images/検索.JPEG')),
              Container(
                  width: double.infinity,
                  child: const Text('\n料理を作るときに参考にしてみてください。')),
              Container(height: 100),
            ]),
          ),
        ),
      ),
    );
  }
}
