// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _overviewMeta = const VerificationMeta(
    'overview',
  );
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
    'overview',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _posterPathMeta = const VerificationMeta(
    'posterPath',
  );
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
    'poster_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backdropPathMeta = const VerificationMeta(
    'backdropPath',
  );
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
    'backdrop_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voteAverageMeta = const VerificationMeta(
    'voteAverage',
  );
  @override
  late final GeneratedColumn<double> voteAverage = GeneratedColumn<double>(
    'vote_average',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _releaseDateMeta = const VerificationMeta(
    'releaseDate',
  );
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
    'release_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isTrendingMeta = const VerificationMeta(
    'isTrending',
  );
  @override
  late final GeneratedColumn<bool> isTrending = GeneratedColumn<bool>(
    'is_trending',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_trending" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isNowPlayingMeta = const VerificationMeta(
    'isNowPlaying',
  );
  @override
  late final GeneratedColumn<bool> isNowPlaying = GeneratedColumn<bool>(
    'is_now_playing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_now_playing" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    overview,
    posterPath,
    backdropPath,
    voteAverage,
    releaseDate,
    isTrending,
    isNowPlaying,
    isBookmarked,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Movy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(
        _overviewMeta,
        overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta),
      );
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
        _posterPathMeta,
        posterPath.isAcceptableOrUnknown(data['poster_path']!, _posterPathMeta),
      );
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
        _backdropPathMeta,
        backdropPath.isAcceptableOrUnknown(
          data['backdrop_path']!,
          _backdropPathMeta,
        ),
      );
    }
    if (data.containsKey('vote_average')) {
      context.handle(
        _voteAverageMeta,
        voteAverage.isAcceptableOrUnknown(
          data['vote_average']!,
          _voteAverageMeta,
        ),
      );
    }
    if (data.containsKey('release_date')) {
      context.handle(
        _releaseDateMeta,
        releaseDate.isAcceptableOrUnknown(
          data['release_date']!,
          _releaseDateMeta,
        ),
      );
    }
    if (data.containsKey('is_trending')) {
      context.handle(
        _isTrendingMeta,
        isTrending.isAcceptableOrUnknown(data['is_trending']!, _isTrendingMeta),
      );
    }
    if (data.containsKey('is_now_playing')) {
      context.handle(
        _isNowPlayingMeta,
        isNowPlaying.isAcceptableOrUnknown(
          data['is_now_playing']!,
          _isNowPlayingMeta,
        ),
      );
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      overview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overview'],
      )!,
      posterPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}poster_path'],
      ),
      backdropPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backdrop_path'],
      ),
      voteAverage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vote_average'],
      ),
      releaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}release_date'],
      ),
      isTrending: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_trending'],
      )!,
      isNowPlaying: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_now_playing'],
      )!,
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
    );
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(attachedDatabase, alias);
  }
}

