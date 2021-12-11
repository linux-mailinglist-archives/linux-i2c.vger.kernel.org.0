Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375954713BC
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 13:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhLKMOj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 07:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhLKMOj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 07:14:39 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE04C061714;
        Sat, 11 Dec 2021 04:14:38 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o20so38172950eds.10;
        Sat, 11 Dec 2021 04:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=EwmAR0Sc3vCJ9053sMeTBvJZKGkXgbwh1Dc0KoUTd+Y=;
        b=hUaCsdACLYCupCMD3ohhaCeA1zVh/VHdKS3N+DfE1xsn6HoEQ3jD0SoAlyFdVZIVpb
         MZ2RPbpKlDdvieN6BbJ72ivSJKjbP8M71liNUwQFfDEXVZJ6M1YplKr6+vzr/93/EHbG
         I7LEkGBRXIOiVxMVuFQ/L7Mxj+tccl0+yV8IMFQXc+YfEPET4Jx1x9Lk/ghIUwN5WwcL
         xrar3FEU7YsyOh99ywhx8V2rdjrP9VvY3Ehw7aApOK2sk310ueKsDjDqxl3VESYzqvQH
         /WABBd0OZ8aE6ReUtxfrai0qOIzw8Tl1QmOm4G7EABFxLghJJZNB0PVnMVAFWgB8iHHf
         AndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EwmAR0Sc3vCJ9053sMeTBvJZKGkXgbwh1Dc0KoUTd+Y=;
        b=6I12ezUYlz2G8N3PrwNMwOoaS6uk8jgRF7OlsBOR57SoAEbI6XId0IjpeYgKX/IFma
         OfuA+hDY5EaLY+UbKKAaVREmKbNimg2UaBWabHtLVnbdPxTErmGBIDNpTUYfci2N9kZD
         D4NCdPGxo1JY357N5DbG7vfetqti4WLAW5rFOHArlfJ16sXwBQYlQAyu2TZprSvj1IiF
         42y99Z0sTLOpqrhgGMOUedf1QP0TmyugPh/UEiLQhaTgJgbcovAC3rDeStJZogGo9dTf
         ysC5K72+0mMl1UsI8cwxOgStTCJYaOVYkOkKf3WaQZoxFWnI/aoS/+bKIiNa5dExMb8P
         Q6Bg==
X-Gm-Message-State: AOAM532HBswdMFUVB3A5X20SPGfKZg5GY1DetMW5E86+8w87g//Go1VW
        OODq97RU/zadpUpu+c2Qn3Ur+sxuUdbkOaN9f7kaonTHVGg=
X-Google-Smtp-Source: ABdhPJwhgRGrhmrnbRHYkcMySNB7nN+5Xh93PtnYFcwQbPUWUAwF/2Rps4iCod1MOJ3017O8IHV9PPKA+w2M+GMTjtc=
X-Received: by 2002:a17:906:86da:: with SMTP id j26mr29011257ejy.19.1639224876953;
 Sat, 11 Dec 2021 04:14:36 -0800 (PST)
MIME-Version: 1.0
From:   Miroslav Bendik <miroslav.bendik@gmail.com>
Date:   Sat, 11 Dec 2021 13:14:24 +0100
Message-ID: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
Subject: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen 2 (AMD)
To:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thinkpad P14s gen 2 with AMD (model 21A00003CK, BIOS R1MET43W - 1.13) SMBus
address detection don't work and trackpoint has slow rate (30 Hz) because can't
use SMBus. Email is divided to SMBus and trackpoint section, there are issues in
both modules.

I am using amd-pstate-dev-v5 branch of kernel, but problem is in all versions.


SMBUS
=====


After inserting i2c_piix4 i have address 0xff00 / 0xff20 in log, but
correct address is 0xb20:

[    0.349576] ACPI: \_SB_.PCI0.SMB1: Unsupported CMI method: _STA
[    0.349629] piix4_smbus 0000:00:14.0: Using IRQ for SMBus
[    0.349630] piix4_smbus 0000:00:14.0: SMBus Host Controller at
0xff00, revision 15
[    0.349632] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus
port selection
[    0.349652] i2c_dev: adapter [SMBus PIIX4 adapter port 0 at ff00]
registered as minor 2
[    0.349658] i2c i2c-2: adapter [SMBus PIIX4 adapter port 0 at ff00]
registered
[    0.349702] i2c_dev: adapter [SMBus PIIX4 adapter port 2 at ff00]
registered as minor 3
[    0.349705] i2c i2c-3: adapter [SMBus PIIX4 adapter port 2 at ff00]
registered
[    0.349720] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host
Controller at 0xff20
[    0.349734] i2c_dev: adapter [SMBus PIIX4 adapter port 1 at ff20]
registered as minor 4
[    0.349737] i2c i2c-4: adapter [SMBus PIIX4 adapter port 1 at ff20]
registered

