import 'package:flutter/cupertino.dart';

class ResuableRow extends StatefulWidget {
  final String title, value;
  final IconData? icon;
  final Widget? child;

  ResuableRow({
    Key? key,
    required this.title,
    required this.value,
    this.child,
    this.icon,
  }) : super(key: key);

  @override
  State<ResuableRow> createState() => _ResuableRowState();
}

class _ResuableRowState extends State<ResuableRow> {
  // final hiveManageC = Get.put(HiveManageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                child: widget.child,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.value),
              // SizedBox(width: 50,),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              //onTap: ()=>hiveManageC.manageBlood(blood: ),
              child: Icon(widget.icon),
              // child: ValueListenableBuilder(
              //   builder:
              //       (BuildContext context, dynamic value, Widget? child) {
              //     return Container(child: Icon(Icons.favorite_border_outlined));
              //   },
              //   valueListenable: hiveManageC.bloodBox.listenable(),
              //   // child: Icon(widget.icon)
              // )
            ),
          ),
        ],
      ),
    );
  }
  
}