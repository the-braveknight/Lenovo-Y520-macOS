// Keyboard configuration

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "PS2K", 0)
{
#endif
    // Enabling brightness keys
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    Scope(_SB.PCI0.LPCB.EC) // brightness buttons
    {
        External(^PS2K, DeviceObj)
        Method (_Q11) // Brightness down
        {
            Notify (PS2K, 0x0405) // For VoodooPS2Controller.kext (by RehabMan)
            Notify (PS2K, 0x20) // For ApplePS2SmartTouchPad.kext (by EMlyDinEsH)
        }
        
        Method (_Q12) // Btightness up
        {
            Notify (PS2K, 0x0406) // For VoodooPS2Controller.kext (by RehabMan)
            Notify (PS2K, 0x10) // For ApplePS2SmartTouchPad.kext (by EMlyDinEsH)
        }
    }
    
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    Scope(_SB.PCI0.LPCB.PS2K)
    {
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Y520",
            })
        }
        
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "ForceTouchMode", 2,
            },
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    "e037=64", // PrtSc=F13
                },
            },
        })
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF