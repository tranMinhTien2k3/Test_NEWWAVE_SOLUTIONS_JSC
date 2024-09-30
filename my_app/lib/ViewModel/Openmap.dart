import 'package:url_launcher/url_launcher.dart';

class Openmap {
  static Future<void> openGoogleMaps(
    double latitude,
    double longitude,
  ) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude&map_action=map&center=current+location';

    // Attempt to launch the URL
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
