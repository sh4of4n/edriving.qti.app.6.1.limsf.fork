class RuleResponse {
  List<Rule>? rule;

  RuleResponse({this.rule});

  RuleResponse.fromJson(Map<String, dynamic> json) {
    if (json['Rule'] != null) {
      rule = <Rule>[];
      json['Rule'].forEach((v) {
        rule!.add(Rule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rule != null) {
      data['Rule'] = rule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rule {
  String? iD;
  String? ruleCode;
  String? elementCode;
  String? elementId;
  String? seqNo;
  String? mandatory;
  String? ruleDesc;
  String? createUser;
  String? createDate;
  String? editUser;
  String? editDate;
  String? transtamp;
  String? lastupload;
  String? compCode;
  String? branchCode;
  String? deleted;
  bool? isCheck = true;

  Rule(
      {this.iD,
      this.ruleCode,
      this.elementCode,
      this.elementId,
      this.seqNo,
      this.mandatory,
      this.ruleDesc,
      this.createUser,
      this.createDate,
      this.editUser,
      this.editDate,
      this.transtamp,
      this.lastupload,
      this.compCode,
      this.branchCode,
      this.deleted,
      this.isCheck});

  Rule.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    ruleCode = json['rule_code'];
    elementCode = json['element_code'];
    elementId = json['element_id'];
    seqNo = json['seq_no'];
    mandatory = json['mandatory'];
    ruleDesc = json['rule_desc'];
    createUser = json['create_user'];
    createDate = json['create_date'];
    editUser = json['edit_user'];
    editDate = json['edit_date'];
    transtamp = json['transtamp'];
    lastupload = json['lastupload'];
    compCode = json['comp_code'];
    branchCode = json['branch_code'];
    deleted = json['deleted'];
    isCheck = json['is_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['rule_code'] = ruleCode;
    data['element_code'] = elementCode;
    data['element_id'] = elementId;
    data['seq_no'] = seqNo;
    data['mandatory'] = mandatory;
    data['rule_desc'] = ruleDesc;
    data['create_user'] = createUser;
    data['create_date'] = createDate;
    data['edit_user'] = editUser;
    data['edit_date'] = editDate;
    data['transtamp'] = transtamp;
    data['lastupload'] = lastupload;
    data['comp_code'] = compCode;
    data['branch_code'] = branchCode;
    data['deleted'] = deleted;
    data['is_check'] = isCheck;
    return data;
  }
}

class ResultRequest {
  String? wsCodeCrypt;
  String? caUid;
  String? caPwd;
  String? userId;
  String? permitCode;

  ResultRequest(
      {this.wsCodeCrypt, this.caUid, this.caPwd, this.userId, this.permitCode});

  ResultRequest.fromJson(Map<String, dynamic> json) {
    wsCodeCrypt = json['wsCodeCrypt'];
    caUid = json['caUid'];
    caPwd = json['caPwd'];
    userId = json['userId'];
    permitCode = json['permitCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wsCodeCrypt'] = wsCodeCrypt;
    data['caUid'] = caUid;
    data['caPwd'] = caPwd;
    data['userId'] = userId;
    data['permitCode'] = permitCode;
    return data;
  }
}

class OwnerIdCategoryResponse {
  List<OwnerIdCategoryList>? ownerIdCategoryList;

  OwnerIdCategoryResponse({this.ownerIdCategoryList});

  OwnerIdCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['OwnerIdCategoryList'] != null) {
      ownerIdCategoryList = <OwnerIdCategoryList>[];
      json['OwnerIdCategoryList'].forEach((v) {
        ownerIdCategoryList!.add(OwnerIdCategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ownerIdCategoryList != null) {
      data['OwnerIdCategoryList'] =
          ownerIdCategoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OwnerIdCategoryList {
  String? ownerCat;
  String? ownerCatDesc;

  OwnerIdCategoryList({this.ownerCat, this.ownerCatDesc});

  OwnerIdCategoryList.fromJson(Map<String, dynamic> json) {
    ownerCat = json['owner_cat'];
    ownerCatDesc = json['owner_cat_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner_cat'] = ownerCat;
    data['owner_cat_desc'] = ownerCatDesc;
    return data;
  }
}

class MySikapVehicleListResponse {
  List<MysikapVehicle>? mysikapVehicle;

  MySikapVehicleListResponse({this.mysikapVehicle});

  MySikapVehicleListResponse.fromJson(Map<String, dynamic> json) {
    if (json['MysikapVehicle'] != null) {
      mysikapVehicle = <MysikapVehicle>[];
      json['MysikapVehicle'].forEach((v) {
        mysikapVehicle!.add(MysikapVehicle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mysikapVehicle != null) {
      data['MysikapVehicle'] = mysikapVehicle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MysikapVehicle {
  String? iD;
  String? plateNo;
  String? groupId;
  String? createUser;
  String? createDate;
  String? editUser;
  String? editDate;
  String? transtamp;
  String? lastupload;
  String? compCode;
  String? branchCode;
  String? deleted;
  String? checked;
  String? carNo;

  MysikapVehicle(
      {this.iD,
      this.plateNo,
      this.groupId,
      this.createUser,
      this.createDate,
      this.editUser,
      this.editDate,
      this.transtamp,
      this.lastupload,
      this.compCode,
      this.branchCode,
      this.deleted,
      this.checked,
      this.carNo});

  MysikapVehicle.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    plateNo = json['plate_no'];
    groupId = json['group_id'];
    createUser = json['create_user'];
    createDate = json['create_date'];
    editUser = json['edit_user'];
    editDate = json['edit_date'];
    transtamp = json['transtamp'];
    lastupload = json['lastupload'];
    compCode = json['comp_code'];
    branchCode = json['branch_code'];
    deleted = json['deleted'];
    checked = json['checked'];
    carNo = json['car_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['plate_no'] = plateNo;
    data['group_id'] = groupId;
    data['create_user'] = createUser;
    data['create_date'] = createDate;
    data['edit_user'] = editUser;
    data['edit_date'] = editDate;
    data['transtamp'] = transtamp;
    data['lastupload'] = lastupload;
    data['comp_code'] = compCode;
    data['branch_code'] = branchCode;
    data['deleted'] = deleted;
    data['checked'] = checked;
    data['car_no'] = carNo;
    return data;
  }
}

class QtiUjianLogoutRequest {
  String? wsCodeCrypt;
  String? caUid;
  String? caPwd;
  String? appId;
  String? appVersion;
  String? mySikapId;
  String? permitCode;

  QtiUjianLogoutRequest(
      {this.wsCodeCrypt,
      this.caUid,
      this.caPwd,
      this.appId,
      this.appVersion,
      this.mySikapId,
      this.permitCode});

  QtiUjianLogoutRequest.fromJson(Map<String, dynamic> json) {
    wsCodeCrypt = json['wsCodeCrypt'];
    caUid = json['caUid'];
    caPwd = json['caPwd'];
    appId = json['appId'];
    appVersion = json['appVersion'];
    mySikapId = json['mySikapId'];
    permitCode = json['permitCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wsCodeCrypt'] = wsCodeCrypt;
    data['caUid'] = caUid;
    data['caPwd'] = caPwd;
    data['appId'] = appId;
    data['appVersion'] = appVersion;
    data['mySikapId'] = mySikapId;
    data['permitCode'] = permitCode;
    return data;
  }
}

class Result2 {
  String? userId;
  String? mysikapId;
  String? firstName;
  String? lastName;
  String? roleCode;
  String? roleDesc;

  Result2(
      {this.userId,
      this.mysikapId,
      this.firstName,
      this.lastName,
      this.roleCode,
      this.roleDesc});

  Result2.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mysikapId = json['mysikap_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    roleCode = json['role_code'];
    roleDesc = json['role_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['mysikap_id'] = mysikapId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['role_code'] = roleCode;
    data['role_desc'] = roleDesc;
    return data;
  }
}

class GetUserIdByMySikapIdResult {
  List<Result2>? result;

  GetUserIdByMySikapIdResult({this.result});

  GetUserIdByMySikapIdResult.fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = <Result2>[];
      json['Result'].forEach((v) {
        result!.add(Result2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['Result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckUserLoginStatusResponse {
  List<ResultCheckUserLoginStatus>? result;

  CheckUserLoginStatusResponse({this.result});

  CheckUserLoginStatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['Result'] != null) {
      result = <ResultCheckUserLoginStatus>[];
      json['Result'].forEach((v) {
        result!.add(ResultCheckUserLoginStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['Result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultCheckUserLoginStatus {
  String? result;
  String? userId;

  ResultCheckUserLoginStatus({this.result, this.userId});

  ResultCheckUserLoginStatus.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['user_id'] = userId;
    return data;
  }
}

class DecryptQrcodeResponse {
  List<Table1>? table1;
  DecryptQrcodeResponse({this.table1});
  DecryptQrcodeResponse.fromJson(Map<String, dynamic> json) {
    if (json['Table1'] != null) {
      table1 = <Table1>[];
      json['Table1'].forEach((v) {
        table1!.add(Table1.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (table1 != null) {
      data['Table1'] = table1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table1 {
  String? groupId;
  String? testCode;
  String? nricNo;
  String? merchantNo;
  String? carNo;
  String? plateNo;
  String? category;
  Table1(
      {this.groupId,
      this.testCode,
      this.nricNo,
      this.merchantNo,
      this.carNo,
      this.plateNo,
      this.category});
  Table1.fromJson(Map<String, dynamic> json) {
    groupId = json['group_id'];
    testCode = json['test_code'];
    nricNo = json['nric_no'];
    merchantNo = json['merchant_no'];
    carNo = json['car_no'];
    plateNo = json['plate_no'];
    category = json['owner_cat'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['group_id'] = groupId;
    data['test_code'] = testCode;
    data['nric_no'] = nricNo;
    data['merchant_no'] = merchantNo;
    data['car_no'] = carNo;
    data['plate_no'] = plateNo;
    data['owner_cat'] = category;
    return data;
  }
}
