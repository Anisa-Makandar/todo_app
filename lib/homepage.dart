import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:toto_app_firebase/addtaskpage.dart';
import 'package:toto_app_firebase/detailpage.dart';
import 'package:toto_app_firebase/profilepage.dart';

class Homepage extends StatefulWidget {
  //const Homepage({super.key});
  var username;

  Homepage({
    String? this.username,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//int count=0;
  int? selecteditem;

  int? taskongoing = 0;
  String? taskcompleted;
  int? completedcount = 0;
  int? continuouscount;
  int? canceleedcount = 0;
  String? id;

  List<Map<String, dynamic>> allnotes = [];

  @override
  Widget build(BuildContext context) {
    //int count=context.watch<taskprovider>().getalltask().length;
    /*  void statusget(){
      if(widget.status==0){
        continuouscount= count;

      }
      else if (widget.status==1){
        completedcount=count-1;
      }

    };*/
    List<Map<String, dynamic>> topview = [
      {
        "name": "Ongoing",
        "completed": "${taskongoing! - completedcount!}",
        "icon": Icon(Icons.restart_alt),
        "color": Colors.blue,
      },
      {
        "name": "In process",
        "completed": "${taskongoing! - completedcount!}",
        "no_of_task": 13,
        "icon": Icon(Icons.timer),
        "color": Colors.grey,
      },
      {
        "name": "Completed",
        "completed": "$completedcount",
        "no_of_task": 40,
        "icon": Icon(Icons.request_page_rounded),
        "color": Colors.greenAccent,
      },
      {
        "name": "Cancelled",
        "completed": "$canceleedcount",
        "no_of_task": 8,
        "icon": Icon(Icons.contact_page),
        "color": Colors.red,
      },
    ];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    //if(firestore.collection("tasks").doc().get()){}

    //context.watch<taskprovider>().gettask();

    return Scaffold(
      //backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Color(0xfff6f6f6),
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    duration: Duration(seconds: 1),
                    child: profilePage(),
                    type: PageTransitionType.leftToRightWithFade));
          },
          child: CircleAvatar(
            radius: 10,
            //backgroundImage: AssetImage("assets/img/IMG_20240316_203634_698.jpg"),
            //backgroundColor: Colors.blue,
          ),
        ),
        title: widget.username != null
            ? Text("Hi, ${widget.username}")
            : Text("Hi user"),
      ),
      body: Column(
        children: [
          Container(
            //padding: EdgeInsets.all(1),
            margin: EdgeInsets.all(10),
            height: 130,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 53,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: topview.length,
                itemBuilder: (ctx, i) {
                  return StreamBuilder<int>(
                      stream: getCompletedTaskCount(),
                      builder: (c, snapshot) {
                        if (snapshot.hasData) {
                          ///var docs= snapshot.data!.docs[i];
                          //var data= docs.data();
                          completedcount = snapshot.data ?? 0;
                          return Container(
                            height: 10,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              leading: (topview[i]["icon"]),
                              subtitle: Text(topview[i]["completed"]),
                              title: Text(topview[i]["name"].toString()),
                              tileColor: topview[i]["color"],
                            ),
                          );
                        }
                        return Container();
                      });
                  Container(
                    height: 10,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: (topview[i]["icon"]),
                      subtitle: Text(topview[i]["completed"].toString()),
                      title: Text(topview[i]["name"].toString()),
                      tileColor: topview[i]["color"],
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: firestore.collection("Usertask").snapshots(),
                  builder: (c, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshots.hasError) {
                      return Center(
                        child: Text("error :${snapshots.error}"),
                      );
                    }
                    if (snapshots.hasData && snapshots.data != null) {
                      return snapshots.data!.docs.isNotEmpty
                          ? ListView.builder(
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (c, i) {
                                taskongoing = snapshots.data!.docs.length;
                                var docs = snapshots.data!.docs[i];
                                var data = docs.data();
                                return ListTile(
                                    onTap: () {
                                      id = docs.id;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => detail_page(
                                                  id: id,
                                                  title: (data["title"]),
                                                  desc: data["desc"])));
                                    },
                                    title: Text(data["title"]),
                                    subtitle: Text(data["desc"]),
                                    trailing: Text(
                                        "${data["assignee"]} \n ${data["date"]}"));
                              })
                          : Column(
                              children: [
                                Text(
                                  "no task yet",
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => addtask()));
                                    },
                                    child: Text("Add notes"))
                              ],
                            );
                    }
                    return Container();
                  }),
            ),
          ),
        ],
      ),

      /*

              )*/ /*
            ],
          ),
        )

            :


      },),*/
    );
  }

  Stream<int> getCompletedTaskCount() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  Stream<int> getongoingTaskCount() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }
}
