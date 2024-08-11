import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/posts/models/post_model_data.dart';
import 'package:news_app/features/posts/repos/post_repos.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostSportsFetchEvent>(postSportsFetchEvent);
    on<PostWorldFetchEvent>(postWorldFetchEvent);
    on<PostBusinessFetchEvent>(postBusinessFetchEvent);
    on<PostHealthFetchEvent>(postHealthFetchEvent);
    on<PostEnvironmentFetchEvent>(postEnvironmentFetchEvent);
  }

  FutureOr<void> postSportsFetchEvent(
      PostSportsFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    Future.delayed(Duration(milliseconds: 500));
    List<PostDataUiModel> posts = await SportsRepo.fetchPost();

    emit(PostFetchSuccessfulState(posts: posts));
  }

  FutureOr<void> postWorldFetchEvent(
      PostWorldFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    Future.delayed(Duration(milliseconds: 500));
    List<PostDataUiModel> posts = await WorldRepo.fetchPost();

    emit(PostFetchSuccessfulState(posts: posts));
  }

  FutureOr<void> postBusinessFetchEvent(
      PostBusinessFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    Future.delayed(Duration(milliseconds: 500));
    List<PostDataUiModel> posts = await BusinessRepo.fetchPost();

    emit(PostFetchSuccessfulState(posts: posts));
  }

  Future<FutureOr<void>> postHealthFetchEvent(
      PostHealthFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    Future.delayed(Duration(milliseconds: 500));
    List<PostDataUiModel> posts = await HealthRepo.fetchPost();

    emit(PostFetchSuccessfulState(posts: posts));
  }

  FutureOr<void> postEnvironmentFetchEvent(
      PostEnvironmentFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    Future.delayed(Duration(milliseconds: 500));
    List<PostDataUiModel> posts = await EnvironmentRepo.fetchPost();

    emit(PostFetchSuccessfulState(posts: posts));
  }
}
