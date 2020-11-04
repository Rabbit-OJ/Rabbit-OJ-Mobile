class Sample {
  String input;
  String output;

  Sample(this.input, this.output);

  Sample.demo() : this("1 2", "3");
}

class ProblemDetail {
  int tid;
  String subject;
  String content;
  int attempt;
  int accept;
  int difficulty;
  int timeLimit;
  int spaceLimit;
  DateTime createdAt;
  bool hide;
  List<Sample> sample;

  ProblemDetail(
      this.tid,
      this.subject,
      this.content,
      this.attempt,
      this.accept,
      this.difficulty,
      this.timeLimit,
      this.spaceLimit,
      this.createdAt,
      this.hide,
      this.sample);

  ProblemDetail.demo(String subject, String content)
      : this(1, subject, content, 10, 20, 1, 1000, 128, DateTime.now(), false,
            <Sample>[Sample.demo()]);
}
