// Configuration data for other SSDTs in this pack (Y530).

DefinitionBlock ("", "SSDT", 2, "hack", "TBK-Y530", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)
        
        // IGPI: Override for ig-platform-id (or snb-platform-id).
        // Will be used if non-zero, and not Ones
        // Can be set to Ones to disable IGPU injection.
        // For example, if you wanted to inject a bogus id, 0x12345678
        //    Name(IGPI, 0x12345678)
        // Or to disable, IGPU injection from SSDT-IGPU:
        //    Name(IGPI, Ones)
        // Or to set a custom ig-platform-id, example:
        //    Name(IGPI, 0x01660008)
        Name(IGPI, 0x3e9b0000)
        
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
    #include "SSDT-Y530-XCPM.dsl"
    #include "Downloads/SSDT-XOSI.dsl"
    #include "Downloads/SSDT-HDEF.dsl"
    #include "Downloads/SSDT-PTSWAK.dsl"
    #include "SSDT-USBX.dsl"
}
//EOF