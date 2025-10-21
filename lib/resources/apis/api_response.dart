class ApiResponse {
  final List<dynamic>? list;
  final Map<String, dynamic>? map;

  ApiResponse({this.list, this.map});

  factory ApiResponse.from(dynamic data) {
    if (data is List) {
      return ApiResponse(list: data);
    } else if (data is Map<String, dynamic>) {
      return ApiResponse(map: data);
    } else {
      throw Exception("Unexpected response type: ${data.runtimeType}");
    }
  }

  bool get isList => list != null;
  bool get isMap => map != null;
}
