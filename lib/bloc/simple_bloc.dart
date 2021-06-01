import 'dart:async';

class SimpleBloc<T> {
  final _streamController = StreamController<T>();
  Stream<T> get stream => _streamController.stream;

  void add(T object) {
    if(!_streamController.isClosed) {
      _streamController.add(object); 
    }
  }

  void addError(Object error) {
    if(!_streamController.isClosed) {
      _streamController.addError(error);
    }
  }

  void dispose() {
    if(!_streamController.isClosed) {
      _streamController.close();
    }
  }
}