import 'package:bmi_style_baru/constan/constans.dart';
import 'package:bmi_style_baru/views/data_screen.dart';
import 'package:flutter/material.dart';

class GenderViewscreen extends StatefulWidget {
  const GenderViewscreen({super.key});

  @override
  State<GenderViewscreen> createState() => _GenderViewscreenState();
}

class _GenderViewscreenState extends State<GenderViewscreen>
    with SingleTickerProviderStateMixin // ingat ini untuk kirimdata
                      {
  TabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length:2, vsync: this);
  } // ingat ini untuk kirimdata
                     


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECE5C7),
      appBar: AppBar(
        title: Text("BMI Calculatror Style"),
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: _controller,
                         // ingat ini untuk kirimdata
                        children: [
                          Icon(
                            Icons.male,
                            size: 200,
                          ),
                          Icon(
                            Icons.female,
                            size: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: TabBar(
                      controller: _controller,
                      // ingat ini untuk kirimdata
                      indicator: BoxDecoration(
                        color: warnaWidget,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      unselectedLabelColor: Colors.black87,
                      labelColor: Colors.white,
                      labelStyle: untukHuruf,
                      tabs: [
                        Tab(text: "Laki-Laki",),
                        Tab(text: "Perempuan"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) {
                          return DataScreen(
                            gender:
                                _controller!.index == 0 ? "laki" : "Perempuan", // ingat ini untuk kirimdata
                     
                          );
                        }),
                      ));
                    },
                    child: Container(
                      height: 100,
                      child: Center(
                          child: Text(
                        "NEXT",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff354259),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
