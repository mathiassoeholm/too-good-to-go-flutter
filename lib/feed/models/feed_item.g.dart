// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeedItem> _$feedItemSerializer = new _$FeedItemSerializer();

class _$FeedItemSerializer implements StructuredSerializer<FeedItem> {
  @override
  final Iterable<Type> types = const [FeedItem, _$FeedItem];
  @override
  final String wireName = 'FeedItem';

  @override
  Iterable serialize(Serializers serializers, FeedItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'companyName',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
      'coverImage',
      serializers.serialize(object.coverImage,
          specifiedType: const FullType(String)),
      'avatarImage',
      serializers.serialize(object.avatarImage,
          specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(Location)),
      'itemsLeft',
      serializers.serialize(object.itemsLeft,
          specifiedType: const FullType(int)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
      'timeStart',
      serializers.serialize(object.timeStart,
          specifiedType: const FullType(String)),
      'timeEnd',
      serializers.serialize(object.timeEnd,
          specifiedType: const FullType(String)),
      'favorites',
      serializers.serialize(object.favorites,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  FeedItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeedItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'companyName':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'coverImage':
          result.coverImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarImage':
          result.avatarImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(Location)) as Location);
          break;
        case 'itemsLeft':
          result.itemsLeft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'price':
          result.price.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap);
          break;
        case 'timeStart':
          result.timeStart = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timeEnd':
          result.timeEnd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'favorites':
          result.favorites = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$FeedItem extends FeedItem {
  @override
  final String companyName;
  @override
  final String coverImage;
  @override
  final String avatarImage;
  @override
  final Location location;
  @override
  final int itemsLeft;
  @override
  final BuiltMap<String, int> price;
  @override
  final String timeStart;
  @override
  final String timeEnd;
  @override
  final int favorites;

  factory _$FeedItem([void updates(FeedItemBuilder b)]) =>
      (new FeedItemBuilder()..update(updates)).build();

  _$FeedItem._(
      {this.companyName,
      this.coverImage,
      this.avatarImage,
      this.location,
      this.itemsLeft,
      this.price,
      this.timeStart,
      this.timeEnd,
      this.favorites})
      : super._() {
    if (companyName == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'companyName');
    }
    if (coverImage == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'coverImage');
    }
    if (avatarImage == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'avatarImage');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'location');
    }
    if (itemsLeft == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'itemsLeft');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'price');
    }
    if (timeStart == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'timeStart');
    }
    if (timeEnd == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'timeEnd');
    }
    if (favorites == null) {
      throw new BuiltValueNullFieldError('FeedItem', 'favorites');
    }
  }

  @override
  FeedItem rebuild(void updates(FeedItemBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedItemBuilder toBuilder() => new FeedItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeedItem &&
        companyName == other.companyName &&
        coverImage == other.coverImage &&
        avatarImage == other.avatarImage &&
        location == other.location &&
        itemsLeft == other.itemsLeft &&
        price == other.price &&
        timeStart == other.timeStart &&
        timeEnd == other.timeEnd &&
        favorites == other.favorites;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, companyName.hashCode),
                                    coverImage.hashCode),
                                avatarImage.hashCode),
                            location.hashCode),
                        itemsLeft.hashCode),
                    price.hashCode),
                timeStart.hashCode),
            timeEnd.hashCode),
        favorites.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FeedItem')
          ..add('companyName', companyName)
          ..add('coverImage', coverImage)
          ..add('avatarImage', avatarImage)
          ..add('location', location)
          ..add('itemsLeft', itemsLeft)
          ..add('price', price)
          ..add('timeStart', timeStart)
          ..add('timeEnd', timeEnd)
          ..add('favorites', favorites))
        .toString();
  }
}

class FeedItemBuilder implements Builder<FeedItem, FeedItemBuilder> {
  _$FeedItem _$v;

  String _companyName;
  String get companyName => _$this._companyName;
  set companyName(String companyName) => _$this._companyName = companyName;

  String _coverImage;
  String get coverImage => _$this._coverImage;
  set coverImage(String coverImage) => _$this._coverImage = coverImage;

  String _avatarImage;
  String get avatarImage => _$this._avatarImage;
  set avatarImage(String avatarImage) => _$this._avatarImage = avatarImage;

  LocationBuilder _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder location) => _$this._location = location;

  int _itemsLeft;
  int get itemsLeft => _$this._itemsLeft;
  set itemsLeft(int itemsLeft) => _$this._itemsLeft = itemsLeft;

  MapBuilder<String, int> _price;
  MapBuilder<String, int> get price =>
      _$this._price ??= new MapBuilder<String, int>();
  set price(MapBuilder<String, int> price) => _$this._price = price;

  String _timeStart;
  String get timeStart => _$this._timeStart;
  set timeStart(String timeStart) => _$this._timeStart = timeStart;

  String _timeEnd;
  String get timeEnd => _$this._timeEnd;
  set timeEnd(String timeEnd) => _$this._timeEnd = timeEnd;

  int _favorites;
  int get favorites => _$this._favorites;
  set favorites(int favorites) => _$this._favorites = favorites;

  FeedItemBuilder();

  FeedItemBuilder get _$this {
    if (_$v != null) {
      _companyName = _$v.companyName;
      _coverImage = _$v.coverImage;
      _avatarImage = _$v.avatarImage;
      _location = _$v.location?.toBuilder();
      _itemsLeft = _$v.itemsLeft;
      _price = _$v.price?.toBuilder();
      _timeStart = _$v.timeStart;
      _timeEnd = _$v.timeEnd;
      _favorites = _$v.favorites;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeedItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FeedItem;
  }

  @override
  void update(void updates(FeedItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FeedItem build() {
    _$FeedItem _$result;
    try {
      _$result = _$v ??
          new _$FeedItem._(
              companyName: companyName,
              coverImage: coverImage,
              avatarImage: avatarImage,
              location: location.build(),
              itemsLeft: itemsLeft,
              price: price.build(),
              timeStart: timeStart,
              timeEnd: timeEnd,
              favorites: favorites);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'location';
        location.build();

        _$failedField = 'price';
        price.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FeedItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
