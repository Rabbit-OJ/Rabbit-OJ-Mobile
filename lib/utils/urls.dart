const bool inProduction = const bool.fromEnvironment("dart.vm.product");
const String BACKEND_URL =
    inProduction ? "https://oj.6rabbit.com/api" : "http://localhost:8888";

class _Question {
  static String getList(String page) => "$BACKEND_URL/question/list/$page";

  static String optionsItem(String tid) => "$BACKEND_URL/question/item/$tid";
  static String postCreate = "$BACKEND_URL/question/item";

  static String putEdit(String tid) => "$BACKEND_URL/question/item/$tid";

  static String postSubmit(String tid) => "$BACKEND_URL/question/submit/$tid";

  static String getRecord(String tid, String page) =>
      "$BACKEND_URL/question/record/$tid/$page";

  static String optionsJudge(String tid) => "$BACKEND_URL/question/judge/$tid";
}

class _User {
  static String getInfo(String username) => "$BACKEND_URL/user/info/$username";

  static String avatar(String uid) => "$BACKEND_URL/user/avatar/$uid";
  static String getMy = "$BACKEND_URL/user/my";
  static String getToken = "$BACKEND_URL/user/token";
  static String postChangeAvatar = "$BACKEND_URL/user/my/avatar";
  static String postLogin = "$BACKEND_URL/user/login";
  static String postRegister = "$BACKEND_URL/user/register";
}

class _Submission {
  static String getUserList(String uid, String page) =>
      "$BACKEND_URL/submission/list/$uid/$page";

  static String getDetail(String sid) => "$BACKEND_URL/submission/detail/$sid";

  static String postCode(String sid) => "$BACKEND_URL/submission/code/$sid";
  static String getLanguage = "$BACKEND_URL/submission/language";

  static String socket(String sid) {
    String backendSocketUrl = BACKEND_URL.replaceAll(RegExp("/^http/"), "ws");
    return "$backendSocketUrl/ws/$sid";
  }
}

class _Contest {
  static String putEdit(String cid) => "$BACKEND_URL/contest/info/$cid";

  static String putQuestion(String cid) =>
      "$BACKEND_URL/contest/question/$cid";

  static String getList(String page) => "$BACKEND_URL/contest/list/$page";

  static String getMyInfo(String cid) => "$BACKEND_URL/contest/my/info/$cid";

  static String postSubmit(String cid, String id) =>
      "$BACKEND_URL/contest/submit/$cid/$id";

  static String getClarify(String cid) => "$BACKEND_URL/contest/clarify/$cid";
  static String postClarifyAdd = "$BACKEND_URL/contest/clarify/add";

  static String getSubmissionList(String cid) =>
      "$BACKEND_URL/contest/submission/list/$cid";

  static String getSubmissionOne(String cid, String sid) =>
      "$BACKEND_URL/contest/submission/one/$cid/$sid";

  static String getScoreboard(String cid, String page) =>
      "$BACKEND_URL/contest/scoreboard/$cid/$page";

  static String getInfo(String cid) => "$BACKEND_URL/contest/info/$cid";

  static String getQuestions(String cid) =>
      "$BACKEND_URL/contest/question/$cid";

  static String postRegister(String cid, String operation) =>
      "$BACKEND_URL/contest/register/$cid/$operation";

  static String socket(String cid, String uid) {
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
