// USBInjectAll.kext port configuration for Lenovo Y520
// Not used - DSDT port properties are already correct

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "hack", "UIAC", 0)
{
#endif
    // Override for USBInjectAll.kext
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        Name(RMCF, Package()
        {
            // XHC overrides
            "8086_a12f", Package()
            {
                //"port-count", Buffer() { 26, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // Left USB2
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // Right close USB3
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS03", Package() // Right far USB3
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    "HS04", Package() // Right USB Type-C
                    {
                        "UsbConnector", 9,
                        "port", Buffer() { 4, 0, 0, 0 },
                    },
                    "HS06", Package() // Webcam
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 6, 0, 0, 0 },
                    },
                    "HS11", Package() // Bluetooth
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                    "SS01", Package() // Right close USB3
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 17, 0, 0, 0 },
                    },
                    "SS02", Package() // Right far USB3
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 18, 0, 0, 0 },
                    },
                    "SS03", Package() // Right USB Type-C
                    {
                        "UsbConnector", 9,
                        "port", Buffer() { 19, 0, 0, 0 },
                    },
                },
            },
        })
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF