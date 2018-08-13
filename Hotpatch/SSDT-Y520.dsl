// Configuration data for other SSDTs in this pack (Y520/Y720).

DefinitionBlock ("", "SSDT", 2, "hack", "TBK-Y520", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)   // do not remove

        // AUDL: Audio Layout
        //
        // LayoutID=7: Realtek ALC235 by the-braveknight
        // LayoutID=14: Realtek ALC235 by vusun123
        // LayoutID=2: Realtek ALC235 by Mirone
        Name(AUDL, 7)
    }
    
    #define NO_DEFINITIONBLOCK
    #include "SSDT-IGPU.dsl"
    #include "Downloads/SSDT-PNLF.dsl"
    #include "Downloads/SSDT-HDEF.dsl"
    #include "Downloads/SSDT-XCPM.dsl"
    #include "Downloads/SSDT-XOSI.dsl"
    #include "SSDT-UIAC.dsl"
    #include "SSDT-DGPU.dsl"
    #include "SSDT-PS2K.dsl"
}
//EOF