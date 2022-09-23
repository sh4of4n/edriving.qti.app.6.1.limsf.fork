import 'package:flutter/material.dart';

class LanguageModel extends ChangeNotifier {
  String? language;

  void selectedLanguage(String lang) {
    language = '($lang)';

    notifyListeners();
  }
}

class CallStatusModel extends ChangeNotifier {
  bool status = false;

  void callStatus(bool status) {
    this.status = status;

    notifyListeners();
  }
}

class HomeLoadingModel extends ChangeNotifier {
  bool isLoading = false;

  void loadingStatus(bool isLoading) {
    this.isLoading = isLoading;

    notifyListeners();
  }
}

class JrSessionModel extends ChangeNotifier {
  int rpk1 = 0,
      rpk2 = 0,
      rpk3 = 0,
      rpk4 = 0,
      rpk5 = 0,
      rpk6 = 0,
      rpk7 = 0,
      rpk8 = 0,
      rpk9 = 0,
      rpk10 = 0,
      rpk11 = 0,
      rpk12 = 0,
      rpk13 = 0,
      rpk14 = 0,
      rpk15 = 0,
      rpk16 = 0,
      rpk17 = 0,
      rpk18 = 0,
      rpk19 = 0,
      rpk20 = 0,
      rpk21 = 0,
      rpk22 = 0,
      rpk23 = 0,
      rpk24 = 0;

  int a1 = 0,
      a2 = 0,
      a3 = 0,
      a4 = 0,
      a5 = 0,
      a6 = 0,
      a7 = 0,
      a8 = 0,
      a9 = 0,
      a10 = 0,
      a11 = 0,
      a12 = 0,
      a13 = 0,
      a14 = 0,
      a15 = 0,
      a16 = 0,
      a17 = 0,
      a18 = 0,
      a19 = 0,
      a20 = 0;

  int b1 = 0,
      b2 = 0,
      b3 = 0,
      b4 = 0,
      b5 = 0,
      b6 = 0,
      b7 = 0,
      b8 = 0,
      b9 = 0,
      b10 = 0;

  int c1 = 0,
      c2 = 0,
      c3 = 0,
      c4 = 0,
      c5 = 0,
      c6 = 0,
      c7 = 0,
      c8 = 0,
      c9 = 0,
      c10 = 0,
      c11 = 0,
      c12 = 0,
      c13 = 0,
      c14 = 0,
      c15 = 0,
      c16 = 0,
      c17 = 0,
      c18 = 0;

  int d1 = 0,
      d2 = 0,
      d3 = 0,
      d4 = 0,
      d5 = 0,
      d6 = 0,
      d7 = 0,
      d8 = 0,
      d9 = 0,
      d10 = 0,
      d11 = 0,
      d12 = 0,
      d13 = 0,
      d14 = 0,
      d15 = 0,
      d16 = 0,
      d17 = 0,
      d18 = 0,
      d19 = 0,
      d20 = 0;

  int e1 = 0,
      e2 = 0,
      e3 = 0,
      e4 = 0,
      e5 = 0,
      e6 = 0,
      e7 = 0,
      e8 = 0,
      e9 = 0,
      e10 = 0,
      e11 = 0,
      e12 = 0,
      e13 = 0,
      e14 = 0;

  int f1 = 0,
      f2 = 0,
      f3 = 0,
      f4 = 0,
      f5 = 0,
      f6 = 0,
      f7 = 0,
      f8 = 0,
      f9 = 0,
      f10 = 0;

  int g1 = 0,
      g2 = 0,
      g3 = 0,
      g4 = 0,
      g5 = 0,
      g6 = 0,
      g7 = 0,
      g8 = 0,
      g9 = 0,
      g10 = 0,
      g11 = 0,
      g12 = 0;

  int h1 = 0,
      h2 = 0,
      h3 = 0,
      h4 = 0,
      h5 = 0,
      h6 = 0,
      h7 = 0,
      h8 = 0,
      h9 = 0,
      h10 = 0;

  int i1 = 0, i2 = 0, i3 = 0, i4 = 0;

  int rpkMark = 0;
  int aMark = 0;
  int aMandatoryMark = 0;
  int bMark = 0;
  int bMandatoryMark = 0;
  int cMark = 0;
  int cMandatoryMark = 0;
  int dMark = 0;
  int dMandatoryMark = 0;
  int eMark = 0;
  int eMandatoryMark = 0;
  int fMark = 0;
  int fMandatoryMark = 0;
  int gMark = 0;
  int gMandatoryMark = 0;
  int hMark = 0;
  int hMandatoryMark = 0;
  int iMandatoryMark = 0;

  void reset() {
    rpk1 = 0;
    rpk2 = 0;
    rpk3 = 0;
    rpk4 = 0;
    rpk5 = 0;
    rpk6 = 0;
    rpk7 = 0;
    rpk8 = 0;
    rpk9 = 0;
    rpk10 = 0;
    rpk11 = 0;
    rpk12 = 0;
    rpk13 = 0;
    rpk14 = 0;
    rpk15 = 0;
    rpk16 = 0;
    rpk17 = 0;
    rpk18 = 0;
    rpk19 = 0;
    rpk20 = 0;
    rpk21 = 0;
    rpk22 = 0;
    rpk23 = 0;
    rpk24 = 0;

    a1 = 0;
    a2 = 0;
    a3 = 0;
    a4 = 0;
    a5 = 0;
    a6 = 0;
    a7 = 0;
    a8 = 0;
    a9 = 0;
    a10 = 0;
    a11 = 0;
    a12 = 0;
    a13 = 0;
    a14 = 0;
    a15 = 0;
    a16 = 0;
    a17 = 0;
    a18 = 0;
    a19 = 0;
    a20 = 0;

    b1 = 0;
    b2 = 0;
    b3 = 0;
    b4 = 0;
    b5 = 0;
    b6 = 0;
    b7 = 0;
    b8 = 0;
    b9 = 0;
    b10 = 0;

    c1 = 0;
    c2 = 0;
    c3 = 0;
    c4 = 0;
    c5 = 0;
    c6 = 0;
    c7 = 0;
    c8 = 0;
    c9 = 0;
    c10 = 0;
    c11 = 0;
    c12 = 0;
    c13 = 0;
    c14 = 0;
    c15 = 0;
    c16 = 0;
    c17 = 0;
    c18 = 0;

    d1 = 0;
    d2 = 0;
    d3 = 0;
    d4 = 0;
    d5 = 0;
    d6 = 0;
    d7 = 0;
    d8 = 0;
    d9 = 0;
    d10 = 0;
    d11 = 0;
    d12 = 0;
    d13 = 0;
    d14 = 0;
    d15 = 0;
    d16 = 0;
    d17 = 0;
    d18 = 0;
    d19 = 0;
    d20 = 0;

    e1 = 0;
    e2 = 0;
    e3 = 0;
    e4 = 0;
    e5 = 0;
    e6 = 0;
    e7 = 0;
    e8 = 0;
    e9 = 0;
    e10 = 0;
    e11 = 0;
    e12 = 0;
    e13 = 0;
    e14 = 0;

    f1 = 0;
    f2 = 0;
    f3 = 0;
    f4 = 0;
    f5 = 0;
    f6 = 0;
    f7 = 0;
    f8 = 0;
    f9 = 0;
    f10 = 0;

    g1 = 0;
    g2 = 0;
    g3 = 0;
    g4 = 0;
    g5 = 0;
    g6 = 0;
    g7 = 0;
    g8 = 0;
    g9 = 0;
    g10 = 0;
    g11 = 0;
    g12 = 0;

    h1 = 0;
    h2 = 0;
    h3 = 0;
    h4 = 0;
    h5 = 0;
    h6 = 0;
    h7 = 0;
    h8 = 0;
    h9 = 0;
    h10 = 0;

    i1 = 0;
    i2 = 0;
    i3 = 0;
    i4 = 0;

    rpkMark = 0;
    aMark = 0;
    aMandatoryMark = 0;
    bMark = 0;
    bMandatoryMark = 0;
    cMark = 0;
    cMandatoryMark = 0;
    dMark = 0;
    dMandatoryMark = 0;
    eMark = 0;
    eMandatoryMark = 0;
    fMark = 0;
    fMandatoryMark = 0;
    gMark = 0;
    gMandatoryMark = 0;
    hMark = 0;
    hMandatoryMark = 0;
    iMandatoryMark = 0;
  }

  void setResultRpk({
    int? rpk1,
    int? rpk2,
    int? rpk3,
    int? rpk4,
    int? rpk5,
    int? rpk6,
    int? rpk7,
    int? rpk8,
    int? rpk9,
    int? rpk10,
    int? rpk11,
    int? rpk12,
    int? rpk13,
    int? rpk14,
    int? rpk15,
    int? rpk16,
    int? rpk17,
    int? rpk18,
    int? rpk19,
    int? rpk20,
    int? rpk21,
    int? rpk22,
    int? rpk23,
    int? rpk24,
  }) {
    if (rpk1 != null) {
      if (this.rpk1 != 1 && rpk1 == 1)
        rpkMark += 1;
      else if (this.rpk1 != 0 && rpk1 == 0) rpkMark -= 1;

      this.rpk1 = rpk1;
    }

    if (rpk2 != null) {
      if (this.rpk2 != 1 && rpk2 == 1)
        rpkMark += 1;
      else if (this.rpk2 != 0 && rpk2 == 0) rpkMark -= 1;

      this.rpk2 = rpk2;
    }

    if (rpk3 != null) {
      if (this.rpk3 != 1 && rpk3 == 1)
        rpkMark += 1;
      else if (this.rpk3 != 0 && rpk3 == 0) rpkMark -= 1;

      this.rpk3 = rpk3;
    }

    if (rpk4 != null) {
      if (this.rpk4 != 1 && rpk4 == 1)
        rpkMark += 1;
      else if (this.rpk4 != 0 && rpk4 == 0) rpkMark -= 1;

      this.rpk4 = rpk4;
    }

    if (rpk5 != null) {
      if (this.rpk5 != 1 && rpk5 == 1)
        rpkMark += 1;
      else if (this.rpk5 != 0 && rpk5 == 0) rpkMark -= 1;

      this.rpk5 = rpk5;
    }

    if (rpk6 != null) {
      if (this.rpk6 != 1 && rpk6 == 1)
        rpkMark += 1;
      else if (this.rpk6 != 0 && rpk6 == 0) rpkMark -= 1;

      this.rpk6 = rpk6;
    }

    if (rpk7 != null) {
      if (this.rpk7 != 1 && rpk7 == 1)
        rpkMark += 1;
      else if (this.rpk7 != 0 && rpk7 == 0) rpkMark -= 1;

      this.rpk7 = rpk7;
    }

    if (rpk8 != null) {
      if (this.rpk8 != 1 && rpk8 == 1)
        rpkMark += 1;
      else if (this.rpk8 != 0 && rpk8 == 0) rpkMark -= 1;

      this.rpk8 = rpk8;
    }

    if (rpk9 != null) {
      if (this.rpk9 != 1 && rpk9 == 1)
        rpkMark += 1;
      else if (this.rpk9 != 0 && rpk9 == 0) rpkMark -= 1;

      this.rpk9 = rpk9;
    }

    if (rpk10 != null) {
      if (this.rpk10 != 1 && rpk10 == 1)
        rpkMark += 1;
      else if (this.rpk10 != 0 && rpk10 == 0) rpkMark -= 1;

      this.rpk10 = rpk10;
    }
    if (rpk11 != null) {
      if (this.rpk11 != 1 && rpk11 == 1)
        rpkMark += 1;
      else if (this.rpk11 != 0 && rpk11 == 0) rpkMark -= 1;

      this.rpk11 = rpk11;
    }

    if (rpk12 != null) {
      if (this.rpk12 != 1 && rpk12 == 1)
        rpkMark += 1;
      else if (this.rpk12 != 0 && rpk12 == 0) rpkMark -= 1;
      this.rpk12 = rpk12;
    }

    if (rpk13 != null) {
      if (this.rpk13 != 1 && rpk13 == 1)
        rpkMark += 1;
      else if (this.rpk13 != 0 && rpk13 == 0) rpkMark -= 1;

      this.rpk13 = rpk13;
    }

    if (rpk14 != null) {
      if (this.rpk14 != 1 && rpk14 == 1)
        rpkMark += 1;
      else if (this.rpk14 != 0 && rpk14 == 0) rpkMark -= 1;

      this.rpk14 = rpk14;
    }

    if (rpk15 != null) {
      if (this.rpk15 != 1 && rpk15 == 1)
        rpkMark += 1;
      else if (this.rpk15 != 0 && rpk15 == 0) rpkMark -= 1;
      this.rpk15 = rpk15;
    }

    if (rpk16 != null) {
      if (this.rpk16 != 1 && rpk16 == 1)
        rpkMark += 1;
      else if (this.rpk16 != 0 && rpk16 == 0) rpkMark -= 1;

      this.rpk16 = rpk16;
    }

    if (rpk17 != null) {
      if (this.rpk17 != 1 && rpk17 == 1)
        rpkMark += 1;
      else if (this.rpk17 != 0 && rpk17 == 0) rpkMark -= 1;

      this.rpk17 = rpk17;
    }

    if (rpk18 != null) {
      if (this.rpk18 != 1 && rpk18 == 1)
        rpkMark += 1;
      else if (this.rpk18 != 0 && rpk18 == 0) rpkMark -= 1;

      this.rpk18 = rpk18;
    }

    if (rpk19 != null) {
      if (this.rpk19 != 1 && rpk19 == 1)
        rpkMark += 1;
      else if (this.rpk19 != 0 && rpk19 == 0) rpkMark -= 1;

      this.rpk19 = rpk19;
    }

    if (rpk20 != null) {
      if (this.rpk20 != 1 && rpk20 == 1)
        rpkMark += 1;
      else if (this.rpk20 != 0 && rpk20 == 0) rpkMark -= 1;

      this.rpk20 = rpk20;
    }

    if (rpk21 != null) {
      if (this.rpk21 != 1 && rpk21 == 1)
        rpkMark += 1;
      else if (this.rpk21 != 0 && rpk21 == 0) rpkMark -= 1;

      this.rpk21 = rpk21;
    }

    if (rpk22 != null) {
      if (this.rpk22 != 1 && rpk22 == 1)
        rpkMark += 1;
      else if (this.rpk22 != 0 && rpk22 == 0) rpkMark -= 1;

      this.rpk22 = rpk22;
    }

    if (rpk23 != null) {
      if (this.rpk23 != 1 && rpk23 == 1)
        rpkMark += 1;
      else if (this.rpk23 != 0 && rpk23 == 0) rpkMark -= 1;

      this.rpk23 = rpk23;
    }

    if (rpk24 != null) {
      if (this.rpk24 != 1 && rpk24 == 1)
        rpkMark += 1;
      else if (this.rpk24 != 0 && rpk24 == 0) rpkMark -= 1;

      this.rpk24 = rpk24;
    }

    notifyListeners();
  }

