import 'package:bmi_style_baru/constan/constans.dart';
import 'package:bmi_style_baru/views/hasil_bmi_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/bmi_calculator.dart';

class DataScreen extends StatefulWidget {
  final String gender;
  const DataScreen({super.key, required this.gender});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.gender);
  } //

  int tinggi = 100;
  int beratPilihan = 50;
  int umurPilihan = 20;

  @override
  List<Widget> untukUmur(start, end) {
    List<Widget> umur = [];
    for (var i = start; i < end; i++) {
      umur.add(Text(
        "$i",
      ));
    }
    return umur;
  }

  List<Widget> untukBerat(start, end) {
    List<Widget> berat = [];
    for (var i = start; i < end; i++) {
      berat.add(Text(
        "$i",
      ));
    }
    return berat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaDasar,
      appBar: AppBar(
        title: Text("data nya ya"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: warnaWidget,
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Icon(
                    widget.gender == "laki" ? Icons.male : Icons.female,
                    size: 150,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "Umur",
                        style: untukHuruf,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: warnaWidget,
                          ),
                          height: MediaQuery.of(context).size.height * 0.175,
                          child: CupertinoPicker(
                              scrollController:
                                  FixedExtentScrollController(initialItem: 0),
                              itemExtent: 25,
                              magnification: 2,
                              onSelectedItemChanged: (val) {
                                print(val);
                                umurPilihan = val + 20;
                              },
                              children: untukUmur(20, 100)))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text("Tinggi"),
                Container(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: warnaWidget,
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Slider(
                          inactiveColor: Colors.white,
                          activeColor: Color(0xffC2DED1),
                          min: 80,
                          max: 200,
                          value: tinggi.toDouble(),
                          onChanged: (value) {
                            tinggi = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: warnaWidget,
                        ),
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "$tinggi",
                                style: untukHuruf,
                              ),
                              Text(
                                " Cm",
                                style: untukHuruf,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Berat",
                  style: untukHuruf,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: warnaWidget,
                    ),
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: CupertinoPicker(
                        scrollController:
                            FixedExtentScrollController(initialItem: 30),
                        itemExtent: 25,
                        magnification: 2,
                        onSelectedItemChanged: (val) {
                          // print(val);
                          beratPilihan = val + 20;
                        },
                        children: untukBerat(20, 220)))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // untuk tombol kiri
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: warnaWidget,
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Icon(
                      Icons.arrow_left,
                      size: 50,
                    ),
                  ),
                ),

                // untuk tombol kanan
                GestureDetector(
                  onTap: () {
                    final bmiCalculator = BmiCalculator(
                        tinggi: tinggi, beratPilihan: beratPilihan);
                    bmiCalculator.calculateBmi();
                    print(bmiCalculator.bmi);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) {
                        print(bmiCalculator.bmi);
                        return HasilBmiScreen(
                            bmi: bmiCalculator.bmi!, gender: widget.gender);
                      }),
                    ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: warnaWidget,
                      ),
                      margin: const EdgeInsets.all(15),
                      child: Icon(Icons.arrow_right, size: 50)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
