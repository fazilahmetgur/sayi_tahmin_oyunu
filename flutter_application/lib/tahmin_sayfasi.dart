import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/sonuc.dart';

class TahminSayfasi extends StatefulWidget {
  const TahminSayfasi({Key? key}) : super(key: key);

  @override
  State<TahminSayfasi> createState() => _TahminSayfasiState();
}

class _TahminSayfasiState extends State<TahminSayfasi> {
  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  late String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    // ignore: avoid_print
    print("Rastgele Sayi: $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahmin Sayfası"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Tahmin Et",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Kalan Hak: $kalanHak",
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Yardım : $yonlendirme",
                style: const TextStyle(
                  color: Color.fromARGB(255, 75, 74, 74),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfTahmin,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    kalanHak = kalanHak - 1;
                  });

                  int tahmin = int.parse(tfTahmin.text);
                  if (tahmin == rastgeleSayi) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Tebrikler!")));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(sonuc: true)));
                    return;
                  }
                  if (tahmin > rastgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Azaltın";
                    });
                  }
                  if (tahmin < rastgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini Arttırın";
                    });
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SonucEkrani(sonuc: false)));
                  }

                  tfTahmin.text = "";
                },
                child: const Text("Tahmin Et"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
