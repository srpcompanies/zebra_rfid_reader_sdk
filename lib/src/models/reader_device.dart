enum ConnectionStatus { connected, disconnected, connecting, notConnected, failed }

class ReaderDevice {
  final ConnectionStatus connectionStatus;
  final String? name;
  final String? batteryLevel;
  final List<dynamic>?  antennaRange;
  final String? serialNumber;

  ReaderDevice({
    required this.connectionStatus,
    this.name,
    this.batteryLevel,
    this.antennaRange,
    this.serialNumber,
  });

  /// override the equality operator to see if two objects are the "same" or not.
  /// We only compute equality based on device name and serial numbers
  bool operator ==(Object other) {
    if (other is ReaderDevice) {
      return (this.name == other.name && this.serialNumber == other.serialNumber);
    }
    return false;
  }

  factory ReaderDevice.fromJson(Map<Object?, Object?> json) {
    return ReaderDevice(
      connectionStatus: ConnectionStatus.values.firstWhere(
          (e) =>
              e.name.toLowerCase() ==
              '${json['connectionStatus']}'.toString().toLowerCase(),
          orElse: () => ConnectionStatus.notConnected),
      name: json['name'] as String?,
      batteryLevel: json['batteryLevel'] as String?,
      antennaRange: json['antennaRange'] as List<dynamic>?,
      serialNumber: json['serialNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'connectionStatus': connectionStatus.name,
      'batteryLevel': batteryLevel,
      'antennaRange': antennaRange,
      'serialNumber': serialNumber,
    };
  }

  factory ReaderDevice.initial() {
    return ReaderDevice(
      connectionStatus: ConnectionStatus.notConnected,
      name: '',
      batteryLevel: '',
      antennaRange: [120,300],
      serialNumber: '',
    );
  }
}
