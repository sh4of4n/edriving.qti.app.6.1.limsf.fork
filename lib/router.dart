import 'package:auto_route/auto_route.dart';
import 'package:edriving_qti_app/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: Authentication.page, path: '/'),
    AutoRoute(page: ClientAccount.page),
    AutoRoute(page: Login.page),
    AutoRoute(page: ForgotPassword.page),
    AutoRoute(page: ChangePassword.page),
    AutoRoute(page: RegisterMobile.page),
    AutoRoute(page: RegisterVerification.page),
    AutoRoute(page: RegisterForm.page),
    AutoRoute(page: GetVehicleInfo.page),
    AutoRoute(page: Home.page),
    AutoRoute(page: Settings.page),
    AutoRoute(page: Profile.page),
    AutoRoute(page: ProfileTab.page),
    AutoRoute(page: UpdateProfile.page),
    AutoRoute(page: RegisterUserToDi.page),
    AutoRoute(page: IdentityBarcode.page),
    AutoRoute(page: ImageViewer.page),
    AutoRoute(page: ComingSoon.page),
    AutoRoute(page: StartLearning.page),
    AutoRoute(page: CriteriaList.page),
    AutoRoute(page: RsmRpkTabs.page),
    AutoRoute(page: RpkDrawer.page),
    AutoRoute(page: TakeProfilePicture.page),
    AutoRoute(page: OperatorScanQR.page),
    AutoRoute(page: LearningEnterStudentIC.page),
    AutoRoute(page: RpkCandidateDetails.page),
    AutoRoute(page: RpkPartIII.page),
    AutoRoute(page: JrCandidateDetails.page),
    AutoRoute(page: JrPartIII.page),
    AutoRoute(page: ConfirmCandidateInfo.page),
    AutoRoute(page: HomeSelect.page),
    AutoRoute(page: HomePageRpk.page),
    AutoRoute(page: HomePageRpk.page),
    AutoRoute(page: CheckListRoute.page),
    AutoRoute(page: ChecklistHome.page),
    AutoRoute(page: ChecklistResultRoute.page),
    AutoRoute(page: RuleRoute.page),
    AutoRoute(page: QrScannerRoute.page),
    //  AutoRoute(page: Test.page, path: '/'),
    AutoRoute(page: NewRpkCandidateDetails.page),
  ];
}
