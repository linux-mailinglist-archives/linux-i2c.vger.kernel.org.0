Return-Path: <linux-i2c+bounces-475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1D7FA6C0
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 17:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E361A2819CF
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 16:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5938933CEE;
	Mon, 27 Nov 2023 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC5F19B
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 08:46:46 -0800 (PST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1r7eko-00074n-H2; Mon, 27 Nov 2023 17:46:38 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	brgl@bgdev.pl,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [RFC PATCH] mtd: devices: add AT24 eeprom support
Date: Mon, 27 Nov 2023 17:46:23 +0100
Message-Id: <20231127164623.1008176-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

This ports the driver/misc/at24.c driver to the MTD framework. The main
reason for this is because of the missing support for fixed-partitions.
EEPROMs can become quite large nowadays (>=64K) and abstracting
everything as NVMEM cell isn't the correct abstraction, since cells
can't be written partially. Instead fixed-partitions should be used to
partition the device + small (size < 1K) specific cells should be added
to these partitions.

The porting was straight forward just a few adaptions for the write/read
operation (mostly API adaptions including the MTD naming scheme) were
required and replacing the NVMEM registration by the MTD registration.
Last but least we need to handle the #WP pin by ourselves. With these
adaptions done I was able use such setups:

&eeprom {
	compatible = "atmel,24c02";
	reg = <0x52>;
	pagesize = <16>;
	#address-cells = <1>;
	#size-cells = <0>;

	partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		otp@0 {
			compatible = "nvmem-cells";
			label = "manufaturing";
			reg = <0x0 0xe0>;

			nvmem-layout {
				compatible = "fixed-layout";
				#address-cells = <1>;
				#size-cells = <1>;

				/* MACs stored in ASCII */
				ethmac1: mac-address@0 {
					reg = <0x0 0xc>;
				};

				ethmac2: mac-address@c {
					reg = <0xc 0xc>;
				};

				test@d8 {
					reg = <0xd8 0x8>;
				};
			};
		j};

		user@e0 {
			reg = <0xe0 0x100>;
		};
	};
};

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi all,

this misses the dt-bindings patch, I know therefore it is marked as RFC.
The idea is to move the AT eeprom driver to the MTD framework to support
the device partitioning with different permissions in user-space.

I dropped the backward compatibility since this is a new driver not
having to deal with it. The old and the new driver can not be used by
the same kernel config. So it is either using the MTD eeprom driver
supporting partitioning and NVMEM or the older one which does not
support partitioning but keeps the backward compatibility.

Comments and suggestions are very welcome :)

Regards,
  Marco

 drivers/mtd/devices/Kconfig  |  30 ++
 drivers/mtd/devices/Makefile |   1 +
 drivers/mtd/devices/at24.c   | 873 +++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c        |   3 +
 include/uapi/mtd/mtd-abi.h   |   2 +
 5 files changed, 909 insertions(+)
 create mode 100644 drivers/mtd/devices/at24.c

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ff2f9e55ef28..859f2da64619 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -3,6 +3,36 @@ menu "Self-contained MTD device drivers"
 	depends on MTD!=n
 	depends on HAS_IOMEM
 
+config MTD_EEPROM_AT24
+	tristate "MTD I2C EEPROMs / RAMs / ROMs from most vendors"
+	depends on I2C
+	depends on !EEPROM_AT24
+	select REGMAP
+	select REGMAP_I2C
+	help
+	  Enable this driver to get read/write support to most I2C EEPROMs
+	  and compatible devices like FRAMs, SRAMs, ROMs etc. After you
+	  configure the driver to know about each chip on your target
+	  board.  Use these generic chip names, instead of vendor-specific
+	  ones like at24c64, 24lc02 or fm24c04:
+
+	     24c00, 24c01, 24c02, spd (readonly 24c02), 24c04, 24c08,
+	     24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024, 24c2048
+
+	  Unless you like data loss puzzles, always be sure that any chip
+	  you configure as a 24c32 (32 kbit) or larger is NOT really a
+	  24c16 (16 kbit) or smaller, and vice versa. Marking the chip
+	  as read-only won't help recover from this. Also, if your chip
+	  has any software write-protect mechanism you may want to review the
+	  code to make sure this driver won't turn it on by accident.
+
+	  If you use this with an SMBus adapter instead of an I2C adapter,
+	  full functionality is not available.  Only smaller devices are
+	  supported (24c16 and below, max 4 kByte).
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called at24.
+
 config MTD_PMC551
 	tristate "Ramix PMC551 PCI Mezzanine RAM card support"
 	depends on PCI
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index d11eb2b8b6f8..00ef5d87a957 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_MTD_DOCG3)		+= docg3.o
+obj-$(CONFIG_MTD_EEPROM_AT24)	+= at24.o
 obj-$(CONFIG_MTD_SLRAM)		+= slram.o
 obj-$(CONFIG_MTD_PHRAM)		+= phram.o
 obj-$(CONFIG_MTD_PMC551)	+= pmc551.o
