// Configuration data for other SSDTs in this pack (Y720).

DefinitionBlock ("", "SSDT", 2, "hack", "TBK-Y720", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)
        
        // DAUD: Digital audio
        //
        // 0: "hda-gfx" is disabled, injected as "#hda-gfx" instead
        // 1: (default when not specified) "hda-gfx" is injected
        Name(DAUD, 0)
        
        // DWOU: Disable wake on USB
        //
        // 1: Disable wake on USB
        // 0: Do not disable wake on USB
        Name(DWOU, 1)
    }
    
    #define NO_DEFINITIONBLOCK
    #include "Downloads/SSDT-IGPU.dsl"
    #include "Downloads/SSDT-PNLF.dsl"
    #include "Downloads/SSDT-SATA.dsl"
    #include "Downloads/SSDT-GPRW.dsl"
    #include "Downloads/SSDT-XCPM.dsl"
    #include "Downloads/SSDT-XOSI.dsl"
    #include "SSDT-PS2K.dsl"
    #include "SSDT-Y720-UPC.dsl"
    #include "SSDT-USBX.dsl"
    #include "SSDT-DGPU.dsl"
}
//EOF