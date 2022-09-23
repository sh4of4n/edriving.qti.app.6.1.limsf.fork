// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:camera/camera.dart' as _i23;
import 'package:flutter/material.dart' as _i22;

import 'coming_soon/coming_soon.dart' as _i8;
import 'common_library/utils/image_viewer.dart' as _i7;
import 'pages/candidate_info/confirm_candidate_info.dart' as _i14;
import 'pages/checklist/checklist.dart' as _i17;
import 'pages/checklist/checklist_home.dart' as _i18;
import 'pages/checklist/checklist_result.dart' as _i19;
import 'pages/eLearning/elearning.dart' as _i9;
import 'pages/eTestingSolution/etesting_solution.dart' as _i10;
import 'pages/forgot_password/forgot_password.dart' as _i2;
import 'pages/home/home.dart' as _i5;
import 'pages/home/home_page_rpk.dart' as _i16;
import 'pages/home/home_select.dart' as _i15;
import 'pages/jalan_raya/jalan_raya.dart' as _i13;
import 'pages/login/login.dart' as _i1;
import 'pages/profile/profile.dart' as _i6;
import 'pages/profile/take_profile_picture.dart' as _i11;
import 'pages/register/register.dart' as _i4;
import 'pages/rpk/rpk.dart' as _i12;
import 'pages/rpk/rule.dart' as _i20;
import 'pages/settings/settings.dart' as _i3;

