// USB _UPC configuration for Lenovo Legion Y720
// USB Type-C port not tested yet, therefore not included.

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "hack", "_UPC", 0)
{
#endif

    External(_SB.PCI0.XHC.RHUB, DeviceObj)
    Scope(_SB.PCI0.XHC.RHUB)
    {
        External(UPC3, PkgObj) // USB3
        External(UPCP, PkgObj) // Internal (built-in)
        
        Method(HS01._UPC)
        {
            Return(UPC3)
        }
        
        Method(HS02._UPC)
        {
            Return(UPC3)
        }
        
        Method(HS03._UPC)
        {
            Return(UPC3)
        }

        Method(HS06._UPC)
        {
            Return(UPCP)
        }
        
        Method(HS09._UPC)
        {
            Return(UPCP)
        }

        External(SPTH, IntObj)
        External(PCHV, MethodObj)
        
        If (SPTH == PCHV())
        {
            Method(HS11._UPC)
            {
                Return(UPCP)
            }
        }

        Method(SS01._UPC)
        {
            Return(UPC3)
        }
        
        Method(SS02._UPC)
        {
            Return(UPC3)
        }
        
        Method(SS06._UPC)
        {
            Return(UPC3)
        }
    }
    
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF