import 'preferences.dart';

class LocalStorage {
  static const String kLocale = 'LOCALE';
  static const String kWsUrl = 'WS_URL';
  static const String kCaUid = 'CAUID';
  static const String kCaPwd = 'CAPWD';
  static const String kCaPwdEncode = 'CAPWD_ENCODE';
  static const String kUserId = 'USER_ID';
  static const String kUsername = 'USERNAME';
  static const String kCountryCode = 'COUNTRY_CODE';
  static const String kUserPhone = 'USER_PHONE';
  static const String kEmail = 'EMAIL';
  static const String kDiCode = 'DI_CODE';
  static const String kSessionId = 'SESSION_ID';
  static const String kNationality = 'NATIONALITY';
  static const String kGender = 'GENDER';
  static const String kAddress = 'ADDRESS';
  static const String kStudentIc = 'STUDENT_IC';
  static const String kState = 'STATE';
  static const String kCountry = 'COUNTRY';
  static const String kPostCode = 'POST_CODE';
  static const String kInstituteLogo = 'INSTITUTE_LOGO';
  static const String kEnrolledGroupId = 'ENROLLED_GROUP_ID';
  static const String kBlacklisted = 'BLACKLISTED';
  static const String kUserLatitude = 'LATITUDE';
  static const String kUserLongitude = 'LONGITUDE';
  static const String kAppVersion = 'APP_VERSION';
  static const String kBirthDate = 'BIRTH_DATE';
  static const String kRace = 'RACE';
  static const String kNickName = 'NICK_NAME';
  static const String kMerchantDbCode = 'MERCHANT_DB_CODE';
  static const String kProfilePic = 'PROFILE_PIC';
  static const String kLoginDeviceId = 'LOGIN_DEVICE_ID';
  static const String kCarNo = 'CAR_NO';
  static const String kPlateNo = 'PLATE_NO';
  static const String kMsgDoc = 'MSG_DOC';
  static const String kMsgRef = 'MSG_REF';
  static const String kMySikapId = 'MY_SIKAP_ID';
  static const String kType = '';
  static const String KMysikapVehicle = 'MYSIKAP_VEHICLE';
  static const String kPermitCode = 'PERMIT_CODE';

  static const String part2MarkSessionB = 'part2MarkB';
  static const String part2MarkSessionC = 'part2MarkC';
  static const String part2MarkSessionD = 'part2MarkD';
  static const String part2MarkSessionE = 'part2MarkE';
  static const String part2MarkSessionF = 'part2MarkF';
  static const String part2MarkSessionG = 'part2MarkG';

  static const String part2MarkSessionB_M = 'part2MarkSessionB_M';
  static const String part2MarkSessionC_M = 'part2MarkSessionC_M';
  static const String part2MarkSessionD_M = 'part2MarkSessionD_M';
  static const String part2MarkSessionE_M = 'part2MarkSessionE_M';
  static const String part2MarkSessionF_M = 'part2MarkSessionF_M';
  static const String part2MarkSessionG_M = 'part2MarkSessionG_M';
  static const String part2MarkSessionH_M = 'part2MarkSessionH_M';

  static const String DeductMarkB = 'DeductMarkB';
  static const String DeductMarkC = 'DeductMarkC';
  static const String DeductMarkD = 'DeductMarkD';
  static const String DeductMarkE = 'DeductMarkE';
  static const String DeductMarkF = 'DeductMarkF';
  static const String DeductMarkG = 'DeductMarkG';
  static const String DeductMarkH = 'DeductMarkH';

  static const String kLoginTime = 'LOGIN_TIME';

  Future<bool> setPart2MarkB(int deductMarkB) {
    return Preference.setInt(DeductMarkB, deductMarkB);
  }

  Future<int?> getCountDeductMarkB() async {
    return Preference.getInt(DeductMarkB, def: 0);
  }

  Future<bool> setPart2MarkC(int deductMarkC) {
    return Preference.setInt(DeductMarkC, deductMarkC);
  }

  Future<int?> getCountMarkC() async {
    return Preference.getInt(DeductMarkC, def: 0);
  }

  Future<bool> setPart2MarkD(int deductMarkD) {
    return Preference.setInt(DeductMarkD, deductMarkD);
  }

