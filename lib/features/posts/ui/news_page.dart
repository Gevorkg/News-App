// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app/features/posts/bloc/post_bloc.dart';
import 'package:news_app/features/posts/ui/news_details_page.dart';
import 'package:news_app/features/side/colors.dart';
import 'package:news_app/features/side/text.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PageController _pageController = PageController();
  final PostBloc postBloc = PostBloc();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchPostsForIndex(_selectedIndex);
  }

  void _fetchPostsForIndex(int index) {
    switch (index) {
      case 0:
        postBloc.add(PostWorldFetchEvent());
        break;
      case 1:
        postBloc.add(PostSportsFetchEvent());
        break;
      case 2:
        postBloc.add(PostBusinessFetchEvent());
        break;
      case 3:
        postBloc.add(PostHealthFetchEvent());
        break;
      case 4:
        postBloc.add(PostEnvironmentFetchEvent());
        break;
      default:
        postBloc.add(PostWorldFetchEvent());
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Map<String, dynamic>? _selectedNews;
    });
    _fetchPostsForIndex(index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          _selectedIndex == 0
              ? 'World'
              : _selectedIndex == 1
                  ? 'Sports'
                  : _selectedIndex == 2
                      ? 'Business'
                      : _selectedIndex == 3
                          ? 'Health'
                          : 'Environment',
          style: GoogleFonts.roboto(
              color: mainBlue, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: mainBlue, size: 30)),
          SizedBox(width: 15),
          Text(
            'Log in',
            style: GoogleFonts.roboto(
                color: mainBlue, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: mainBlue, size: 30)),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildPostPage(context),
          _buildPostPage(context),
          _buildPostPage(context),
          _buildPostPage(context),
          _buildPostPage(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.public, size: 24),
            label: 'World',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer, size: 24),
            label: 'Sports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, size: 24),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety, size: 24),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco, size: 24),
            label: 'Environment',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainBlue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildPostPage(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      bloc: postBloc,
      listenWhen: (previous, current) => current is PostActionState,
      buildWhen: (previous, current) => current is! PostActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PostFetchingLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PostFetchSuccessfulState) {
          final successState = state as PostFetchSuccessfulState;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (successState.posts.isNotEmpty &&
                      successState.posts[0].imageUrl != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsPage(
                              title: decodeText(successState.posts[0].title),
                              imageUrl:
                                  successState.posts[0].imageUrl.toString(),
                              description: decodeText(
                                  successState.posts[0].description ?? ''),
                              keywords: convertToUpperCase(decodeText(
                                  successState.posts[0].keywords
                                      .join('')
                                      .toString())),
                              pubDate: successState.posts[0].pubDate,
                              sourceName: successState.posts[0].sourceName,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                successState.posts[0].imageUrl.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsPage(
                              title: decodeText(successState.posts[0].title),
                              imageUrl:
                                  successState.posts[0].imageUrl.toString(),
                              description: decodeText(
                                  successState.posts[0].description ?? ''),
                              keywords: convertToUpperCase(decodeText(
                                  successState.posts[0].keywords
                                      .join('')
                                      .toString())),
                              pubDate: successState.posts[0].pubDate,
                              sourceName: successState.posts[0].sourceName),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          convertToUpperCase(decodeText(successState
                              .posts[0].keywords
                              .join('')
                              .toString()
                              .toUpperCase())),
                          style: TextStyle(
                              color: sport,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          decodeText(successState.posts[0].title),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      color: Colors.black.withOpacity(0.6),
                      height: 20,
                      thickness: 3,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: successState.posts.length - 1,
                    itemBuilder: (BuildContext context, int index) {
                      final actualIndex = index + 1;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsPage(
                                  title: decodeText(
                                      successState.posts[actualIndex].title),
                                  imageUrl: successState
                                      .posts[actualIndex].imageUrl
                                      .toString(),
                                  description: decodeText(successState
                                          .posts[actualIndex].description ??
                                      ''),
                                  keywords: convertToUpperCase(decodeText(
                                      successState.posts[actualIndex].keywords
                                          .join('')
                                          .toString())),
                                  pubDate:
                                      successState.posts[actualIndex].pubDate,
                                  sourceName: successState
                                      .posts[actualIndex].sourceName),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (successState
                                          .posts[actualIndex].imageUrl !=
                                      null)
                                    Container(
                                      height: 200,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(successState
                                              .posts[actualIndex].imageUrl
                                              .toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            convertToUpperCase(decodeText(
                                                successState
                                                    .posts[actualIndex].keywords
                                                    .join('')
                                                    .toString()
                                                    .toUpperCase())),
                                            style: TextStyle(
                                                color: sport,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            maxLines: 6,
                                            decodeText(successState
                                                .posts[actualIndex].title),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                  color: Colors.black.withOpacity(0.6),
                                  thickness: 2),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
