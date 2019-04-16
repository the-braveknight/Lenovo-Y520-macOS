// Inject plugin-type=1 on _SB.PR00

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "_XCPM", 0)
{
#endif
    Method(_SB.PR00._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "plugin-type", 1
        })
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
