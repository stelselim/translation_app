// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_constants.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageTypesAdapter extends TypeAdapter<LanguageTypes> {
  @override
  final int typeId = 1;

  @override
  LanguageTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguageTypes.invalid;
      case 1:
        return LanguageTypes.afrikaans;
      case 2:
        return LanguageTypes.arabic;
      case 3:
        return LanguageTypes.english;
      case 4:
        return LanguageTypes.french;
      case 5:
        return LanguageTypes.turkish;
      case 6:
        return LanguageTypes.italian;
      case 7:
        return LanguageTypes.spanish;
      case 8:
        return LanguageTypes.chineseSimplified;
      default:
        return LanguageTypes.invalid;
    }
  }

  @override
  void write(BinaryWriter writer, LanguageTypes obj) {
    switch (obj) {
      case LanguageTypes.invalid:
        writer.writeByte(0);
        break;
      case LanguageTypes.afrikaans:
        writer.writeByte(1);
        break;
      case LanguageTypes.arabic:
        writer.writeByte(2);
        break;
      case LanguageTypes.english:
        writer.writeByte(3);
        break;
      case LanguageTypes.french:
        writer.writeByte(4);
        break;
      case LanguageTypes.turkish:
        writer.writeByte(5);
        break;
      case LanguageTypes.italian:
        writer.writeByte(6);
        break;
      case LanguageTypes.spanish:
        writer.writeByte(7);
        break;
      case LanguageTypes.chineseSimplified:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
