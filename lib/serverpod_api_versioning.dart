///
/// Checks if the client version is compatible with the server.
///
class ServerpodAPIVersioning {
    static List<int> _parse(String v) =>
        v.split('.').map((e) => int.parse(e)).toList();

    static bool isCompatible(String client, String minimum) {
        final c = _parse(client);
        final m = _parse(minimum);

        if (c[0] != m[0]) return false;       // major mismatch
        if (c[1] < m[1]) return false;        // minor too low

        return true;                          // patch ignored
    }
}
