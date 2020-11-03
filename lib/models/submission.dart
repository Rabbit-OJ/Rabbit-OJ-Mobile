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
