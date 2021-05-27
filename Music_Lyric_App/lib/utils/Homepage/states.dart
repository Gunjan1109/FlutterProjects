import 'package:equatable/equatable.dart';

abstract class MusicState extends Equatable{
  List<Object> get props => [];
}

class MusicInitState extends MusicState {}

class MusicLoading extends MusicState {}

class MusicLoaded extends MusicState{
  final List music;
  MusicLoaded({this.music});
}

class MusicError extends MusicState {
  final error;
  MusicError({this.error});
}