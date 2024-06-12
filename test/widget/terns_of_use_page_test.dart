import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/view/terms_of_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeSut() => const MaterialApp(home: TermsOfUsePage());

  testWidgets('Testando elementos da tela Termo de Uso.', (tester) async {
    await tester.pumpWidget(makeSut());
    await tester.pumpAndSettle();

    expect(find.text('Termos de Uso'), findsOneWidget);
    expect(find.byType(AppBarCustom), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(2));
  });
}
