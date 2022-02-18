import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/Ek/userData.dart';
import 'package:yasam_beklentisi/result_page.dart';

import 'Ek/constants.dart';
import 'Ek/myContainer.dart';
import 'Ek/myWidget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  Color renk2 = Colors.amber;
  double icilenSigara = 0.0;
  double yapilanSpor = 0.0;
  int boy = 170;
  int kilo = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutLineButton("BOY", boy),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutLineButton("KILO", kilo),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftalık yapılan spor?',
                    style: metinStili,
                  ),
                  Text(
                    '${yapilanSpor.round()}',
                    style: sayiStili,
                  ),
                  Slider(
                    divisions: 7,
                    value: yapilanSpor,
                    onChanged: (double value) {
                      setState(() {
                        yapilanSpor = value;
                      });
                    },
                    min: 0,
                    max: 7,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gündelik sigara tüketi mi kaç?',
                    style: metinStili,
                  ),
                  Text(
                    '${icilenSigara.round()}',
                    style: sayiStili,
                  ),
                  Slider(
                    value: icilenSigara,
                    onChanged: (double value) {
                      setState(() {
                        icilenSigara = value;
                      });
                    },
                    min: 0,
                    max: 20,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN' ? renk2 : Colors.white,
                    child:
                        myWidget(text: 'KADIN', icon1: FontAwesomeIcons.venus),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK' ? renk2 : Colors.white,
                    child: myWidget(
                      icon1: FontAwesomeIcons.mars,
                      text: 'ERKEK',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sonucSayfa(
                      UserData(
                          boy: boy,
                          icilenSigara: icilenSigara,
                          kilo: kilo,
                          seciliCinsiyet: seciliCinsiyet,
                          yapilanSpor: yapilanSpor),
                    ),
                  ),
                );
              },
              color: Colors.white,
              child: Text(
                'HESAPLA',
                style: metinStili,
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutLineButton(String anaString, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            anaString,
            style: metinStili,
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            anaString == "BOY" ? boy.toString() : kilo.toString(),
            style: sayiStili,
          ),
        ),
        SizedBox(width: 15),
        Column(
          children: [
            SizedBox(
              height: 5,
            ),
            ButtonTheme(
              height: 40,
              minWidth: 40,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    anaString == "BOY" ? boy++ : kilo++;
                  });
                },
                highlightedBorderColor: Colors.blue,
                borderSide: const BorderSide(color: Colors.blue, width: 1),
                child: const Icon(
                  Icons.add,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonTheme(
              height: 40,
              minWidth: 40,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    anaString == "BOY" ? boy-- : kilo--;
                  });
                },
                highlightedBorderColor: Colors.blue,
                borderSide: BorderSide(color: Colors.blue, width: 1),
                child: const Icon(
                  Icons.remove,
                  size: 15,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