class AppRouter extends _i21.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    Authentication.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.Authentication());
    },
    ClientAccount.name: (routeData) {
      final args = routeData.argsAs<ClientAccountArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.ClientAccount(args.data));
    },
    Login.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.Login());
    },
    ForgotPassword.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ForgotPassword());
    },
    ChangePassword.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ChangePassword());
    },
    RegisterMobile.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RegisterMobile());
    },
    RegisterVerification.name: (routeData) {
      final args = routeData.argsAs<RegisterVerificationArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RegisterVerification(args.data));
    },
    RegisterForm.name: (routeData) {
      final args = routeData.argsAs<RegisterFormArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RegisterForm(args.data));
    },
    GetVehicleInfo.name: (routeData) {
      final args = routeData.argsAs<GetVehicleInfoArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.GetVehicleInfo(key: args.key, type: args.type));
    },
    Home.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.Home());
    },
    Settings.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.Settings());
    },
    Profile.name: (routeData) {
      final args = routeData.argsAs<ProfileArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.Profile(
              userProfile: args.userProfile, isLoading: args.isLoading));
    },
    ProfileTab.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.ProfileTab());
    },
    UpdateProfile.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.UpdateProfile());
    },
    RegisterUserToDi.name: (routeData) {
      final args = routeData.argsAs<RegisterUserToDiArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RegisterUserToDi(args.data));
    },
    IdentityBarcode.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.IdentityBarcode());
    },
    ImageViewer.name: (routeData) {
      final args = routeData.argsAs<ImageViewerArgs>(
          orElse: () => const ImageViewerArgs());
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.ImageViewer(title: args.title, image: args.image));
    },
    ComingSoon.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.ComingSoon());
    },
    StartLearning.name: (routeData) {
      final args = routeData.argsAs<StartLearningArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.StartLearning(args.studentIC));
    },
    CriteriaList.name: (routeData) {
      final args = routeData.argsAs<CriteriaListArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.CriteriaList(args.studentIc, args.startDateTime,
              args.group, args.course, args.part));
    },
    RsmRpkTabs.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.RsmRpkTabs());
    },
    RpkDrawer.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.RpkDrawer());
    },
    TakeProfilePicture.name: (routeData) {
      final args = routeData.argsAs<TakeProfilePictureArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.TakeProfilePicture(args.camera));
    },
    OperatorScanQR.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.OperatorScanQR());
    },
    LearningEnterStudentIC.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.LearningEnterStudentIC());
    },
    RpkCandidateDetails.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.RpkCandidateDetails());
    },
    RpkPartIII.name: (routeData) {
      final args = routeData.argsAs<RpkPartIIIArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.RpkPartIII(args.qNo, args.nric, args.rpkName,
              args.testDate, args.groupId, args.testCode, args.vehNo));
    },
    JrCandidateDetails.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.JrCandidateDetails());
    },
    JrPartIII.name: (routeData) {
      final args = routeData.argsAs<JrPartIIIArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.JrPartIII(args.qNo, args.nric, args.jrName, args.testDate,
              args.groupId, args.testCode, args.vehNo));
    },
    ConfirmCandidateInfo.name: (routeData) {
      final args = routeData.argsAs<ConfirmCandidateInfoArgs>();
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ConfirmCandidateInfo(
              part3Type: args.part3Type,
              nric: args.nric,
              candidateName: args.candidateName,
              qNo: args.qNo,
              groupId: args.groupId,
              testDate: args.testDate,
              testCode: args.testCode,
              icPhoto: args.icPhoto));
    },
    HomeSelect.name: (routeData) {
      final args = routeData.argsAs<HomeSelectArgs>(
          orElse: () => const HomeSelectArgs());
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.HomeSelect(key: args.key));
    },
    HomePageRpk.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.HomePageRpk());
    },
    CheckListRoute.name: (routeData) {
      final args = routeData.argsAs<CheckListRouteArgs>(
          orElse: () => const CheckListRouteArgs());
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.CheckListPage(key: args.key));
    },
    ChecklistHome.name: (routeData) {
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ChecklistHome());
    },
    ChecklistResultRoute.name: (routeData) {
      final args = routeData.argsAs<ChecklistResultRouteArgs>(
          orElse: () => const ChecklistResultRouteArgs());
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.ChecklistResultPage(key: args.key));
    },
    RuleRoute.name: (routeData) {
      final args =
          routeData.argsAs<RuleRouteArgs>(orElse: () => const RuleRouteArgs());
      return _i21.MaterialPageX<dynamic>(
          routeData: routeData, child: _i20.RulePage(key: args.key));
    }
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(Authentication.name, path: '/'),
        _i21.RouteConfig(ClientAccount.name, path: '/client-account'),
        _i21.RouteConfig(Login.name, path: '/Login'),
        _i21.RouteConfig(ForgotPassword.name, path: '/forgot-password'),
        _i21.RouteConfig(ChangePassword.name, path: '/change-password'),
        _i21.RouteConfig(RegisterMobile.name, path: '/register-mobile'),
        _i21.RouteConfig(RegisterVerification.name,
            path: '/register-verification'),
        _i21.RouteConfig(RegisterForm.name, path: '/register-form'),
        _i21.RouteConfig(GetVehicleInfo.name, path: '/get-vehicle-info'),
        _i21.RouteConfig(Home.name, path: '/Home'),
        _i21.RouteConfig(Settings.name, path: '/Settings'),
        _i21.RouteConfig(Profile.name, path: '/Profile'),
        _i21.RouteConfig(ProfileTab.name, path: '/profile-tab'),
        _i21.RouteConfig(UpdateProfile.name, path: '/update-profile'),
        _i21.RouteConfig(RegisterUserToDi.name, path: '/register-user-to-di'),
        _i21.RouteConfig(IdentityBarcode.name, path: '/identity-barcode'),
        _i21.RouteConfig(ImageViewer.name, path: '/image-viewer'),
        _i21.RouteConfig(ComingSoon.name, path: '/coming-soon'),
        _i21.RouteConfig(StartLearning.name, path: '/start-learning'),
        _i21.RouteConfig(CriteriaList.name, path: '/criteria-list'),
        _i21.RouteConfig(RsmRpkTabs.name, path: '/rsm-rpk-tabs'),
        _i21.RouteConfig(RpkDrawer.name, path: '/rpk-drawer'),
        _i21.RouteConfig(TakeProfilePicture.name,
            path: '/take-profile-picture'),
        _i21.RouteConfig(OperatorScanQR.name, path: '/operator-scan-qR'),
        _i21.RouteConfig(LearningEnterStudentIC.name,
            path: '/learning-enter-student-iC'),
        _i21.RouteConfig(RpkCandidateDetails.name,
            path: '/rpk-candidate-details'),
        _i21.RouteConfig(RpkPartIII.name, path: '/rpk-part-ii-i'),
        _i21.RouteConfig(JrCandidateDetails.name,
            path: '/jr-candidate-details'),
        _i21.RouteConfig(JrPartIII.name, path: '/jr-part-ii-i'),
        _i21.RouteConfig(ConfirmCandidateInfo.name,
            path: '/confirm-candidate-info'),
        _i21.RouteConfig(HomeSelect.name, path: '/home-select'),
        _i21.RouteConfig(HomePageRpk.name, path: '/home-page-rpk'),
        _i21.RouteConfig(HomePageRpk.name, path: '/home-page-rpk'),
        _i21.RouteConfig(CheckListRoute.name, path: '/check-list-page'),
        _i21.RouteConfig(ChecklistHome.name, path: '/checklist-home'),
        _i21.RouteConfig(ChecklistResultRoute.name,
            path: '/checklist-result-page'),
        _i21.RouteConfig(RuleRoute.name, path: '/rule-page')
      ];
}

