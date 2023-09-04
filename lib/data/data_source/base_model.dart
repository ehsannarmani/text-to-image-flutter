class BaseModel<T>{
  late ResponseStatus status;
  late T data;
  late String message;

  BaseModel.loading(): status = ResponseStatus.Loading;
  BaseModel.success(this.data): status = ResponseStatus.Success;
  BaseModel.failed(this.message):status = ResponseStatus.Failed;

  @override
  String toString() {
    return "Status: $status\nmessage: $message\ndata: $data";
  }
}
enum ResponseStatus{Loading,Success,Failed}