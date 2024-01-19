class Response<T> {
  bool isSuccess;
  String? message;
  T? data;

  Response(this.isSuccess, {this.message, this.data});
}
