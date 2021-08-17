class UserInfoStore {
  static final Map<String, dynamic> _items = <String, dynamic>{};
  static final UserInfoStore _cache = UserInfoStore._internal();

  UserInfoStore._internal();

  factory UserInfoStore() {
    return _cache;
  }

  set(String key, dynamic data) => _items[key] = data;
  get(String key) => _items[key];
}
