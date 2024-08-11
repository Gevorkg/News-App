part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}


class PostSportsFetchEvent extends PostEvent{ }

class PostWorldFetchEvent extends PostEvent{}

class PostBusinessFetchEvent extends PostEvent{}

class PostHealthFetchEvent extends PostEvent{}

class PostEnvironmentFetchEvent extends PostEvent{}