  Future<int?> getCountMarkD() async {
    return Preference.getInt(DeductMarkD, def: 0);
  }

  Future<bool> setPart2MarkE(int deductMarkE) {
    return Preference.setInt(DeductMarkE, deductMarkE);
  }

  Future<int?> getCountMarkE() async {
    return Preference.getInt(DeductMarkE, def: 0);
  }

  Future<bool> setPart2MarkF(int deductMarkF) {
    return Preference.setInt(DeductMarkF, deductMarkF);
  }

  Future<int?> getCountMarkF() async {
    return Preference.getInt(DeductMarkF, def: 0);
  }

  Future<bool> setPart2MarkG(int deductMarkG) {
    return Preference.setInt(DeductMarkG, deductMarkG);
  }

  Future<int?> getCountMarkG() async {
    return Preference.getInt(DeductMarkG, def: 0);
  }

  Future<bool> setPart2MarkH(int deductMarkH) {
    return Preference.setInt(DeductMarkH, deductMarkH);
  }

  Future<int?> getDeductMarkH() async {
    return Preference.getInt(DeductMarkH, def: 0);
  }

  Future<bool> setPart2MarkSessionB(int part2MarkB) {
    return Preference.setInt(part2MarkSessionB, part2MarkB);
  }

  Future<int?> getPart2MarkSessionB() async {
    return Preference.getInt(part2MarkSessionB, def: 0);
  }

  Future<bool> setPart2MarkSessionC(int part2MarkC) {
    return Preference.setInt(part2MarkSessionC, part2MarkC);
  }

  Future<int?> getPart2MarkSessionC() async {
    return Preference.getInt(part2MarkSessionC, def: 0);
  }

  Future<bool> setPart2MarkSessionD(int part2MarkD) {
    return Preference.setInt(part2MarkSessionD, part2MarkD);
  }

  Future<int?> getPart2MarkSessionD() async {
    return Preference.getInt(part2MarkSessionD, def: 0);
  }

  Future<bool> setPart2MarkSessionE(int part2MarkE) {
    return Preference.setInt(part2MarkSessionE, part2MarkE);
  }

  Future<int?> getPart2MarkSessionE() async {
    return Preference.getInt(part2MarkSessionE, def: 0);
  }

  Future<bool> setPart2MarkSessionF(int part2MarkF) {
    return Preference.setInt(part2MarkSessionF, part2MarkF);
  }

  Future<int?> getPart2MarkSessionF() async {
    return Preference.getInt(part2MarkSessionF, def: 0);
  }

  Future<bool> setPart2MarkSessionG(int part2MarkG) {
    return Preference.setInt(part2MarkSessionG, part2MarkG);
  }

  Future<int?> getPart2MarkSessionG() async {
    return Preference.getInt(part2MarkSessionG, def: 0);
  }

  Future<bool> setPart2MarkSessionBM(int part2MarkBM) {
    return Preference.setInt(part2MarkSessionB_M, part2MarkBM);
  }

  Future<int?> getPart2MarkSessionBM() async {
    return Preference.getInt(part2MarkSessionB_M, def: 0);
  }

  Future<bool> setPart2MarkCM(int part2MarkCM) {
    return Preference.setInt(part2MarkSessionC_M, part2MarkCM);
  }

  Future<int?> getPart2MarkCM() async {
    return Preference.getInt(part2MarkSessionC_M, def: 0);
  }

  Future<bool> setPart2MarkDM(int part2MarkDM) {
    return Preference.setInt(part2MarkSessionD_M, part2MarkDM);
  }

  Future<int?> getPart2MarkDM() async {
    return Preference.getInt(part2MarkSessionD_M, def: 0);
  }

  Future<bool> setPart2MarkEM(int part2MarkEM) {
    return Preference.setInt(part2MarkSessionE_M, part2MarkEM);
  }

  Future<int?> getPart2MarkEM() async {
    return Preference.getInt(part2MarkSessionE_M, def: 0);
  }

  Future<bool> setPart2MarkFM(int part2MarkFM) {
    return Preference.setInt(part2MarkSessionF_M, part2MarkFM);
  }

  Future<int?> getPart2MarkFM() async {
    return Preference.getInt(part2MarkSessionF_M, def: 0);
  }

  Future<bool> setPart2MarkGM(int part2MarkGM) {
    return Preference.setInt(part2MarkSessionG_M, part2MarkGM);
  }

  Future<int?> getPart2MarkGM() async {
    return Preference.getInt(part2MarkSessionG_M, def: 0);
  }

  Future<bool> setPart2MarkSessionHM(int part2MarkHM) {
    return Preference.setInt(part2MarkSessionH_M, part2MarkHM);
  }

  Future<int?> getPart2MarkHM() async {
    return Preference.getInt(part2MarkSessionH_M, def: 0);
  }

  //-------------------------------Part 3-----------------------------------------------

  static const String part3MarkSessionA = 'Part3MarkSessionA';
  static const String part3MarkSessionB = 'Part3MarkSessionB';
  static const String part3MarkSessionC = 'Part3MarkSessionC';
  static const String part3MarkSessionD = 'Part3MarkSessionD';
  static const String part3MarkSessionE = 'Part3MarkSessionE';
  static const String part3MarkSessionF = 'Part3MarkSessionF';
  static const String part3MarkSessionG = 'Part3MarkSessionG';
  static const String part3MarkSessionH = 'Part3MarkSessionH';
  static const String part3MarkSessionI = 'Part3MarkSessionI';
  static const String part3MarkSessionJ = 'Part3MarkSessionJ';

  static const String part3MarkA_M = 'part3MarkA_M';
  static const String part3MarkB_M = 'part3MarkB_M';
  static const String part3MarkC_M = 'part3MarkC_M';
  static const String part3MarkD_M = 'part3MarkD_M';
  static const String part3MarkE_M = 'part3MarkE_M';
  static const String part3MarkF_M = 'part3MarkF_M';
  static const String part3MarkG_M = 'part3MarkG_M';
  static const String part3MarkH_M = 'part3MarkH_M';
  static const String part3MarkI_M = 'part3MarkI_M';
  static const String part3MarkJ_M = 'part3MarkJ_M';

  static const String part3MarkA_N = 'NormalMarkA_N';
  static const String part3MarkB_N = 'NormalMarkB_N';
  static const String part3MarkC_N = 'NormalMarkC_N';
  static const String part3MarkD_N = 'NormalMarkD_N';
  static const String part3MarkE_N = 'NormalMarkE_N';
  static const String part3MarkF_N = 'NormalMarkF_N';
  static const String part3MarkG_N = 'NormalMarkG_N';
  static const String part3MarkH_N = 'NormalMarkH_N';
  static const String part3MarkI_N = 'NormalMarkI_N';
  static const String part3MarkJ_N = 'NormalMarkJ_N';

  Future<bool> setPart3MarkSessionA(int part3MarkA) {
    return Preference.setInt(part3MarkSessionA, part3MarkA);
  }

  Future<int?> getPart3MarkSessionA() async {
    return Preference.getInt(part3MarkSessionA, def: 0);
  }

  Future<bool> setPart3MarkSessionB(int part3MarkB) {
    return Preference.setInt(part3MarkSessionB, part3MarkB);
  }

  Future<int?> getPart3MarkSessionB() async {
    return Preference.getInt(part3MarkSessionB, def: 0);
  }

  Future<bool> setPart3MarkSessionC(int part3MarkC) {
    return Preference.setInt(part3MarkSessionC, part3MarkC);
  }

  Future<int?> getPart3MarkSessionC() async {
    return Preference.getInt(part3MarkSessionC, def: 0);
  }

  Future<bool> setPart3MarkSessionD(int part3MarkD) {
    return Preference.setInt(part3MarkSessionD, part3MarkD);
  }

  Future<int?> getPart3MarkSessionD() async {
    return Preference.getInt(part3MarkSessionD, def: 0);
  }

  Future<bool> setPart3MarkSessionE(int part3MarkE) {
    return Preference.setInt(part3MarkSessionE, part3MarkE);
  }

  Future<int?> getPart3MarkSessionE() async {
    return Preference.getInt(part3MarkSessionE, def: 0);
  }

  Future<bool> setPart3MarkSessionF(int part3MarkF) {
    return Preference.setInt(part3MarkSessionF, part3MarkF);
  }

