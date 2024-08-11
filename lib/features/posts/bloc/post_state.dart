part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

abstract class PostActionState extends PostState{}

class PostFetchingLoadingState extends PostState{}

class PostFetchingErrorState extends PostState{}


class PostFetchSuccessfulState extends PostState{
  final List<PostDataUiModel> posts;

  PostFetchSuccessfulState({required this.posts});
}