# makefile
#
# Created by the-braveknight
#

BUILDDIR=./Build

IASLOPTS=-vw 2095 -vw 2008
IASL=iasl

Y520=$(BUILDDIR)/SSDT-Y520.aml

.PHONY: all
all: $(Y520)
	
$(BUILDDIR)/%.aml : Hotpatch/%.dsl
	$(IASL) $(IASLOPTS) -p $@ $<

.PHONY: clean
clean:
	rm -f $(BUILDDIR)/*.aml

.PHONY: install
install: $(Y520)
	$(eval EFIDIR:=$(shell macos-tools/mount_efi.sh))
	rm -f $(EFIDIR)/EFI/CLOVER/ACPI/patched/*.aml
	cp $(Y520) $(EFIDIR)/EFI/CLOVER/ACPI/patched
