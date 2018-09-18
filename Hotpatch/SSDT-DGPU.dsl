// For disabling the discrete GPU on the Y520

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "hack", "DGPU", 0)
{
#endif

    External(_SB.PCI0.PEG0.PEGP, DeviceObj)
    Scope(_SB.PCI0.PEG0.PEGP)
    {
        External(HGOF, MethodObj)
        External(GPRF, IntObj)
        External(VREG, FieldUnitObj)
        External(VGAB, BuffObj)
        External(XINI, MethodObj)
        
        Method(_INI)
        {
            // Call original _INI (renamed XINI)
            XINI() 
            
            // Code borrowed from _SB.PCI0.PEG0.PEGP._OFF
            // EC related code moved to EC._REG
            If (GPRF != 1)
            {
                VGAB = VREG
            }
            HGOF()
        }
    }
    
    External(_SB.PCI0.LPCB.EC, DeviceObj)
    Scope(_SB.PCI0.LPCB.EC)
    {     
        External(XREG, MethodObj)
        External(GATY, FieldUnitObj)
        
        OperationRegion(ECR3, EmbeddedControl, 0x00, 0xFF)
        
        Method(_REG, 2)
        {
            XREG(Arg0, Arg1)
            If(Arg0 == 3 && Arg1 == 1)
            {
                // EC related code moved from  _SB.PCI0.PEG0.PEGP._OFF
                GATY = 0
            }
        }
    }
    
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF