// Injection of IGPU properties needed to drive WhateverGreen
// framebuffer patching

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "_IGPU", 0)
{
#endif
    External(_SB.PCI0.IGPU, DeviceObj)
    Scope(_SB.PCI0.IGPU)
    {
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return(Package()
            {
                "framebuffer-patch-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "framebuffer-stolenmem", Buffer() { 0x00, 0x00, 0x30, 0x01 },
                "framebuffer-fbmem", Buffer() { 0x00, 0x00, 0x90, 0x00 },
                "framebuffer-con1-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "framebuffer-con1-type", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "framebuffer-con2-enable", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "framebuffer-con2-type", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                "framebuffer-pipecount", Buffer() { 0x01, 0x00, 0x00, 0x00 },                "framebuffer-portcount", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            })
        }  
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