  void setResultA({
    a1,
    a2,
    a3,
    a4,
    a5,
    a6,
    a7,
    a8,
    a9,
    a10,
    a11,
    a12,
    a13,
    a14,
    a15,
    a16,
    a17,
    a18,
    a19,
    a20,
  }) {
    if (a1 != null) {
      if (this.a1 != 1 && a1 == 1)
        aMark += 1;
      else if (this.a1 != 0 && a1 == 0) aMark -= 1;

      this.a1 = a1;
    }
    if (a2 != null) {
      if (this.a2 != 1 && a2 == 1)
        aMark += 1;
      else if (this.a2 != 0 && a2 == 0) aMark -= 1;

      this.a2 = a2;
    }
    if (a3 != null) {
      if (this.a3 != 1 && a3 == 1)
        aMark += 1;
      else if (this.a3 != 0 && a3 == 0) aMark -= 1;

      this.a3 = a3;
    }
    if (a4 != null) {
      if (this.a4 != 1 && a4 == 1)
        aMark += 1;
      else if (this.a4 != 0 && a4 == 0) aMark -= 1;

      this.a4 = a4;
    }
    if (a5 != null) {
      if (this.a5 != 1 && a5 == 1)
        aMark += 1;
      else if (this.a5 != 0 && a5 == 0) aMark -= 1;

      this.a5 = a5;
    }
    if (a6 != null) {
      if (this.a6 != 1 && a6 == 1)
        aMark += 1;
      else if (this.a6 != 0 && a6 == 0) aMark -= 1;

      this.a6 = a6;
    }
    if (a7 != null) {
      if (this.a7 != 1 && a7 == 1)
        aMark += 1;
      else if (this.a7 != 0 && a7 == 0) aMark -= 1;

      this.a7 = a7;
    }
    if (a8 != null) {
      if (this.a8 != 1 && a8 == 1)
        aMark += 1;
      else if (this.a8 != 0 && a8 == 0) aMark -= 1;

      this.a8 = a8;
    }
    if (a9 != null) {
      if (this.a9 != 1 && a9 == 1)
        aMark += 1;
      else if (this.a9 != 0 && a9 == 0) aMark -= 1;

      this.a9 = a9;
    }
    if (a10 != null) {
      if (this.a10 != 1 && a10 == 1)
        aMark += 1;
      else if (this.a10 != 0 && a10 == 0) aMark -= 1;

      this.a10 = a10;
    }
    if (a11 != null) {
      if (this.a11 != 1 && a11 == 1)
        aMark += 1;
      else if (this.a11 != 0 && a11 == 0) aMark -= 1;

      this.a11 = a11;
    }
    if (a12 != null) {
      if (this.a12 != 1 && a12 == 1)
        aMark += 1;
      else if (this.a12 != 0 && a12 == 0) aMark -= 1;

      this.a12 = a12;
    }
    if (a13 != null) {
      if (this.a13 != 1 && a13 == 1)
        aMark += 1;
      else if (this.a13 != 0 && a13 == 0) aMark -= 1;

      this.a13 = a13;
    }
    if (a14 != null) {
      if (this.a14 != 1 && a14 == 1)
        aMark += 1;
      else if (this.a14 != 0 && a14 == 0) aMark -= 1;

      this.a14 = a14;
    }
    if (a15 != null) {
      if (this.a15 != 1 && a15 == 1)
        aMark += 1;
      else if (this.a15 != 0 && a15 == 0) aMark -= 1;

      this.a15 = a15;
    }
    if (a16 != null) {
      if (this.a16 != 1 && a16 == 1)
        aMark += 1;
      else if (this.a16 != 0 && a16 == 0) aMark -= 1;

      this.a16 = a16;
    }
    if (a17 != null) {
      if (this.a17 != 1 && a17 == 1)
        aMark += 1;
      else if (this.a17 != 0 && a17 == 0) aMark -= 1;

      this.a17 = a17;
    }
    if (a18 != null) {
      if (this.a18 != 1 && a18 == 1)
        aMark += 1;
      else if (this.a18 != 0 && a18 == 0) aMark -= 1;

      this.a18 = a18;
    }
    if (a19 != null) {
      if (this.a19 != 1 && a19 == 1)
        aMark += 1;
      else if (this.a19 != 0 && a19 == 0) aMark -= 1;

      this.a19 = a19;
    }
    if (a20 != null) {
      if (this.a20 != 1 && a20 == 1)
        aMandatoryMark += 1;
      else if (this.a20 != 0 && a20 == 0) aMandatoryMark -= 1;

      this.a20 = a20;
    }

    notifyListeners();
  }

  void setResultB({
    b1,
    b2,
    b3,
    b4,
    b5,
    b6,
    b7,
    b8,
    b9,
    b10,
  }) {
    if (b1 != null) {
      if (this.b1 != 1 && b1 == 1)
        bMark += 1;
      else if (this.b1 != 0 && b1 == 0) bMark -= 1;

      this.b1 = b1;
    }
    if (b2 != null) {
      if (this.b2 != 1 && b2 == 1)
        bMark += 1;
      else if (this.b2 != 0 && b2 == 0) bMark -= 1;

      this.b2 = b2;
    }
    if (b3 != null) {
      if (this.b3 != 1 && b3 == 1)
        bMark += 1;
      else if (this.b3 != 0 && b3 == 0) bMark -= 1;

      this.b3 = b3;
    }
    if (b4 != null) {
      if (this.b4 != 1 && b4 == 1)
        bMark += 1;
      else if (this.b4 != 0 && b4 == 0) bMark -= 1;

      this.b4 = b4;
    }
    if (b5 != null) {
      if (this.b5 != 1 && b5 == 1)
        bMark += 1;
      else if (this.b5 != 0 && b5 == 0) bMark -= 1;

      this.b5 = b5;
    }
    if (b6 != null) {
      if (this.b6 != 1 && b6 == 1)
        bMark += 1;
      else if (this.b6 != 0 && b6 == 0) bMark -= 1;

      this.b6 = b6;
    }
    if (b7 != null) {
      if (this.b7 != 1 && b7 == 1)
        bMark += 1;
      else if (this.b7 != 0 && b7 == 0) bMark -= 1;

      this.b7 = b7;
    }
    if (b8 != null) {
      if (this.b8 != 1 && b8 == 1)
        bMandatoryMark += 1;
      else if (this.b8 != 0 && b8 == 0) bMandatoryMark -= 1;

      this.b8 = b8;
    }
    if (b9 != null) {
      if (this.b9 != 1 && b9 == 1)
        bMandatoryMark += 1;
      else if (this.b9 != 0 && b9 == 0) bMandatoryMark -= 1;

      this.b9 = b9;
    }
    if (b10 != null) {
      if (this.b10 != 1 && b10 == 1)
        bMandatoryMark += 1;
      else if (this.b10 != 0 && b10 == 0) bMandatoryMark -= 1;

      this.b10 = b10;
    }

    notifyListeners();
  }

