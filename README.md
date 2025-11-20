# Serverpod API Versioning

A lightweight, reusable package for client/server API version compatibility checking in Serverpod projects.

## Features

- String-based semantic version comparison
- Client-side version compatibility helper

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  serverpod_api_versioning: ^1.0.0
```

## Usage

``` dart
import 'package:serverpod_api_versioning/serverpod_api_versioning.dart';

final result = await VersionChecker.check(
  clientVersion: "1.0.0",
  getServerInfo: () => client.version.getServerInfo(),
);

if (!result.compatible) {
  // Show upgrade required UI
}
```

This works by using Semantic version comparison, so 1.2.0 is compatible with 1.1.0: 
``` dart
   final isCompatible = SemVer.isCompatible("1.2.0", "1.1.0");
```