// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i38;
import 'package:camera/camera.dart' as _i40;
import 'package:edriving_qti_app/coming_soon/coming_soon.dart' as _i7;
import 'package:edriving_qti_app/common_library/utils/image_viewer.dart'
    as _i16;
import 'package:edriving_qti_app/pages/candidate_info/confirm_candidate_info.dart'
    as _i8;
import 'package:edriving_qti_app/pages/checklist/checklist.dart' as _i3;
import 'package:edriving_qti_app/pages/checklist/checklist_home.dart' as _i4;
import 'package:edriving_qti_app/pages/checklist/checklist_result.dart' as _i5;
import 'package:edriving_qti_app/pages/eLearning/criteria_list.dart' as _i9;
import 'package:edriving_qti_app/pages/eLearning/enter_student_ic.dart' as _i19;
import 'package:edriving_qti_app/pages/eLearning/start_learning.dart' as _i35;
import 'package:edriving_qti_app/pages/eTestingSolution/operator_scan.dart'
    as _i21;
import 'package:edriving_qti_app/pages/eTestingSolution/rpk_drawer.dart'
    as _i30;
import 'package:edriving_qti_app/pages/eTestingSolution/rsm_rpk_tab.dart'
    as _i32;
import 'package:edriving_qti_app/pages/forgot_password/forgot_password_page.dart'
    as _i10;
import 'package:edriving_qti_app/pages/home/home_page.dart' as _i12;
import 'package:edriving_qti_app/pages/home/home_page_rpk.dart' as _i13;
import 'package:edriving_qti_app/pages/home/home_select.dart' as _i14;
import 'package:edriving_qti_app/pages/jalan_raya/jr_candidate_details.dart'
    as _i17;
import 'package:edriving_qti_app/pages/jalan_raya/jr_part_iii.dart' as _i18;
import 'package:edriving_qti_app/pages/login/authentication.dart' as _i1;
import 'package:edriving_qti_app/pages/login/client_acc_page.dart' as _i6;
import 'package:edriving_qti_app/pages/login/get_vehicle_info.dart' as _i11;
import 'package:edriving_qti_app/pages/login/login_page.dart' as _i20;
import 'package:edriving_qti_app/pages/profile/identity_barcode.dart' as _i15;
import 'package:edriving_qti_app/pages/profile/profile_page.dart' as _i22;
import 'package:edriving_qti_app/pages/profile/profile_tab.dart' as _i23;
import 'package:edriving_qti_app/pages/profile/take_profile_picture.dart'
    as _i36;
import 'package:edriving_qti_app/pages/profile/update_profile.dart' as _i37;
import 'package:edriving_qti_app/pages/qr_scanner.dart' as _i24;
import 'package:edriving_qti_app/pages/register/register_form.dart' as _i25;
import 'package:edriving_qti_app/pages/register/register_mobile.dart' as _i26;
import 'package:edriving_qti_app/pages/register/register_user_to_di.dart'
    as _i27;
import 'package:edriving_qti_app/pages/register/register_verification.dart'
    as _i28;
import 'package:edriving_qti_app/pages/rpk/rpk_candidate_details.dart' as _i29;
import 'package:edriving_qti_app/pages/rpk/rpk_part_iii.dart' as _i31;
import 'package:edriving_qti_app/pages/rpk/rule.dart' as _i33;
import 'package:edriving_qti_app/pages/settings/change_password.dart' as _i2;
import 'package:edriving_qti_app/pages/settings/settings_page.dart' as _i34;
import 'package:flutter/material.dart' as _i39;