  void setResultC({
    c1,
    c2,
    c3,
    c4,
    c5,
    c6,
    c7,
    c8,
    c9,
    c10,
    c11,
    c12,
    c13,
    c14,
    c15,
    c16,
    c17,
    c18,
  }) {
    if (c1 != null) {
      if (this.c1 != 1 && c1 == 1)
        cMark += 1;
      else if (this.c1 != 0 && c1 == 0) cMark -= 1;

      this.c1 = c1;
    }
    if (c2 != null) {
      if (this.c2 != 1 && c2 == 1)
        cMark += 1;
      else if (this.c2 != 0 && c2 == 0) cMark -= 1;

      this.c2 = c2;
    }
    if (c3 != null) {
      if (this.c3 != 1 && c3 == 1)
        cMark += 1;
      else if (this.c3 != 0 && c3 == 0) cMark -= 1;

      this.c3 = c3;
    }
    if (c4 != null) {
      if (this.c4 != 1 && c4 == 1)
        cMark += 1;
      else if (this.c4 != 0 && c4 == 0) cMark -= 1;

      this.c4 = c4;
    }
    if (c5 != null) {
      if (this.c5 != 1 && c5 == 1)
        cMark += 1;
      else if (this.c5 != 0 && c5 == 0) cMark -= 1;

      this.c5 = c5;
    }
    if (c6 != null) {
      if (this.c6 != 1 && c6 == 1)
        cMark += 1;
      else if (this.c6 != 0 && c6 == 0) cMark -= 1;

      this.c6 = c6;
    }
    if (c7 != null) {
      if (this.c7 != 1 && c7 == 1)
        cMark += 1;
      else if (this.c7 != 0 && c7 == 0) cMark -= 1;

      this.c7 = c7;
    }
    if (c8 != null) {
      if (this.c8 != 1 && c8 == 1)
        cMark += 1;
      else if (this.c8 != 0 && c8 == 0) cMark -= 1;

      this.c8 = c8;
    }
    if (c9 != null) {
      if (this.c9 != 1 && c9 == 1)
        cMark += 1;
      else if (this.c9 != 0 && c9 == 0) cMark -= 1;

      this.c9 = c9;
    }
    if (c10 != null) {
      if (this.c10 != 1 && c10 == 1)
        cMark += 1;
      else if (this.c10 != 0 && c10 == 0) cMark -= 1;

      this.c10 = c10;
    }
    if (c11 != null) {
      if (this.c11 != 1 && c11 == 1)
        cMark += 1;
      else if (this.c11 != 0 && c11 == 0) cMark -= 1;

      this.c11 = c11;
    }
    if (c12 != null) {
      if (this.c12 != 1 && c12 == 1)
        cMark += 1;
      else if (this.c12 != 0 && c12 == 0) cMark -= 1;

      this.c12 = c12;
    }
    if (c13 != null) {
      if (this.c13 != 1 && c13 == 1)
        cMandatoryMark += 1;
      else if (this.c13 != 0 && c13 == 0) cMandatoryMark -= 1;

      this.c13 = c13;
    }
    if (c14 != null) {
      if (this.c14 != 1 && c14 == 1)
        cMandatoryMark += 1;
      else if (this.c14 != 0 && c14 == 0) cMandatoryMark -= 1;

      this.c14 = c14;
    }
    if (c15 != null) {
      if (this.c15 != 1 && c15 == 1)
        cMandatoryMark += 1;
      else if (this.c15 != 0 && c15 == 0) cMandatoryMark -= 1;

      this.c15 = c15;
    }
    if (c16 != null) {
      if (this.c16 != 1 && c16 == 1)
        cMandatoryMark += 1;
      else if (this.c16 != 0 && c16 == 0) cMandatoryMark -= 1;

      this.c16 = c16;
    }
    if (c17 != null) {
      if (this.c17 != 1 && c17 == 1)
        cMandatoryMark += 1;
      else if (this.c17 != 0 && c17 == 0) cMandatoryMark -= 1;

      this.c17 = c17;
    }
    if (c18 != null) {
      if (this.c18 != 1 && c18 == 1)
        cMandatoryMark += 1;
      else if (this.c18 != 0 && c18 == 0) cMandatoryMark -= 1;

      this.c18 = c18;
    }

    notifyListeners();
  }

