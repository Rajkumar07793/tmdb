# TMDB API Connection Troubleshooting

## Issue
Getting connection timeout errors when calling TMDB API from the Flutter app, but Postman works fine.

## What's Working
✅ API key is correctly passed in the URL: `api_key=fb7bb23f03b6994dafc674c074d01761`  
✅ Retrofit code generation successful  
✅ Android INTERNET permission is set  
✅ Timeout increased to 30 seconds

## Possible Causes & Solutions

### 1. **Network/Proxy Issues**

The app might be behind a proxy or firewall that Postman bypasses.

**Test:**
```bash
# From terminal, test if the API is reachable
curl "https://api.themoviedb.org/3/movie/now_playing?api_key=fb7bb23f03b6994dafc674c074d01761"
```

**Solution:** If you're behind a corporate proxy, configure Dio to use it:
```dart
// In api_client.dart
_dio.httpClientAdapter = IOHttpClientAdapter(
  createHttpClient: () {
    final client = HttpClient();
    client.findProxy = (uri) {
      return 'PROXY your-proxy-host:port';
    };
    return client;
  },
);
```

### 2. **Android Emulator Network**

Android emulators sometimes have network connectivity issues.

**Solutions:**
- Try on a **physical device** instead of emulator
- Restart the emulator
- Check emulator's network settings (Settings → Network & Internet)

### 3. **DNS Resolution**

The device might not be able to resolve `api.themoviedb.org`.

**Test on device:**
```dart
// Add this temporarily in your repository to test
try {
  final addresses = await InternetAddress.lookup('api.themoviedb.org');
  print('DNS resolved: $addresses');
} catch (e) {
  print('DNS failed: $e');
}
```

### 4. **Use HTTP Client Directly (Bypass Dio)**

Temporarily test with raw HTTP to isolate the issue:

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

// Test method
Future<void> testDirectHttp() async {
  try {
    final url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=fb7bb23f03b6994dafc674c074d01761';
    final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
  } catch (e) {
    print('Error: $e');
  }
}
```

### 5. **Check Device Time**

SSL certificates can fail if device time is incorrect.

**Fix:** Ensure your device/emulator has the correct date and time.

### 6. **Offline Mode Testing**

Since the app has offline support, you can test the UI with cached data:

1. Manually insert test data into the database
2. Or use mock data in the repository

## Quick Test

Run this in your `main.dart` before the app starts:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Test API connectivity
  try {
    final dio = Dio();
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/now_playing',
      queryParameters: {'api_key': 'fb7bb23f03b6994dafc674c074d01761'},
    ).timeout(Duration(seconds: 30));
    print('✅ API Test Success: ${response.statusCode}');
  } catch (e) {
    print('❌ API Test Failed: $e');
  }
  
  // Continue with normal app initialization
  runApp(MyApp(...));
}
```

## Next Steps

1. **Try on physical device** - Most reliable test
2. **Check network logs** - Use Android Studio's Network Profiler
3. **Test with VPN** - If behind restrictive network
4. **Use mock data** - For development without API dependency