abstract class $AppRouter extends _i38.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i38.PageFactory> pagesMap = {
    Authentication.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.Authentication(),
      );
    },
    ChangePassword.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChangePassword(),
      );
    },
    CheckListRoute.name: (routeData) {
      final args = routeData.argsAs<CheckListRouteArgs>(
          orElse: () => const CheckListRouteArgs());
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CheckListPage(key: args.key),
      );
    },
    ChecklistHome.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChecklistHome(),
      );
    },
    ChecklistResultRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistResultRouteArgs>(
          orElse: () => const ChecklistResultRouteArgs());
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChecklistResultPage(key: args.key),
      );
    },
    ClientAccount.name: (routeData) {
      final args = routeData.argsAs<ClientAccountArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ClientAccount(args.data),
      );
    },
    ComingSoon.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ComingSoon(),
      );
    },
    ConfirmCandidateInfo.name: (routeData) {
      final args = routeData.argsAs<ConfirmCandidateInfoArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ConfirmCandidateInfo(
          part3Type: args.part3Type,
          nric: args.nric,
          candidateName: args.candidateName,
          qNo: args.qNo,
          groupId: args.groupId,
          testDate: args.testDate,
          testCode: args.testCode,
          icPhoto: args.icPhoto,
        ),
      );
    },
    CriteriaList.name: (routeData) {
      final args = routeData.argsAs<CriteriaListArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CriteriaList(
          args.studentIc,
          args.startDateTime,
          args.group,
          args.course,
          args.part,
        ),
      );
    },
    ForgotPassword.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ForgotPassword(),
      );
    },
    GetVehicleInfo.name: (routeData) {
      final args = routeData.argsAs<GetVehicleInfoArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.GetVehicleInfo(
          key: args.key,
          type: args.type,
        ),
      );
    },
    Home.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.Home(),
      );
    },
    HomePageRpk.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.HomePageRpk(),
      );
    },
    HomeSelect.name: (routeData) {
      final args = routeData.argsAs<HomeSelectArgs>(
          orElse: () => const HomeSelectArgs());
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.HomeSelect(key: args.key),
      );
    },
    IdentityBarcode.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.IdentityBarcode(),
      );
    },
    ImageViewer.name: (routeData) {
      final args = routeData.argsAs<ImageViewerArgs>(
          orElse: () => const ImageViewerArgs());
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.ImageViewer(
          title: args.title,
          image: args.image,
        ),
      );
    },
    JrCandidateDetails.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.JrCandidateDetails(),
      );
    },
    JrPartIII.name: (routeData) {
      final args = routeData.argsAs<JrPartIIIArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.JrPartIII(
          args.qNo,
          args.nric,
          args.jrName,
          args.testDate,
          args.groupId,
          args.testCode,
          args.vehNo,
          args.skipUpdateJrJpjTestStart,
        ),
      );
    },
    LearningEnterStudentIC.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.LearningEnterStudentIC(),
      );
    },
    Login.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.Login(),
      );
    },
    OperatorScanQR.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.OperatorScanQR(),
      );
    },
    Profile.name: (routeData) {
      final args = routeData.argsAs<ProfileArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.Profile(
          userProfile: args.userProfile,
          isLoading: args.isLoading,
        ),
      );
    },
    ProfileTab.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.ProfileTab(),
      );
    },
    QrScannerRoute.name: (routeData) {
      final args = routeData.argsAs<QrScannerRouteArgs>(
          orElse: () => const QrScannerRouteArgs());
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.QrScannerPage(key: args.key),
      );
    },
    RegisterForm.name: (routeData) {
      final args = routeData.argsAs<RegisterFormArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.RegisterForm(args.data),
      );
    },
    RegisterMobile.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.RegisterMobile(),
      );
    },
    RegisterUserToDi.name: (routeData) {
      final args = routeData.argsAs<RegisterUserToDiArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.RegisterUserToDi(args.data),
      );
    },
    RegisterVerification.name: (routeData) {
      final args = routeData.argsAs<RegisterVerificationArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.RegisterVerification(args.data),
      );
    },
    RpkCandidateDetails.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.RpkCandidateDetails(),
      );
    },
    RpkDrawer.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.RpkDrawer(),
      );
    },
    RpkPartIII.name: (routeData) {
      final args = routeData.argsAs<RpkPartIIIArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.RpkPartIII(
          args.qNo,
          args.nric,
          args.rpkName,
          args.testDate,
          args.groupId,
          args.testCode,
          args.vehNo,
          args.skipUpdateRpkJpjTestStart,
        ),
      );
    },
    RsmRpkTabs.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.RsmRpkTabs(),
      );
    },
    RuleRoute.name: (routeData) {
      final args =
          routeData.argsAs<RuleRouteArgs>(orElse: () => const RuleRouteArgs());
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.RulePage(key: args.key),
      );
    },
    Settings.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.Settings(),
      );
    },
    StartLearning.name: (routeData) {
      final args = routeData.argsAs<StartLearningArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.StartLearning(args.studentIC),
      );
    },
    TakeProfilePicture.name: (routeData) {
      final args = routeData.argsAs<TakeProfilePictureArgs>();
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i36.TakeProfilePicture(args.camera),
      );
    },
    UpdateProfile.name: (routeData) {
      return _i38.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.UpdateProfile(),
      );
    },
  };
}

