class SubmissionLite {
  int sid;
  int uid;
  int tid;
  String questionTitle;
  String status;
  String language;
  int timeUsed;
  int spaceUsed;
  DateTime createdAt;

  SubmissionLite(this.sid, this.uid, this.tid, this.questionTitle, this.status,
      this.language, this.timeUsed, this.spaceUsed, this.createdAt);

  SubmissionLite.demo(int sid, String status)
      : this(sid, 1, 1, "A + B Problem", status, "cpp", 1, 1, DateTime.now());
}

class JudgeResult {
  String judge;
  int timeUsed;
  int spaceUsed;

  JudgeResult(this.judge, this.timeUsed, this.spaceUsed);

  JudgeResult.demo() : this("AC", 1, 1);
}

class Submission {
  int sid;
  int uid;
  int tid;
  String questionTitle;
  String judgeStatus;
  String language;
  int timeUsed;
  int spaceUsed;
  DateTime createdAt;
  List<JudgeResult> judge;

  Submission(this.sid, this.uid, this.tid, this.questionTitle, this.judgeStatus,
      this.language, this.timeUsed, this.spaceUsed, this.createdAt, this.judge);

  Submission.demo(String status)
      : this(1, 1, 1, "A + B Problem", status, "cpp17", 1, 1, DateTime.now(),
            [JudgeResult.demo()]);
}
