const bool inProduction = const bool.fromEnvironment("dart.vm.product");
const String BACKEND_URL =
    inProduction ? "https://oj.6rabbit.com/api" : "http://localhost:8888";

class _Question {
  String getList(String page) => "$BACKEND_URL/question/list/$page";

  String optionsItem(String tid) => "$BACKEND_URL/question/item/$tid";
  String postCreate = "$BACKEND_URL/question/item";

  String putEdit(String tid) => "$BACKEND_URL/question/item/$tid";

  String postSubmit(String tid) => "$BACKEND_URL/question/submit/$tid";

  String getRecord(String tid, String page) =>
      "$BACKEND_URL/question/record/$tid/$page";

  String optionsJudge(String tid) => "$BACKEND_URL/question/judge/$tid";
}

class _User {
  String getInfo(String username) => "$BACKEND_URL/user/info/$username";

  String avatar(String uid) => "$BACKEND_URL/user/avatar/$uid";
  String getMy = "$BACKEND_URL/user/my";
  String getToken = "$BACKEND_URL/user/token";
  String postChangeAvatar = "$BACKEND_URL/user/my/avatar";
  String postLogin = "$BACKEND_URL/user/login";
  String postRegister = "$BACKEND_URL/user/register";
}

class _Submission {
  String getUserList(String uid, String page) =>
      "$BACKEND_URL/submission/list/$uid/$page";

  String getDetail(String sid) => "$BACKEND_URL/submission/detail/$sid";

  String postCode(String sid) => "$BACKEND_URL/submission/code/$sid";
  String getLanguage = "$BACKEND_URL/submission/language";

  String socket(String sid) {
    String backendSocketUrl = BACKEND_URL.replaceAll(RegExp("/^http/"), "ws");
    return "$backendSocketUrl/ws/$sid";
  }
}

class _Contest {
  String putEdit(String cid) => "$BACKEND_URL/contest/info/$cid";

  String putQuestion(String cid) => "$BACKEND_URL/contest/question/$cid";

  String getList(String page) => "$BACKEND_URL/contest/list/$page";

  String getMyInfo(String cid) => "$BACKEND_URL/contest/my/info/$cid";

  String postSubmit(String cid, String id) =>
      "$BACKEND_URL/contest/submit/$cid/$id";

  String getClarify(String cid) => "$BACKEND_URL/contest/clarify/$cid";
  String postClarifyAdd = "$BACKEND_URL/contest/clarify/add";

  String getSubmissionList(String cid) =>
      "$BACKEND_URL/contest/submission/list/$cid";

  String getSubmissionOne(String cid, String sid) =>
      "$BACKEND_URL/contest/submission/one/$cid/$sid";

  String getScoreboard(String cid, String page) =>
      "$BACKEND_URL/contest/scoreboard/$cid/$page";

  String getInfo(String cid) => "$BACKEND_URL/contest/info/$cid";

  String getQuestions(String cid) => "$BACKEND_URL/contest/question/$cid";

  String postRegister(String cid, String operation) =>
      "$BACKEND_URL/contest/register/$cid/$operation";

  String socket(String cid, String uid) {
    String backendSocketUrl = BACKEND_URL.replaceAll(RegExp("/^http/"), "ws");
    return "$backendSocketUrl/contest/ws/$cid/$uid";
  }
}

class ApiUrl {
  static _Question question;
  static _User user;
  static _Submission submission;
  static _Contest contest;
}
