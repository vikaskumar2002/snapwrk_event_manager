
import 'package:event_manager_app/event_add_screen.dart';
import 'package:event_manager_app/event_row_item.dart';
import 'package:event_manager_app/model/event_getter_model.dart';
import 'package:event_manager_app/utils/btnstyle_util.dart';
import 'package:event_manager_app/utils/color_utils.dart';
import 'package:event_manager_app/utils/date_util.dart';
import 'package:event_manager_app/utils/textstyle_util.dart';
import 'package:flutter/material.dart';

typedef OnItemClick(String value);

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {

  //Create local variables here..
  // String selectedYear;
   //String selectedMonth;

   String selectedYear = 'Select Year';
   String selectedMonth = 'Select Month';

  @override
  void initState()
  {
    super.initState();

    selectedYear = 'Select Year';
    selectedMonth = 'Select Month';
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(
       backgroundColor: appBarColor,
       title: Center(
        child: Text('Events'),
       ),
     ),

     body: Column(
       children: [
         Container(
           height: 100,
           //color: Colors.white,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ElevatedButton(
                       child: Text(
                           selectedYear,
                           style: myTextStyle(),
                       ),
                       style: myBtnStyle(),
                       onPressed: ()  {
                         //yearList.clear(),
                         List<String> yearList = [];

                         for (int i = 2016; i <= 2025; i++){
                           yearList.add(i.toString());
                         }

                         _showBottomSheet(context,'Years', yearList, onTap: (item){
                           selectedYear = item;
                         });
                       },
                   ),
                   ),
               ),

               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ElevatedButton(
                     child: Text(
                       selectedMonth,
                       style: myTextStyle(),
                     ),
                     style: myBtnStyle(),
                     onPressed: ()  {
                     _showBottomSheet(context,"Months", months, onTap: (item){
                        selectedMonth = item.toString();
                     });
                     },
                   ),
                 ),
               ),

             ],
           ),
         ),
         Expanded(
           child: ListView.builder(
             shrinkWrap: true,
             itemCount: (selectedMonth != null && selectedYear != null && selectedMonth != "Select Month" && selectedYear != "Select Year") ?
             daysInMonth(months.indexOf(selectedMonth), int.parse(selectedYear)) : 0,
             itemBuilder: (context,index) {

               print("index>>>"+index.toString());

               return EventRowItem(
                   onPressed: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(
                           builder: (context) =>
                               EventAddScreen(date: "${(index + 1)}-${selectedMonth}-${selectedYear}")
                       ),);
                   },
                   //context: context,
                   events: EventModel(
                       id:1,
                       date: DateTime.now(),
                       title: "",
                       description: ""),
                   month: months.elementAt(months.indexOf(selectedMonth),),
                   day: (0 + 1).toString()
               );
             },
           ),
         ),
       ],
     ),
   );
  }

  void _showBottomSheet(BuildContext context,String title, List<String> item, {required OnItemClick onTap}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: transparentColor,
        context: context,
        builder: (BuildContext bc) {
          return DecoratedBox(
              decoration: BoxDecoration(
                  color: transparentColor
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child:Container(
                      color: whiteColor,
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: Center(
                                    child:
                                    Text(
                                      title == " " ? '': title,
                                      style: myBottomSheetTextStyle(),
                                    ),
                                ),
                              ),
                            ],
                          ),
                          new Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  itemCount: item.length,
                                  itemBuilder: (context,index) => ListTile(
                                      onTap: (){
                                        setState(() {
                                          onTap(item[index]);
                                          print("selected month"+ item[index]);
                                          Navigator.pop(context);
                                        });
                                      },
                                      title: Center(
                                          child: Text(item[index].toString(),
                                            style: myBottomSheetBlueTextStyle(),
                                          ),
                                      ),
                                  ),
                                 /* separatorBuilder: (context, index) {
                                    return Divider();
                                  },*/
                                ),
                              ),
                          ),
                        ],
                      ),
                  ),
              ),
          );
        });

  }

}



