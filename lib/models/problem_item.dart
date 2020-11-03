class ProblemItem {
  int tid;
  int uid;
  String subject;
  int attempt;
  int accept;
  int difficulty;
  int timeLimit;
  int spaceLimit;
  DateTime createdAt;

  ProblemItem(this.tid, this.uid, this.subject, this.attempt, this.accept,
      this.difficulty, this.timeLimit, this.spaceLimit, this.createdAt);

  ProblemItem.demo(int tid, int difficulty)
      : this(tid, 1, "A + B Problem", 12, 24, difficulty, 1000, 128,
            DateTime.now());
}
