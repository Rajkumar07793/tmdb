import 'package:drift/drift.dart';

class Movies extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  RealColumn get voteAverage => real().nullable()();
  TextColumn get releaseDate => text().nullable()();

  // Flags for categorization and persistence
  BoolColumn get isTrending => boolean().withDefault(const Constant(false))();
  BoolColumn get isNowPlaying => boolean().withDefault(const Constant(false))();
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