/// generated route for
/// [_i1.Authentication]
class Authentication extends _i21.PageRouteInfo<void> {
  const Authentication() : super(Authentication.name, path: '/');

  static const String name = 'Authentication';
}

/// generated route for
/// [_i1.ClientAccount]
class ClientAccount extends _i21.PageRouteInfo<ClientAccountArgs> {
  ClientAccount({required dynamic data})
      : super(ClientAccount.name,
            path: '/client-account', args: ClientAccountArgs(data: data));

  static const String name = 'ClientAccount';
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
/// [_i1.Login]
class Login extends _i21.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/Login');

  static const String name = 'Login';
}

/// generated route for
/// [_i2.ForgotPassword]
class ForgotPassword extends _i21.PageRouteInfo<void> {
  const ForgotPassword() : super(ForgotPassword.name, path: '/forgot-password');

  static const String name = 'ForgotPassword';
}

/// generated route for
/// [_i3.ChangePassword]
class ChangePassword extends _i21.PageRouteInfo<void> {
  const ChangePassword() : super(ChangePassword.name, path: '/change-password');

  static const String name = 'ChangePassword';
}

/// generated route for
/// [_i4.RegisterMobile]
class RegisterMobile extends _i21.PageRouteInfo<void> {
  const RegisterMobile() : super(RegisterMobile.name, path: '/register-mobile');

  static const String name = 'RegisterMobile';
}

