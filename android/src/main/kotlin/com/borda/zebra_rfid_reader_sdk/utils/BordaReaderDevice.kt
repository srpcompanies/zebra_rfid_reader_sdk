package com.borda.zebra_rfid_reader_sdk.utils

import com.google.gson.annotations.SerializedName

/**
 * Represents a single Borda reader device, encapsulating its connection status, name, and battery level.
 *
 * @property connectionStatus The connection status of the reader.
 * @property name The name of the reader (optional).
 * @property batteryLevel The battery level of the reader (optional).
 */
class BordaReaderDevice {
    @SerializedName("connectionStatus")
    private var _connectionStatus: ConnectionStatus = ConnectionStatus.notConnected
    @SerializedName("name")
    private var _name: String? = null
    @SerializedName("batteryLevel")
    private var _batteryLevel: Int? = null
    @SerializedName("antennaRange")
    private var _antennaRange: IntArray? = null
    @SerializedName("serialNumber")
    private var _serialNumber: String? = null

    constructor(connectionStatus: ConnectionStatus, name: String?, batteryLevel: Int?, antennaRange: IntArray?, serialNumber: String?) {
        this._connectionStatus = connectionStatus
        this._name = name
        this._batteryLevel = batteryLevel
        this._antennaRange = antennaRange
        this._serialNumber = serialNumber
    }

    var connectionStatus: ConnectionStatus
        get() = _connectionStatus
        set(value) { _connectionStatus = value }

    var batteryLevel: Int?
        get() = _batteryLevel;
        set(value) {
            if (value == null)
                _batteryLevel = value
            else if (value >= 0 && value <= 100)
                _batteryLevel = value;
        }
}