class ButtonData {
  final String text;
  final buttonStyle style;

  ButtonData({required this.text, required this.style});

  factory ButtonData.fromJson(Map<String, dynamic> json) {
    return ButtonData(
        text: json['text'], style: buttonStyle.fromJson(json['style']));
  }
}

class buttonStyle {
  final String backgroundColor;
  final String textColor;
  final double fontSize;

  buttonStyle({
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
  });

  factory buttonStyle.fromJson(Map<String, dynamic> json) {
    return buttonStyle(
      backgroundColor: json['backgroundColor'],
      textColor: json['textColor'],
      fontSize: json['fontSize'].toDouble(),
    );
  }
}
