import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/coming_soon/coming_soon.dart';
import 'package:edriving_qti_app/pages/checklist/checklist.dart';
import 'package:edriving_qti_app/pages/checklist/checklist_home.dart';
import 'package:edriving_qti_app/pages/checklist/checklist_result.dart';
import 'package:edriving_qti_app/pages/eLearning/elearning.dart';
import 'package:edriving_qti_app/pages/forgot_password/forgot_password.dart';
import 'package:edriving_qti_app/pages/home/home_page_rpk.dart';
import 'package:edriving_qti_app/pages/home/home_select.dart';
import 'package:edriving_qti_app/pages/profile/profile.dart';
import 'package:edriving_qti_app/pages/qr_scanner.dart';
import 'package:edriving_qti_app/pages/register/register.dart';
import 'package:edriving_qti_app/pages/rpk/rpk.dart';
import 'package:edriving_qti_app/pages/rpk/rule.dart';
import 'pages/candidate_info/confirm_candidate_info.dart';
import 'pages/eTestingSolution/etesting_solution.dart';
import 'pages/home/home.dart';
import 'pages/jalan_raya/jalan_raya.dart';
import 'pages/login/login.dart';
import 'pages/profile/take_profile_picture.dart';
import 'pages/settings/settings.dart';
import 'package:edriving_qti_app/common_library/utils/image_viewer.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Authentication, initial: true, name: 'Authentication'),
    AutoRoute(page: ClientAccount, name: 'ClientAccount'),
    AutoRoute(page: Login, name: 'Login'),
    AutoRoute(page: ForgotPassword, name: 'ForgotPassword'),
    AutoRoute(page: ChangePassword, name: 'ChangePassword'),
    AutoRoute(page: RegisterMobile, name: 'RegisterMobile'),
    AutoRoute(page: RegisterVerification, name: 'RegisterVerification'),
    AutoRoute(page: RegisterForm, name: 'RegisterForm'),
    AutoRoute(page: GetVehicleInfo, name: 'GetVehicleInfo'),
    AutoRoute(page: Home, name: 'Home'),
    AutoRoute(page: Settings, name: 'Settings'),
    AutoRoute(page: Profile, name: 'Profile'),
    AutoRoute(page: ProfileTab, name: 'ProfileTab'),
    AutoRoute(page: UpdateProfile, name: 'UpdateProfile'),
    AutoRoute(page: RegisterUserToDi, name: 'RegisterUserToDi'),
    AutoRoute(page: IdentityBarcode, name: 'IdentityBarcode'),
    AutoRoute(page: ImageViewer, name: 'ImageViewer'),
    AutoRoute(page: ComingSoon, name: 'ComingSoon'),
    AutoRoute(page: StartLearning, name: 'StartLearning'),
    AutoRoute(page: CriteriaList, name: 'CriteriaList'),
    AutoRoute(page: RsmRpkTabs, name: 'RsmRpkTabs'),
    AutoRoute(page: RpkDrawer, name: 'RpkDrawer'),
    AutoRoute(page: TakeProfilePicture, name: 'TakeProfilePicture'),
    AutoRoute(page: OperatorScanQR, name: 'OperatorScanQR'),
    AutoRoute(page: LearningEnterStudentIC, name: 'LearningEnterStudentIC'),
    AutoRoute(page: RpkCandidateDetails, name: 'RpkCandidateDetails'),
    AutoRoute(page: RpkPartIII, name: 'RpkPartIII'),
    AutoRoute(page: JrCandidateDetails, name: 'JrCandidateDetails'),
    AutoRoute(page: JrPartIII, name: 'JrPartIII'),
    AutoRoute(page: ConfirmCandidateInfo, name: 'ConfirmCandidateInfo'),
    AutoRoute(page: HomeSelect, name: 'HomeSelect'),
    AutoRoute(page: HomePageRpk, name: 'HomePageRpk'),
    AutoRoute(page: HomePageRpk, name: 'HomePageRpk'),
    AutoRoute(page: CheckListPage),
    AutoRoute(page: ChecklistHome),
    AutoRoute(page: ChecklistResultPage),
    AutoRoute(page: RulePage),
    AutoRoute(page: QrScannerPage),
  ],
)
class $AppRouter {}
