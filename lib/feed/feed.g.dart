// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Feed extends Feed {
  @override
  final List<FeedItem> items;
  @override
  final FeedItem selectedItem;
  @override
  final bool isFetching;
  @override
  final Exception fetchError;

  factory _$Feed([void updates(FeedBuilder b)]) =>
      (new FeedBuilder()..update(updates)).build();

  _$Feed._({this.items, this.selectedItem, this.isFetching, this.fetchError})
      : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('Feed', 'items');
    }
    if (isFetching == null) {
      throw new BuiltValueNullFieldError('Feed', 'isFetching');
    }
  }

  @override
  Feed rebuild(void updates(FeedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedBuilder toBuilder() => new FeedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Feed &&
        items == other.items &&
        selectedItem == other.selectedItem &&
        isFetching == other.isFetching &&
        fetchError == other.fetchError;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, items.hashCode), selectedItem.hashCode),
            isFetching.hashCode),
        fetchError.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Feed')
          ..add('items', items)
          ..add('selectedItem', selectedItem)
          ..add('isFetching', isFetching)
          ..add('fetchError', fetchError))
        .toString();
  }
}

class FeedBuilder implements Builder<Feed, FeedBuilder> {
  _$Feed _$v;

  List<FeedItem> _items;
  List<FeedItem> get items => _$this._items;
  set items(List<FeedItem> items) => _$this._items = items;

  FeedItemBuilder _selectedItem;
  FeedItemBuilder get selectedItem =>
      _$this._selectedItem ??= new FeedItemBuilder();
  set selectedItem(FeedItemBuilder selectedItem) =>
      _$this._selectedItem = selectedItem;

  bool _isFetching;
  bool get isFetching => _$this._isFetching;
  set isFetching(bool isFetching) => _$this._isFetching = isFetching;

  Exception _fetchError;
  Exception get fetchError => _$this._fetchError;
  set fetchError(Exception fetchError) => _$this._fetchError = fetchError;

  FeedBuilder();

  FeedBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _selectedItem = _$v.selectedItem?.toBuilder();
      _isFetching = _$v.isFetching;
      _fetchError = _$v.fetchError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Feed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Feed;
  }

  @override
  void update(void updates(FeedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Feed build() {
    _$Feed _$result;
    try {
      _$result = _$v ??
          new _$Feed._(
              items: items,
              selectedItem: _selectedItem?.build(),
              isFetching: isFetching,
              fetchError: fetchError);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'selectedItem';
        _selectedItem?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Feed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
