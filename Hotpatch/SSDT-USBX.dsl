// USB power properties via USBX device

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "USBX", 0)
{
#endif
    Device(_SB.USBX)
    {
        Name(_ADR, 0)
        Method (_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "kUSBSleepPortCurrentLimit", 3000,
                "kUSBSleepPowerSupply", 2600,
                "kUSBWakePortCurrentLimit", 3000,
                "kUSBWakePowerSupply", 3200
            })
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF