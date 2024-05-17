Return-Path: <linux-i2c+bounces-3567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9628E8C8719
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1141C22559
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 13:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C4D54666;
	Fri, 17 May 2024 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="f+fR3s08"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928505102F
	for <linux-i2c@vger.kernel.org>; Fri, 17 May 2024 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715951807; cv=none; b=iaqE1pnLhZxZZKcqtYgUfOUDXTD+0XHBJ++XB51zemEqlL8bcrxYsnWhEk65iV+upIfj7xG+ZtEq7vSnsaqIEAXOxPUEDogXghoeQvGURWQvuP89JnOJCUL26NIvesSIOAM8j7UkvHnncmX6LmdDXL1CbklKuVHiQ9/KPfaC0Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715951807; c=relaxed/simple;
	bh=pW5Asn4bjCcrEh6yAYVE0ztcjFoflcaLS8lMe2oOk5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCy2e1T3YajIflSjULvjYXmEQMJghCe85nlc4KgNVrACdab/2R7fBdHHyfNq8H3y29aGkPSM5Xas/yVRIqkOBkcQlkyv+bXgYSaDaF9rhctSxiOxzIzkJ1lPdg+veYEqN2FxcNovxWVWgcmIKKhIeuNoi79d1EaOdxivdTaF7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=f+fR3s08; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: broonie@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715951804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7lqePBNqA/MEOrkQ+ndQqHEh9JM7eWzf5/WXt1v0tTw=;
	b=f+fR3s08MhLko46kI0lSU5af4P3iEm//H7yw1suAVI4s+rW2cL8QtR0jlCY6SsDs1g36dD
	T0GC37oucZc6efmh9eFY4C3Xgzckc3lOrPGVaNCU7oO9/xUT6pAn0Nshr78A863l+LSE5M
	WI3iabPhN7ovX1JFY3ZBh62lvW76uaD4kZmzrSZ4pN0gv0UDMw6DFhRDTcdtmacRkVDlEp
	+5td6hI+lFaVy6PqT4N8NxTzhA1Al3NWgCGpjavVUpAIr2xGivU6bMdJDqIQlULJmzqmF4
	wKdxz1UZgZcyz2K7QFUvl9VW6UR8y88u1ISwmEkcyTzXBDyK4PfhdcCwOEszcA==
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: perex@perex.cz
X-Envelope-To: tiwai@suse.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: alsi@bang-olufsen.dk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 15:02:19 +0200
Subject: [PATCH 12/13] a2b: add Beosound Shape node driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-12-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Bang & Olufsen Beosound Shapes are amplifier speakers connected over
A2B. They have an on-board microcontroller with non-volatile firmware
which can be updated over a firmware update protocol (DFU).

Due to hardware peculiarities, the update of the microcontroller will
reset the A2B transceiver on the Shape board, causing an A2B bus drop.
This custom A2B node driver therefore handles the firmware update in a
serial fashion in order to ensure an error-free enumeration of the A2B
bus.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/a2b/Kconfig          |  13 +
 drivers/a2b/Makefile         |   1 +
 drivers/a2b/beo-shape-node.c | 584 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 598 insertions(+)

diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
index e3c38520a90a..7a8009c13672 100644
--- a/drivers/a2b/Kconfig
+++ b/drivers/a2b/Kconfig
@@ -44,4 +44,17 @@ config A2B_AD24XX_NODE
 
 	 If unsure, say N.
 
+config A2B_BEO_SHAPE_NODE
+       tristate "Bang & Olufsen Beosound Shape node support"
+       depends on A2B_AD24XX_NODE
+       help
+         The Beosound Shape is an A2B-connected amplifier speaker. As a piece of
+         hardware it is functionally similar to any board with an AD2425, but
+         this driver handles firmware update of the on-board microcontroller in
+         a way that is agreeable to the A2B driver model.
+
+	 Beosound Shapes are always subordinate A2B nodes.
+
+	 If unsure, say N.
+
 endif # A2B
diff --git a/drivers/a2b/Makefile b/drivers/a2b/Makefile
index 171ffa237943..abeeb76c4e8c 100644
--- a/drivers/a2b/Makefile
+++ b/drivers/a2b/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_A2B_AD24XX_I2C)		+= ad24xx-i2c.o
 
 # Node drivers
 obj-$(CONFIG_A2B_AD24XX_NODE)		+= ad24xx-node.o
