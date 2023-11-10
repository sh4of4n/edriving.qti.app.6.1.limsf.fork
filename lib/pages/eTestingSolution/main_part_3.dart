import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edriving_qti_app/common_library/utils/app_localizations.dart';
import 'list_part_3.dart';

// ignore: must_be_immutable
class Part3Main extends StatefulWidget {
  const Part3Main({super.key});

  @override
  _Part3MainState createState() => _Part3MainState();
}

class _Part3MainState extends State<Part3Main>
    with AutomaticKeepAliveClientMixin {
  final image = ImagesConstant();
  final localStorage = LocalStorage();
  int? marksA = 0;
  int? marksB = 0;
  int? marksC = 0;
  int? marksD = 0;
  int? marksE = 0;
  int? marksF = 0;
  int? marksG = 0;
  int? marksH = 0;
  int? marksI = 0;
  int? marksJ = 0;

  int? marksBM = 0;
  int? marksCM = 0;
  int? marksDM = 0;
  int? marksEM = 0;
  int? marksFM = 0;
  int? marksGM = 0;
  int? marksHM = 0;
  int? marksIM = 0;
  int? marksJM = 0;

  _getBMark() async {
    int? markA = await localStorage.getPart3MarkSessionA();
    int? markB = await localStorage.getPart3MarkB();
    int? markC = await localStorage.getPart3MarkC();
    int? markD = await localStorage.getPart3MarkD();
    int? markE = await localStorage.getPart3MarkE();
    int? markF = await localStorage.getPart3MarkF();
    int? markG = await localStorage.getPart3MarkG();
    int? markH = await localStorage.getPart3MarkH();
    int? markI = await localStorage.getPart3MarkI();
    int? markJ = await localStorage.getPart3MarkJ();

    int? markBM = await localStorage.getPart3MarkBM();
    int? markCM = await localStorage.getPart3MarkCM();
    int? markDM = await localStorage.getPart3MarkDM();
    int? markEM = await localStorage.getPart3MarkEM();
    int? markFM = await localStorage.getPart3MarkFM();
    int? markGM = await localStorage.getPart3MarkGM();
    int? markHM = await localStorage.getPart3MarkHM();
    int? markIM = await localStorage.getPart3MarkIM();
    int? markJM = await localStorage.getPart3MarkJM();

    setState(() {
      marksA = markA;
      marksB = markB;
      marksC = markC;
      marksD = markD;
      marksE = markE;
      marksF = markF;
      marksG = markG;
      marksH = markH;
      marksI = markI;
      marksJ = markJ;

      marksBM = markBM;
      marksCM = markCM;
      marksDM = markDM;
      marksEM = markEM;
      marksFM = markFM;
      marksGM = markGM;
      marksHM = markHM;
      marksIM = markIM;
      marksJM = markJM;
    });
  }

  /* @override
  void initState() {
    super.initState();

    refresh();
  }
*/

  refresh() {
    setState(() {
      _getBMark();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      /*appBar: AppBar(
        title: Text('RSM',style: TextStyle(color: Colors.black),),
      ),
      drawer: RPKDrawer(),*/

      /*body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // _header(),
            //RpkSessionA(),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 2),
              child: SessionA(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionB(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionC(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionD(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionE(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionF(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionG(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionH(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionI(notifyParent: refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: SessionJ(notifyParent: refresh),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),

            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(children: [
                  Center(
                      child: Text(
                          AppLocalizations.of(context)!
                              .translate('session_lbl'),
                          style: const TextStyle(color: Colors.black))),
                  Center(
                      child: Text(
                          AppLocalizations.of(context)!
                              .translate('normal_mistake_mark'),
                          style: const TextStyle(color: Colors.black))),
                  Center(
                      child: Text(
                          AppLocalizations.of(context)!
                              .translate('mandatory_mistake_mark'),
                          style: const TextStyle(color: Colors.black))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('A', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksA',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/24', style: TextStyle(color: Colors.black)),
                      ]))),
                  const Center(
                      child: Text('-', style: TextStyle(color: Colors.black))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('B', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksB',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/19', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksBM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/1', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('C', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksC',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/7', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksCM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/3', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('D', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksD',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/12', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksDM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/6', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('E', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksE',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/13', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksEM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/7', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('F', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksF',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/8', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksFM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/6', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('G', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksG',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/7', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksGM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/3', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('H', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksH',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/8', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksHM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/4', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('I', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksI',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/6', style: TextStyle(color: Colors.black)),
                      ]))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksIM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/4', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
                TableRow(children: [
                  const Center(
                      child: Text('J', style: TextStyle(color: Colors.black))),
                  const Center(
                      child: Text('-', style: TextStyle(color: Colors.black))),
                  Center(
                      child: RichText(
                          text: TextSpan(
                              text: '$marksJM',
                              style: const TextStyle(color: Colors.black),
                              children: const <TextSpan>[
                        TextSpan(
                            text: '/4', style: TextStyle(color: Colors.black)),
                      ]))),
                ]),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  localStorage.setPart2MarkSessionB(0);
                  localStorage.setPart2MarkSessionC(0);
                  localStorage.setPart2MarkSessionD(0);
                  localStorage.setPart2MarkSessionE(0);
                  localStorage.setPart2MarkSessionF(0);
                  localStorage.setPart2MarkSessionG(0);

                  localStorage.setPart2MarkSessionHM(0);
                  localStorage.setPart2MarkSessionBM(0);
                  localStorage.setPart2MarkCM(0);
                  localStorage.setPart2MarkDM(0);
                  localStorage.setPart2MarkEM(0);
                  localStorage.setPart2MarkFM(0);
                  localStorage.setPart2MarkGM(0);
                  localStorage.setPart2MarkGM(0);
                  refresh();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: ColorConstant.primaryColor,
                  minimumSize: const Size(88, 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.translate('submit_btn'),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(300),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
