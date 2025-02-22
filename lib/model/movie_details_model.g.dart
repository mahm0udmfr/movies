// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsAdapter extends TypeAdapter<MovieDetails> {
  @override
  final int typeId = 0;

  @override
  MovieDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetails(
      id: fields[0] as int?,
      title: fields[1] as String?,
      year: fields[4] as int?,
      rating: fields[5] as num?,
      largeCoverImage: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetails obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(2)
      ..write(obj.largeCoverImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
