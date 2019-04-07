// Configuration data for other SSDTs in this pack (Y530).

DefinitionBlock ("", "SSDT", 2, "hack", "TBK-Y530", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)
        
        // AUDL: Audio Layout
        //
        // The value here will be used to inject layout-id for HDEF and HDAU
        // If set to Ones, no audio injection will be done.
        Name(AUDL, 18)
        
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
    #include "Downloads/SSDT-DDGPU.dsl"
    #include "Downloads/SSDT-SATA.dsl"
    #include "Downloads/SSDT-GPRW.dsl"
    #include "Downloads/SSDT-XCPM.dsl"
    #include "Downloads/SSDT-XOSI.dsl"
    #include "Downloads/SSDT-HDEF.dsl"
    #include "Downloads/SSDT-PTSWAK.dsl"
    #include "SSDT-USBX.dsl"
}
//EOF