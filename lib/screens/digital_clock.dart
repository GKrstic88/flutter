// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:clock_app/topNavBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  List<dynamic> data2 = [];
  List<List<String>> continents = [
    ['Africa', 'America', 'Europe', 'Asia', 'Australia', 'Other']
  ];
  List<String> africa = [];
  List<String> america = [];
  List<String> europe = [];
  List<String> asia = [];
  List<String> other = [];
  List<String> australia = [];
  int currentTimeSeconds =
      (DateTime.now().millisecondsSinceEpoch / 1000).floor();
  DateTime dateFromSeconds = DateTime.now();
  String formattedTime = '';
  String formattedDate = '';

  String zona = 'Europe/Belgrade';
  void getTime() async {
    Uri alltimeFromApi = Uri.parse('http://worldtimeapi.org/api/timezone');

    http.Response response2 = await http.get(alltimeFromApi);
    data2 = jsonDecode(response2.body);

    //split all timezones into continents

    data2.forEach((element) {
      if (element.contains('Africa')) {
        africa.add(element);
      } else if (element.contains('America')) {
        america.add(element);
      } else if (element.contains('Asia')) {
        asia.add(element);
      } else if (element.contains('Europe')) {
        europe.add(element);
      } else if (element.contains('Australia')) {
        australia.add(element);
      } else if (element.contains('Pacific') ||
          element.contains('Antarctica') ||
          element.contains('Indian') ||
          element.contains('Atlantic')) {
        other.add(element);
      }

      // print(element);
      // print('type is ${element.runtimeType}');
    });

    continents.add(africa);
    continents.add(america);
    continents.add(asia);
    continents.add(europe);
    continents.add(other);
    continents.add(australia);

    continents.forEach((element) {
      print(element);
      print('type is ${element.runtimeType}');
    });

    List<String> strs = continents.map((e) => e.toString()).toList();
    //  print('continents is $continents');

    // List<String> strs = data2.map((e) => e.toString()).toList();

    // print('strs is $strs');
    // print('type is ${strs[0].runtimeType}');

    // Uri timeFromApi =
    //     Uri.parse('http://worldtimeapi.org/api/timezone/${data2[0]}');
    // Response response = await get(timeFromApi);
    // Map data = jsonDecode(response.body);

    // print('data is $data');

    // String datetime = data['datetime'];
    // String offset = data['utc_offset'].substring(1, 3);

    // // create DateTime object

    // DateTime now = DateTime.parse(datetime);

    // now = now.add(
    //   Duration(
    //     hours: int.parse(offset),
    //   ),
    // );
    // print('Belgrade time is $now');
  }

  @override
  void initState() {
    super.initState();
    //getTime();
    // ignore: unused_local_variable
    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTimeSeconds++;
      dateFromSeconds = DateTime.fromMillisecondsSinceEpoch(
          (currentTimeSeconds * 1000).floor());
      formattedTime = DateFormat('HH:mm').format(dateFromSeconds);
      setState(() {});
    });
  }

  @override
  void dispose() {
    //timer.cancel();
    super.dispose();
  }

  List<String>? dropdownvalue;
  String? innerDropdownvalue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const TopNavBar(),
        Container(
          height: size.height * .5,
          width: size.width,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 17),
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/images/matrix_code.jpg'),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    formattedTime,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 13, 232, 6),
                      fontSize: 115,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Material(
          child: Column(
            children: [
              TextButton(
                onPressed: getTime,
                child: const Text('Get timezones'),
              ),
              DropdownButton<List<String>>(
                value: dropdownvalue,
                items: continents
                    .map(
                      (item) => DropdownMenuItem<List<String>>(
                        value: item,
                        child: DropdownButton<String>(
                          value: innerDropdownvalue,
                          items: item
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (e) =>
                              setState(() => innerDropdownvalue = e!),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (item) => setState(() => dropdownvalue = item!),
              )
              // SingleChildScrollView(
              //   child: SizedBox(
              //     width: 340,
              //     child: DropdownButton<String>(
              //       hint: const Text('Timezones'),
              //       icon: const Icon(Icons.keyboard_arrow_down),
              //       value: dropdownvalue,
              //       items: continents[0]
              //           .map((item) => DropdownMenuItem<String>(
              //                 value: item,
              //                 child: Text(item),
              //               ))
              //           .toList(),
              //       onChanged: (item) => setState(() => dropdownvalue = item!),
              //     ),
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
