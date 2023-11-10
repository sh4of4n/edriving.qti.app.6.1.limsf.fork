import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeIcon extends StatelessWidget {
  final name;
  final index;
  final image;
  final component;

  const HomeIcon({super.key, 
    this.name,
    this.index,
    this.image,
    this.component,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1.0, 2.0),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          component != null
              ? context.router.push(component)
              : const SizedBox.shrink();
        },
        child: SizedBox(
          // padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          width: ScreenUtil().setWidth(650),
          height: ScreenUtil().setHeight(650),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  image,
                  width: ScreenUtil().setWidth(450),
                  height: ScreenUtil().setHeight(450),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                name,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(60),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
