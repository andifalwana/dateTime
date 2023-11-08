import 'package:flutter/material.dart';
import 'dart:developer';


class pertamaPage extends StatefulWidget{
  const pertamaPage({super.key});

  @override
  State<pertamaPage> createState() => _pertamaPageState();
}

class _pertamaPageState extends State<pertamaPage> {
  DateTime? dateTimenow=DateTime.now(), dateTimeTomorrow, picked_date;
  var year, month, day;
  TimeOfDay? picked_time, selectedTime=TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async{
    picked_date = await showDatePicker(context: context, 
    initialDate: dateTimenow!, 
    firstDate: DateTime(dateTimenow!.year -1), 
    lastDate: DateTime(dateTimenow!.year +1));

    if(picked_date != null && picked_date != dateTimenow){
      setState(() {
        dateTimenow = picked_date;
      });
    }
  }
  Future<Null> getTime(BuildContext context) async{
    picked_time = await showTimePicker(context: context,
     initialTime: selectedTime!,);
     log(picked_time.toString());

     if(picked_time != null && picked_time != selectedTime){
      setState(() {
        selectedTime = picked_time;
        log("test"+picked_time.toString());
      });
     }
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(onPressed: (){getDate(context);},
          child: Text("Test DatePicker"),),
          MaterialButton(onPressed: (){getTime(context);},
          child: Text("Test TimePicker"),),
          Text("${dateTimenow.toString().substring(0, 10)}"),
          Text("${selectedTime.toString().substring(10, 15)}"),
        ],
      )
    );
  }
}