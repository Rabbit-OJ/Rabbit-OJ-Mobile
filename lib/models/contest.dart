class Contest {
  int cid;
  String name;
  int uid;
  DateTime startTime;
  DateTime endTime;
  int status;
  int participants;
  int penalty;

  Contest(this.cid, this.name, this.uid, this.startTime, this.endTime,
      this.status, this.participants, this.penalty);

  Contest.demo(int cid, String name, int status)
      : this(cid, name, 1, DateTime.now(), DateTime.now(), status, 1, 300);
}