  Future<int?> getPart3MarkSessionF() async {
    return Preference.getInt(part3MarkSessionF, def: 0);
  }

  Future<bool> setPart3MarkSessionG(int part3MarkG) {
    return Preference.setInt(part3MarkSessionG, part3MarkG);
  }

  Future<int?> getPart3MarkSessionG() async {
    return Preference.getInt(part3MarkSessionG, def: 0);
  }

  Future<bool> setPart3MarkSessionH(int part3MarkH) {
    return Preference.setInt(part3MarkSessionH, part3MarkH);
  }

  Future<int?> getPart3MarkSessionH() async {
    return Preference.getInt(part3MarkSessionH, def: 0);
  }

  Future<bool> setPart3MarkSessionI(int part3MarkI) {
    return Preference.setInt(part3MarkSessionI, part3MarkI);
  }

  Future<int?> getPart3MarkSessionI() async {
    return Preference.getInt(part3MarkSessionI, def: 0);
  }

  Future<bool> setPart3MarkSessionJ(int part3MarkJ) {
    return Preference.setInt(part3MarkSessionJ, part3MarkJ);
  }

  Future<int?> getPart3MarkSessionJ() async {
    return Preference.getInt(part3MarkSessionJ, def: 0);
  }

  Future<bool> setPart3MarkA(int markA) {
    return Preference.setInt(part3MarkA_N, markA);
  }

  Future<int?> getPart3MarkA() async {
    return Preference.getInt(part3MarkA_N, def: 0);
  }

  Future<bool> setPart3MarkB(int markB) {
    return Preference.setInt(part3MarkB_N, markB);
  }

  Future<int?> getPart3MarkB() async {
    return Preference.getInt(part3MarkB_N, def: 0);
  }

  Future<bool> setPart3MarkC(int markC) {
    return Preference.setInt(part3MarkC_N, markC);
  }

  Future<int?> getPart3MarkC() async {
    return Preference.getInt(part3MarkC_N, def: 0);
  }

  Future<bool> setPart3MarkD(int markD) {
    return Preference.setInt(part3MarkD_N, markD);
  }

  Future<int?> getPart3MarkD() async {
    return Preference.getInt(part3MarkD_N, def: 0);
  }

  Future<bool> setPart3MarkE(int markE) {
    return Preference.setInt(part3MarkE_N, markE);
  }

  Future<int?> getPart3MarkE() async {
    return Preference.getInt(part3MarkE_N, def: 0);
  }

  Future<bool> setPart3MarkF(int markF) {
    return Preference.setInt(part3MarkF_N, markF);
  }

  Future<int?> getPart3MarkF() async {
    return Preference.getInt(part3MarkF_N, def: 0);
  }

  Future<bool> setPart3MarkG(int markG) {
    return Preference.setInt(part3MarkG_N, markG);
  }

  Future<int?> getPart3MarkG() async {
    return Preference.getInt(part3MarkG_N, def: 0);
  }

  Future<bool> setPart3MarkH(int markH) {
    return Preference.setInt(part3MarkH_N, markH);
  }

  Future<int?> getPart3MarkH() async {
    return Preference.getInt(part3MarkH_N, def: 0);
  }

  Future<bool> setPart3MarkI(int markI) {
    return Preference.setInt(part3MarkI_N, markI);
  }

  Future<int?> getPart3MarkI() async {
    return Preference.getInt(part3MarkI_N, def: 0);
  }

  Future<bool> setPart3MarkJ(int markJ) {
    return Preference.setInt(part3MarkJ_N, markJ);
  }

  Future<int?> getPart3MarkJ() async {
    return Preference.getInt(part3MarkJ_N, def: 0);
  }

  Future<bool> setPart3MarkAM(int part3MarkAM) {
    return Preference.setInt(part3MarkA_M, part3MarkAM);
  }

  Future<int?> getPart3MarkAM() async {
    return Preference.getInt(part3MarkA_M, def: 0);
  }

  Future<bool> setPart3MarkBM(int part3MarkBM) {
    return Preference.setInt(part3MarkB_M, part3MarkBM);
  }

  Future<int?> getPart3MarkBM() async {
    return Preference.getInt(part3MarkB_M, def: 0);
  }

  Future<bool> setPart3MarkCM(int part3MarkCM) {
    return Preference.setInt(part3MarkC_M, part3MarkCM);
  }

