
import '../../utils/enums.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.complited(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;
}