  void setResultD({
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    d8,
    d9,
    d10,
    d11,
    d12,
    d13,
    d14,
    d15,
    d16,
    d17,
    d18,
    d19,
    d20,
  }) {
    if (d1 != null) {
      if (this.d1 != 1 && d1 == 1)
        dMark += 1;
      else if (this.d1 != 0 && d1 == 0) dMark -= 1;

      this.d1 = d1;
    }
    if (d2 != null) {
      if (this.d2 != 1 && d2 == 1)
        dMark += 1;
      else if (this.d2 != 0 && d2 == 0) dMark -= 1;

      this.d2 = d2;
    }
    if (d3 != null) {
      if (this.d3 != 1 && d3 == 1)
        dMark += 1;
      else if (this.d3 != 0 && d3 == 0) dMark -= 1;

      this.d3 = d3;
    }
    if (d4 != null) {
      if (this.d4 != 1 && d4 == 1)
        dMark += 1;
      else if (this.d4 != 0 && d4 == 0) dMark -= 1;

      this.d4 = d4;
    }
    if (d5 != null) {
      if (this.d5 != 1 && d5 == 1)
        dMark += 1;
      else if (this.d5 != 0 && d5 == 0) dMark -= 1;

      this.d5 = d5;
    }
    if (d6 != null) {
      if (this.d6 != 1 && d6 == 1)
        dMark += 1;
      else if (this.d6 != 0 && d6 == 0) dMark -= 1;

      this.d6 = d6;
    }
    if (d7 != null) {
      if (this.d7 != 1 && d7 == 1)
        dMark += 1;
      else if (this.d7 != 0 && d7 == 0) dMark -= 1;

      this.d7 = d7;
    }
    if (d8 != null) {
      if (this.d8 != 1 && d8 == 1)
        dMark += 1;
      else if (this.d8 != 0 && d8 == 0) dMark -= 1;

      this.d8 = d8;
    }
    if (d9 != null) {
      if (this.d9 != 1 && d9 == 1)
        dMark += 1;
      else if (this.d9 != 0 && d9 == 0) dMark -= 1;

      this.d9 = d9;
    }
    if (d10 != null) {
      if (this.d10 != 1 && d10 == 1)
        dMark += 1;
      else if (this.d10 != 0 && d10 == 0) dMark -= 1;

      this.d10 = d10;
    }
    if (d11 != null) {
      if (this.d11 != 1 && d11 == 1)
        dMark += 1;
      else if (this.d11 != 0 && d11 == 0) dMark -= 1;

      this.d11 = d11;
    }
    if (d12 != null) {
      if (this.d12 != 1 && d12 == 1)
        dMark += 1;
      else if (this.d12 != 0 && d12 == 0) dMark -= 1;

      this.d12 = d12;
    }
    if (d13 != null) {
      if (this.d13 != 1 && d13 == 1)
        dMark += 1;
      else if (this.d13 != 0 && d13 == 0) dMark -= 1;

      this.d13 = d13;
    }
    if (d14 != null) {
      if (this.d14 != 1 && d14 == 1)
        dMandatoryMark += 1;
      else if (this.d14 != 0 && d14 == 0) dMandatoryMark -= 1;

      this.d14 = d14;
    }
    if (d15 != null) {
      if (this.d15 != 1 && d15 == 1)
        dMandatoryMark += 1;
      else if (this.d15 != 0 && d15 == 0) dMandatoryMark -= 1;

      this.d15 = d15;
    }
    if (d16 != null) {
      if (this.d16 != 1 && d16 == 1)
        dMandatoryMark += 1;
      else if (this.d16 != 0 && d16 == 0) dMandatoryMark -= 1;

      this.d16 = d16;
    }
    if (d17 != null) {
      if (this.d17 != 1 && d17 == 1)
        dMandatoryMark += 1;
      else if (this.d17 != 0 && d17 == 0) dMandatoryMark -= 1;

      this.d17 = d17;
    }
    if (d18 != null) {
      if (this.d18 != 1 && d18 == 1)
        dMandatoryMark += 1;
      else if (this.d18 != 0 && d18 == 0) dMandatoryMark -= 1;

      this.d18 = d18;
    }
    if (d19 != null) {
      if (this.d19 != 1 && d19 == 1)
        dMandatoryMark += 1;
      else if (this.d19 != 0 && d19 == 0) dMandatoryMark -= 1;

      this.d19 = d19;
    }
    if (d20 != null) {
      if (this.d20 != 1 && d20 == 1)
        dMandatoryMark += 1;
      else if (this.d20 != 0 && d20 == 0) dMandatoryMark -= 1;

      this.d20 = d20;
    }

    notifyListeners();
  }

  void setResultE({
    e1,
    e2,
    e3,
    e4,
    e5,
    e6,
    e7,
    e8,
    e9,
    e10,
    e11,
    e12,
    e13,
    e14,
  }) {
    if (e1 != null) {
      if (this.e1 != 1 && e1 == 1)
        eMark += 1;
      else if (this.e1 != 0 && e1 == 0) eMark -= 1;

      this.e1 = e1;
    }
    if (e2 != null) {
      if (this.e2 != 1 && e2 == 1)
        eMark += 1;
      else if (this.e2 != 0 && e2 == 0) eMark -= 1;

      this.e2 = e2;
    }
    if (e3 != null) {
      if (this.e3 != 1 && e3 == 1)
        eMark += 1;
      else if (this.e3 != 0 && e3 == 0) eMark -= 1;

      this.e3 = e3;
    }
    if (e4 != null) {
      if (this.e4 != 1 && e4 == 1)
        eMark += 1;
      else if (this.e4 != 0 && e4 == 0) eMark -= 1;

      this.e4 = e4;
    }
    if (e5 != null) {
      if (this.e5 != 1 && e5 == 1)
        eMark += 1;
      else if (this.e5 != 0 && e5 == 0) eMark -= 1;

      this.e5 = e5;
    }
    if (e6 != null) {
      if (this.e6 != 1 && e6 == 1)
        eMark += 1;
      else if (this.e6 != 0 && e6 == 0) eMark -= 1;

      this.e6 = e6;
    }
    if (e7 != null) {
      if (this.e7 != 1 && e7 == 1)
        eMark += 1;
      else if (this.e7 != 0 && e7 == 0) eMark -= 1;

      this.e7 = e7;
    }
    if (e8 != null) {
      if (this.e8 != 1 && e8 == 1)
        eMark += 1;
      else if (this.e8 != 0 && e8 == 0) eMark -= 1;

      this.e8 = e8;
    }
    if (e9 != null) {
      if (this.e9 != 1 && e9 == 1)
        eMandatoryMark += 1;
      else if (this.e9 != 0 && e9 == 0) eMandatoryMark -= 1;

      this.e9 = e9;
    }
    if (e10 != null) {
      if (this.e10 != 1 && e10 == 1)
        eMandatoryMark += 1;
      else if (this.e10 != 0 && e10 == 0) eMandatoryMark -= 1;

      this.e10 = e10;
    }
    if (e11 != null) {
      if (this.e11 != 1 && e11 == 1)
        eMandatoryMark += 1;
      else if (this.e11 != 0 && e11 == 0) eMandatoryMark -= 1;

      this.e11 = e11;
    }
    if (e12 != null) {
      if (this.e12 != 1 && e12 == 1)
        eMandatoryMark += 1;
      else if (this.e12 != 0 && e12 == 0) eMandatoryMark -= 1;

      this.e12 = e12;
    }
    if (e13 != null) {
      if (this.e13 != 1 && e13 == 1)
        eMandatoryMark += 1;
      else if (this.e13 != 0 && e13 == 0) eMandatoryMark -= 1;

      this.e13 = e13;
    }
    if (e14 != null) {
      if (this.e14 != 1 && e14 == 1)
        eMandatoryMark += 1;
      else if (this.e14 != 0 && e14 == 0) eMandatoryMark -= 1;

      this.e14 = e14;
    }

    notifyListeners();
  }

