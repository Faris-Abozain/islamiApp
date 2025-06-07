class SuraData {
  String suraNumber;
  String suraNameAr;
  String suraNameEn;
  String verses;

  SuraData(
      {required this.suraNumber, required this.suraNameAr, required this.suraNameEn, required this.verses});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuraData &&
          runtimeType == other.runtimeType &&
          verses == other.verses;

  @override
  int get hashCode => verses.hashCode;
}