/// generated route for
/// [_i1.Authentication]
class Authentication extends _i38.PageRouteInfo<void> {
  const Authentication({List<_i38.PageRouteInfo>? children})
      : super(
          Authentication.name,
          initialChildren: children,
        );

  static const String name = 'Authentication';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChangePassword]
class ChangePassword extends _i38.PageRouteInfo<void> {
  const ChangePassword({List<_i38.PageRouteInfo>? children})
      : super(
          ChangePassword.name,
          initialChildren: children,
        );

  static const String name = 'ChangePassword';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CheckListPage]
class CheckListRoute extends _i38.PageRouteInfo<CheckListRouteArgs> {
  CheckListRoute({
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          CheckListRoute.name,
          args: CheckListRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckListRoute';

  static const _i38.PageInfo<CheckListRouteArgs> page =
      _i38.PageInfo<CheckListRouteArgs>(name);
}

class CheckListRouteArgs {
  const CheckListRouteArgs({this.key});

  final _i39.Key? key;

  @override
  String toString() {
    return 'CheckListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ChecklistHome]
class ChecklistHome extends _i38.PageRouteInfo<void> {
  const ChecklistHome({List<_i38.PageRouteInfo>? children})
      : super(
          ChecklistHome.name,
          initialChildren: children,
        );

  static const String name = 'ChecklistHome';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChecklistResultPage]
class ChecklistResultRoute
    extends _i38.PageRouteInfo<ChecklistResultRouteArgs> {
  ChecklistResultRoute({
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          ChecklistResultRoute.name,
          args: ChecklistResultRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChecklistResultRoute';

  static const _i38.PageInfo<ChecklistResultRouteArgs> page =
      _i38.PageInfo<ChecklistResultRouteArgs>(name);
}

class ChecklistResultRouteArgs {
  const ChecklistResultRouteArgs({this.key});

  final _i39.Key? key;

  @override
  String toString() {
    return 'ChecklistResultRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ClientAccount]
class ClientAccount extends _i38.PageRouteInfo<ClientAccountArgs> {
  ClientAccount({
    required dynamic data,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          ClientAccount.name,
          args: ClientAccountArgs(data: data),
          initialChildren: children,
        );

  static const String name = 'ClientAccount';

  static const _i38.PageInfo<ClientAccountArgs> page =
      _i38.PageInfo<ClientAccountArgs>(name);
}

class ClientAccountArgs {
  const ClientAccountArgs({required this.data});

  final dynamic data;

  @override
  String toString() {
    return 'ClientAccountArgs{data: $data}';
  }
}

/// generated route for
/// [_i7.ComingSoon]
class ComingSoon extends _i38.PageRouteInfo<void> {
  const ComingSoon({List<_i38.PageRouteInfo>? children})
      : super(
          ComingSoon.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoon';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ConfirmCandidateInfo]
class ConfirmCandidateInfo
    extends _i38.PageRouteInfo<ConfirmCandidateInfoArgs> {
  ConfirmCandidateInfo({
    required String? part3Type,
    required String? nric,
    required String? candidateName,
    required String? qNo,
    required String? groupId,
    required String? testDate,
    required String? testCode,
    required String icPhoto,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          ConfirmCandidateInfo.name,
          args: ConfirmCandidateInfoArgs(
            part3Type: part3Type,
            nric: nric,
            candidateName: candidateName,
            qNo: qNo,
            groupId: groupId,
            testDate: testDate,
            testCode: testCode,
            icPhoto: icPhoto,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmCandidateInfo';

  static const _i38.PageInfo<ConfirmCandidateInfoArgs> page =
      _i38.PageInfo<ConfirmCandidateInfoArgs>(name);
}

class ConfirmCandidateInfoArgs {
  const ConfirmCandidateInfoArgs({
    required this.part3Type,
    required this.nric,
    required this.candidateName,
    required this.qNo,
    required this.groupId,
    required this.testDate,
    required this.testCode,
    required this.icPhoto,
  });

  final String? part3Type;

  final String? nric;

  final String? candidateName;

  final String? qNo;

  final String? groupId;

  final String? testDate;

  final String? testCode;

  final String icPhoto;

  @override
  String toString() {
    return 'ConfirmCandidateInfoArgs{part3Type: $part3Type, nric: $nric, candidateName: $candidateName, qNo: $qNo, groupId: $groupId, testDate: $testDate, testCode: $testCode, icPhoto: $icPhoto}';
  }
}

/// generated route for
/// [_i9.CriteriaList]
class CriteriaList extends _i38.PageRouteInfo<CriteriaListArgs> {
  CriteriaList({
    required String studentIc,
    required String startDateTime,
    required String group,
    required String course,
    required String part,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          CriteriaList.name,
          args: CriteriaListArgs(
            studentIc: studentIc,
            startDateTime: startDateTime,
            group: group,
            course: course,
            part: part,
          ),
          initialChildren: children,
        );

  static const String name = 'CriteriaList';

  static const _i38.PageInfo<CriteriaListArgs> page =
      _i38.PageInfo<CriteriaListArgs>(name);
}

class CriteriaListArgs {
  const CriteriaListArgs({
    required this.studentIc,
    required this.startDateTime,
    required this.group,
    required this.course,
    required this.part,
  });

  final String studentIc;

  final String startDateTime;

  final String group;

  final String course;

  final String part;

  @override
  String toString() {
    return 'CriteriaListArgs{studentIc: $studentIc, startDateTime: $startDateTime, group: $group, course: $course, part: $part}';
  }
}

/// generated route for
/// [_i10.ForgotPassword]
class ForgotPassword extends _i38.PageRouteInfo<void> {
  const ForgotPassword({List<_i38.PageRouteInfo>? children})
      : super(
          ForgotPassword.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPassword';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i11.GetVehicleInfo]
class GetVehicleInfo extends _i38.PageRouteInfo<GetVehicleInfoArgs> {
  GetVehicleInfo({
    _i39.Key? key,
    required String type,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          GetVehicleInfo.name,
          args: GetVehicleInfoArgs(
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'GetVehicleInfo';

  static const _i38.PageInfo<GetVehicleInfoArgs> page =
      _i38.PageInfo<GetVehicleInfoArgs>(name);
}

class GetVehicleInfoArgs {
  const GetVehicleInfoArgs({
    this.key,
    required this.type,
  });

  final _i39.Key? key;

  final String type;

  @override
  String toString() {
    return 'GetVehicleInfoArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i12.Home]
class Home extends _i38.PageRouteInfo<void> {
  const Home({List<_i38.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i13.HomePageRpk]
class HomePageRpk extends _i38.PageRouteInfo<void> {
  const HomePageRpk({List<_i38.PageRouteInfo>? children})
      : super(
          HomePageRpk.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRpk';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i14.HomeSelect]
class HomeSelect extends _i38.PageRouteInfo<HomeSelectArgs> {
  HomeSelect({
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          HomeSelect.name,
          args: HomeSelectArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeSelect';

  static const _i38.PageInfo<HomeSelectArgs> page =
      _i38.PageInfo<HomeSelectArgs>(name);
}

class HomeSelectArgs {
  const HomeSelectArgs({this.key});

  final _i39.Key? key;

  @override
  String toString() {
    return 'HomeSelectArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.IdentityBarcode]
class IdentityBarcode extends _i38.PageRouteInfo<void> {
  const IdentityBarcode({List<_i38.PageRouteInfo>? children})
      : super(
          IdentityBarcode.name,
          initialChildren: children,
        );

  static const String name = 'IdentityBarcode';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ImageViewer]
class ImageViewer extends _i38.PageRouteInfo<ImageViewerArgs> {
  ImageViewer({
    String? title,
    _i39.NetworkImage? image,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          ImageViewer.name,
          args: ImageViewerArgs(
            title: title,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'ImageViewer';

  static const _i38.PageInfo<ImageViewerArgs> page =
      _i38.PageInfo<ImageViewerArgs>(name);
}

class ImageViewerArgs {
  const ImageViewerArgs({
    this.title,
    this.image,
  });

  final String? title;

  final _i39.NetworkImage? image;

  @override
  String toString() {
    return 'ImageViewerArgs{title: $title, image: $image}';
  }
}

/// generated route for
/// [_i17.JrCandidateDetails]
class JrCandidateDetails extends _i38.PageRouteInfo<void> {
  const JrCandidateDetails({List<_i38.PageRouteInfo>? children})
      : super(
          JrCandidateDetails.name,
          initialChildren: children,
        );

  static const String name = 'JrCandidateDetails';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i18.JrPartIII]
class JrPartIII extends _i38.PageRouteInfo<JrPartIIIArgs> {
  JrPartIII({
    required String? qNo,
    required String? nric,
    required String? jrName,
    required String? testDate,
    required String? groupId,
    required String? testCode,
    required String? vehNo,
    required bool skipUpdateJrJpjTestStart,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          JrPartIII.name,
          args: JrPartIIIArgs(
            qNo: qNo,
            nric: nric,
            jrName: jrName,
            testDate: testDate,
            groupId: groupId,
            testCode: testCode,
            vehNo: vehNo,
            skipUpdateJrJpjTestStart: skipUpdateJrJpjTestStart,
          ),
          initialChildren: children,
        );

  static const String name = 'JrPartIII';

  static const _i38.PageInfo<JrPartIIIArgs> page =
      _i38.PageInfo<JrPartIIIArgs>(name);
}

class JrPartIIIArgs {
  const JrPartIIIArgs({
    required this.qNo,
    required this.nric,
    required this.jrName,
    required this.testDate,
    required this.groupId,
    required this.testCode,
    required this.vehNo,
    required this.skipUpdateJrJpjTestStart,
  });

  final String? qNo;

  final String? nric;

  final String? jrName;

  final String? testDate;

  final String? groupId;

  final String? testCode;

  final String? vehNo;

  final bool skipUpdateJrJpjTestStart;

  @override
  String toString() {
    return 'JrPartIIIArgs{qNo: $qNo, nric: $nric, jrName: $jrName, testDate: $testDate, groupId: $groupId, testCode: $testCode, vehNo: $vehNo, skipUpdateJrJpjTestStart: $skipUpdateJrJpjTestStart}';
  }
}

/// generated route for
/// [_i19.LearningEnterStudentIC]
class LearningEnterStudentIC extends _i38.PageRouteInfo<void> {
  const LearningEnterStudentIC({List<_i38.PageRouteInfo>? children})
      : super(
          LearningEnterStudentIC.name,
          initialChildren: children,
        );

  static const String name = 'LearningEnterStudentIC';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i20.Login]
class Login extends _i38.PageRouteInfo<void> {
  const Login({List<_i38.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i21.OperatorScanQR]
class OperatorScanQR extends _i38.PageRouteInfo<void> {
  const OperatorScanQR({List<_i38.PageRouteInfo>? children})
      : super(
          OperatorScanQR.name,
          initialChildren: children,
        );

  static const String name = 'OperatorScanQR';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i22.Profile]
class Profile extends _i38.PageRouteInfo<ProfileArgs> {
  Profile({
    required dynamic userProfile,
    required dynamic isLoading,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          Profile.name,
          args: ProfileArgs(
            userProfile: userProfile,
            isLoading: isLoading,
          ),
          initialChildren: children,
        );

  static const String name = 'Profile';

  static const _i38.PageInfo<ProfileArgs> page =
      _i38.PageInfo<ProfileArgs>(name);
}

class ProfileArgs {
  const ProfileArgs({
    required this.userProfile,
    required this.isLoading,
  });

  final dynamic userProfile;

  final dynamic isLoading;

  @override
  String toString() {
    return 'ProfileArgs{userProfile: $userProfile, isLoading: $isLoading}';
  }
}

/// generated route for
/// [_i23.ProfileTab]
class ProfileTab extends _i38.PageRouteInfo<void> {
  const ProfileTab({List<_i38.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i24.QrScannerPage]
class QrScannerRoute extends _i38.PageRouteInfo<QrScannerRouteArgs> {
  QrScannerRoute({
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          QrScannerRoute.name,
          args: QrScannerRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i38.PageInfo<QrScannerRouteArgs> page =
      _i38.PageInfo<QrScannerRouteArgs>(name);
}

class QrScannerRouteArgs {
  const QrScannerRouteArgs({this.key});

  final _i39.Key? key;

  @override
  String toString() {
    return 'QrScannerRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.RegisterForm]
class RegisterForm extends _i38.PageRouteInfo<RegisterFormArgs> {
  RegisterForm({
    required dynamic data,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          RegisterForm.name,
          args: RegisterFormArgs(data: data),
          initialChildren: children,
        );

  static const String name = 'RegisterForm';

  static const _i38.PageInfo<RegisterFormArgs> page =
      _i38.PageInfo<RegisterFormArgs>(name);
}

class RegisterFormArgs {
  const RegisterFormArgs({required this.data});

  final dynamic data;

  @override
  String toString() {
    return 'RegisterFormArgs{data: $data}';
  }
}

/// generated route for
/// [_i26.RegisterMobile]
class RegisterMobile extends _i38.PageRouteInfo<void> {
  const RegisterMobile({List<_i38.PageRouteInfo>? children})
      : super(
          RegisterMobile.name,
          initialChildren: children,
        );

  static const String name = 'RegisterMobile';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i27.RegisterUserToDi]
class RegisterUserToDi extends _i38.PageRouteInfo<RegisterUserToDiArgs> {
  RegisterUserToDi({
    required dynamic data,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          RegisterUserToDi.name,
          args: RegisterUserToDiArgs(data: data),
          initialChildren: children,
        );

  static const String name = 'RegisterUserToDi';

  static const _i38.PageInfo<RegisterUserToDiArgs> page =
      _i38.PageInfo<RegisterUserToDiArgs>(name);
}

class RegisterUserToDiArgs {
  const RegisterUserToDiArgs({required this.data});

  final dynamic data;

  @override
  String toString() {
    return 'RegisterUserToDiArgs{data: $data}';
  }
}

/// generated route for
/// [_i28.RegisterVerification]
class RegisterVerification
    extends _i38.PageRouteInfo<RegisterVerificationArgs> {
  RegisterVerification({
    required dynamic data,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          RegisterVerification.name,
          args: RegisterVerificationArgs(data: data),
          initialChildren: children,
        );

  static const String name = 'RegisterVerification';

  static const _i38.PageInfo<RegisterVerificationArgs> page =
      _i38.PageInfo<RegisterVerificationArgs>(name);
}

class RegisterVerificationArgs {
  const RegisterVerificationArgs({required this.data});

  final dynamic data;

  @override
  String toString() {
    return 'RegisterVerificationArgs{data: $data}';
  }
}

/// generated route for
/// [_i29.RpkCandidateDetails]
class RpkCandidateDetails extends _i38.PageRouteInfo<void> {
  const RpkCandidateDetails({List<_i38.PageRouteInfo>? children})
      : super(
          RpkCandidateDetails.name,
          initialChildren: children,
        );

  static const String name = 'RpkCandidateDetails';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i30.RpkDrawer]
class RpkDrawer extends _i38.PageRouteInfo<void> {
  const RpkDrawer({List<_i38.PageRouteInfo>? children})
      : super(
          RpkDrawer.name,
          initialChildren: children,
        );

  static const String name = 'RpkDrawer';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i31.RpkPartIII]
class RpkPartIII extends _i38.PageRouteInfo<RpkPartIIIArgs> {
  RpkPartIII({
    required String? qNo,
    required String? nric,
    required String? rpkName,
    required String? testDate,
    required String? groupId,
    required String? testCode,
    required String? vehNo,
    required bool skipUpdateRpkJpjTestStart,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          RpkPartIII.name,
          args: RpkPartIIIArgs(
            qNo: qNo,
            nric: nric,
            rpkName: rpkName,
            testDate: testDate,
            groupId: groupId,
            testCode: testCode,
            vehNo: vehNo,
            skipUpdateRpkJpjTestStart: skipUpdateRpkJpjTestStart,
          ),
          initialChildren: children,
        );

  static const String name = 'RpkPartIII';

  static const _i38.PageInfo<RpkPartIIIArgs> page =
      _i38.PageInfo<RpkPartIIIArgs>(name);
}

class RpkPartIIIArgs {
  const RpkPartIIIArgs({
    required this.qNo,
    required this.nric,
    required this.rpkName,
    required this.testDate,
    required this.groupId,
    required this.testCode,
    required this.vehNo,
    required this.skipUpdateRpkJpjTestStart,
  });

  final String? qNo;

  final String? nric;

  final String? rpkName;

  final String? testDate;

  final String? groupId;

  final String? testCode;

  final String? vehNo;

  final bool skipUpdateRpkJpjTestStart;

  @override
  String toString() {
    return 'RpkPartIIIArgs{qNo: $qNo, nric: $nric, rpkName: $rpkName, testDate: $testDate, groupId: $groupId, testCode: $testCode, vehNo: $vehNo, skipUpdateRpkJpjTestStart: $skipUpdateRpkJpjTestStart}';
  }
}

/// generated route for
/// [_i32.RsmRpkTabs]
class RsmRpkTabs extends _i38.PageRouteInfo<void> {
  const RsmRpkTabs({List<_i38.PageRouteInfo>? children})
      : super(
          RsmRpkTabs.name,
          initialChildren: children,
        );

  static const String name = 'RsmRpkTabs';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i33.RulePage]
class RuleRoute extends _i38.PageRouteInfo<RuleRouteArgs> {
  RuleRoute({
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          RuleRoute.name,
          args: RuleRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RuleRoute';

  static const _i38.PageInfo<RuleRouteArgs> page =
      _i38.PageInfo<RuleRouteArgs>(name);
}

class RuleRouteArgs {
  const RuleRouteArgs({this.key});

  final _i39.Key? key;

  @override
  String toString() {
    return 'RuleRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i34.Settings]
class Settings extends _i38.PageRouteInfo<void> {
  const Settings({List<_i38.PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}

/// generated route for
/// [_i35.StartLearning]
class StartLearning extends _i38.PageRouteInfo<StartLearningArgs> {
  StartLearning({
    required dynamic studentIC,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          StartLearning.name,
          args: StartLearningArgs(studentIC: studentIC),
          initialChildren: children,
        );

  static const String name = 'StartLearning';

  static const _i38.PageInfo<StartLearningArgs> page =
      _i38.PageInfo<StartLearningArgs>(name);
}

class StartLearningArgs {
  const StartLearningArgs({required this.studentIC});

  final dynamic studentIC;

  @override
  String toString() {
    return 'StartLearningArgs{studentIC: $studentIC}';
  }
}

/// generated route for
/// [_i36.TakeProfilePicture]
class TakeProfilePicture extends _i38.PageRouteInfo<TakeProfilePictureArgs> {
  TakeProfilePicture({
    required List<_i40.CameraDescription>? camera,
    List<_i38.PageRouteInfo>? children,
  }) : super(
          TakeProfilePicture.name,
          args: TakeProfilePictureArgs(camera: camera),
          initialChildren: children,
        );

  static const String name = 'TakeProfilePicture';

  static const _i38.PageInfo<TakeProfilePictureArgs> page =
      _i38.PageInfo<TakeProfilePictureArgs>(name);
}

class TakeProfilePictureArgs {
  const TakeProfilePictureArgs({required this.camera});

  final List<_i40.CameraDescription>? camera;

  @override
  String toString() {
    return 'TakeProfilePictureArgs{camera: $camera}';
  }
}

/// generated route for
/// [_i37.UpdateProfile]
class UpdateProfile extends _i38.PageRouteInfo<void> {
  const UpdateProfile({List<_i38.PageRouteInfo>? children})
      : super(
          UpdateProfile.name,
          initialChildren: children,
        );

  static const String name = 'UpdateProfile';

  static const _i38.PageInfo<void> page = _i38.PageInfo<void>(name);
}