  void setResultF({
    f1,
    f2,
    f3,
    f4,
    f5,
    f6,
    f7,
    f8,
    f9,
    f10,
  }) {
    if (f1 != null) {
      if (this.f1 != 1 && f1 == 1)
        fMark += 1;
      else if (this.f1 != 0 && f1 == 0) fMark -= 1;

      this.f1 = f1;
    }
    if (f2 != null) {
      if (this.f2 != 1 && f2 == 1)
        fMark += 1;
      else if (this.f2 != 0 && f2 == 0) fMark -= 1;

      this.f2 = f2;
    }
    if (f3 != null) {
      if (this.f3 != 1 && f3 == 1)
        fMark += 1;
      else if (this.f3 != 0 && f3 == 0) fMark -= 1;

      this.f3 = f3;
    }
    if (f4 != null) {
      if (this.f4 != 1 && f4 == 1)
        fMark += 1;
      else if (this.f4 != 0 && f4 == 0) fMark -= 1;

      this.f4 = f4;
    }
    if (f5 != null) {
      if (this.f5 != 1 && f5 == 1)
        fMark += 1;
      else if (this.f5 != 0 && f5 == 0) fMark -= 1;

      this.f5 = f5;
    }
    if (f6 != null) {
      if (this.f6 != 1 && f6 == 1)
        fMark += 1;
      else if (this.f6 != 0 && f6 == 0) fMark -= 1;

      this.f6 = f6;
    }
    if (f7 != null) {
      if (this.f7 != 1 && f7 == 1)
        fMark += 1;
      else if (this.f7 != 0 && f7 == 0) fMark -= 1;

      this.f7 = f7;
    }
    if (f8 != null) {
      if (this.f8 != 1 && f8 == 1)
        fMandatoryMark += 1;
      else if (this.f8 != 0 && f8 == 0) fMandatoryMark -= 1;

      this.f8 = f8;
    }
    if (f9 != null) {
      if (this.f9 != 1 && f9 == 1)
        fMandatoryMark += 1;
      else if (this.f9 != 0 && f9 == 0) fMandatoryMark -= 1;

      this.f9 = f9;
    }
    if (f10 != null) {
      if (this.f10 != 1 && f10 == 1)
        fMandatoryMark += 1;
      else if (this.f10 != 0 && f10 == 0) fMandatoryMark -= 1;

      this.f10 = f10;
    }

    notifyListeners();
  }

  void setResultG({
    g1,
    g2,
    g3,
    g4,
    g5,
    g6,
    g7,
    g8,
    g9,
    g10,
    g11,
    g12,
  }) {
    if (g1 != null) {
      if (this.g1 != 1 && g1 == 1)
        gMark += 1;
      else if (this.g1 != 0 && g1 == 0) gMark -= 1;

      this.g1 = g1;
    }
    if (g2 != null) {
      if (this.g2 != 1 && g2 == 1)
        gMark += 1;
      else if (this.g2 != 0 && g2 == 0) gMark -= 1;

      this.g2 = g2;
    }
    if (g3 != null) {
      if (this.g3 != 1 && g3 == 1)
        gMark += 1;
      else if (this.g3 != 0 && g3 == 0) gMark -= 1;

      this.g3 = g3;
    }
    if (g4 != null) {
      if (this.g4 != 1 && g4 == 1)
        gMark += 1;
      else if (this.g4 != 0 && g4 == 0) gMark -= 1;

      this.g4 = g4;
    }
    if (g5 != null) {
      if (this.g5 != 1 && g5 == 1)
        gMark += 1;
      else if (this.g5 != 0 && g5 == 0) gMark -= 1;

      this.g5 = g5;
    }
    if (g6 != null) {
      if (this.g6 != 1 && g6 == 1)
        gMark += 1;
      else if (this.g6 != 0 && g6 == 0) gMark -= 1;

      this.g6 = g6;
    }
    if (g7 != null) {
      if (this.g7 != 1 && g7 == 1)
        gMark += 1;
      else if (this.g7 != 0 && g7 == 0) gMark -= 1;

      this.g7 = g7;
    }
    if (g8 != null) {
      if (this.g8 != 1 && g8 == 1)
        gMark += 1;
      else if (this.g8 != 0 && g8 == 0) gMark -= 1;

      this.g8 = g8;
    }
    if (g9 != null) {
      if (this.g9 != 1 && g9 == 1)
        gMandatoryMark += 1;
      else if (this.g9 != 0 && g9 == 0) gMandatoryMark -= 1;

      this.g9 = g9;
    }
    if (g10 != null) {
      if (this.g10 != 1 && g10 == 1)
        gMandatoryMark += 1;
      else if (this.g10 != 0 && g10 == 0) gMandatoryMark -= 1;

      this.g10 = g10;
    }
    if (g11 != null) {
      if (this.g11 != 1 && g11 == 1)
        gMandatoryMark += 1;
      else if (this.g11 != 0 && g11 == 0) gMandatoryMark -= 1;

      this.g11 = g11;
    }
    if (g12 != null) {
      if (this.g12 != 1 && g12 == 1)
        gMandatoryMark += 1;
      else if (this.g12 != 0 && g12 == 0) gMandatoryMark -= 1;

      this.g12 = g12;
    }

    notifyListeners();
  }

  void setResultH({
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    h7,
    h8,
    h9,
    h10,
  }) {
    if (h1 != null) {
      if (this.h1 != 1 && h1 == 1)
        hMark += 1;
      else if (this.h1 != 0 && h1 == 0) hMark -= 1;

      this.h1 = h1;
    }
    if (h2 != null) {
      if (this.h2 != 1 && h2 == 1)
        hMark += 1;
      else if (this.h2 != 0 && h2 == 0) hMark -= 1;

      this.h2 = h2;
    }
    if (h3 != null) {
      if (this.h3 != 1 && h3 == 1)
        hMark += 1;
      else if (this.h3 != 0 && h3 == 0) hMark -= 1;

      this.h3 = h3;
    }
    if (h4 != null) {
      if (this.h4 != 1 && h4 == 1)
        hMark += 1;
      else if (this.h4 != 0 && h4 == 0) hMark -= 1;

      this.h4 = h4;
    }
    if (h5 != null) {
      if (this.h5 != 1 && h5 == 1)
        hMark += 1;
      else if (this.h5 != 0 && h5 == 0) hMark -= 1;

      this.h5 = h5;
    }
    if (h6 != null) {
      if (this.h6 != 1 && h6 == 1)
        hMark += 1;
      else if (this.h6 != 0 && h6 == 0) hMark -= 1;

      this.h6 = h6;
    }
    if (h7 != null) {
      if (this.h7 != 1 && h7 == 1)
        hMandatoryMark += 1;
      else if (this.h7 != 0 && h7 == 0) hMandatoryMark -= 1;

      this.h7 = h7;
    }
    if (h8 != null) {
      if (this.h8 != 1 && h8 == 1)
        hMandatoryMark += 1;
      else if (this.h8 != 0 && h8 == 0) hMandatoryMark -= 1;

      this.h8 = h8;
    }
    if (h9 != null) {
      if (this.h9 != 1 && h9 == 1)
        hMandatoryMark += 1;
      else if (this.h9 != 0 && h9 == 0) hMandatoryMark -= 1;

      this.h9 = h9;
    }
    if (h10 != null) {
      if (this.h10 != 1 && h10 == 1)
        hMandatoryMark += 1;
      else if (this.h10 != 0 && h10 == 0) hMandatoryMark -= 1;

      this.h10 = h10;
    }

    notifyListeners();
  }

  void setResultI({
    i1,
    i2,
    i3,
    i4,
    i5,
  }) {
    if (i1 != null) {
      if (this.i1 != 1 && i1 == 1)
        iMandatoryMark += 1;
      else if (this.i1 != 0 && i1 == 0) iMandatoryMark -= 1;

      this.i1 = i1;
    }

    if (i2 != null) {
      if (this.i2 != 1 && i2 == 1)
        iMandatoryMark += 1;
      else if (this.i2 != 0 && i2 == 0) iMandatoryMark -= 1;

      this.i2 = i2;
    }

    if (i3 != null) {
      if (this.i3 != 1 && i3 == 1)
        iMandatoryMark += 1;
      else if (this.i3 != 0 && i3 == 0) iMandatoryMark -= 1;

      this.i3 = i3;
    }

    if (i4 != null) {
      if (this.i4 != 1 && i4 == 1)
        iMandatoryMark += 1;
      else if (this.i4 != 0 && i4 == 0) iMandatoryMark -= 1;

      this.i4 = i4;
    }

    notifyListeners();
  }

