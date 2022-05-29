import 'package:bmi_style_baru/constan/constans.dart';
import 'package:bmi_style_baru/helpers/bmi_calculator.dart';
import 'package:bmi_style_baru/views/gender_view_screen.dart';
import 'package:flutter/material.dart';

class HasilBmiScreen extends StatelessWidget {
  final String gender;
  final double bmi;
  const HasilBmiScreen({super.key, required this.gender, required this.bmi});

  @override
  Widget build(BuildContext context) {
    BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // // final bmiCategory =
    bmiCalculator.determineBmiCategory();
    // // final bmiDesc =
    bmiCalculator.getHealRiskDecripsion();

    return Scaffold(
      backgroundColor: warnaDasar,
      appBar: AppBar(
        title: Text("Hasil data ya"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: warnaWidget,
            ),
            margin: const EdgeInsets.all(10),
            height: 50,
            child: Center(
              child: Text(
                "hasilnya adalah",
                style: untukHurufHasil,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: warnaWidget,
            ),
            margin: const EdgeInsets.all(15),
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${bmiCalculator.bmiCategory!}",
                  style: untukHuruf,
                ),
                Container(
                  child: Icon(
                    gender == "laki" ? Icons.male : Icons.female,
                    size: 80,
                  ),
                ),
                Text(
                  "${bmi.toStringAsFixed(1)}",
                  style: untukHurufHasil,
                ),
                Text(
                  "${bmiCalculator.bmiDescription!}",
                  style: untukHuruf,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
            Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: warnaWidget,
              ),
              margin: const EdgeInsets.all(10),
              width: 500,
              height: 80,
              child: Center(
                  child: Text(
                "HITUNG ULANG",
                style: untukHurufHasil,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
