class ResponseAPI<T> {
  bool ok;
  String msg;
  T data;

  ResponseAPI.ok(this.data) {
    this.ok = true;
  }

  ResponseAPI.error(this.msg) {
    this.ok = false;
  }
}