  String getRpkResults() {
    return '''{
      "Result": [{
        "rpk01": "$rpk1",
        "rpk02": "$rpk2",
        "rpk03": "$rpk3",
        "rpk04": "$rpk4",
        "rpk05": "$rpk5",
        "rpk06": "$rpk6",
        "rpk07": "$rpk7",
        "rpk08": "$rpk8",
        "rpk09": "$rpk9",
        "rpk10": "$rpk10",
        "rpk11": "$rpk11",
        "rpk12": "$rpk12",
        "rpk13": "$rpk13",
        "rpk14": "$rpk14",
        "rpk15": "$rpk15",
        "rpk16": "$rpk16",
        "rpk17": "$rpk17",
        "rpk18": "$rpk18",
        "rpk19": "$rpk19",
        "rpk20": "$rpk20",
        "rpk21": "$rpk21",
        "rpk22": "$rpk22",
        "rpk23": "$rpk23",
        "rpk24": "$rpk24"
      }]
    }''';
  }

  String getJrResults() {
    return '''{
      "Result": [{
        "a01": "$a1",
        "a02": "$a2",
        "a03": "$a3",
        "a04": "$a4",
        "a05": "$a5",
        "a06": "$a6",
        "a07": "$a7",
        "a08": "$a8",
        "a09": "$a9",
        "a10": "$a10",
        "a11": "$a11",
        "a12": "$a12",
        "a13": "$a13",
        "a14": "$a14",
        "a15": "$a15",
        "a16": "$a16",
        "a17": "$a17",
        "a18": "$a18",
        "a19": "$a19",
        "a20": "$a20",
        "b01": "$b1",
        "b02": "$b2",
        "b03": "$b3",
        "b04": "$b4",
        "b05": "$b5",
        "b06": "$b6",
        "b07": "$b7",
        "b08": "$b8",
        "b09": "$b9",
        "b10": "$b10",
        "c01": "$c1",
        "c02": "$c2",
        "c03": "$c3",
        "c04": "$c4",
        "c05": "$c5",
        "c06": "$c6",
        "c07": "$c7",
        "c08": "$c8",
        "c09": "$c9",
        "c10": "$c10",
        "c11": "$c11",
        "c12": "$c12",
        "c13": "$c13",
        "c14": "$c14",
        "c15": "$c15",
        "c16": "$c16",
        "c17": "$c17",
        "c18": "$c18",
        "d01": "$d1",
        "d02": "$d2",
        "d03": "$d3",
        "d04": "$d4",
        "d05": "$d5",
        "d06": "$d6",
        "d07": "$d7",
        "d08": "$d8",
        "d09": "$d9",
        "d10": "$d10",
        "d11": "$d11",
        "d12": "$d12",
        "d13": "$d13",
        "d14": "$d14",
        "d15": "$d15",
        "d16": "$d16",
        "d17": "$d17",
        "d18": "$d18",
        "d19": "$d19",
        "d20": "$d20",
        "e01": "$e1",
        "e02": "$e2",
        "e03": "$e3",
        "e04": "$e4",
        "e05": "$e5",
        "e06": "$e6",
        "e07": "$e7",
        "e08": "$e8",
        "e09": "$e9",
        "e10": "$e10",
        "e11": "$e11",
        "e12": "$e12",
        "e13": "$e13",
        "e14": "$e14",
        "f01": "$f1",
        "f02": "$f2",
        "f03": "$f3",
        "f04": "$f4",
        "f05": "$f5",
        "f06": "$f6",
        "f07": "$f7",
        "f08": "$f8",
        "f09": "$f9",
        "f10": "$f10",
        "g01": "$g1",
        "g02": "$g2",
        "g03": "$g3",
        "g04": "$g4",
        "g05": "$g5",
        "g06": "$g6",
        "g07": "$g7",
        "g08": "$g8",
        "g09": "$g9",
        "g10": "$g10",
        "g11": "$g11",
        "g12": "$g12",
        "h01": "$h1",
        "h02": "$h2",
        "h03": "$h3",
        "h04": "$h4",
        "h05": "$h5",
        "h06": "$h6",
        "h07": "$h7",
        "h08": "$h8",
        "h09": "$h9",
        "h10": "$h10",
        "i01": "$i1",
        "i02": "$i2",
        "i03": "$i3",
        "i04": "$i4"
      }]
    }''';
  }
}

class RpkSessionModel extends ChangeNotifier {
  List<int> rpk = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  int rpk1 = 0,
      rpk2 = 0,
      rpk3 = 0,
      rpk4 = 0,
      rpk5 = 0,
      rpk6 = 0,
      rpk7 = 0,
      rpk8 = 0,
      rpk9 = 0,
      rpk10 = 0,
      rpk11 = 0,
      rpk12 = 0,
      rpk13 = 0,
      rpk14 = 0,
      rpk15 = 0,
      rpk16 = 0,
      rpk17 = 0,
      rpk18 = 0,
      rpk19 = 0,
      rpk20 = 0,
      rpk21 = 0,
      rpk22 = 0,
      rpk23 = 0,
      rpk24 = 0;

  int mark = 0;

  void reset() {
    rpk1 = 0;
    rpk2 = 0;
    rpk3 = 0;
    rpk4 = 0;
    rpk5 = 0;
    rpk6 = 0;
    rpk7 = 0;
    rpk8 = 0;
    rpk9 = 0;
    rpk10 = 0;
    rpk11 = 0;
    rpk12 = 0;
    rpk13 = 0;
    rpk14 = 0;
    rpk15 = 0;
    rpk16 = 0;
    rpk17 = 0;
    rpk18 = 0;
    rpk19 = 0;
    rpk20 = 0;
    rpk21 = 0;
    rpk22 = 0;
    rpk23 = 0;
    rpk24 = 0;

    mark = 0;
  }

