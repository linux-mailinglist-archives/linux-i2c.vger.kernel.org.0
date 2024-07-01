Return-Path: <linux-i2c+bounces-4532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13091E16A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A55411F24A29
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 13:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A93168484;
	Mon,  1 Jul 2024 13:54:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB71607B8
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842060; cv=none; b=uJSqsrDvNR04mjQaedQ3YAE+V0q4FVGuS98dNZ8Vxt/FrnNKHySBfcKp+R3SehF1HuhWWsIbF2jWtJhUqHBC+h3EaXo49vtvJP46ZFd2+Frqq2CNbaA8GHkMiu63xP/oEQUKBcWiR8gF1Pn+1sV1Pz8+4J7mAvpnDIvWYlXF4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842060; c=relaxed/simple;
	bh=96M+1aZCz6FD4wRDRulXAIhHUbQkINM48MDvJXCrEdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQc0xMIVJ46+spuzYp5/mgY9CYKCrc9L0+lLrkdv61yP9GOeBzdJ/DgNzQG0HZmigZeezsna4eBEQM2SgpG8oBzoprqlOZORIjwpt/cJKapL6T/RE2zUfJQkp+3PhnKEk7vlR/Zad48yt5ZLZxzcrODQ/KCO9RtKOrSaIaIVAmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTX-0001LY-ET; Mon, 01 Jul 2024 15:53:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Jul 2024 15:53:43 +0200
Subject: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 loongarch@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

At the moment there are three ways to access EEPROM content from
user-space:

  1st) via the single nvmem device (rw)
  2nd) via the single 'eeprom' device (rw)
  3th) via nvmem-cells (r)

EEPROMs can become quite large nowadays (>=64K). Exposing such devices
as single device isn't always sufficient. There may be partitions which
require different access permissions. Also write access always need to
to verify the offset.

Port the current misc/eeprom/at24.c driver to the MTD framework since
EEPROMs are memory-technology devices and the framework already supports
partitioning. This allow using of-paritions like we do for SPI-NOR
devices already:

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
		label = "board-eeprom";

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

The porting was straight forward:
 - at24_read/write funcs are adapted to be MTD compatible
 - (re-)adding the write-protection gpio handling since the devices can
   now be accessed via NVMEM and MTD API
 - Replace the NVMEM with MTD registration. The mtdcore is taking care
   of exposing the NVMEM and eeprom device correctly ensure backward
   compatibility.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Changelog:
v2:
- resync misc/eeprom/at24.c with mtd/at24.c driver
- add backward compatibility
- drop misc/eeprom/at24.c driver
- adapt Kconfig EEPROM_AT24 Kconfig entry
- shift infrastructure support into separate patch
- adapt commit message
---
 MAINTAINERS                                 |   2 +-
 drivers/misc/eeprom/Kconfig                 |  30 +------
 drivers/misc/eeprom/Makefile                |   1 -
 drivers/mtd/devices/Kconfig                 |  31 +++++++
 drivers/mtd/devices/Makefile                |   1 +
 drivers/{misc/eeprom => mtd/devices}/at24.c | 122 +++++++++++++++-------------
 6 files changed, 103 insertions(+), 84 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..a3a56f34d754 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3355,7 +3355,7 @@ L:	linux-i2c@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
 F:	Documentation/devicetree/bindings/eeprom/at24.yaml
-F:	drivers/misc/eeprom/at24.c
+F:	drivers/mtd/devices/at24.c
 
 ATA OVER ETHERNET (AOE) DRIVER
 M:	"Justin Sanders" <justin@coraid.com>
diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
index 4e61ac18cc96..3a9aaec2f2c7 100644
--- a/drivers/misc/eeprom/Kconfig
+++ b/drivers/misc/eeprom/Kconfig
@@ -3,34 +3,10 @@ menu "EEPROM support"
 
 config EEPROM_AT24
 	tristate "I2C EEPROMs / RAMs / ROMs from most vendors"