  Future<int?> getPart3MarkCM() async {
    return Preference.getInt(part3MarkC_M, def: 0);
  }

  Future<bool> setPart3MarkDM(int part3MarkDM) {
    return Preference.setInt(part3MarkD_M, part3MarkDM);
  }

  Future<int?> getPart3MarkDM() async {
    return Preference.getInt(part3MarkD_M, def: 0);
  }

  Future<bool> setPart3MarkEM(int part3MarkEM) {
    return Preference.setInt(part3MarkE_M, part3MarkEM);
  }

  Future<int?> getPart3MarkEM() async {
    return Preference.getInt(part3MarkE_M, def: 0);
  }

  Future<bool> setPart3MarkFM(int part3MarkFM) {
    return Preference.setInt(part3MarkF_M, part3MarkFM);
  }

  Future<int?> getPart3MarkFM() async {
    return Preference.getInt(part3MarkF_M, def: 0);
  }

  Future<bool> setPart3MarkGM(int part3MarkGM) {
    return Preference.setInt(part3MarkG_M, part3MarkGM);
  }

  Future<int?> getPart3MarkGM() async {
    return Preference.getInt(part3MarkG_M, def: 0);
  }

  Future<bool> setPart3MarkHM(int part3MarkHM) {
    return Preference.setInt(part3MarkH_M, part3MarkHM);
  }

  Future<int?> getPart3MarkHM() async {
    return Preference.getInt(part3MarkH_M, def: 0);
  }

  Future<bool> setPart3MarkIM(int part3MarkIM) {
    return Preference.setInt(part3MarkI_M, part3MarkIM);
  }

  Future<int?> getPart3MarkIM() async {
    return Preference.getInt(part3MarkI_M, def: 0);
  }

  Future<bool> setPart3MarkJM(int part3MarkJM) {
    return Preference.setInt(part3MarkJ_M, part3MarkJM);
  }

  Future<int?> getPart3MarkJM() async {
    return Preference.getInt(part3MarkJ_M, def: 0);
  }

  //------------------------------Part 3 end---------------------------------------------

  Future<bool> saveNickName(String nickName) {
    return Preference.setString(kNickName, nickName);
  }

  Future<String?> getNickName() async {
    return Preference.getString(kNickName, def: '');
  }

  Future<bool> saveRace(String race) {
    return Preference.setString(kRace, race);
  }

  Future<String?> getRace() async {
    return Preference.getString(kRace, def: '');
  }

  Future<bool> saveBirthDate(String birthDate) {
    return Preference.setString(kBirthDate, birthDate);
  }

  Future<String?> getBirthDate() async {
    return Preference.getString(kBirthDate, def: '');
  }

  Future<bool> saveLocale(String locale) {
    return Preference.setString(kLocale, locale);
  }

  Future<String?> getLocale() async {
    return Preference.getString(kLocale, def: 'ms');
  }

  Future<bool> saveWsUrl(String wsUrl) {
    return Preference.setString(kWsUrl, wsUrl);
  }

  Future<String?> getWsUrl() async {
    return Preference.getString(kWsUrl, def: '');
  }

  Future<String?> getCaUid() async {
    return Preference.getString(kCaUid, def: 'epandu_prod');
  }

  Future<bool> saveCaUid(String caUid) async {
    return Preference.setString(kCaUid, caUid);
  }

  Future<String?> getCaPwd() async {
    return Preference.getString(kCaPwd, def: 'vWh7SmgDRJ%TW4xa');
  }

  Future<bool> saveCaPwd(String caPwd) async {
    return Preference.setString(kCaPwd, caPwd);
  }

  Future<String?> getCaPwdEncode() async {
    return Preference.getString(kCaPwdEncode, def: 'vWh7SmgDRJ%25TW4xa');
  }

  Future<bool> saveCaPwdEncode(String caPwdEncode) async {
    return Preference.setString(kCaPwdEncode, caPwdEncode);
  }

  Future<bool> saveUserId(String userId) {
    return Preference.setString(kUserId, userId);
  }

  Future<String?> getUserId() async {
    return Preference.getString(kUserId, def: '');
  }

  Future<bool> saveName(String username) {
    return Preference.setString(kUsername, username);
  }

