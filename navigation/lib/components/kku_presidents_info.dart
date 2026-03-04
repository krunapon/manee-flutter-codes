import 'package:flutter/material.dart';
import '../components/university_president.dart';

class KKUPresidentsInfo extends StatefulWidget {
  const KKUPresidentsInfo({Key? key}) : super(key: key);

  @override
  State<KKUPresidentsInfo> createState() => _KKUPresidentsInfoState();
}

class _KKUPresidentsInfoState extends State<KKUPresidentsInfo> {
  var prezInfo = {
    1: {
      "name": "พจน์ สารสิน",
      "title": "อธิการบดี (2509-2512)",
      "imgUrl": "https://lindaescoto.files.wordpress.com/2012/11/9.jpg",
    },
    2: {
      "name": "ศาสตราจารย์ ดร. พิมล กลกิจ",
      "title": "อธิการบดี (2512-2518)",
      "imgUrl":
          "https://archive.kku.ac.th/omeka/files/square_thumbnails/e1566e127368984ec5bb0434e46ad700.jpg",
    },
    3: {
      "name": "ศาสตราจารย์เกียรติคุณ นายแพทย์กวี ทังสุบุตร",
      "title": "อธิการบดี (2518-2519, 2522-2523)",
      "imgUrl": "https://tmc.or.th/halloffame/images/md/27md.jpg",
    },
  };

  @override
  Widget build(BuildContext context) {
    return UniversityPresident(num: 1, info: prezInfo);
  }
}