/// generated route for
/// [_i4.RegisterVerification]
class RegisterVerification
    extends _i21.PageRouteInfo<RegisterVerificationArgs> {
  RegisterVerification({required dynamic data})
      : super(RegisterVerification.name,
            path: '/register-verification',
            args: RegisterVerificationArgs(data: data));

  static const String name = 'RegisterVerification';
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
/// [_i4.RegisterForm]
class RegisterForm extends _i21.PageRouteInfo<RegisterFormArgs> {
  RegisterForm({required dynamic data})
      : super(RegisterForm.name,
            path: '/register-form', args: RegisterFormArgs(data: data));

  static const String name = 'RegisterForm';
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
/// [_i1.GetVehicleInfo]
class GetVehicleInfo extends _i21.PageRouteInfo<GetVehicleInfoArgs> {
  GetVehicleInfo({_i22.Key? key, required String type})
      : super(GetVehicleInfo.name,
            path: '/get-vehicle-info',
            args: GetVehicleInfoArgs(key: key, type: type));

  static const String name = 'GetVehicleInfo';
}

class GetVehicleInfoArgs {
  const GetVehicleInfoArgs({this.key, required this.type});

  final _i22.Key? key;

  final String type;

  @override
  String toString() {
    return 'GetVehicleInfoArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i5.Home]
class Home extends _i21.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/Home');

  static const String name = 'Home';
}

/// generated route for
/// [_i3.Settings]
class Settings extends _i21.PageRouteInfo<void> {
  const Settings() : super(Settings.name, path: '/Settings');

  static const String name = 'Settings';
}

/// generated route for
/// [_i6.Profile]
class Profile extends _i21.PageRouteInfo<ProfileArgs> {
  Profile({required dynamic userProfile, required dynamic isLoading})
      : super(Profile.name,
            path: '/Profile',
            args: ProfileArgs(userProfile: userProfile, isLoading: isLoading));

  static const String name = 'Profile';
}

class ProfileArgs {
  const ProfileArgs({required this.userProfile, required this.isLoading});

  final dynamic userProfile;

  final dynamic isLoading;

  @override
  String toString() {
    return 'ProfileArgs{userProfile: $userProfile, isLoading: $isLoading}';
  }
}

/// generated route for
/// [_i6.ProfileTab]
class ProfileTab extends _i21.PageRouteInfo<void> {
  const ProfileTab() : super(ProfileTab.name, path: '/profile-tab');

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i6.UpdateProfile]
class UpdateProfile extends _i21.PageRouteInfo<void> {
  const UpdateProfile() : super(UpdateProfile.name, path: '/update-profile');

  static const String name = 'UpdateProfile';
}

/// generated route for
/// [_i4.RegisterUserToDi]
class RegisterUserToDi extends _i21.PageRouteInfo<RegisterUserToDiArgs> {
  RegisterUserToDi({required dynamic data})
      : super(RegisterUserToDi.name,
            path: '/register-user-to-di',
            args: RegisterUserToDiArgs(data: data));

  static const String name = 'RegisterUserToDi';
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
/// [_i6.IdentityBarcode]
class IdentityBarcode extends _i21.PageRouteInfo<void> {
  const IdentityBarcode()
      : super(IdentityBarcode.name, path: '/identity-barcode');

  static const String name = 'IdentityBarcode';
}

/// generated route for
/// [_i7.ImageViewer]
class ImageViewer extends _i21.PageRouteInfo<ImageViewerArgs> {
  ImageViewer({String? title, _i22.NetworkImage? image})
      : super(ImageViewer.name,
            path: '/image-viewer',
            args: ImageViewerArgs(title: title, image: image));

  static const String name = 'ImageViewer';
}

class ImageViewerArgs {
  const ImageViewerArgs({this.title, this.image});

  final String? title;

  final _i22.NetworkImage? image;

  @override
  String toString() {
    return 'ImageViewerArgs{title: $title, image: $image}';
  }
}

/// generated route for
/// [_i8.ComingSoon]
class ComingSoon extends _i21.PageRouteInfo<void> {
  const ComingSoon() : super(ComingSoon.name, path: '/coming-soon');

  static const String name = 'ComingSoon';
}

/// generated route for
/// [_i9.StartLearning]
class StartLearning extends _i21.PageRouteInfo<StartLearningArgs> {
  StartLearning({required dynamic studentIC})
      : super(StartLearning.name,
            path: '/start-learning',
            args: StartLearningArgs(studentIC: studentIC));

  static const String name = 'StartLearning';
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
/// [_i9.CriteriaList]
class CriteriaList extends _i21.PageRouteInfo<CriteriaListArgs> {
  CriteriaList(
      {required String studentIc,
      required String startDateTime,
      required String group,
      required String course,
      required String part})
      : super(CriteriaList.name,
            path: '/criteria-list',
            args: CriteriaListArgs(
                studentIc: studentIc,
                startDateTime: startDateTime,
                group: group,
                course: course,
                part: part));

  static const String name = 'CriteriaList';
}

class CriteriaListArgs {
  const CriteriaListArgs(
      {required this.studentIc,
      required this.startDateTime,
      required this.group,
      required this.course,
      required this.part});

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
/// [_i10.RsmRpkTabs]
class RsmRpkTabs extends _i21.PageRouteInfo<void> {
  const RsmRpkTabs() : super(RsmRpkTabs.name, path: '/rsm-rpk-tabs');

  static const String name = 'RsmRpkTabs';
}

/// generated route for
/// [_i10.RpkDrawer]
class RpkDrawer extends _i21.PageRouteInfo<void> {
  const RpkDrawer() : super(RpkDrawer.name, path: '/rpk-drawer');

  static const String name = 'RpkDrawer';
}

/// generated route for
/// [_i11.TakeProfilePicture]
class TakeProfilePicture extends _i21.PageRouteInfo<TakeProfilePictureArgs> {
  TakeProfilePicture({required List<_i23.CameraDescription>? camera})
      : super(TakeProfilePicture.name,
            path: '/take-profile-picture',
            args: TakeProfilePictureArgs(camera: camera));

  static const String name = 'TakeProfilePicture';
}

class TakeProfilePictureArgs {
  const TakeProfilePictureArgs({required this.camera});

  final List<_i23.CameraDescription>? camera;

  @override
  String toString() {
    return 'TakeProfilePictureArgs{camera: $camera}';
  }
}

/// generated route for
/// [_i10.OperatorScanQR]
class OperatorScanQR extends _i21.PageRouteInfo<void> {
  const OperatorScanQR()
      : super(OperatorScanQR.name, path: '/operator-scan-qR');

  static const String name = 'OperatorScanQR';
}

/// generated route for
/// [_i9.LearningEnterStudentIC]
class LearningEnterStudentIC extends _i21.PageRouteInfo<void> {
  const LearningEnterStudentIC()
      : super(LearningEnterStudentIC.name, path: '/learning-enter-student-iC');

  static const String name = 'LearningEnterStudentIC';
}

/// generated route for
/// [_i12.RpkCandidateDetails]
class RpkCandidateDetails extends _i21.PageRouteInfo<void> {
  const RpkCandidateDetails()
      : super(RpkCandidateDetails.name, path: '/rpk-candidate-details');

  static const String name = 'RpkCandidateDetails';
}

/// generated route for
/// [_i12.RpkPartIII]
class RpkPartIII extends _i21.PageRouteInfo<RpkPartIIIArgs> {
  RpkPartIII(
      {required String? qNo,
      required String? nric,
      required String? rpkName,
      required String? testDate,
      required String? groupId,
      required String? testCode,
      required String? vehNo})
      : super(RpkPartIII.name,
            path: '/rpk-part-ii-i',
            args: RpkPartIIIArgs(
                qNo: qNo,
                nric: nric,
                rpkName: rpkName,
                testDate: testDate,
                groupId: groupId,
                testCode: testCode,
                vehNo: vehNo));

  static const String name = 'RpkPartIII';
}

class RpkPartIIIArgs {
  const RpkPartIIIArgs(
      {required this.qNo,
      required this.nric,
      required this.rpkName,
      required this.testDate,
      required this.groupId,
      required this.testCode,
      required this.vehNo});

  final String? qNo;

  final String? nric;

  final String? rpkName;

  final String? testDate;

  final String? groupId;

  final String? testCode;

  final String? vehNo;

  @override
  String toString() {
    return 'RpkPartIIIArgs{qNo: $qNo, nric: $nric, rpkName: $rpkName, testDate: $testDate, groupId: $groupId, testCode: $testCode, vehNo: $vehNo}';
  }
}

/// generated route for
/// [_i13.JrCandidateDetails]
class JrCandidateDetails extends _i21.PageRouteInfo<void> {
  const JrCandidateDetails()
      : super(JrCandidateDetails.name, path: '/jr-candidate-details');

  static const String name = 'JrCandidateDetails';
}

/// generated route for
/// [_i13.JrPartIII]
class JrPartIII extends _i21.PageRouteInfo<JrPartIIIArgs> {
  JrPartIII(
      {required String? qNo,
      required String? nric,
      required String? jrName,
      required String? testDate,
      required String? groupId,
      required String? testCode,
      required String? vehNo})
      : super(JrPartIII.name,
            path: '/jr-part-ii-i',
            args: JrPartIIIArgs(
                qNo: qNo,
                nric: nric,
                jrName: jrName,
                testDate: testDate,
                groupId: groupId,
                testCode: testCode,
                vehNo: vehNo));

  static const String name = 'JrPartIII';
}

class JrPartIIIArgs {
  const JrPartIIIArgs(
      {required this.qNo,
      required this.nric,
      required this.jrName,
      required this.testDate,
      required this.groupId,
      required this.testCode,
      required this.vehNo});

  final String? qNo;

  final String? nric;

  final String? jrName;

  final String? testDate;

  final String? groupId;

  final String? testCode;

  final String? vehNo;

  @override
  String toString() {
    return 'JrPartIIIArgs{qNo: $qNo, nric: $nric, jrName: $jrName, testDate: $testDate, groupId: $groupId, testCode: $testCode, vehNo: $vehNo}';
  }
}

/// generated route for
/// [_i14.ConfirmCandidateInfo]
class ConfirmCandidateInfo
    extends _i21.PageRouteInfo<ConfirmCandidateInfoArgs> {
  ConfirmCandidateInfo(
      {required String? part3Type,
      required String? nric,
      required String? candidateName,
      required String? qNo,
      required String? groupId,
      required String? testDate,
      required String? testCode,
      required String icPhoto})
      : super(ConfirmCandidateInfo.name,
            path: '/confirm-candidate-info',
            args: ConfirmCandidateInfoArgs(
                part3Type: part3Type,
                nric: nric,
                candidateName: candidateName,
                qNo: qNo,
                groupId: groupId,
                testDate: testDate,
                testCode: testCode,
                icPhoto: icPhoto));

  static const String name = 'ConfirmCandidateInfo';
}

class ConfirmCandidateInfoArgs {
  const ConfirmCandidateInfoArgs(
      {required this.part3Type,
      required this.nric,
      required this.candidateName,
      required this.qNo,
      required this.groupId,
      required this.testDate,
      required this.testCode,
      required this.icPhoto});

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
/// [_i15.HomeSelect]
class HomeSelect extends _i21.PageRouteInfo<HomeSelectArgs> {
  HomeSelect({_i22.Key? key})
      : super(HomeSelect.name,
            path: '/home-select', args: HomeSelectArgs(key: key));

  static const String name = 'HomeSelect';
}

class HomeSelectArgs {
  const HomeSelectArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'HomeSelectArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.HomePageRpk]
class HomePageRpk extends _i21.PageRouteInfo<void> {
  const HomePageRpk() : super(HomePageRpk.name, path: '/home-page-rpk');

  static const String name = 'HomePageRpk';
}

/// generated route for
/// [_i17.CheckListPage]
class CheckListRoute extends _i21.PageRouteInfo<CheckListRouteArgs> {
  CheckListRoute({_i22.Key? key})
      : super(CheckListRoute.name,
            path: '/check-list-page', args: CheckListRouteArgs(key: key));

  static const String name = 'CheckListRoute';
}

class CheckListRouteArgs {
  const CheckListRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'CheckListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.ChecklistHome]
class ChecklistHome extends _i21.PageRouteInfo<void> {
  const ChecklistHome() : super(ChecklistHome.name, path: '/checklist-home');

  static const String name = 'ChecklistHome';
}

/// generated route for
/// [_i19.ChecklistResultPage]
class ChecklistResultRoute
    extends _i21.PageRouteInfo<ChecklistResultRouteArgs> {
  ChecklistResultRoute({_i22.Key? key})
      : super(ChecklistResultRoute.name,
            path: '/checklist-result-page',
            args: ChecklistResultRouteArgs(key: key));

  static const String name = 'ChecklistResultRoute';
}

class ChecklistResultRouteArgs {
  const ChecklistResultRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'ChecklistResultRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.RulePage]
class RuleRoute extends _i21.PageRouteInfo<RuleRouteArgs> {
  RuleRoute({_i22.Key? key})
      : super(RuleRoute.name,
            path: '/rule-page', args: RuleRouteArgs(key: key));

  static const String name = 'RuleRoute';
}

class RuleRouteArgs {
  const RuleRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'RuleRouteArgs{key: $key}';
  }
}
