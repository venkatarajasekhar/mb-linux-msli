#ifndef KEXEC_ARCH_PPC64_OPTIONS_H
#define KEXEC_ARCH_PPC64_OPTIONS_H

#define OPT_ARCH_MAX   (OPT_MAX+0)
#define OPT_ELF64_CORE  (OPT_MAX+1)

#define KEXEC_ARCH_OPTIONS \
	KEXEC_OPTIONS \
	{ "elf64-core-headers", 0, 0, OPT_ELF64_CORE }, \

#define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR ""

#endif /* KEXEC_ARCH_PPC64_OPTIONS_H */