Here is relevant section of ACPI DSDT:

Scope (_SB.PCI0)
{
    Device (SMB1)
    {
        Name (_HID, "SMB0001")  // _HID: Hardware ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
            IO (Decode16,
                0x0B20,             // Range Minimum
                0x0B20,             // Range Maximum
                0x20,               // Alignment
                0x20,               // Length
                )
            IRQ (Level, ActiveLow, Shared, )
                {7}
        })
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}

Here is SMBus section of lspci:

# lspci -vvv -b -x -nn -PP -P -s 00:14.0
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus
Controller [1022:790b] (rev 51)
    Subsystem: Lenovo FCH SMBus Controller [17aa:5094]
    Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
    Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    IOMMU group: 9
    Kernel driver in use: piix4_smbus
    Kernel modules: i2c_piix4, sp5100_tco
00: 22 10 0b 79 00 04 20 02 51 00 05 0c 00 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 aa 17 94 50
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Command i2cdetect -q -y 4 don't detect anything and log contains this messages:

[  813.156253] i2c i2c-9: Transaction (pre): CNT=ff, CMD=ff, ADD=ff,
DAT0=ff, DAT1=ff
[  813.156259] i2c i2c-9: SMBus busy (ff). Resetting...
[  813.156265] i2c i2c-9: Failed! (ff)
[  813.156272] i2c i2c-9: Probing failed, no device found

I tried to temporary fix problem on my machine. Relevant function is
piix4_setup_sb800 in drivers/i2c/buses/i2c-piix4.c. I have added debug messages
and changed address in this function.

     smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
     outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
     smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
+    printk(KERN_INFO "piix4 smba_en_lo %u", smba_en_lo);
+    printk(KERN_INFO "piix4 smba_en_hi %u", smba_en_hi);
+    smba_en_hi = 0x0b;

...

+    printk(KERN_INFO "piix4 irq %d", PIIX4_dev->irq);
+    printk(KERN_INFO "piix4 i2ccfg %u", i2ccfg);

Then log looks like this:

[    0.809897] piix4 smba_en_lo 255
[    0.809899] piix4 smba_en_hi 255
[    0.811592] piix4 irq 0
[    0.811594] piix4 i2ccfg 4
[    0.811595] piix4_smbus 0000:00:14.0: SMBus Host Controller at
0xb00, revision 0
[    0.811598] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus
port selection
[    0.822338] piix4 smba_en_lo 255
[    0.822340] piix4 smba_en_hi 255
[    0.822345] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host
Controller at 0xb20

And touchpad / trackpoint is detected:

# i2cdetect -q -y 4
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- 1c -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- 2c 2d 2e 2f
30: 30 31 32 33 34 35 36 37 38 39 3a 3b 3c 3d 3e 3f
40: 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e 4f
50: 50 51 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e 5f
60: 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e 6f
70: 70 71 72 73 74 75 76 77


Trackpoint (RMI4)
=================

SMBus is now working (probably).

Without any module parameters i have this output:

psmouse serio1: synaptics: Your touchpad (PNP: LEN2073 PNP0f13) says
it can support a different bus. If i2c-hid and hid-rmi are not used,
you might want to try setting psmouse.synaptics_intertouch to 1 and
report this to linux-input@vger.kernel.org.

When i try with synaptics_intertouch=1 i have this in dmesg:

psmouse serio1: synaptics: Trying to set up SMBus access
psmouse serio1: synaptics: SMbus companion is not ready yet

I have disabled I2C_FUNC_SMBUS_HOST_NOTIFY checks in psmouse-smbus.c,
synaptics.c and
rmi_smbus.c. Module i2c_piix4 dont export I2C_FUNC_SMBUS_HOST_NOTIFY. Exact
changes are:

diff --git a/drivers/input/mouse/psmouse-smbus.c
b/drivers/input/mouse/psmouse-smbus.c
index a472489cc..6205f8d65 100644
--- a/drivers/input/mouse/psmouse-smbus.c
+++ b/drivers/input/mouse/psmouse-smbus.c
@@ -30,8 +30,8 @@ static void psmouse_smbus_check_adapter(struct
i2c_adapter *adapter)
 {
     struct psmouse_smbus_dev *smbdev;

-    if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
-        return;
+    //if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
+    //    return;

     mutex_lock(&psmouse_smbus_mutex);

@@ -196,8 +196,8 @@ static int psmouse_smbus_create_companion(struct
device *dev, void *data)
     if (!adapter)
         return 0;

-    if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
-        return 0;
+    //if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
+    //    return 0;

     client = i2c_new_scanned_device(adapter, &smbdev->board,
                     addr_list, NULL);
diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index ffad14280..2f476dce7 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1765,7 +1765,7 @@ static int synaptics_create_intertouch(struct
psmouse *psmouse,
     };
     const struct i2c_board_info intertouch_board = {
         I2C_BOARD_INFO("rmi4_smbus", 0x2c),
-        .flags = I2C_CLIENT_HOST_NOTIFY,
+        //.flags = I2C_CLIENT_HOST_NOTIFY,
     };

     return psmouse_smbus_init(psmouse, &intertouch_board,
diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 2407ea43d..3eb7193b4 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -281,14 +281,17 @@ static int rmi_smb_probe(struct i2c_client *client,
         return -ENOMEM;
     }

+    //if (!i2c_check_functionality(client->adapter,
+    //                 I2C_FUNC_SMBUS_READ_BLOCK_DATA |
+    //                 I2C_FUNC_SMBUS_HOST_NOTIFY)) {
     if (!i2c_check_functionality(client->adapter,
-                     I2C_FUNC_SMBUS_READ_BLOCK_DATA |
-                     I2C_FUNC_SMBUS_HOST_NOTIFY)) {
+                     I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
         dev_err(&client->dev,
             "adapter does not support required functionality\n");
         return -ENODEV;
     }

+    client->irq = 7;
     if (client->irq <= 0) {
         dev_err(&client->dev, "no IRQ provided, giving up\n");
         return client->irq ? client->irq : -ENODEV;

Now i have working trackpoint. It's not reliable. Sometimes it's generating
keyboard events instead mouse events, sometimes starts working for cca 1 second
after first move and then stops (no IRQs are generated), sometimes dmesg
contains many "Failed to read irq" messages.

[    2.058579] psmouse serio1: synaptics: queried max coordinates: x
[..5678], y [..4694]
[    2.092853] psmouse serio1: synaptics: queried min coordinates: x
[1266..], y [1162..]
[    2.092855] psmouse serio1: synaptics: Trying to set up SMBus access
[    2.116391] rmi4_smbus 4-002c: registering SMbus-connected sensor
[    2.186473] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
Synaptics, product: TM3471-030, fw id: 3418235
[    2.226009] input: Synaptics TM3471-030 as /devices/rmi4-00/input/input54
[    2.239455] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
[    2.347012] psmouse serio2: trackpoint: Elan TrackPoint firmware:
0x12, buttons: 3/3
[    2.388030] input: TPPS/2 Elan TrackPoint as
/devices/rmi4-00/rmi4-00.fn03/serio2/input/input55
[ 1507.883750] rmi4_physical rmi4-00: Failed to read irqs, code=-5
[ 3263.258033] rmi4_physical rmi4-00: Failed to read irqs, code=-5
[ 3263.258587] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to
write to F03 TX register (-5).
[ 3263.259036] rmi4_physical rmi4-00: Failed to read irqs, code=-6
[ 3263.259579] rmi4_physical rmi4-00: Failed to read irqs, code=-6
[ 3263.267027] rmi4_physical rmi4-00: Failed to read irqs, code=-5
[ 3263.267581] rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -5.
[ 3263.267582] rmi4_f01 rmi4-00.fn01: Suspend failed with code -5.


Changes needed to fix issues
============================

Address detection in piix4 is really broken for this machine. I don't know how
to fix this, without breaking detection on other machines.

I think, that piix4 should implement I2C_FUNC_SMBUS_HOST_NOTIFY like i2c-i801.
Or rmi4 can be reliably enabled without I2C_FUNC_SMBUS_HOST_NOTIFY, just using
irq?

If bus access is fixed, then should be LEN2073 whitelisted for SMBus access.


Files
=====

Kernel config - https://mireq.linuxos.sk/kernel/p14s_gen2_amd_kernel_config
ACPI tables - https://mireq.linuxos.sk/kernel/p14s_gen2_amd_acpi_tables.tar.xz
My really really dangerous changes -
https://mireq.linuxos.sk/kernel/p14s_gen2_amd_smbus.patch