-	depends on I2C && SYSFS
-	select NVMEM
-	select NVMEM_SYSFS
-	select REGMAP
-	select REGMAP_I2C
+	select MTD_EEPROM_AT24
 	help
-	  Enable this driver to get read/write support to most I2C EEPROMs
-	  and compatible devices like FRAMs, SRAMs, ROMs etc. After you
-	  configure the driver to know about each chip on your target
-	  board.  Use these generic chip names, instead of vendor-specific
-	  ones like at24c64, 24lc02 or fm24c04:
-
-	     24c00, 24c01, 24c02, spd (readonly 24c02), 24c04, 24c08,
-	     24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024, 24c2048
-
-	  Unless you like data loss puzzles, always be sure that any chip
-	  you configure as a 24c32 (32 kbit) or larger is NOT really a
-	  24c16 (16 kbit) or smaller, and vice versa. Marking the chip
-	  as read-only won't help recover from this. Also, if your chip
-	  has any software write-protect mechanism you may want to review the
-	  code to make sure this driver won't turn it on by accident.
-
-	  If you use this with an SMBus adapter instead of an I2C adapter,
-	  full functionality is not available.  Only smaller devices are
-	  supported (24c16 and below, max 4 kByte).
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called at24.
+	  Deprecated config option to get read/write support to most I2C
+	  EEPROMs. Please use MTD_EEPROM_AT24 instead.
 
 config EEPROM_AT25
 	tristate "SPI EEPROMs (FRAMs) from most vendors"
diff --git a/drivers/misc/eeprom/Makefile b/drivers/misc/eeprom/Makefile
index 65794e526d5d..2ace4f09d0f0 100644
--- a/drivers/misc/eeprom/Makefile
+++ b/drivers/misc/eeprom/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_EEPROM_AT24)	+= at24.o
 obj-$(CONFIG_EEPROM_AT25)	+= at25.o
 obj-$(CONFIG_EEPROM_MAX6875)	+= max6875.o
 obj-$(CONFIG_EEPROM_93CX6)	+= eeprom_93cx6.o
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ff2f9e55ef28..8c6720ea84e7 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -3,6 +3,37 @@ menu "Self-contained MTD device drivers"
 	depends on MTD!=n
 	depends on HAS_IOMEM
 
+config MTD_EEPROM_AT24
+	tristate "MTD I2C EEPROMs / RAMs / ROMs from most vendors"
+	depends on I2C && SYSFS
+	select NVMEM
+	select NVMEM_SYSFS
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
diff --git a/drivers/misc/eeprom/at24.c b/drivers/mtd/devices/at24.c
similarity index 92%
rename from drivers/misc/eeprom/at24.c
rename to drivers/mtd/devices/at24.c
index 4bd4f32bcdab..713f40a1d95c 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/mtd/devices/at24.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2005-2007 David Brownell
  * Copyright (C) 2008 Wolfram Sang, Pengutronix
+ * Copyright (C) 2024 Pengutronix, Marco Felsch <kernel@pengutronix.de>
  */
 
 #include <linux/acpi.h>
@@ -16,8 +17,8 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
 #include <linux/mutex.h>
