class GetCheckListResponse {
  List<CheckList>? checkList;

  GetCheckListResponse({this.checkList});

  GetCheckListResponse.fromJson(Map<String, dynamic> json) {
    if (json['CheckList'] != null) {
      checkList = <CheckList>[];
      json['CheckList'].forEach((v) {
        checkList!.add(new CheckList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checkList != null) {
      data['CheckList'] = this.checkList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckList {
  String? iD;
  String? checkType;
  String? checkCode;
  String? mandatory;
  String? checkDesc;
  String? createUser;
  String? createDate;
  String? editUser;
  String? editDate;
  String? transtamp;
  String? lastupload;
  String? compCode;
  String? branchCode;
  String? deleted;
  bool? isCheck;

  CheckList(
      {this.iD,
      this.checkType,
      this.checkCode,
      this.mandatory,
      this.checkDesc,
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

  CheckList.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    checkType = json['check_type'];
    checkCode = json['check_code'];
    mandatory = json['mandatory'];
    checkDesc = json['check_desc'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['check_type'] = this.checkType;
    data['check_code'] = this.checkCode;
    data['mandatory'] = this.mandatory;
    data['check_desc'] = this.checkDesc;
    data['create_user'] = this.createUser;
    data['create_date'] = this.createDate;
    data['edit_user'] = this.editUser;
    data['edit_date'] = this.editDate;
    data['transtamp'] = this.transtamp;
    data['lastupload'] = this.lastupload;
    data['comp_code'] = this.compCode;
    data['branch_code'] = this.branchCode;
    data['deleted'] = this.deleted;
    data['is_check'] = this.isCheck;
    return data;
  }
}

class GetCheckListRequest {
  String? wsCodeCrypt;
  String? caUid;
  String? caPwd;
  String? diCode;
  String? userId;
  String? plateNo;
  String? checkListJson;

  GetCheckListRequest(
      {this.wsCodeCrypt,
      this.caUid,
      this.caPwd,
      this.diCode,
      this.userId,
      this.plateNo,
      this.checkListJson});

  GetCheckListRequest.fromJson(Map<String, dynamic> json) {
    wsCodeCrypt = json['wsCodeCrypt'];
    caUid = json['caUid'];
    caPwd = json['caPwd'];
    diCode = json['diCode'];
    userId = json['userId'];
    plateNo = json['plateNo'];
    checkListJson = json['checkListJson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wsCodeCrypt'] = this.wsCodeCrypt;
    data['caUid'] = this.caUid;
    data['caPwd'] = this.caPwd;
    data['diCode'] = this.diCode;
    data['userId'] = this.userId;
    data['plateNo'] = this.plateNo;
    data['checkListJson'] = this.checkListJson;
    return data;
  }
}

class JpjCheckListRequest {
  List<JpjCheckListJson>? jpjCheckList;

  JpjCheckListRequest({this.jpjCheckList});

  JpjCheckListRequest.fromJson(Map<String, dynamic> json) {
    if (json['JpjCheckList'] != null) {
      jpjCheckList = <JpjCheckListJson>[];
      json['JpjCheckList'].forEach((v) {
        jpjCheckList!.add(new JpjCheckListJson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jpjCheckList != null) {
      data['JpjCheckList'] = this.jpjCheckList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JpjCheckListJson {
  String? checkCode;
  String? status;
  String? remark;

  JpjCheckListJson({this.checkCode, this.status, this.remark});

  JpjCheckListJson.fromJson(Map<String, dynamic> json) {
    checkCode = json['check_code'];
    status = json['status'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_code'] = this.checkCode;
    data['status'] = this.status;
    data['remark'] = this.remark;
    return data;
  }
}

class JpjCheckListResponse {
  List<JpjCheckList>? jpjCheckList;

  JpjCheckListResponse({this.jpjCheckList});

  JpjCheckListResponse.fromJson(Map<String, dynamic> json) {
    if (json['JpjCheckList'] != null) {
      jpjCheckList = <JpjCheckList>[];
      json['JpjCheckList'].forEach((v) {
        jpjCheckList!.add(new JpjCheckList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jpjCheckList != null) {
      data['JpjCheckList'] = this.jpjCheckList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JpjCheckList {
  String? iD;
  String? checkDate;
  String? checkType;
  String? plateNo;
  String? checkCode;
  String? mandatory;
  String? checkDesc;
  String? status;
  String? remark;
  String? createUser;
  String? createDate;
  String? editUser;
  String? editDate;
  String? transtamp;
  String? lastupload;
  String? compCode;
  String? branchCode;
  String? deleted;

  JpjCheckList(
      {this.iD,
      this.checkDate,
      this.checkType,
      this.plateNo,
      this.checkCode,
      this.mandatory,
      this.checkDesc,
      this.status,
      this.remark,
      this.createUser,
      this.createDate,
      this.editUser,
      this.editDate,
      this.transtamp,
      this.lastupload,
      this.compCode,
      this.branchCode,
      this.deleted});

  JpjCheckList.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    checkDate = json['check_date'];
    checkType = json['check_type'];
    plateNo = json['plate_no'];
    checkCode = json['check_code'];
    mandatory = json['mandatory'];
    checkDesc = json['check_desc'];
    status = json['status'];
    remark = json['remark'];
    createUser = json['create_user'];
    createDate = json['create_date'];
    editUser = json['edit_user'];
    editDate = json['edit_date'];
    transtamp = json['transtamp'];
    lastupload = json['lastupload'];
    compCode = json['comp_code'];
    branchCode = json['branch_code'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['check_date'] = this.checkDate;
    data['check_type'] = this.checkType;
    data['plate_no'] = this.plateNo;
    data['check_code'] = this.checkCode;
    data['mandatory'] = this.mandatory;
    data['check_desc'] = this.checkDesc;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['create_user'] = this.createUser;
    data['create_date'] = this.createDate;
    data['edit_user'] = this.editUser;
    data['edit_date'] = this.editDate;
    data['transtamp'] = this.transtamp;
    data['lastupload'] = this.lastupload;
    data['comp_code'] = this.compCode;
    data['branch_code'] = this.branchCode;
    data['deleted'] = this.deleted;
    return data;
  }
}