diff --git a/drivers/mtd/devices/at24.c b/drivers/mtd/devices/at24.c
new file mode 100644
index 000000000000..2ecf0146736a
--- /dev/null
+++ b/drivers/mtd/devices/at24.c
@@ -0,0 +1,873 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * at24.c - handle most I2C EEPROMs
+ *
+ * Copyright (C) 2005-2007 David Brownell
+ * Copyright (C) 2008 Wolfram Sang, Pengutronix
+ * Copyright (C) 2023 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/capability.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+/* Address pointer is 16 bit. */
+#define AT24_FLAG_ADDR16	BIT(7)
+/* sysfs-entry will be read-only. */
+#define AT24_FLAG_READONLY	BIT(6)
+/* sysfs-entry will be world-readable. */
+#define AT24_FLAG_IRUGO		BIT(5)
+/* Take always 8 addresses (24c00). */
+#define AT24_FLAG_TAKE8ADDR	BIT(4)
+/* Factory-programmed serial number. */
+#define AT24_FLAG_SERIAL	BIT(3)
+/* Factory-programmed mac address. */
+#define AT24_FLAG_MAC		BIT(2)
+/* Does not auto-rollover reads to the next slave address. */
+#define AT24_FLAG_NO_RDROL	BIT(1)
+
+/*
+ * I2C EEPROMs from most vendors are inexpensive and mostly interchangeable.
+ * Differences between different vendor product lines (like Atmel AT24C or
+ * MicroChip 24LC, etc) won't much matter for typical read/write access.
+ * There are also I2C RAM chips, likewise interchangeable. One example
+ * would be the PCF8570, which acts like a 24c02 EEPROM (256 bytes).
+ *
+ * However, misconfiguration can lose data. "Set 16-bit memory address"
+ * to a part with 8-bit addressing will overwrite data. Writing with too
+ * big a page size also loses data. And it's not safe to assume that the
+ * conventional addresses 0x50..0x57 only hold eeproms; a PCF8563 RTC
+ * uses 0x51, for just one example.
+ *
+ * Accordingly, explicit board-specific configuration data should be used
+ * in almost all cases. (One partial exception is an SMBus used to access
+ * "SPD" data for DRAM sticks. Those only use 24c02 EEPROMs.)
+ *
+ * So this driver uses "new style" I2C driver binding, expecting to be
+ * told what devices exist. That may be in arch/X/mach-Y/board-Z.c or
+ * similar kernel-resident tables; or, configuration data coming from
+ * a bootloader.
+ *
+ * Other than binding model, current differences from "eeprom" driver are
+ * that this one handles write access and isn't restricted to 24c02 devices.
+ * It also handles larger devices (32 kbit and up) with two-byte addresses,
+ * which won't work on pure SMBus systems.
+ */
+
+struct at24_data {
+	/*
+	 * Lock protects against activities from other Linux tasks,
+	 * but not from changes by other I2C masters.
+	 */
+	struct mutex lock;
+
+	unsigned int write_max;
+	unsigned int num_addresses;
+	unsigned int offset_adj;
+
+	u32 byte_len;
+	u16 page_size;
+	u8 flags;
+
+	struct mtd_info mtd;
+	struct regulator *vcc_reg;
+	struct gpio_desc *wp_gpio;
+	void (*read_post)(unsigned int off, char *buf, size_t count);
+
+	/*
+	 * Some chips tie up multiple I2C addresses; dummy devices reserve
+	 * them for us.
+	 */
+	u8 bank_addr_shift;
+	struct regmap *client_regmaps[];
+};
+
+static struct at24_data *mtd_to_at24(struct mtd_info *mtd)
+{
+	return container_of(mtd, struct at24_data, mtd);
+}
+
+/*
+ * This parameter is to help this driver avoid blocking other drivers out
+ * of I2C for potentially troublesome amounts of time. With a 100 kHz I2C
+ * clock, one 256 byte read takes about 1/43 second which is excessive;
+ * but the 1/170 second it takes at 400 kHz may be quite reasonable; and
+ * at 1 MHz (Fm+) a 1/430 second delay could easily be invisible.
+ *
+ * This value is forced to be a power of two so that writes align on pages.
+ */
+static unsigned int at24_io_limit = 128;
+module_param_named(io_limit, at24_io_limit, uint, 0);
+MODULE_PARM_DESC(at24_io_limit, "Maximum bytes per I/O (default 128)");
+
+/*
+ * Specs often allow 5 msec for a page write, sometimes 20 msec;
+ * it's important to recover from write timeouts.
+ */
+static unsigned int at24_write_timeout = 25;
+module_param_named(write_timeout, at24_write_timeout, uint, 0);
+MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
+
+struct at24_chip_data {
+	u32 byte_len;
+	u8 flags;
+	u8 bank_addr_shift;
+	void (*read_post)(unsigned int off, char *buf, size_t count);
+};
+
+#define AT24_CHIP_DATA(_name, _len, _flags)				\
+	static const struct at24_chip_data _name = {			\
+		.byte_len = _len, .flags = _flags,			\
+	}
+
+#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)		\
+	static const struct at24_chip_data _name = {			\
+		.byte_len = _len, .flags = _flags,			\
+		.read_post = _read_post,				\
+	}
+
+#define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)	\
+	static const struct at24_chip_data _name = {			\
+		.byte_len = _len, .flags = _flags,			\
+		.bank_addr_shift = _bank_addr_shift			\
+	}
+
+static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
+{
+	int i;
+
+	if (capable(CAP_SYS_ADMIN))
+		return;
+
+	/*
+	 * Hide VAIO private settings to regular users:
+	 * - BIOS passwords: bytes 0x00 to 0x0f
+	 * - UUID: bytes 0x10 to 0x1f
+	 * - Serial number: 0xc0 to 0xdf
+	 */
+	for (i = 0; i < count; i++) {
+		if ((off + i <= 0x1f) ||
+		    (off + i >= 0xc0 && off + i <= 0xdf))
+			buf[i] = 0;
+	}
+}
+
+/* needs 8 addresses as A0-A2 are ignored */
+AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
+/* old variants can't be handled with this generic entry! */
+AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0);
+AT24_CHIP_DATA(at24_data_24cs01, 16,
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0);
+AT24_CHIP_DATA(at24_data_24cs02, 16,
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
+	AT24_FLAG_MAC | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
+	AT24_FLAG_MAC | AT24_FLAG_READONLY);
+/* spd is a 24c02 in memory DIMMs */
+AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
+	AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
+/* 24c02_vaio is a 24c02 on some Sony laptops */
+AT24_CHIP_DATA_CB(at24_data_24c02_vaio, 2048 / 8,
+	AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
+	at24_read_post_vaio);
+AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
+AT24_CHIP_DATA(at24_data_24cs04, 16,
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+/* 24rf08 quirk is handled at i2c-core */
+AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0);
+AT24_CHIP_DATA(at24_data_24cs08, 16,
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0);
+AT24_CHIP_DATA(at24_data_24cs16, 16,
+	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24cs32, 16,
+	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24cs64, 16,
+	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
+AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
+AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
+AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
+/* identical to 24c08 ? */
+AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
+
+static const struct i2c_device_id at24_ids[] = {
+	{ "24c00",	(kernel_ulong_t)&at24_data_24c00 },
+	{ "24c01",	(kernel_ulong_t)&at24_data_24c01 },
+	{ "24cs01",	(kernel_ulong_t)&at24_data_24cs01 },
+	{ "24c02",	(kernel_ulong_t)&at24_data_24c02 },
+	{ "24cs02",	(kernel_ulong_t)&at24_data_24cs02 },
+	{ "24mac402",	(kernel_ulong_t)&at24_data_24mac402 },
+	{ "24mac602",	(kernel_ulong_t)&at24_data_24mac602 },
+	{ "spd",	(kernel_ulong_t)&at24_data_spd },
+	{ "24c02-vaio",	(kernel_ulong_t)&at24_data_24c02_vaio },
+	{ "24c04",	(kernel_ulong_t)&at24_data_24c04 },
+	{ "24cs04",	(kernel_ulong_t)&at24_data_24cs04 },
+	{ "24c08",	(kernel_ulong_t)&at24_data_24c08 },
+	{ "24cs08",	(kernel_ulong_t)&at24_data_24cs08 },
+	{ "24c16",	(kernel_ulong_t)&at24_data_24c16 },
+	{ "24cs16",	(kernel_ulong_t)&at24_data_24cs16 },
+	{ "24c32",	(kernel_ulong_t)&at24_data_24c32 },
+	{ "24cs32",	(kernel_ulong_t)&at24_data_24cs32 },
+	{ "24c64",	(kernel_ulong_t)&at24_data_24c64 },
+	{ "24cs64",	(kernel_ulong_t)&at24_data_24cs64 },
+	{ "24c128",	(kernel_ulong_t)&at24_data_24c128 },
+	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
+	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
+	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
+	{ "24c1025",	(kernel_ulong_t)&at24_data_24c1025 },
+	{ "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
+	{ "at24",	0 },
+	{ /* END OF LIST */ }
+};
+MODULE_DEVICE_TABLE(i2c, at24_ids);
+
+static const struct of_device_id at24_of_match[] = {
+	{ .compatible = "atmel,24c00",		.data = &at24_data_24c00 },
+	{ .compatible = "atmel,24c01",		.data = &at24_data_24c01 },
+	{ .compatible = "atmel,24cs01",		.data = &at24_data_24cs01 },
+	{ .compatible = "atmel,24c02",		.data = &at24_data_24c02 },
+	{ .compatible = "atmel,24cs02",		.data = &at24_data_24cs02 },
+	{ .compatible = "atmel,24mac402",	.data = &at24_data_24mac402 },
+	{ .compatible = "atmel,24mac602",	.data = &at24_data_24mac602 },
+	{ .compatible = "atmel,spd",		.data = &at24_data_spd },
+	{ .compatible = "atmel,24c04",		.data = &at24_data_24c04 },
+	{ .compatible = "atmel,24cs04",		.data = &at24_data_24cs04 },
+	{ .compatible = "atmel,24c08",		.data = &at24_data_24c08 },
+	{ .compatible = "atmel,24cs08",		.data = &at24_data_24cs08 },
+	{ .compatible = "atmel,24c16",		.data = &at24_data_24c16 },
+	{ .compatible = "atmel,24cs16",		.data = &at24_data_24cs16 },
+	{ .compatible = "atmel,24c32",		.data = &at24_data_24c32 },
+	{ .compatible = "atmel,24cs32",		.data = &at24_data_24cs32 },
+	{ .compatible = "atmel,24c64",		.data = &at24_data_24c64 },
+	{ .compatible = "atmel,24cs64",		.data = &at24_data_24cs64 },
+	{ .compatible = "atmel,24c128",		.data = &at24_data_24c128 },
+	{ .compatible = "atmel,24c256",		.data = &at24_data_24c256 },
+	{ .compatible = "atmel,24c512",		.data = &at24_data_24c512 },
+	{ .compatible = "atmel,24c1024",	.data = &at24_data_24c1024 },
+	{ .compatible = "atmel,24c1025",	.data = &at24_data_24c1025 },
+	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
+	{ /* END OF LIST */ },
+};
+MODULE_DEVICE_TABLE(of, at24_of_match);
+
+static const struct acpi_device_id __maybe_unused at24_acpi_ids[] = {
+	{ "INT3499",	(kernel_ulong_t)&at24_data_INT3499 },
+	{ "TPF0001",	(kernel_ulong_t)&at24_data_24c1024 },
+	{ /* END OF LIST */ }
+};
+MODULE_DEVICE_TABLE(acpi, at24_acpi_ids);
+
+/*
+ * This routine supports chips which consume multiple I2C addresses. It
+ * computes the addressing information to be used for a given r/w request.
+ * Assumes that sanity checks for offset happened at sysfs-layer.
+ *
+ * Slave address and byte offset derive from the offset. Always
+ * set the byte address; on a multi-master board, another master
+ * may have changed the chip's "current" address pointer.
+ */
+static struct regmap *at24_translate_offset(struct at24_data *at24,
+					    unsigned int *offset)
+{
+	unsigned int i;
+
+	if (at24->flags & AT24_FLAG_ADDR16) {
+		i = *offset >> 16;
+		*offset &= 0xffff;
+	} else {
+		i = *offset >> 8;
+		*offset &= 0xff;
+	}
+
+	return at24->client_regmaps[i];
+}
+
+static struct device *at24_base_client_dev(struct at24_data *at24)
+{
+	return regmap_get_device(at24->client_regmaps[0]);
+}
+
+static size_t at24_adjust_read_count(struct at24_data *at24,
+				      unsigned int offset, size_t count)
+{
+	unsigned int bits;
+	size_t remainder;
+
+	/*
+	 * In case of multi-address chips that don't rollover reads to
+	 * the next slave address: truncate the count to the slave boundary,
+	 * so that the read never straddles slaves.
+	 */
+	if (at24->flags & AT24_FLAG_NO_RDROL) {
+		bits = (at24->flags & AT24_FLAG_ADDR16) ? 16 : 8;
+		remainder = BIT(bits) - offset;
+		if (count > remainder)
+			count = remainder;
+	}
+
+	if (count > at24_io_limit)
+		count = at24_io_limit;
+
+	return count;
+}
+
+static ssize_t at24_regmap_read(struct at24_data *at24, char *buf,
+				unsigned int offset, size_t count)
+{
+	unsigned long timeout, read_time;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = at24_translate_offset(at24, &offset);
+	count = at24_adjust_read_count(at24, offset, count);
+
+	/* adjust offset for mac and serial read ops */
+	offset += at24->offset_adj;
+
+	timeout = jiffies + msecs_to_jiffies(at24_write_timeout);
+	do {
+		/*
+		 * The timestamp shall be taken before the actual operation
+		 * to avoid a premature timeout in case of high CPU load.
+		 */
+		read_time = jiffies;
+
+		ret = regmap_bulk_read(regmap, offset, buf, count);
+		dev_dbg(regmap_get_device(regmap), "read %zu@%d --> %d (%ld)\n",
+			count, offset, ret, jiffies);
+		if (!ret)
+			return count;
+
+		usleep_range(1000, 1500);
+	} while (time_before(read_time, timeout));
+
+	return -ETIMEDOUT;
+}
+
+/*
+ * Note that if the hardware write-protect pin is pulled high, the whole
+ * chip is normally write protected. But there are plenty of product
+ * variants here, including OTP fuses and partial chip protect.
+ *
+ * We only use page mode writes; the alternative is sloooow. These routines
+ * write at most one page.
+ */
+
+static size_t at24_adjust_write_count(struct at24_data *at24,
+				      unsigned int offset, size_t count)
+{
+	unsigned int next_page;
+
+	/* write_max is at most a page */
+	if (count > at24->write_max)
+		count = at24->write_max;
+
+	/* Never roll over backwards, to the start of this page */
+	next_page = roundup(offset + 1, at24->page_size);
+	if (offset + count > next_page)
+		count = next_page - offset;
+
+	return count;
+}
+
+static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
+				 unsigned int offset, size_t count)
+{
+	unsigned long timeout, write_time;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = at24_translate_offset(at24, &offset);
+	count = at24_adjust_write_count(at24, offset, count);
+	timeout = jiffies + msecs_to_jiffies(at24_write_timeout);
+
+	do {
+		/*
+		 * The timestamp shall be taken before the actual operation
+		 * to avoid a premature timeout in case of high CPU load.
+		 */
+		write_time = jiffies;
+
+		ret = regmap_bulk_write(regmap, offset, buf, count);
+		dev_dbg(regmap_get_device(regmap), "write %zu@%d --> %d (%ld)\n",
+			count, offset, ret, jiffies);
+		if (!ret)
+			return count;
+
+		usleep_range(1000, 1500);
+	} while (time_before(write_time, timeout));
+
+	return -ETIMEDOUT;
+}
+
+static int at24_read(struct mtd_info *mtd, loff_t from, size_t len,
+		     size_t *retlen, u_char *buf)
+{
+	struct at24_data *at24 = mtd_to_at24(mtd);
+	struct device *dev;
+	int i, ret;
+
+	dev = at24_base_client_dev(at24);
+
+	if (unlikely(!len))
+		return len;
+
+	if (from + len > at24->byte_len)
+		return -EINVAL;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
+	/*
+	 * Read data from chip, protecting against concurrent updates
+	 * from this host, but not from other I2C masters.
+	 */
+	mutex_lock(&at24->lock);
+
+	for (i = 0; len; i += ret, len -= ret) {
+		ret = at24_regmap_read(at24, buf + i, from + i, len);
+		if (ret < 0) {
+			mutex_unlock(&at24->lock);
+			pm_runtime_put(dev);
+			return ret;
+		}
+		*retlen = ret;
+	}
+
+	mutex_unlock(&at24->lock);
+
+	pm_runtime_put(dev);
+
+	if (unlikely(at24->read_post))
+		at24->read_post(from, buf, i);
+
+	return 0;
+}
+
+static int at24_write(struct mtd_info *mtd, loff_t to, size_t len,
+		      size_t *retlen, const u_char *buf)
+{
+	struct at24_data *at24 = mtd_to_at24(mtd);
+	struct device *dev;
+	int ret;
+
+	dev = at24_base_client_dev(at24);
+
+	if (unlikely(!len))
+		return -EINVAL;
+
+	if (to + len > at24->byte_len)
+		return -EINVAL;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
+	/*
+	 * Write data to chip, protecting against concurrent updates
+	 * from this host, but not from other I2C masters.
+	 */
+	mutex_lock(&at24->lock);
+
+	gpiod_set_value_cansleep(at24->wp_gpio, 0);
+
+	while (len) {
+		ret = at24_regmap_write(at24, buf, to, len);
+		if (ret < 0) {
+			mutex_unlock(&at24->lock);
+			pm_runtime_put(dev);
+			return ret;
+		}
+		buf += ret;
+		to += ret;
+		len -= ret;
+		*retlen += ret;
+	}
+
+	gpiod_set_value_cansleep(at24->wp_gpio, 1);
+
+	mutex_unlock(&at24->lock);
+
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static const struct at24_chip_data *at24_get_chip_data(struct device *dev)
+{
+	struct device_node *of_node = dev->of_node;
+	const struct at24_chip_data *cdata;
+	const struct i2c_device_id *id;
+
+	id = i2c_match_id(at24_ids, to_i2c_client(dev));
+
+	/*
+	 * The I2C core allows OF nodes compatibles to match against the
+	 * I2C device ID table as a fallback, so check not only if an OF
+	 * node is present but also if it matches an OF device ID entry.
+	 */
+	if (of_node && of_match_device(at24_of_match, dev))
+		cdata = of_device_get_match_data(dev);
+	else if (id)
+		cdata = (void *)id->driver_data;
+	else
+		cdata = acpi_device_get_match_data(dev);
+
+	if (!cdata)
+		return ERR_PTR(-ENODEV);
+
+	return cdata;
+}
+
+static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
+				  struct i2c_client *base_client,
+				  struct regmap_config *regmap_config)
+{
+	struct i2c_client *dummy_client;
+	struct regmap *regmap;
+
+	dummy_client = devm_i2c_new_dummy_device(&base_client->dev,
+						 base_client->adapter,
+						 base_client->addr +
+						 (index << at24->bank_addr_shift));
+	if (IS_ERR(dummy_client))
+		return PTR_ERR(dummy_client);
+
+	regmap = devm_regmap_init_i2c(dummy_client, regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	at24->client_regmaps[index] = regmap;
+
+	return 0;
+}
+
+static unsigned int at24_get_offset_adj(u8 flags, unsigned int byte_len)
+{
+	if (flags & AT24_FLAG_MAC) {
+		/* EUI-48 starts from 0x9a, EUI-64 from 0x98 */
+		return 0xa0 - byte_len;
+	} else if (flags & AT24_FLAG_SERIAL && flags & AT24_FLAG_ADDR16) {
+		/*
+		 * For 16 bit address pointers, the word address must contain
+		 * a '10' sequence in bits 11 and 10 regardless of the
+		 * intended position of the address pointer.
+		 */
+		return 0x0800;
+	} else if (flags & AT24_FLAG_SERIAL) {
+		/*
+		 * Otherwise the word address must begin with a '10' sequence,
+		 * regardless of the intended address.
+		 */
+		return 0x0080;
+	} else {
+		return 0;
+	}
+}
+
+static int at24_probe(struct i2c_client *client)
+{
+	struct regmap_config regmap_config = { };
+	u32 byte_len, page_size, flags, addrw;
+	const struct at24_chip_data *cdata;
+	struct device *dev = &client->dev;
+	bool i2c_fn_i2c, i2c_fn_block;
+	unsigned int i, num_addresses;
+	struct at24_data *at24;
+	struct device_node *np;
+	struct mtd_info *mtd;
+	bool full_power;
+	struct regmap *regmap;
+	bool writable;
+	int err;
+
+	i2c_fn_i2c = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
+	i2c_fn_block = i2c_check_functionality(client->adapter,
+					       I2C_FUNC_SMBUS_WRITE_I2C_BLOCK);
+
+	cdata = at24_get_chip_data(dev);
+	if (IS_ERR(cdata))
+		return PTR_ERR(cdata);
+
+	err = device_property_read_u32(dev, "pagesize", &page_size);
+	if (err)
+		/*
+		 * This is slow, but we can't know all eeproms, so we better
+		 * play safe. Specifying custom eeprom-types via device tree
+		 * or properties is recommended anyhow.
+		 */
+		page_size = 1;
+
+	flags = cdata->flags;
+	if (device_property_present(dev, "read-only"))
+		flags |= AT24_FLAG_READONLY;
+	if (device_property_present(dev, "no-read-rollover"))
+		flags |= AT24_FLAG_NO_RDROL;
+
+	err = device_property_read_u32(dev, "address-width", &addrw);
+	if (!err) {
+		switch (addrw) {
+		case 8:
+			if (flags & AT24_FLAG_ADDR16)
+				dev_warn(dev,
+					 "Override address width to be 8, while default is 16\n");
+			flags &= ~AT24_FLAG_ADDR16;
+			break;
+		case 16:
+			flags |= AT24_FLAG_ADDR16;
+			break;
+		default:
+			dev_warn(dev, "Bad \"address-width\" property: %u\n",
+				 addrw);
+		}
+	}
+
+	err = device_property_read_u32(dev, "size", &byte_len);
+	if (err)
+		byte_len = cdata->byte_len;
+
+	if (!i2c_fn_i2c && !i2c_fn_block)
+		page_size = 1;
+
+	if (!page_size) {
+		dev_err(dev, "page_size must not be 0!\n");
+		return -EINVAL;
+	}
+
+	if (!is_power_of_2(page_size))
+		dev_warn(dev, "page_size looks suspicious (no power of 2)!\n");
+
+	err = device_property_read_u32(dev, "num-addresses", &num_addresses);
+	if (err) {
+		if (flags & AT24_FLAG_TAKE8ADDR)
+			num_addresses = 8;
+		else
+			num_addresses =	DIV_ROUND_UP(byte_len,
+				(flags & AT24_FLAG_ADDR16) ? 65536 : 256);
+	}
+
+	if ((flags & AT24_FLAG_SERIAL) && (flags & AT24_FLAG_MAC)) {
+		dev_err(dev,
+			"invalid device data - cannot have both AT24_FLAG_SERIAL & AT24_FLAG_MAC.");
+		return -EINVAL;
+	}
+
+	regmap_config.val_bits = 8;
+	regmap_config.reg_bits = (flags & AT24_FLAG_ADDR16) ? 16 : 8;
+	regmap_config.disable_locking = true;
+
+	regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	at24 = devm_kzalloc(dev, struct_size(at24, client_regmaps, num_addresses),
+			    GFP_KERNEL);
+	if (!at24)
+		return -ENOMEM;
+
+	mutex_init(&at24->lock);
+	at24->byte_len = byte_len;
+	at24->page_size = page_size;
+	at24->flags = flags;
+	at24->read_post = cdata->read_post;
+	at24->bank_addr_shift = cdata->bank_addr_shift;
+	at24->num_addresses = num_addresses;
+	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
+	at24->client_regmaps[0] = regmap;
+
+	at24->vcc_reg = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(at24->vcc_reg))
+		return PTR_ERR(at24->vcc_reg);
+
+	writable = !(flags & AT24_FLAG_READONLY);
+	if (writable) {
+		at24->write_max = min_t(unsigned int,
+					page_size, at24_io_limit);
+		if (!i2c_fn_i2c && at24->write_max > I2C_SMBUS_BLOCK_MAX)
+			at24->write_max = I2C_SMBUS_BLOCK_MAX;
+
+		at24->wp_gpio = gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
+		if (IS_ERR(at24->wp_gpio))
+			return PTR_ERR(at24->wp_gpio);
+	}
+
+	/* use dummy devices for multiple-address chips */
+	for (i = 1; i < num_addresses; i++) {
+		err = at24_make_dummy_client(at24, i, client, &regmap_config);
+		if (err)
+			return err;
+	}
+
+	mtd = &at24->mtd;
+	if (device_property_present(dev, "label")) {
+		err = device_property_read_string(dev, "label",
+						  &mtd->name);
+		if (err)
+			return err;
+	} else {
+		mtd->name = dev_name(dev);
+	}
+	mtd->dev.parent = dev;
+	mtd->type = MTD_EEPROM;
+	mtd->flags = MTD_CAP_EEPROM;
+	if (!writable)
+		mtd->flags = MTD_CAP_ROM;
+
+	mtd->writesize = 1;
+	mtd->writebufsize = 1;
+	mtd->size = byte_len;
+	mtd->_read = at24_read;
+	mtd->_write = at24_write;
+
+	/* Fixed partitions are only supported on OF plaforms */
+	np = to_of_node(dev_fwnode(dev));
+	if (np)
+		mtd_set_of_node(mtd, np);
+
+	i2c_set_clientdata(client, at24);
+
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		err = regulator_enable(at24->vcc_reg);
+		if (err) {
+			dev_err(dev, "Failed to enable vcc regulator\n");
+			return err;
+		}
+
+		pm_runtime_set_active(dev);
+	}
+	pm_runtime_enable(dev);
+
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		pm_runtime_disable(dev);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
+		return dev_err_probe(dev, err, "failed to register mtd\n");
+	}
+
+	/*
+	 * Perform a one-byte test read to verify that the chip is functional,
+	 * unless powering on the device is to be avoided during probe (i.e.
+	 * it's powered off right now).
+	 */
+	if (full_power) {
+		u8 test_byte;
+		size_t len;
+
+		err = at24_read(mtd, 0, 1, &len, &test_byte);
+		if (err) {
+			pm_runtime_disable(dev);
+			if (!pm_runtime_status_suspended(dev))
+				regulator_disable(at24->vcc_reg);
+			return -ENODEV;
+		}
+	}
+
+	pm_runtime_idle(dev);
+
+	if (writable)
+		dev_info(dev, "%u byte %s EEPROM, writable, %u bytes/write\n",
+			 byte_len, client->name, at24->write_max);
+	else
+		dev_info(dev, "%u byte %s EEPROM, read-only\n",
+			 byte_len, client->name);
+
+	return 0;
+}
+
+static void at24_remove(struct i2c_client *client)
+{
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
+	pm_runtime_disable(&client->dev);
+	if (acpi_dev_state_d0(&client->dev)) {
+		if (!pm_runtime_status_suspended(&client->dev))
+			regulator_disable(at24->vcc_reg);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static int __maybe_unused at24_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
+	return regulator_disable(at24->vcc_reg);
+}
+
+static int __maybe_unused at24_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct at24_data *at24 = i2c_get_clientdata(client);
+
+	return regulator_enable(at24->vcc_reg);
+}
+
+static const struct dev_pm_ops at24_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(at24_suspend, at24_resume, NULL)
+};
+
+static struct i2c_driver at24_driver = {
+	.driver = {
+		.name = "at24",
+		.pm = &at24_pm_ops,
+		.of_match_table = at24_of_match,
+		.acpi_match_table = ACPI_PTR(at24_acpi_ids),
+	},
+	.probe = at24_probe,
+	.remove = at24_remove,
+	.id_table = at24_ids,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
+};
+
+static int __init at24_init(void)
+{
+	if (!at24_io_limit) {
+		pr_err("at24: at24_io_limit must not be 0!\n");
+		return -EINVAL;
+	}
+
+	at24_io_limit = rounddown_pow_of_two(at24_io_limit);
+	return i2c_add_driver(&at24_driver);
+}
+module_init(at24_init);
+
+static void __exit at24_exit(void)
+{
+	i2c_del_driver(&at24_driver);
+}
+module_exit(at24_exit);
+
+MODULE_DESCRIPTION("Driver for most I2C EEPROMs");
+MODULE_AUTHOR("David Brownell and Wolfram Sang");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6d83e72a24d2..1a850b19515d 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -148,6 +148,9 @@ static ssize_t mtd_type_show(struct device *dev,
 	case MTD_ROM:
 		type = "rom";
 		break;
+	case MTD_EEPROM:
+		type = "eeprom";
+		break;
 	case MTD_NORFLASH:
 		type = "nor";
 		break;
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 714d55b49d2a..59bf43d58ddb 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -146,6 +146,7 @@ struct mtd_read_req {
 #define MTD_DATAFLASH		6
 #define MTD_UBIVOLUME		7
 #define MTD_MLCNANDFLASH	8	/* MLC NAND (including TLC) */
+#define MTD_EEPROM		9
 
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
@@ -159,6 +160,7 @@ struct mtd_read_req {
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
 #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
 #define MTD_CAP_NVRAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
+#define MTD_CAP_EEPROM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
 
 /* Obsolete ECC byte placement modes (used with obsolete MEMGETOOBSEL) */
 #define MTD_NANDECC_OFF		0	/* Switch off ECC (Not recommended) */
-- 
2.39.2


