// Configuration data for other SSDTs in this pack (Y520/Y720).

DefinitionBlock ("", "SSDT", 2, "hack", "TBK-Y520", 0)
{
    #define NO_DEFINITIONBLOCK
    #include "Downloads/SSDT-PNLF.dsl"
    #include "Downloads/SSDT-XCPM.dsl"
    #include "Downloads/SSDT-XOSI.dsl"
    #include "SSDT-USBX.dsl"
    #include "SSDT-DGPU.dsl"
    #include "SSDT-PS2K.dsl"
}
//EOF