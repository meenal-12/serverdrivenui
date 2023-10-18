class CardData {
  final String title;
  final String description;
  final CardStyle style;

  CardData(
      {required this.title, required this.description, required this.style});

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      title: json['title'],
      description: json['description'],
      style: CardStyle.fromJson(json['style']),
    );
  }
}

class CardStyle {
  final String backgroundColor;
  final String textColor;
  final double fontSize;

  CardStyle({
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
  });

  factory CardStyle.fromJson(Map<String, dynamic> json) {
    return CardStyle(
      backgroundColor: json['backgroundColor'],
      textColor: json['textColor'],
      fontSize: json['fontSize'].toDouble(),
    );
  }
}
