class AddLearnResult {
  String? wsCodeCrypt;
  String? caUid;
  String? caPwd;
  String? appId;
  String? userId;
  String? diCode;
  String? icNo;
  String? groupId;
  String? courseCode;
  String? part;
  String? dateTimeFromString;
  String? dateTimeToString;
  String? remark;
  String? detlInJson;

  AddLearnResult({
    this.wsCodeCrypt,
    this.caUid,
    this.caPwd,
    this.appId,
    this.userId,
    this.diCode,
    this.icNo,
    this.groupId,
    this.courseCode,
    this.part,
    this.dateTimeFromString,
    this.dateTimeToString,
    this.remark,
    this.detlInJson,
  });

  AddLearnResult.fromJson(Map<String, dynamic> json) {
    wsCodeCrypt = json['wsCodeCrypt'];
    caUid = json['caUid'];
    caPwd = json['caPwd'];
    appId = json['appId'];
    userId = json['userId'];
    diCode = json['diCode'];
    icNo = json['icNo'];
    groupId = json['groupId'];
    courseCode = json['courseCode'];
    part = json['part'];
    dateTimeFromString = json['dateTimeFromString'];
    dateTimeToString = json['dateTimeToString'];
    remark = json['remark'];
    detlInJson = json['detlInJson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wsCodeCrypt'] = wsCodeCrypt;
    data['caUid'] = caUid;
    data['caPwd'] = caPwd;
    data['userId'] = userId;
    data['appId'] = appId;
    data['diCode'] = diCode;
    data['icNo'] = icNo;
    data['groupId'] = groupId;
    data['courseCode'] = courseCode;
    data['part'] = part;
    data['dateTimeFromString'] = dateTimeFromString;
    data['dateTimeToString'] = dateTimeToString;
    data['remark'] = remark;
    data['detlInJson'] = detlInJson;
    return data;
  }
}

class DetlInJson {
  List<DetailInJson>? learnResultDetl;

  DetlInJson({this.learnResultDetl});

  DetlInJson.fromJson(Map<String, dynamic> json) {
    if (json['LearnResultDetl'] != null) {
      learnResultDetl = List<DetailInJson>.empty(growable: true);
      json['LearnResultDetl'].forEach((v) {
        learnResultDetl!.add(DetailInJson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (learnResultDetl != null) {
      data['LearnResultDetl'] =
          learnResultDetl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailInJson {
  String? ruleCode;
  String? ruleGrade;
  String? remark;

  DetailInJson({this.ruleCode, this.ruleGrade, this.remark});

  DetailInJson.fromJson(Map<String, dynamic> json) {
    ruleCode = json['ruleCode'];
    ruleGrade = json['ruleGrade'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, String?>{};
    data['ruleCode'] = ruleCode;
    data['ruleGrade'] = ruleGrade;
    data['remark'] = remark;
    return data;
  }
}

class EkppTag {
  String ruleCode;
  String ruleGrade;
  String remark;

  EkppTag(this.ruleCode, this.ruleGrade, this.remark);

  Map toJson() => {
        'ruleCode': ruleCode,
        'ruleGrade': ruleGrade,
        'remark': remark,
      };
}

class EkppTagReturn {
  List<EkppTag>? tags;

  EkppTagReturn([this.tags]);

  Map toJson() {
    List<Map>? tags =
        this.tags != null ? this.tags!.map((i) => i.toJson()).toList() : null;

    return {'LearnResultDetl': tags};
  }
}
