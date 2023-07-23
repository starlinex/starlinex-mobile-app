class ApiResponse<T> {
  final bool _status;
  final T? _data;
  final String? _message ;
  final String? _error;

  ApiResponse(this._status, this._data, this._message, this._error);

  ApiResponse.success(T _data) : this(true, _data, null,null);

  ApiResponse.error(String _error) : this(false, null, null,_error);

  ApiResponse.empty() : this(true, null, null,null);

  bool isSuccess() => _status;

  bool isEmpty() => isSuccess() && _data == null;

  T data() => _data!;

  T? peek() => _data;

  String error() => _error!;

  @override
  String toString() {
    return "Status : $_status \n Message : $_message \n Data : $data";
  }
}

