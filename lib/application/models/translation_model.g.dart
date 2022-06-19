// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationModelAdapter extends TypeAdapter<TranslationModel> {
  @override
  final int typeId = 0;

  @override
  TranslationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranslationModel(
      id: fields[0] as String,
      text: fields[1] as String,
      sourceLanguage: fields[2] as LanguageTypes,
      translateTime: fields[3] as DateTime,
      translatedTexts: (fields[4] as Map).cast<LanguageTypes, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TranslationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.sourceLanguage)
      ..writeByte(3)
      ..write(obj.translateTime)
      ..writeByte(4)
      ..write(obj.translatedTexts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
