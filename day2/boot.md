# Overview of Linux Boot Process Stages

The Linux boot process generally follows these 6 stages:

1. Firmware Initialization (BIOS or UEFI)
2. Bootloader Stage (GRUB2)
3. Kernel Loading
4. Initial RAM Disk (initramfs) 
5. System Initialization (systemd or init)
6. User Space & Login

## BIOS Mode Boot Process (Legacy + MBR + GRUB)

### 1. Power On & BIOS Initialization

- BIOS firmware stored on motherboard ROM
- On power on:
    - CPU resets and executes from predefined address (0xFFFF0)
    - BIOS runs POST (Power-On Self Test)
    - Initializes hardware components
    - Checks boot order for bootable device

### 2. BIOS Loads Bootloader from MBR

- Reads first 512 bytes of boot device (MBR)
- MBR contains:
    - Bootloader stage 1 (446 bytes)
    - Partition table (64 bytes) 
    - Boot signature (2 bytes)
- Loads to memory address 0x7C00

### 3. GRUB Stage Process 

GRUB stages:
- **Stage 1**: In MBR, loads Stage 1.5/2
- **Stage 1.5**: Optional, handles basic filesystems
- **Stage 2**: Main executable in `/boot/grub2/`
    - Loads configuration
    - Shows boot menu
    - Handles kernel selection

### 4. Kernel & initramfs Loading

- GRUB loads selected kernel and initramfs
- Passes kernel parameters
- Transfers control to kernel

### 5. Kernel Initialization

- Initializes hardware
- Mounts initramfs temporarily
- Loads drivers for root filesystem
- Mounts real root filesystem

### 6. System Initialization

- Kernel starts init/systemd
- systemd:
    - Mounts filesystems
    - Starts services/targets
    - Initializes user space

## UEFI Mode Boot Process (GPT + GRUB + systemd)

### 1. UEFI Initialization
- Modern replacement for BIOS
- Runs in 32/64-bit protected mode
- Better hardware support

### 2. EFI System Partition
- Reads boot entries from NVRAM
- Locates EFI System Partition
- FAT32 format, 100-500MB
- Located at `/boot/efi`

### 3-6. Remaining Process
Similar to BIOS mode but using EFI executables

## Key Differences: BIOS vs UEFI

| Feature | BIOS (Legacy) | UEFI |
|---------|---------------|------|
| Mode | 16-bit real | 32/64-bit protected |
| Boot Location | MBR | EFI Partition |
| Partition | MBR | GPT |
| Storage Limit | 2TB | >2TB |
| Secure Boot | No | Yes |
| Performance | Slower | Faster |

## Boot Flow Summary

```
BIOS: BIOS → MBR → GRUB → Kernel → systemd
UEFI: UEFI → ESP → GRUB → Kernel → systemd
```

## Key Paths

| Component | BIOS Path | UEFI Path |
|-----------|-----------|-----------|
| GRUB Config | `/boot/grub2/grub.cfg` | `/boot/grub2/grub.cfg` |
| Kernel | `/boot/vmlinuz-*` | `/boot/vmlinuz-*` |
| initramfs | `/boot/initramfs-*` | `/boot/initramfs-*` |
| EFI Boot | N/A | `/boot/efi/EFI/<distro>/grubx64.efi` |