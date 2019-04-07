# makefile
#
# Created by the-braveknight
#

BUILDDIR=./Build

IASL=iasl

Y520=$(BUILDDIR)/SSDT-Y520.aml
Y720=$(BUILDDIR)/SSDT-Y720.aml
Y530=$(BUILDDIR)/SSDT-Y530.aml

.PHONY: all
all: $(Y520) $(Y720) $(Y530)
	
$(BUILDDIR)/%.aml : Hotpatch/%.dsl
	$(IASL) -p $@ $<
	
.PHONY: clean
clean:
	rm -f $(BUILDDIR)/*.aml
	
.PHONY: install_y520
install_y520: $(Y520)
	$(eval EFIDIR:=$(shell macos-tools/mount_efi.sh))
	rm -f $(EFIDIR)/EFI/CLOVER/ACPI/patched/*.aml
	cp $(Y520) $(EFIDIR)/EFI/CLOVER/ACPI/patched
	
.PHONY: install_y720
install_y720: $(Y720)
	$(eval EFIDIR:=$(shell macos-tools/mount_efi.sh))
	rm -f $(EFIDIR)/EFI/CLOVER/ACPI/patched/*.aml
	cp $(Y720) $(EFIDIR)/EFI/CLOVER/ACPI/patched

.PHONY: install_y530
install_y530: $(Y530)
	$(eval EFIDIR:=$(shell macos-tools/mount_efi.sh))
	rm -f $(EFIDIR)/EFI/CLOVER/ACPI/patched/*.aml
	cp $(Y530) $(EFIDIR)/EFI/CLOVER/ACPI/patched
