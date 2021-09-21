
import 'package:event_manager_app/utils/assets_util.dart';
import 'package:flutter/material.dart';

class EventAddScreen extends StatefulWidget {
  final String date;
  EventAddScreen({required this.date});

  @override
  _EventAddScreenState createState() => _EventAddScreenState();
}

class _EventAddScreenState extends State<EventAddScreen> {
  late TextEditingController titleController,timeController, descController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    timeController = TextEditingController(text: "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute}");
    descController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    /// Custom back button specially for app bar
    final Image backButton = new Image.asset(
      ImageAssets.backBtn,
      height: 15.0,
      width: 70.0,
    );

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: backButton,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(child: Text("Event Detail"),),
      ),
      body: Stack(
          children:[ Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Date & Time")),
                    Expanded(child: TextField(controller: timeController, decoration: new InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ))),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.date == '' ? '' : widget.date),
                    )),
                  ],
                ),

                SizedBox(height: 15,),

                Row(
                  children: [
                    Expanded(flex: 1,
                        child: Text("Title")),
                    Expanded(
                      flex: 2,
                      child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: TextField(
                        controller: titleController,
                        decoration: new InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        ),),
                    ),),
                  ],
                ),
                SizedBox(height: 15,),

                Expanded(child: Text("Description")),
                SizedBox(height: 8,),
                Expanded(child: TextField(controller: descController,
                    decoration: new InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    )
                )),
              ],
            ),
          ),

            Positioned(
                bottom: 0.0,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: (){
                      print("Save Event");
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text("SAVE",
                      style: TextStyle(color: Colors.white),),
                    shape: RoundedRectangleBorder(
                  ),),
                )
            )
          ]
      ),
    );
  }
}
