import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future fetch() async {
    // var res - http://192.168.0.12:3000/로 부터 받아들이는 값
    var res = await http.get(
        Uri.parse(
          'http://192.168.0.12:3000/',
        ),
        headers: {'user-header': '1234'});

    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //FutureBuilder의 경우 데이터를 직접적으로 불러오는 곳에 많이 쓰이게 된다.
        //이는 대게 api 호출과같이 데이터를 불러오는 시간이 어느정도 걸리는곳에서 많이 사용되어 지고 있다.
        child: FutureBuilder(
          future: fetch(),
          builder: (context, snap) {
            if (!snap.hasData) return const CircularProgressIndicator();
            return Text(snap.data['key'].toString());
          },
        ),
      ),
    );
  }
}