  Future<String?> getName() async {
    return Preference.getString(kUsername, def: '');
  }

  Future<bool> saveCountryCode(String countryCode) {
    return Preference.setString(kCountryCode, countryCode);
  }

  Future<String?> getCountryCode() async {
    return Preference.getString(kCountryCode, def: '');
  }

  Future<bool> saveUserPhone(String userPhone) {
    return Preference.setString(kUserPhone, userPhone);
  }

  Future<String?> getUserPhone() async {
    return Preference.getString(kUserPhone, def: '');
  }

  Future<bool> saveEmail(String email) {
    return Preference.setString(kEmail, email);
  }

  Future<String?> getEmail() async {
    return Preference.getString(kEmail, def: '');
  }

  Future<bool> saveDiCode(String diCode) async {
    return Preference.setString(kDiCode, diCode);
  }

  Future<String?> getDiCode() async {
    return Preference.getString(kDiCode, def: '');
  }

  Future<bool> saveSessionId(String sessionId) async {
    return Preference.setString(kSessionId, sessionId);
  }

  Future<String?> getSessionId() async {
    return Preference.getString(kSessionId, def: '');
  }

  Future<bool> saveNationality(String nationality) async {
    return Preference.setString(kNationality, nationality);
  }

  Future<String?> getNationality() async {
    return Preference.getString(kNationality, def: '');
  }

  Future<bool> saveGender(String gender) async {
    return Preference.setString(kGender, gender);
  }

  Future<String?> getGender() async {
    return Preference.getString(kGender, def: '');
  }

  Future<bool> saveStudentIc(String icNo) async {
    return Preference.setString(kStudentIc, icNo);
  }

  Future<String?> getStudentIc() async {
    return Preference.getString(kStudentIc, def: '');
  }

  Future<bool> saveAddress(String address) async {
    return Preference.setString(kAddress, address);
  }

  Future<String?> getAddress() async {
    return Preference.getString(kAddress, def: '');
  }

  Future<bool> saveCountry(String country) async {
    return Preference.setString(kCountry, country);
  }

  Future<String?> getCountry() async {
    return Preference.getString(kCountry, def: '');
  }

  Future<bool> saveState(String state) async {
    return Preference.setString(kState, state);
  }

  Future<String?> getState() async {
    return Preference.getString(kState, def: '');
  }

  Future<bool> savePostCode(String postCode) async {
    return Preference.setString(kPostCode, postCode);
  }

  Future<String?> getPostCode() async {
    return Preference.getString(kPostCode, def: '');
  }

  Future<bool> saveInstituteLogo(String instituteLogo) async {
    return Preference.setString(kInstituteLogo, instituteLogo);
  }

  Future<String?> getInstituteLogo() async {
    return Preference.getString(kInstituteLogo, def: '');
  }

  Future<bool> saveEnrolledGroupId(String enrolledGroupId) async {
    return Preference.setString(kEnrolledGroupId, enrolledGroupId);
  }

  Future<String?> getEnrolledGroupId() async {
    return Preference.getString(kEnrolledGroupId, def: '');
  }

  Future<bool> saveBlacklisted(String blacklisted) async {
    return Preference.setString(kBlacklisted, blacklisted);
  }

  Future<String?> getBlacklisted() async {
    return Preference.getString(kBlacklisted, def: '');
  }

  Future<bool> saveUserLatitude(String latitude) async {
    return Preference.setString(kUserLatitude, latitude);
  }

  Future<String?> getUserLatitude() async {
    return Preference.getString(kUserLatitude, def: '');
  }

  Future<bool> saveUserLongitude(String longitude) async {
    return Preference.setString(kUserLongitude, longitude);
  }

  Future<String?> getUserLongitude() async {
    return Preference.getString(kUserLongitude, def: '');
  }

  Future<String?> getAppVersion() async {
    return Preference.getString(kAppVersion, def: '');
  }

  Future<bool> saveAppVersion(String appVersion) async {
    return Preference.setString(kAppVersion, appVersion);
  }

  Future<String?> getMerchantDbCode() async {
    return Preference.getString(kMerchantDbCode, def: '');
  }

  Future<bool> saveMerchantDbCode(String dbCode) async {
    return Preference.setString(kMerchantDbCode, dbCode);
  }