-#include <linux/nvmem-provider.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
@@ -84,8 +85,9 @@ struct at24_data {
 	u16 page_size;
 	u8 flags;
 
-	struct nvmem_device *nvmem;
+	struct mtd_info mtd;
 	struct regulator *vcc_reg;
+	struct gpio_desc *wp_gpio;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 
 	/*
@@ -96,6 +98,11 @@ struct at24_data {
 	struct regmap *client_regmaps[] __counted_by(num_addresses);
 };
 
+static struct at24_data *mtd_to_at24(struct mtd_info *mtd)
+{
+	return container_of(mtd, struct at24_data, mtd);
+}
+
 /*
  * This parameter is to help this driver avoid blocking other drivers out
  * of I2C for potentially troublesome amounts of time. With a 100 kHz I2C
@@ -424,20 +431,19 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
 	return -ETIMEDOUT;
 }
 
-static int at24_read(void *priv, unsigned int off, void *val, size_t count)
+static int at24_read(struct mtd_info *mtd, loff_t from, size_t len,
+		     size_t *retlen, u_char *buf)
 {
-	struct at24_data *at24;
+	struct at24_data *at24 = mtd_to_at24(mtd);
 	struct device *dev;
-	char *buf = val;
 	int i, ret;
 
-	at24 = priv;
 	dev = at24_base_client_dev(at24);
 
-	if (unlikely(!count))
-		return count;
+	if (unlikely(!len))
+		return len;
 
-	if (off + count > at24->byte_len)
+	if (from + len > at24->byte_len)
 		return -EINVAL;
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -449,13 +455,14 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	 */
 	mutex_lock(&at24->lock);
 
-	for (i = 0; count; i += ret, count -= ret) {
-		ret = at24_regmap_read(at24, buf + i, off + i, count);
+	for (i = 0; len; i += ret, len -= ret) {
+		ret = at24_regmap_read(at24, buf + i, from + i, len);
 		if (ret < 0) {
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
 		}
+		*retlen += ret;
 	}
 
 	mutex_unlock(&at24->lock);
@@ -463,25 +470,24 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	pm_runtime_put(dev);
 
 	if (unlikely(at24->read_post))
-		at24->read_post(off, buf, i);
+		at24->read_post(from, buf, i);
 
 	return 0;
 }
 
-static int at24_write(void *priv, unsigned int off, void *val, size_t count)
+static int at24_write(struct mtd_info *mtd, loff_t to, size_t len,
+		      size_t *retlen, const u_char *buf)
 {
-	struct at24_data *at24;
+	struct at24_data *at24 = mtd_to_at24(mtd);
 	struct device *dev;
-	char *buf = val;
 	int ret;
 
-	at24 = priv;
 	dev = at24_base_client_dev(at24);
 
-	if (unlikely(!count))
+	if (unlikely(!len))
 		return -EINVAL;
 
-	if (off + count > at24->byte_len)
+	if (to + len > at24->byte_len)
 		return -EINVAL;
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -493,18 +499,23 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	 */
 	mutex_lock(&at24->lock);
 
-	while (count) {
-		ret = at24_regmap_write(at24, buf, off, count);
+	gpiod_set_value_cansleep(at24->wp_gpio, 0);
+
+	while (len) {
+		ret = at24_regmap_write(at24, buf, to, len);
 		if (ret < 0) {
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
 		}
 		buf += ret;
-		off += ret;
-		count -= ret;
+		to += ret;
+		len -= ret;
+		*retlen += ret;
 	}
 
+	gpiod_set_value_cansleep(at24->wp_gpio, 1);
+
 	mutex_unlock(&at24->lock);
 
 	pm_runtime_put(dev);
@@ -562,6 +573,8 @@ static void at24_probe_temp_sensor(struct i2c_client *client)
 {
 	struct at24_data *at24 = i2c_get_clientdata(client);
 	struct i2c_board_info info = { .type = "jc42" };
+	struct mtd_info *mtd = &at24->mtd;
+	size_t len;
 	int ret;
 	u8 val;
 
@@ -569,12 +582,12 @@ static void at24_probe_temp_sensor(struct i2c_client *client)
 	 * Byte 2 has value 11 for DDR3, earlier versions don't
 	 * support the thermal sensor present flag
 	 */
-	ret = at24_read(at24, 2, &val, 1);
+	ret = at24_read(mtd, 2, 1, &len, &val);
 	if (ret || val != 11)
 		return;
 
 	/* Byte 32, bit 7 is set if temp sensor is present */
-	ret = at24_read(at24, 32, &val, 1);
+	ret = at24_read(mtd, 32, 1, &len, &val);
 	if (ret || !(val & BIT(7)))
 		return;
 
@@ -586,17 +599,19 @@ static void at24_probe_temp_sensor(struct i2c_client *client)
 static int at24_probe(struct i2c_client *client)
 {
 	struct regmap_config regmap_config = { };
-	struct nvmem_config nvmem_config = { };
 	u32 byte_len, page_size, flags, addrw;
 	const struct at24_chip_data *cdata;
 	struct device *dev = &client->dev;
 	bool i2c_fn_i2c, i2c_fn_block;
 	unsigned int i, num_addresses;
 	struct at24_data *at24;
+	struct device_node *np;
+	struct mtd_info *mtd;
 	bool full_power;
 	struct regmap *regmap;
 	bool writable;
 	u8 test_byte;
+	size_t len;
 	int err;
 
 	i2c_fn_i2c = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
@@ -703,6 +718,10 @@ static int at24_probe(struct i2c_client *client)
 					page_size, at24_io_limit);
 		if (!i2c_fn_i2c && at24->write_max > I2C_SMBUS_BLOCK_MAX)
 			at24->write_max = I2C_SMBUS_BLOCK_MAX;
+
+		at24->wp_gpio = gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
+		if (IS_ERR(at24->wp_gpio))
+			return PTR_ERR(at24->wp_gpio);
 	}
 
 	/* use dummy devices for multiple-address chips */
@@ -712,37 +731,31 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 	}
 
-	/*
-	 * We initialize nvmem_config.id to NVMEM_DEVID_AUTO even if the
-	 * label property is set as some platform can have multiple eeproms
-	 * with same label and we can not register each of those with same
-	 * label. Failing to register those eeproms trigger cascade failure
-	 * on such platform.
-	 */
-	nvmem_config.id = NVMEM_DEVID_AUTO;
-
+	mtd = &at24->mtd;
 	if (device_property_present(dev, "label")) {
 		err = device_property_read_string(dev, "label",
-						  &nvmem_config.name);
+						  &mtd->name);
 		if (err)
 			return err;
 	} else {
-		nvmem_config.name = dev_name(dev);
+		mtd->name = dev_name(dev);
 	}
-
-	nvmem_config.type = NVMEM_TYPE_EEPROM;
-	nvmem_config.dev = dev;
-	nvmem_config.read_only = !writable;
-	nvmem_config.root_only = !(flags & AT24_FLAG_IRUGO);
-	nvmem_config.owner = THIS_MODULE;
-	nvmem_config.compat = true;
-	nvmem_config.base_dev = dev;
-	nvmem_config.reg_read = at24_read;
-	nvmem_config.reg_write = at24_write;
-	nvmem_config.priv = at24;
-	nvmem_config.stride = 1;
-	nvmem_config.word_size = 1;
-	nvmem_config.size = byte_len;
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
 
 	i2c_set_clientdata(client, at24);
 
@@ -764,7 +777,7 @@ static int at24_probe(struct i2c_client *client)
 	 * it's powered off right now).
 	 */
 	if (full_power) {
-		err = at24_read(at24, 0, &test_byte, 1);
+		err = at24_read(mtd, 0, 1, &len, &test_byte);
 		if (err) {
 			pm_runtime_disable(dev);
 			if (!pm_runtime_status_suspended(dev))
@@ -773,13 +786,12 @@ static int at24_probe(struct i2c_client *client)
 		}
 	}
 
-	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
-	if (IS_ERR(at24->nvmem)) {
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
 		pm_runtime_disable(dev);
 		if (!pm_runtime_status_suspended(dev))
 			regulator_disable(at24->vcc_reg);
-		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
-				     "failed to register nvmem\n");
+		return dev_err_probe(dev, err, "failed to register mtd\n");
 	}
 
 	/* If this a SPD EEPROM, probe for DDR3 thermal sensor */

-- 
2.39.2