  void setRpkResult({
    rpk1,
    rpk2,
    rpk3,
    rpk4,
    rpk5,
    rpk6,
    rpk7,
    rpk8,
    rpk9,
    rpk10,
    rpk11,
    rpk12,
    rpk13,
    rpk14,
    rpk15,
    rpk16,
    rpk17,
    rpk18,
    rpk19,
    rpk20,
    rpk21,
    rpk22,
    rpk23,
    rpk24,
  }) {
    /* List<int> rpk = [];

    for (int i = 0; i < this.rpk.length; i += 1) {
      rpk[i] = int.tryParse('$rpk$i');

      if (rpk[i] != null) {
        if (this.rpk[i] != 1 && rpk[i] == 1)
          mark += 1;
        else if (this.rpk[i] != 0 && rpk[i] == 0) mark -= 1;

        this.rpk[i] = rpk[i];
      }
    } */

    if (rpk1 != null) {
      if (this.rpk1 != 1 && rpk1 == 1)
        mark += 1;
      else if (this.rpk1 != 0 && rpk1 == 0) mark -= 1;

      this.rpk1 = rpk1;
    }

    if (rpk2 != null) {
      if (this.rpk2 != 1 && rpk2 == 1)
        mark += 1;
      else if (this.rpk2 != 0 && rpk2 == 0) mark -= 1;

      this.rpk2 = rpk2;
    }

    if (rpk3 != null) {
      if (this.rpk3 != 1 && rpk3 == 1)
        mark += 1;
      else if (this.rpk3 != 0 && rpk3 == 0) mark -= 1;

      this.rpk3 = rpk3;
    }

    if (rpk4 != null) {
      if (this.rpk4 != 1 && rpk4 == 1)
        mark += 1;
      else if (this.rpk4 != 0 && rpk4 == 0) mark -= 1;

      this.rpk4 = rpk4;
    }

    if (rpk5 != null) {
      if (this.rpk5 != 1 && rpk5 == 1)
        mark += 1;
      else if (this.rpk5 != 0 && rpk5 == 0) mark -= 1;

      this.rpk5 = rpk5;
    }

    if (rpk6 != null) {
      if (this.rpk6 != 1 && rpk6 == 1)
        mark += 1;
      else if (this.rpk6 != 0 && rpk6 == 0) mark -= 1;

      this.rpk6 = rpk6;
    }

    if (rpk7 != null) {
      if (this.rpk7 != 1 && rpk7 == 1)
        mark += 1;
      else if (this.rpk7 != 0 && rpk7 == 0) mark -= 1;

      this.rpk7 = rpk7;
    }

    if (rpk8 != null) {
      if (this.rpk8 != 1 && rpk8 == 1)
        mark += 1;
      else if (this.rpk8 != 0 && rpk8 == 0) mark -= 1;

      this.rpk8 = rpk8;
    }

    if (rpk9 != null) {
      if (this.rpk9 != 1 && rpk9 == 1)
        mark += 1;
      else if (this.rpk9 != 0 && rpk9 == 0) mark -= 1;

      this.rpk9 = rpk9;
    }

    if (rpk10 != null) {
      if (this.rpk10 != 1 && rpk10 == 1)
        mark += 1;
      else if (this.rpk10 != 0 && rpk10 == 0) mark -= 1;

      this.rpk10 = rpk10;
    }
    if (rpk11 != null) {
      if (this.rpk11 != 1 && rpk11 == 1)
        mark += 1;
      else if (this.rpk11 != 0 && rpk11 == 0) mark -= 1;

      this.rpk11 = rpk11;
    }

    if (rpk12 != null) {
      if (this.rpk12 != 1 && rpk12 == 1)
        mark += 1;
      else if (this.rpk12 != 0 && rpk12 == 0) mark -= 1;
      this.rpk12 = rpk12;
    }

    if (rpk13 != null) {
      if (this.rpk13 != 1 && rpk13 == 1)
        mark += 1;
      else if (this.rpk13 != 0 && rpk13 == 0) mark -= 1;

      this.rpk13 = rpk13;
    }

    if (rpk14 != null) {
      if (this.rpk14 != 1 && rpk14 == 1)
        mark += 1;
      else if (this.rpk14 != 0 && rpk14 == 0) mark -= 1;

      this.rpk14 = rpk14;
    }

    if (rpk15 != null) {
      if (this.rpk15 != 1 && rpk15 == 1)
        mark += 1;
      else if (this.rpk15 != 0 && rpk15 == 0) mark -= 1;
      this.rpk15 = rpk15;
    }

    if (rpk16 != null) {
      if (this.rpk16 != 1 && rpk16 == 1)
        mark += 1;
      else if (this.rpk16 != 0 && rpk16 == 0) mark -= 1;

      this.rpk16 = rpk16;
    }

    if (rpk17 != null) {
      if (this.rpk17 != 1 && rpk17 == 1)
        mark += 1;
      else if (this.rpk17 != 0 && rpk17 == 0) mark -= 1;

      this.rpk17 = rpk17;
    }

    if (rpk18 != null) {
      if (this.rpk18 != 1 && rpk18 == 1)
        mark += 1;
      else if (this.rpk18 != 0 && rpk18 == 0) mark -= 1;

      this.rpk18 = rpk18;
    }

    if (rpk19 != null) {
      if (this.rpk19 != 1 && rpk19 == 1)
        mark += 1;
      else if (this.rpk19 != 0 && rpk19 == 0) mark -= 1;

      this.rpk19 = rpk19;
    }

    if (rpk20 != null) {
      if (this.rpk20 != 1 && rpk20 == 1)
        mark += 1;
      else if (this.rpk20 != 0 && rpk20 == 0) mark -= 1;

      this.rpk20 = rpk20;
    }

    if (rpk21 != null) {
      if (this.rpk21 != 1 && rpk21 == 1)
        mark += 1;
      else if (this.rpk21 != 0 && rpk21 == 0) mark -= 1;

      this.rpk21 = rpk21;
    }

    if (rpk22 != null) {
      if (this.rpk22 != 1 && rpk22 == 1)
        mark += 1;
      else if (this.rpk22 != 0 && rpk22 == 0) mark -= 1;

      this.rpk22 = rpk22;
    }

    if (rpk23 != null) {
      if (this.rpk23 != 1 && rpk23 == 1)
        mark += 1;
      else if (this.rpk23 != 0 && rpk23 == 0) mark -= 1;

      this.rpk23 = rpk23;
    }

    if (rpk24 != null) {
      if (this.rpk24 != 1 && rpk24 == 1)
        mark += 1;
      else if (this.rpk24 != 0 && rpk24 == 0) mark -= 1;

      this.rpk24 = rpk24;
    }

    notifyListeners();
  }

  String getRpkResult() {
    return '{' +
        '"Result": [{' +
        '"rpk01": "$rpk1",' +
        '"rpk02": "$rpk2",' +
        '"rpk03": "$rpk3",' +
        '"rpk04": "$rpk4",' +
        '"rpk05": "$rpk5",' +
        '"rpk06": "$rpk6",' +
        '"rpk07": "$rpk7",' +
        '"rpk08": "$rpk8",' +
        '"rpk09": "$rpk9",' +
        '"rpk10": "$rpk10",' +
        '"rpk11": "$rpk11",' +
        '"rpk12": "$rpk12",' +
        '"rpk13": "$rpk13",' +
        '"rpk14": "$rpk14",' +
        '"rpk15": "$rpk15",' +
        '"rpk16": "$rpk16",' +
        '"rpk17": "$rpk17",' +
        '"rpk18": "$rpk18",' +
        '"rpk19": "$rpk19",' +
        '"rpk20": "$rpk20",' +
        '"rpk21": "$rpk21",' +
        '"rpk22": "$rpk22",' +
        '"rpk23": "$rpk23",' +
        '"rpk24": "$rpk24"' +
        '}]' +
        '}';
  }
}
