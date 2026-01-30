import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kavach/main.dart';
import 'package:kavach/services/storage_service.dart';

void main() {
  testWidgets('App splash screen smoke test', (WidgetTester tester) async {
    // Initialize mock shared preferences
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final storageService = StorageService(prefs);

    // Build our app and trigger a frame.
    await tester.pumpWidget(KrishiKavachApp(storageService: storageService));

    // Verify that the splash screen shows the app name
    expect(find.text('Krishi Kavach'), findsOneWidget);
    expect(find.text('कृषि कवच'), findsOneWidget);
  });
}
