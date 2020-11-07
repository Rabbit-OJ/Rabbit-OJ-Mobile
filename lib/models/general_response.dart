class GeneralResponse<T> {
  int code;
  T message;
  GeneralResponse(this.code, this.message);
}

class GeneralListResponse<T> {
  int count;
  List<T> list;

  GeneralListResponse(this.count, this.list);
}
