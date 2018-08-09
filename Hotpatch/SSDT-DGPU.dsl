// For disabling the discrete GPU on the Y520

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "hack", "DGPU", 0)
{
#endif

    External(_SB.PCI0.LPCB.EC, DeviceObj)
    Scope(_SB.PCI0.LPCB.EC)
    {
        // The original GATY FieldUnitObj is renamed to GATX, so
        // calls to GATY land here. This prevents crash when called
        // before EC is initialized.
        Name(GATY, 0)
        
        OperationRegion(ECR3, EmbeddedControl, 0x00, 0xFF)
        
        External(XREG, MethodObj)
        External(GATX, FieldUnitObj)
        Method(_REG, 2)
        {
            XREG(Arg0, Arg1)
            
            // Set original GATY (renamed to GATX) to zero.
            If(Arg0 == 3 && Arg1 == 1) { GATX = 0 }
        }
    }
    
    External(_SB.PCI0.PEG0.PEGP, DeviceObj)
    Scope(_SB.PCI0.PEG0.PEGP)
    {
        External(_OFF, MethodObj)
        Device(DGPU)
        {
            Name(_HID, "DGPU0000")
            Method(_INI)
            {
                _OFF()
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF