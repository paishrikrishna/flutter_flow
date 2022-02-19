import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _mobile = prefs.getString('ff_mobile') ?? _mobile;
    _uasd = prefs.getBool('ff_uasd') ?? _uasd;
    _visib = prefs.getBool('ff_visib') ?? _visib;
  }

  SharedPreferences prefs;

  String name = '';

  String gender = '';

  String _mobile = '';
  String get mobile => _mobile;
  set mobile(String _value) {
    _mobile = _value;
    prefs.setString('ff_mobile', _value);
  }

  String otp = '';

  bool _uasd = false;
  bool get uasd => _uasd;
  set uasd(bool _value) {
    _uasd = _value;
    prefs.setBool('ff_uasd', _value);
  }

  String last = '';

  String date = '';

  bool termsconditions = false;

  bool _visib = false;
  bool get visib => _visib;
  set visib(bool _value) {
    _visib = _value;
    prefs.setBool('ff_visib', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
