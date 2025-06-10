class CurrencyModel {
  final String date;
  final String time;
  final String name;
  final String name_en;
  final int price;
  final String unit;
  final int change_value;
  final double change_percent;

  CurrencyModel({
    required this.name_en,
    required this.change_percent,
    required this.change_value,
    required this.date,
    required this.time,
    required this.name,
    required this.price,
    required this.unit,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      change_percent: double.tryParse(json['change_percent'].toString()) ?? 0.0,
      change_value: int.tryParse(json['change_value'].toString()) ?? 0,
      name_en: json['name_en'] ?? 'Unknown',
      date: json['date'] ?? 'Unknown',
      time: json['time'] ?? 'Unknown',
      name: json['name'] ?? 'Unknown',
      price: int.tryParse(json['price'].toString()) ?? 0,
      unit: json['unit'] ?? 'Unknown',
    );
  }

  @override
  String toString() {
    return 'CurrencyModel(name: $name, price: $price $unit at $time on $date , ENGLISH name: $name_en, percent change: $change_percent, Value change: $change_value )';
  }
}
