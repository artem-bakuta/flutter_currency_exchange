class Currency {
  String key;
  String name;
  double exchange;

  Currency(this.key, this.name, this.exchange);

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'name': name,
      'exchange': exchange,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      map['key'] as String,
      map['name'] as String,
      map['exchange'] as double,
    );
  }
}
