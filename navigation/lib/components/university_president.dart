import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UniversityPresident extends StatefulWidget {
  const UniversityPresident({Key? key, required this.num, required this.info}) : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;


  @override
  State<UniversityPresident> createState() => _UniversityPresidentState();
}

class _UniversityPresidentState extends State<UniversityPresident> {
  late String name;
  late String title;
  late String imgUrl;
  bool previous = false;
  Widget? nextPresident;

  @override
  void initState() {
    super.initState();
    name = widget.info[widget.num]["name"];
    title = widget.info[widget.num]["title"];
    imgUrl = widget.info[widget.num]["imgUrl"];
    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = true;
    }
    if (widget.num < widget.info.length) {
      nextPresident = UniversityPresident(num: widget.num + 1, info: widget.info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:
          Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 25, color: Colors.orangeAccent)
                )
              )
            ),
            Expanded(
              child: Image(
                image: NetworkImage(imgUrl)
              )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: previous,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Previous")),
                    ),
                  Visibility(
                    visible: nextPresident != null,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              nextPresident ?? Container())),
                        child: const Text("Next")
                      ),
                  )
                ]
              )
            )
          ])
      )
    );
  }
}