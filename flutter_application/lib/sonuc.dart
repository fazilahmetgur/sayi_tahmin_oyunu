// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application/tahmin_sayfasi.dart';

// ignore: must_be_immutable
class SonucEkrani extends StatefulWidget {
  bool sonuc;

   SonucEkrani({ Key? key, required this.sonuc,}) : super(key: key);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuç Syafası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("assets/mutlu_resim.png"): Image.asset("assets/uzgun_resim.png"),
             Text(widget.sonuc ? "Sonuç : Kazandınız" : "Kaybettiniz",
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tekrar Oyna"),
            ),
          ],
        ),
      ),
    );
  }
}