  Future<String?> getProfilePic() async {
    return Preference.getString(kProfilePic, def: '');
  }

  Future<bool> saveProfilePic(String profilePic) async {
    return Preference.setString(kProfilePic, profilePic);
  }

  Future<String?> getLoginDeviceId() async {
    return Preference.getString(kLoginDeviceId, def: '');
  }

  Future<bool> saveLoginDeviceId(String deviceId) async {
    return Preference.setString(kLoginDeviceId, deviceId);
  }

  Future<String?> getCarNo() async {
    return Preference.getString(kCarNo, def: '');
  }

  Future<bool> saveCarNo(String carNo) async {
    return Preference.setString(kCarNo, carNo);
  }

  Future<String?> getPlateNo() async {
    return Preference.getString(kPlateNo, def: '');
  }

  Future<bool> savePlateNo(String plateNo) async {
    return Preference.setString(kPlateNo, plateNo);
  }

  Future<String?> getMsgDoc() async {
    return Preference.getString(kMsgDoc, def: '');
  }

  Future<bool> saveMsgDoc(String msgDoc) async {
    return Preference.setString(kMsgDoc, msgDoc);
  }

  Future<String?> getMsgRef() async {
    return Preference.getString(kMsgRef, def: '');
  }

  Future<bool> saveMsgRef(String msgRef) async {
    return Preference.setString(kMsgRef, msgRef);
  }

  Future<String?> getType() async {
    return Preference.getString(kType, def: '');
  }

  Future<bool> saveType(String msgRef) async {
    return Preference.setString(kType, msgRef);
  }

  Future<bool> getMySikapVehicle() async {
    return Preference.getBool(KMysikapVehicle, def: false);
  }

  Future<bool> saveMySikapVehicle(bool check) async {
    return Preference.setBool(KMysikapVehicle, check);
  }

  Future<String?> getMySikapId() async {
    return Preference.getString(kMySikapId, def: '');
  }

  Future<bool> saveMySikapId(String mySikapId) async {
    return Preference.setString(kMySikapId, mySikapId);
  }

  Future<String?> getPermitCode() async {
    return Preference.getString(kPermitCode, def: '');
  }

  Future<bool> savePermitCode(String permitCode) async {
    return Preference.setString(kPermitCode, permitCode);
  }

  Future<bool> saveLoginTime(String loginTime) async {
    return Preference.setString(kLoginTime, loginTime);
  }

  Future<String?> getLoginTime() async {
    return Preference.getString(kLoginTime, def: '');
  }

  Future<void> reset() async {
    // await Preference.removeAll();
    await Preference.remove(kWsUrl);
    // await Preference.remove(kCaUid);
    // await Preference.remove(kCaPwd);
    // await Preference.remove(kCaPwdEncode);
    // await Preference.remove(kServerType);
    await Preference.remove(kUserId);
    await Preference.remove(kUsername);
    await Preference.remove(kCountryCode);
    await Preference.remove(kUserPhone);
    await Preference.remove(kEmail);
    await Preference.remove(kDiCode);
    await Preference.remove(kSessionId);
    await Preference.remove(kNationality);
    await Preference.remove(kGender);
    await Preference.remove(kAddress);
    await Preference.remove(kStudentIc);
    await Preference.remove(kState);
    await Preference.remove(kCountry);
    await Preference.remove(kPostCode);
    await Preference.remove(kInstituteLogo);
    await Preference.remove(kEnrolledGroupId);
    await Preference.remove(kBlacklisted);
    await Preference.remove(kUserLatitude);
    await Preference.remove(kUserLongitude);
    // await Preference.remove(kAppVersion);
    await Preference.remove(kBirthDate);
    await Preference.remove(kNickName);
    await Preference.remove(kRace);
    await Preference.remove(kMerchantDbCode);
    await Preference.remove(kProfilePic);
    await Preference.remove(kCarNo);
    await Preference.remove(kPlateNo);
    await Preference.remove(kMsgDoc);
    await Preference.remove(kMsgRef);
    await Preference.remove(kType);
    await Preference.remove(KMysikapVehicle);
    await Preference.remove(kMySikapId);
    await Preference.remove(kLoginTime);
  }
}