class Movy extends DataClass implements Insertable<Movy> {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double? voteAverage;
  final String? releaseDate;
  final bool isTrending;
  final bool isNowPlaying;
  final bool isBookmarked;
  const Movy({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.releaseDate,
    required this.isTrending,
    required this.isNowPlaying,
    required this.isBookmarked,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    if (!nullToAbsent || posterPath != null) {
      map['poster_path'] = Variable<String>(posterPath);
    }
    if (!nullToAbsent || backdropPath != null) {
      map['backdrop_path'] = Variable<String>(backdropPath);
    }
    if (!nullToAbsent || voteAverage != null) {
      map['vote_average'] = Variable<double>(voteAverage);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    map['is_trending'] = Variable<bool>(isTrending);
    map['is_now_playing'] = Variable<bool>(isNowPlaying);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      title: Value(title),
      overview: Value(overview),
      posterPath: posterPath == null && nullToAbsent
          ? const Value.absent()
          : Value(posterPath),
      backdropPath: backdropPath == null && nullToAbsent
          ? const Value.absent()
          : Value(backdropPath),
      voteAverage: voteAverage == null && nullToAbsent
          ? const Value.absent()
          : Value(voteAverage),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      isTrending: Value(isTrending),
      isNowPlaying: Value(isNowPlaying),
      isBookmarked: Value(isBookmarked),
    );
  }

  factory Movy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movy(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      posterPath: serializer.fromJson<String?>(json['posterPath']),
      backdropPath: serializer.fromJson<String?>(json['backdropPath']),
      voteAverage: serializer.fromJson<double?>(json['voteAverage']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      isTrending: serializer.fromJson<bool>(json['isTrending']),
      isNowPlaying: serializer.fromJson<bool>(json['isNowPlaying']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'posterPath': serializer.toJson<String?>(posterPath),
      'backdropPath': serializer.toJson<String?>(backdropPath),
      'voteAverage': serializer.toJson<double?>(voteAverage),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'isTrending': serializer.toJson<bool>(isTrending),
      'isNowPlaying': serializer.toJson<bool>(isNowPlaying),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
    };
  }

  Movy copyWith({
    int? id,
    String? title,
    String? overview,
    Value<String?> posterPath = const Value.absent(),
    Value<String?> backdropPath = const Value.absent(),
    Value<double?> voteAverage = const Value.absent(),
    Value<String?> releaseDate = const Value.absent(),
    bool? isTrending,
    bool? isNowPlaying,
    bool? isBookmarked,
  }) => Movy(
    id: id ?? this.id,
    title: title ?? this.title,
    overview: overview ?? this.overview,
    posterPath: posterPath.present ? posterPath.value : this.posterPath,
    backdropPath: backdropPath.present ? backdropPath.value : this.backdropPath,
    voteAverage: voteAverage.present ? voteAverage.value : this.voteAverage,
    releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
    isTrending: isTrending ?? this.isTrending,
    isNowPlaying: isNowPlaying ?? this.isNowPlaying,
    isBookmarked: isBookmarked ?? this.isBookmarked,
  );
  Movy copyWithCompanion(MoviesCompanion data) {
    return Movy(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      overview: data.overview.present ? data.overview.value : this.overview,
      posterPath: data.posterPath.present
          ? data.posterPath.value
          : this.posterPath,
      backdropPath: data.backdropPath.present
          ? data.backdropPath.value
          : this.backdropPath,
      voteAverage: data.voteAverage.present
          ? data.voteAverage.value
          : this.voteAverage,
      releaseDate: data.releaseDate.present
          ? data.releaseDate.value
          : this.releaseDate,
      isTrending: data.isTrending.present
          ? data.isTrending.value
          : this.isTrending,
      isNowPlaying: data.isNowPlaying.present
          ? data.isNowPlaying.value
          : this.isNowPlaying,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Movy(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('isTrending: $isTrending, ')
          ..write('isNowPlaying: $isNowPlaying, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    overview,
    posterPath,
    backdropPath,
    voteAverage,
    releaseDate,
    isTrending,
    isNowPlaying,
    isBookmarked,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movy &&
          other.id == this.id &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.posterPath == this.posterPath &&
          other.backdropPath == this.backdropPath &&
          other.voteAverage == this.voteAverage &&
          other.releaseDate == this.releaseDate &&
          other.isTrending == this.isTrending &&
          other.isNowPlaying == this.isNowPlaying &&
          other.isBookmarked == this.isBookmarked);
}

class MoviesCompanion extends UpdateCompanion<Movy> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> overview;
  final Value<String?> posterPath;
  final Value<String?> backdropPath;
  final Value<double?> voteAverage;
  final Value<String?> releaseDate;
  final Value<bool> isTrending;
  final Value<bool> isNowPlaying;
  final Value<bool> isBookmarked;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.isTrending = const Value.absent(),
    this.isNowPlaying = const Value.absent(),
    this.isBookmarked = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String overview,
    this.posterPath = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.voteAverage = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.isTrending = const Value.absent(),
    this.isNowPlaying = const Value.absent(),
    this.isBookmarked = const Value.absent(),
  }) : title = Value(title),
       overview = Value(overview);
  static Insertable<Movy> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<String>? posterPath,
    Expression<String>? backdropPath,
    Expression<double>? voteAverage,
    Expression<String>? releaseDate,
    Expression<bool>? isTrending,
    Expression<bool>? isNowPlaying,
    Expression<bool>? isBookmarked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (posterPath != null) 'poster_path': posterPath,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (voteAverage != null) 'vote_average': voteAverage,
      if (releaseDate != null) 'release_date': releaseDate,
      if (isTrending != null) 'is_trending': isTrending,
      if (isNowPlaying != null) 'is_now_playing': isNowPlaying,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
    });
  }

  MoviesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? overview,
    Value<String?>? posterPath,
    Value<String?>? backdropPath,
    Value<double?>? voteAverage,
    Value<String?>? releaseDate,
    Value<bool>? isTrending,
    Value<bool>? isNowPlaying,
    Value<bool>? isBookmarked,
  }) {
    return MoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      isTrending: isTrending ?? this.isTrending,
      isNowPlaying: isNowPlaying ?? this.isNowPlaying,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (voteAverage.present) {
      map['vote_average'] = Variable<double>(voteAverage.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (isTrending.present) {
      map['is_trending'] = Variable<bool>(isTrending.value);
    }
    if (isNowPlaying.present) {
      map['is_now_playing'] = Variable<bool>(isNowPlaying.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('posterPath: $posterPath, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('voteAverage: $voteAverage, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('isTrending: $isTrending, ')
          ..write('isNowPlaying: $isNowPlaying, ')
          ..write('isBookmarked: $isBookmarked')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MoviesTable movies = $MoviesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}

typedef $$MoviesTableCreateCompanionBuilder =
    MoviesCompanion Function({
      Value<int> id,
      required String title,
      required String overview,
      Value<String?> posterPath,
      Value<String?> backdropPath,
      Value<double?> voteAverage,
      Value<String?> releaseDate,
      Value<bool> isTrending,
      Value<bool> isNowPlaying,
      Value<bool> isBookmarked,
    });
typedef $$MoviesTableUpdateCompanionBuilder =
    MoviesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> overview,
      Value<String?> posterPath,
      Value<String?> backdropPath,
      Value<double?> voteAverage,
      Value<String?> releaseDate,
      Value<bool> isTrending,
      Value<bool> isNowPlaying,
      Value<bool> isBookmarked,
    });

class $$MoviesTableFilterComposer
    extends Composer<_$AppDatabase, $MoviesTable> {
  $$MoviesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTrending => $composableBuilder(
    column: $table.isTrending,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNowPlaying => $composableBuilder(
    column: $table.isNowPlaying,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MoviesTableOrderingComposer
    extends Composer<_$AppDatabase, $MoviesTable> {
  $$MoviesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overview => $composableBuilder(
    column: $table.overview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTrending => $composableBuilder(
    column: $table.isTrending,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNowPlaying => $composableBuilder(
    column: $table.isNowPlaying,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MoviesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MoviesTable> {
  $$MoviesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get overview =>
      $composableBuilder(column: $table.overview, builder: (column) => column);

  GeneratedColumn<String> get posterPath => $composableBuilder(
    column: $table.posterPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backdropPath => $composableBuilder(
    column: $table.backdropPath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get voteAverage => $composableBuilder(
    column: $table.voteAverage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isTrending => $composableBuilder(
    column: $table.isTrending,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isNowPlaying => $composableBuilder(
    column: $table.isNowPlaying,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );
}

class $$MoviesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MoviesTable,
          Movy,
          $$MoviesTableFilterComposer,
          $$MoviesTableOrderingComposer,
          $$MoviesTableAnnotationComposer,
          $$MoviesTableCreateCompanionBuilder,
          $$MoviesTableUpdateCompanionBuilder,
          (Movy, BaseReferences<_$AppDatabase, $MoviesTable, Movy>),
          Movy,
          PrefetchHooks Function()
        > {
  $$MoviesTableTableManager(_$AppDatabase db, $MoviesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MoviesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MoviesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MoviesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> overview = const Value.absent(),
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<String?> releaseDate = const Value.absent(),
                Value<bool> isTrending = const Value.absent(),
                Value<bool> isNowPlaying = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
              }) => MoviesCompanion(
                id: id,
                title: title,
                overview: overview,
                posterPath: posterPath,
                backdropPath: backdropPath,
                voteAverage: voteAverage,
                releaseDate: releaseDate,
                isTrending: isTrending,
                isNowPlaying: isNowPlaying,
                isBookmarked: isBookmarked,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String overview,
                Value<String?> posterPath = const Value.absent(),
                Value<String?> backdropPath = const Value.absent(),
                Value<double?> voteAverage = const Value.absent(),
                Value<String?> releaseDate = const Value.absent(),
                Value<bool> isTrending = const Value.absent(),
                Value<bool> isNowPlaying = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
              }) => MoviesCompanion.insert(
                id: id,
                title: title,
                overview: overview,
                posterPath: posterPath,
                backdropPath: backdropPath,
                voteAverage: voteAverage,
                releaseDate: releaseDate,
                isTrending: isTrending,
                isNowPlaying: isNowPlaying,
                isBookmarked: isBookmarked,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MoviesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MoviesTable,
      Movy,
      $$MoviesTableFilterComposer,
      $$MoviesTableOrderingComposer,
      $$MoviesTableAnnotationComposer,
      $$MoviesTableCreateCompanionBuilder,
      $$MoviesTableUpdateCompanionBuilder,
      (Movy, BaseReferences<_$AppDatabase, $MoviesTable, Movy>),
      Movy,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MoviesTableTableManager get movies =>
      $$MoviesTableTableManager(_db, _db.movies);
}
