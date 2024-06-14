import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:dart_movies_app/view/search_page.dart';
import 'package:dart_movies_app/bloc/media/media_bloc.dart';
import 'package:mockito/annotations.dart';

import 'search_page_test.mocks.dart';

@GenerateMocks([MediaBloc])
void main() {
  testWidgets('SearchMovieEvent is dispatched correctly',
      (WidgetTester tester) async {
    final mediaBloc = MockMediaBloc();

    when(mediaBloc.state).thenReturn(MediaInitial());
    when(mediaBloc.stream)
        .thenAnswer((_) => Stream.fromIterable([MediaInitial()]));

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<MediaBloc>(create: (_) => mediaBloc),
        ],
        child: MaterialApp(
          home: SearchPage(),
        ),
      ),
    );

    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);

    await tester.enterText(searchField, 'maxx');

    verify(mediaBloc.add(
        argThat(predicate((event) => event is SearchMovieEvent)))).called(1);
  });

  testWidgets(
      'Checks when typing less than three characters and greater than or equal to three',
      (WidgetTester tester) async {
    final mediaBloc = MockMediaBloc();

    when(mediaBloc.state).thenReturn(MediaInitial());
    when(mediaBloc.stream)
        .thenAnswer((_) => Stream.fromIterable([MediaInitial()]));

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<MediaBloc>(create: (_) => mediaBloc),
        ],
        child: MaterialApp(
          home: SearchPage(),
        ),
      ),
    );

    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    await tester.enterText(textField, 'ab');
    expect(mediaBloc.state, isNot(SearchMovieEvent));

    await tester.enterText(textField, 'abc');
    verify(mediaBloc.add(
      argThat(predicate(
          (event) => event is SearchMovieEvent && event.value == 'abc')),
    )).called(1);
  });
}
