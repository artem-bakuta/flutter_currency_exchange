class CurrencyResponse {
  List<Currencies>? _currencies;
  int? _timestamp;

  CurrencyResponse({List<Currencies>? currencies, int? timestamp}) {
    if (currencies != null) {
      _currencies = currencies;
    }
    if (timestamp != null) {
      _timestamp = timestamp;
    }
  }

  List<Currencies>? get currencies => _currencies;

  set currencies(List<Currencies>? currencies) => _currencies = currencies;

  int? get timestamp => _timestamp;

  set timestamp(int? timestamp) => _timestamp = timestamp;

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    if (json['currencies'] != null) {
      _currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        _currencies!.add(Currencies.fromJson(v));
      });
    }
    _timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (_currencies != null) {
      data['currencies'] = _currencies!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = _timestamp;
    return data;
  }
}

class Currencies {
  String? _key;
  String? _name;
  double? _exchange;

  Currencies({String? key, String? name, double? exchange}) {
    if (key != null) {
      _key = key;
    }
    if (name != null) {
      _name = name;
    }
    if (exchange != null) {
      _exchange = exchange;
    }
  }

  String? get key => _key;

  set key(String? key) => _key = key;

  String? get name => _name;

  set name(String? name) => _name = name;

  double? get exchange => _exchange;

  set exchange(double? exchange) => _exchange = exchange;

  Currencies.fromJson(Map<String, dynamic> json) {
    _key = json['key'];
    _name = json['name'];
    _exchange = json['exchange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['key'] = _key;
    data['name'] = _name;
    data['exchange'] = _exchange;
    return data;
  }
}
