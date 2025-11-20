import 'package:package_info_plus/package_info_plus.dart';
import 'package:serverpod_api_versioning/serverpod_api_versioning.dart';

///
/// Version check result.
///
class VersionCheckResult {
    final bool compatible;
    final Map<String, dynamic> info;

    VersionCheckResult({
        required this.compatible,
        required this.info,
    });
}

class VersionChecker {

    final Future<Map<String, dynamic>> Function() getServerInfo;

    VersionChecker({required this.getServerInfo});

    ///
    /// Checks if the client is compatible with the server.
    /// Automatically reads the client version from pubspec.yaml
    ///
    Future<VersionCheckResult> check() async {
        final packageInfo = await PackageInfo.fromPlatform();
        final clientVersion = packageInfo.version; // e.g., "1.2.0"

        final info = await getServerInfo();
        final minVersion = info['minClientVersion'] as String;

        final ok = ServerpodAPIVersioning.isCompatible(clientVersion, minVersion);

        return VersionCheckResult(compatible: ok, info: info);
    }
}