+obj-$(CONFIG_A2B_BEO_SHAPE_NODE)	+= beo-shape-node.o
diff --git a/drivers/a2b/beo-shape-node.c b/drivers/a2b/beo-shape-node.c
new file mode 100644
index 000000000000..54184cd667df
--- /dev/null
+++ b/drivers/a2b/beo-shape-node.c
@@ -0,0 +1,584 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Beosound Shape A2B transceiver node driver
+ *
+ * Copyright (c) 2023-2024 Alvin Šipraga <alsi@bang-olufsen.dk>
+ *
+ * This is basically an AD2425 driver. But in order to flash the STM32
+ * microcontroller on the Beosound Shape, some help is needed on the part of the
+ * A2B node driver.
+ *
+ * Here is a simplified block diagram of the problem this driver is dealing
+ * with:
+ *
+ *                                ┌───────────┐
+ *                        ┌───────│ regulator │
+ *                        │       └──────▲────┘
+ *                        │ 5V           │ GPIO enable
+ *      ┌──────┐  A2B ┌───▼──┐  I2C  ┌───────┐
+ *      │ A2B  │/\/\/\│ A2B  │───────│ STM32 │
+ *      │ main │\/\/\/│ sub  │       │  MCU  │
+ *      └──────┘      └──────┘       └───────┘
+ *
+ * The Shape's MCU is an STM32F072. It has a bootloader. The bootloader can
+ * either enter firmware update (DFU) mode, or jump to the Bang & Olufsen
+ * application code (APP). DFU mode is a proprietary implementation and does not
+ * refer to the standard STM32 bootloader mode. DFU mode allows for the APP
+ * code to be updated.
+ *
+ * Whether the bootloader enters DFU or APP mode depends on a flag kept in the
+ * MCU's non-volatile flash memory. The MCU can be moved into DFU or APP mode by
+ * issuing a command which sets the flag to DFU (resp. APP) mode and then
+ * performs a software reset. The MCU responds over I2C in both modes, but the
+ * commands are in general different. The command to read the flag is the same
+ * for both modes, which allows the driver to determine the current state.
+ *
+ * When the MCU undergoes software reset, its GPIOs enter their default state
+ * and this causes the A2B transceiver on the board to lose power due to a
+ * hardware pull-down on the GPIO enable line of its supply regulator. This A2B
+ * node driver supervises the process to ensure that the A2B discovery process
+ * only continues when all currently discovered nodes have had their MCU
+ * firmware updated.
+ *
+ * An obvious question is why not let an MCU-specific I2C driver handle the
+ * firmware update. The answer lies in the issue of device probe order and
+ * topology: suppose that an I2C driver flashed the MCU instead. Then what is
+ * likely to happen is that further downstream nodes also get discovered and
+ * potentially probed in between one of the transitions between APP/DFU
+ * mode. This process is wasted as at some point there will be a bus drop and
+ * all those new devices must also be cleaned up. Worse yet is if further
+ * downstream MCU I2C drivers begin flashing as well, leading to a big mess of
+ * devices coming and going during boot. By blocking the creation of a2b_func
+ * devices and discovery of further nodes until this MCU reset flip-flopping is
+ * complete, the chaos is kept to a minimum.
+ *
+ * After the firmware is up-to-date, the driver reverts to the standard
+ * behaviour of the generic ad24xx-node driver.
+ *
+ * The firmware is split into 2048 byte sectors, and each sector has 16
+ * blocks. Each block is written with a single I2C command. After each block
+ * write command, an ACK must be read back successfully to continue with the
+ * next block write. The MCU must only be put into APP mode when all blocks have
+ * successfully been written - doing otherwise will cause the bootloader's
+ * checksum verification to fail and it will then unconditionally fall into the
+ * standard STM32 bootloader every time.
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+
+#include "ad24xx-node.h"
+
+/* The MCU answers on this I2C address */
+#define MCU_ADDRESS		0x65
+
+/* Firmware properties */
+#define FW_ADDR			0x08004000
+#define FW_SIZE			0x1B800
+#define FW_BLKSZ		128
+#define FW_SECSZ		2048
+#define FW_BLKS_PER_SEC		(FW_SECSZ / FW_BLKSZ)
+#define FW_SECTORS		(FW_SIZE / FW_SECSZ)
+#define FW_VER32_ADDR		0x0801F7F8
+#define FW_VER32_OFFSET		(FW_VER32_ADDR - FW_ADDR)
+
+#define FW_VER32_0		0xFF000000
+#define FW_VER32_1		0x00FF0000
+#define FW_VER32_2		0x0000FF00
+#define FW_VER32_3		0x000000FF
+#define FW_VER32_TO_FW_VER(fw_ver32)		    \
+	(FIELD_GET(FW_VER32_0, (fw_ver32)) * 1000 + \
+	 FIELD_GET(FW_VER32_1, (fw_ver32)) * 100 +  \
+	 FIELD_GET(FW_VER32_2, (fw_ver32)) * 10 +   \
+	 FIELD_GET(FW_VER32_3, (fw_ver32)) * 1)
+#define FW_VER32_FIELDS(fw_ver32)	   \
+	FIELD_GET(FW_VER32_0, (fw_ver32)), \
+	FIELD_GET(FW_VER32_1, (fw_ver32)), \
+	FIELD_GET(FW_VER32_2, (fw_ver32)), \
+	FIELD_GET(FW_VER32_3, (fw_ver32))
+#define FW_VER32(fw_ver32)	FW_VER32_FIELDS(fw_ver32)
+#define FW_VER32_FIELDS_FMT	"%u.%u.%u.%u"
+#define FW_VER32_FMT		FW_VER32_FIELDS_FMT
+
+#define FW_VER_FIELDS(fw_ver)	     \
+	(((fw_ver) % 10000) / 1000), \
+	 (((fw_ver) % 1000) / 100),  \
+	 (((fw_ver) % 100) / 10),    \
+	 (((fw_ver) % 10))
+#define FW_VER(fw_ver)		FW_VER_FIELDS(fw_ver)
+#define FW_VER_FIELDS_FMT	"%u.%u.%u.%u"
+#define FW_VER_FMT		FW_VER_FIELDS_FMT
+
+/* The DFU flag indicates whether or not the MCU is in DFU mode or not */
+#define FLAG_APP_MODE		0x00
+#define FLAG_DFU_MODE		0xDD
+
+/* DFU constants */
+#define DFU_ACK			0xAA
+#define DFU_NACK		0xBB
+
+/* Read commands in APP mode */
+#define APP_READ_DFU_FLAG	0x00
+#define APP_READ_ITEM_NO	0x01
+#define APP_READ_TYPE_NO	0x02
+#define APP_READ_SERIAL_NO	0x03
+#define APP_READ_HW_VER		0x04
+#define APP_READ_BTL_VER	0x05
+#define APP_READ_APP_VER	0x06
+#define APP_READ_DSP_VER	0x07
+#define APP_READ_NTC_VALUE	0x08
+#define APP_READ_DSP_DELAY	0x09
+#define APP_READ_DSP_GAIN	0x0A
+#define APP_READ_DSP_ROOMEQ	0x0B
+#define APP_READ_DSP_ROOMEQ2	0x0C
+
+/* Write commands in APP mode */
+#define APP_WRITE_ENTER_DFU_MODE	0x01
+
+/* Read commands in DFU mode */
+#define DFU_READ_DFU_FLAG	APP_READ_DFU_FLAG
+#define DFU_READ_ACK		0x02
+
+/* Write commands in DFU mode */
+#define DFU_WRITE_BLOCK			0x01
+#define DFU_WRITE_ENTER_APP_MODE	0x02
+
+static unsigned int force_fwupd;
+module_param(force_fwupd, uint, 0644);
+MODULE_PARM_DESC(force_fwupd, "force firmware update ignoring version check");
+
+static int beo_shape_node_enter_app_mode(struct a2b_node *node)
+{
+	struct i2c_msg xfer[1];
+	u8 buf[2] = {
+		DFU_WRITE_ENTER_APP_MODE,
+		0xFF - DFU_WRITE_ENTER_APP_MODE, /* checksum */
+	};
+	int ret;
+
+	xfer[0].addr = MCU_ADDRESS;
+	xfer[0].flags = 0;
+	xfer[0].len = 2;
+	xfer[0].buf = buf;
+
+	ret = a2b_node_i2c_xfer(node, xfer, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Wait for the A2B transceiver to lose power */
+	msleep(1000);
+
+	return 0;
+}
+
+static int beo_shape_node_enter_dfu_mode(struct a2b_node *node)
+{
+	struct i2c_msg xfer[1];
+	u8 reg = APP_WRITE_ENTER_DFU_MODE;
+	int ret;
+
+	xfer[0].addr = MCU_ADDRESS;
+	xfer[0].flags = 0;
+	xfer[0].len = 1;
+	xfer[0].buf = &reg;
+
+	ret = a2b_node_i2c_xfer(node, xfer, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Wait for the A2B transceiver to lose power */
+	msleep(1000);
+
+	return 0;
+}
+
+static int beo_shape_node_read(struct a2b_node *node, u8 reg, u8 *buf, u16 len)
+{
+	struct i2c_msg xfer[2];
+	int ret;
+
+	xfer[0].addr = MCU_ADDRESS;
+	xfer[0].flags = 0;
+	xfer[0].len = 1;
+	xfer[0].buf = &reg;
+
+	xfer[1].addr = MCU_ADDRESS;
+	xfer[1].flags = I2C_M_RD;
+	xfer[1].len = len;
+	xfer[1].buf = buf;
+
+	ret = a2b_node_i2c_xfer(node, xfer, 2);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int beo_shape_node_read8(struct a2b_node *node, u8 reg, u8 *val)
+{
+	return beo_shape_node_read(node, reg, val, 1);
+}
+
+static int beo_shape_node_read16(struct a2b_node *node, u8 reg, u16 *val)
+{
+	int ret;
+
+	ret = beo_shape_node_read(node, reg, (u8 *)val, 2);
+	if (ret)
+		return ret;
+
+	*val = __le16_to_cpu(*val);
+
+	return 0;
+}
+
+static int beo_shape_node_read32(struct a2b_node *node, u8 reg, u32 *val)
+{
+	int ret;
+
+	ret = beo_shape_node_read(node, reg, (u8 *)val, 4);
+	if (ret)
+		return ret;
+
+	*val = __le32_to_cpu(*val);
+
+	return 0;
+}
+
+static int beo_shape_node_get_dfu_flag(struct a2b_node *node, u8 *flag)
+{
+	return beo_shape_node_read8(node, APP_READ_DFU_FLAG, flag);
+}
+
+static int beo_shape_node_get_app_ver(struct a2b_node *node, u16 *ver)
+{
+	return beo_shape_node_read16(node, APP_READ_APP_VER, ver);
+}
+
+static int beo_shape_node_get_item_no(struct a2b_node *node, u32 *item_no)
+{
+	return beo_shape_node_read32(node, APP_READ_ITEM_NO, item_no);
+}
+
+static int beo_shape_node_get_type_no(struct a2b_node *node, u32 *type_no)
+{
+	return beo_shape_node_read32(node, APP_READ_TYPE_NO, type_no);
+}
+
+static int beo_shape_node_get_serial_no(struct a2b_node *node, u32 *serial_no)
+{
+	return beo_shape_node_read32(node, APP_READ_SERIAL_NO, serial_no);
+}
+
+static int beo_shape_node_get_hw_ver(struct a2b_node *node, u32 *hw_ver)
+{
+	return beo_shape_node_read32(node, APP_READ_HW_VER, hw_ver);
+}
+
+static const char *beo_shape_node_hw_ver_string(u32 hw_ver)
+{
+	const char *hw_string[] = { "unknown", "ES1",  "ES2",  "ES3",
+				    "EVT1",    "EVT2", "DVT1", "DVT2",
+				    "PVT",     "MP1",  "MP2" };
+	if (hw_ver >= ARRAY_SIZE(hw_string))
+		return "unknown";
+
+	return hw_string[hw_ver];
+}
+
+static int beo_shape_node_write_fw_blk(struct a2b_node *node,
+				       const struct firmware *fw, u8 sec,
+				       u8 blk)
+{
+	u32 offset = (sec * FW_SECSZ) + (blk * FW_BLKSZ);
+	union {
+		struct {
+			u8 cmd;
+			u8 data[FW_BLKSZ];
+			u8 sec;
+			u8 blk;
+			u8 csum;
+		};
+		u8 raw[FW_BLKSZ + 4];
+	} buf;
+	struct i2c_msg xfer[1];
+	unsigned int retries = 3;
+	u8 ack = 0;
+	int ret;
+	int i;
+
+	buf.cmd = DFU_WRITE_BLOCK;
+	memcpy(buf.data, fw->data + offset, FW_BLKSZ);
+	buf.sec = sec;
+	buf.blk = blk;
+	buf.csum = 0;
+
+	for (i = 0; i < sizeof(buf) - 1; i++)
+		buf.csum += buf.raw[i];
+	buf.csum = 0xFF - buf.csum;
+
+	xfer[0].addr = MCU_ADDRESS;
+	xfer[0].flags = 0;
+	xfer[0].len = sizeof(buf);
+	xfer[0].buf = buf.raw;
+
+retry:
+	ret = a2b_node_i2c_xfer(node, xfer, 1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * These sleeps are stolen from the firmware code. They might be too
+	 * generous. But issuing a DFU_READ_ACK command too early will clobber
+	 * the I2C RX buffer in the MCU while it is reading from that buffer to
+	 * write a block. So the sleeps are crucial.
+	 */
+	if (blk == FW_BLKS_PER_SEC - 1)
+		msleep(100);
+	else
+		msleep(3);
+
+	/*
+	 * An ACK indicates that the checksum at the end of the previous
+	 * DFU_WRITE_BLOCK command was correct on the receiving (MCU) end.
+	 */
+	ret = beo_shape_node_read8(node, DFU_READ_ACK, &ack);
+	if (ret)
+		return ret;
+
+	if (ack != DFU_ACK) {
+		if (--retries > 0)
+			goto retry;
+
+		dev_err_ratelimited(&node->dev,
+				    "got NACK on write of sec %d blk %d\n", sec,
+				    blk);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int beo_shape_node_write_fw(struct a2b_node *node,
+				   const struct firmware *fw)
+{
+	u8 sec, blk;
+	int ret;
+
+	for (sec = 0; sec < FW_SECTORS; sec++) {
+		for (blk = 0; blk < FW_BLKS_PER_SEC; blk++) {
+			ret = beo_shape_node_write_fw_blk(node, fw, sec, blk);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/*
+	 * The firmware might silently ignore (but still ACK) subsequent
+	 * commands for some reason... give it a moment.
+	 */
+	msleep(100);
+
+	return 0;
+}
+
+struct beo_shape_node {
+	bool resetting;
+};
+
+static int beo_shape_node_setup(struct a2b_node *node)
+{
+	struct beo_shape_node *shape;
+	const struct firmware *fw;
+	u32 fw_ver32;
+	u16 fw_ver;
+	int ret;
+	u8 flag;
+
+	if (node->priv)
+		shape = node->priv;
+	else {
+		shape = devm_kzalloc(&node->dev, sizeof(*shape), GFP_KERNEL);
+		if (!shape)
+			return -ENOMEM;
+
+		node->priv = shape;
+	}
+
+	/*
+	 * A reset command was already sent to flip the MCU into APP or DFU
+	 * mode. Nothing left to do until a bus drop. Just continue deferring
+	 * probe.
+	 */
+	if (shape->resetting)
+		return -EPROBE_DEFER;
+
+	ret = beo_shape_node_get_dfu_flag(node, &flag);
+	if (ret)
+		return ret;
+
+	ret = request_firmware(&fw, "beo/shape.bin", &node->dev);
+	if (ret)
+		return ret;
+
+	if (fw->size != FW_SIZE) {
+		ret = -EINVAL;
+		goto release_fw;
+	}
+
+	/*
+	 * The firmware binary contains a 32 bit version field at a fixed
+	 * offset. There is also a 16 bit representation of the version returned
+	 * by the APP over I2C. The data is interchangeable so we convert to a
+	 * 16 bit representation to test whether or not the Shape needs a
+	 * firmware update.
+	 */
+	fw_ver32 = *((u32 *)&fw->data[FW_VER32_OFFSET]);
+	fw_ver = FW_VER32_TO_FW_VER(fw_ver32);
+
+	if (flag != FLAG_DFU_MODE) {
+		u32 hw_ver = 0;
+		u32 type_no;
+		u32 item_no;
+		u32 serial_no;
+		u16 app_ver;
+
+		/*
+		 * The APP firmware returns 0 on some read commands while it is
+		 * still initializing. It doesn't send I2C NAKs. Due to this,
+		 * the driver has to poll something to figure out when the
+		 * firmware is actually ready. From what I can see, the HW
+		 * revision is the last thing to get populated out of the
+		 * miscellaneous read registers, and also not at all likely to
+		 * be 0 thereafter. So let's use that. Give it up to 3 seconds.
+		 */
+		ret = read_poll_timeout(beo_shape_node_get_hw_ver, ret,
+					(ret != 0 || hw_ver != 0), 100e3, 2e6,
+					true, node, &hw_ver);
+		if (ret)
+			goto release_fw;
+
+		ret = beo_shape_node_get_app_ver(node, &app_ver);
+		if (ret)
+			goto release_fw;
+
+		ret = beo_shape_node_get_type_no(node, &type_no);
+		if (ret)
+			goto release_fw;
+
+		ret = beo_shape_node_get_item_no(node, &item_no);
+		if (ret)
+			goto release_fw;
+
+		ret = beo_shape_node_get_serial_no(node, &serial_no);
+		if (ret)
+			goto release_fw;
+
+		dev_info(&node->dev,
+			 "shape hw %u (%s) fw " FW_VER_FMT
+			 " type %u item %u serial %u \n",
+			 hw_ver, beo_shape_node_hw_ver_string(hw_ver),
+			 FW_VER(app_ver), type_no, item_no, serial_no);
+
+		if (app_ver != fw_ver || (BIT(node->addr) & force_fwupd)) {
+			dev_info(&node->dev, "entering DFU mode\n");
+
+			/*
+			 * Unset the bit now that we are updating this shape in
+			 * order to avoid an infinite update loop
+			 */
+			force_fwupd &= ~BIT(node->addr);
+
+			ret = beo_shape_node_enter_dfu_mode(node);
+			if (ret)
+				goto release_fw;
+
+			/* Expect a bus drop now */
+			shape->resetting = true;
+			ret = -EPROBE_DEFER;
+			goto release_fw;
+		}
+	} else {
+		dev_info(&node->dev, "writing fw " FW_VER32_FMT "\n",
+			 FW_VER32(fw_ver32));
+
+		ret = beo_shape_node_write_fw(node, fw);
+		if (ret)
+			goto release_fw;
+
+		dev_info(&node->dev, "entering APP mode\n");
+
+		ret = beo_shape_node_enter_app_mode(node);
+		if (ret)
+			goto release_fw;
+
+		/* Expect a bus drop now */
+		shape->resetting = true;
+		ret = -EPROBE_DEFER;
+		goto release_fw;
+	}
+
+release_fw:
+	release_firmware(fw);
+
+	if (ret)
+		return ret;
+
+	return ad24xx_node_setup(node);
+}
+
+static struct a2b_node_ops beo_shape_node_ops = {
+	.set_respcycs = ad24xx_node_set_respcycs,
+	.set_switching = ad24xx_node_set_switching,
+	.is_last = ad24xx_node_is_last,
+	.setup = beo_shape_node_setup,
+	.teardown = ad24xx_node_teardown,
+};
+
+static int beo_shape_node_probe(struct device *dev)
+{
+	struct a2b_node *node = to_a2b_node(dev);
+	int ret;
+
+	node->ops = &beo_shape_node_ops;
+	node->chip_info = of_device_get_match_data(dev);
+
+	ret = a2b_register_node(node);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void beo_shape_node_remove(struct device *dev)
+{
+	struct a2b_node *node = to_a2b_node(dev);
+
+	a2b_unregister_node(node);
+}
+
+static const struct of_device_id beo_shape_node_of_match_table[] = {
+	{
+		.compatible = "beo,shape-node",
+		.data = &ad24xx_chip_info[A2B_AD2425],
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, beo_shape_node_of_match_table);
+
+static struct a2b_driver beo_shape_node_driver = {
+	.driver = {
+		.name = "beo-shape-node",
+		.of_match_table = beo_shape_node_of_match_table,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = beo_shape_node_probe,
+	.remove = beo_shape_node_remove,
+};
+module_a2b_driver(beo_shape_node_driver);
+
+MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
+MODULE_DESCRIPTION("Beosound Shape A2B transceiver node driver");
+MODULE_LICENSE("GPL");

-- 
2.44.0


