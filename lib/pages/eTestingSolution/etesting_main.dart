import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/common_library/services/repository/auth_repository.dart';
import 'package:edriving_qti_app/common_library/services/repository/kpp_repository.dart';
import 'package:edriving_qti_app/utils/constants.dart';
import 'package:edriving_qti_app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../router.gr.dart';

class ETestMain extends StatefulWidget {
  const ETestMain({super.key});

  @override
  _ETestMain createState() => _ETestMain();
}

class _ETestMain extends State<ETestMain> {
  final authRepo = AuthRepo();
  final kppRepo = KppRepo();
  final image = ImagesConstant();
  final localStorage = LocalStorage();
  String? instituteLogo = '';
  bool isLogoLoaded = false;
  final primaryColor = ColorConstant.primaryColor;

  @override
  void initState() {
    super.initState();

    _getDiProfile();
  }

  _getDiProfile() async {
    String instituteLogoPath = (await localStorage.getInstituteLogo())!;

    if (instituteLogoPath.isEmpty) {
      var result = await authRepo.getDiProfile(context: context);

      if (result.isSuccess && result.data != null) {
        // Uint8List decodedImage = base64Decode(
        //     result.data);

        setState(() {
          instituteLogo = result.data;
          isLogoLoaded = true;
        });
      }
    } else {
      // Uint8List decodedImage = base64Decode(instituteLogoPath);

      setState(() {
        instituteLogo = instituteLogoPath;
        isLogoLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(''
            //AppLocalizations.of(context).translate('choose_category')
            ),
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              height: ScreenUtil().setHeight(1000),
            ),
          ),
          Column(
            children: <Widget>[
              FadeInImage(
                alignment: Alignment.center,
                placeholder: MemoryImage(kTransparentImage),
                image: (instituteLogo!.isNotEmpty
                    ? NetworkImage(instituteLogo!)
                    : MemoryImage(kTransparentImage)) as ImageProvider<Object>,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(400),
                      height: ScreenUtil().setHeight(500),
                      child: ElevatedButton(
                        child: Text(
                          'RSM - Part 2',
                          style: TextStyle(fontSize: ScreenUtil().setSp(100)),
                        ),
                        onPressed: () => context.router.push(const RsmRpkTabs()),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(400),
                      height: ScreenUtil().setHeight(500),
                      child: ElevatedButton(
                        child: Text(
                          'RPK - part 3',
                          style: TextStyle(fontSize: ScreenUtil().setSp(100)),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
