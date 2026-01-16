Return-Path: <linux-i2c+bounces-15223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3ED2F700
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59F48302955C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0060822424C;
	Fri, 16 Jan 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mM9XPjUa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9EE2DA77F
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558702; cv=none; b=HSkjbssfFIV9BzIbaboBXler/QNhjcX0tYC8CPUrEQJA3TA0bkkT7eC6WCuC61VmAlKvKHR6TyHVKy1xsByfejL9ut/bLJSyqIRV8BXNB0orKRWez8wFU3ku3Jzz3bQsQlVZmkVwM2EPG2BnRsMYAb3Ohy+/WD+J8sKwjYlqglM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558702; c=relaxed/simple;
	bh=fY1vlaNG9rfSl7hZWIKtQdWuSfKXucxRWfFOOtNmcp8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=lqpn/uj3jmkD1lwyvZXNw+OF0vjoIKqsWor0xf5XKyc4lup6MbXgCBq0v3u1cETD2PMLp8KntSqg3gDXKD4QmM+KwY2umA+WtMYBwj/FMB1z+IGluwFue8P6dfiTwKYxKw7/l5rh2FnweHjMyzFd/pZKa6jMmq38pPNFioZ4iRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mM9XPjUa; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-655ae329d6bso793397a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 02:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768558699; x=1769163499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yqm/yKHcDbxewBOKx84pZAViFu0mXsZwDIIfDIlwTsk=;
        b=mM9XPjUaRRQ5IncPoAiDkoJF/yEP/e7V+5+sWLpg/PH0i9+Gg9m1W1j823zKAWOLfk
         1wZTJE3j/YCm2gA+VffqPjx4bwZo/sVfN0qFjPGwJ8daPW3M1Qjfc6ANtiz0YG3JP7W8
         /ndb18xDeKn932wmqNz8FEs7WaRMaCVCn8UkmRI25UYYHkMzgzOk/VRMxKSM2jhHN6tS
         jZ5fmZ/35S1QqJW23hboAiKlykt1kaSw9C9zqdweMmrVx+AVvba672F+7yuTanx24CZk
         WCXAnRFMQyetBu6ymvAwyEfhO7qyBRe445CtoL1DoUYfXjysSciNfG0alYHW8XoS57RQ
         YPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558699; x=1769163499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yqm/yKHcDbxewBOKx84pZAViFu0mXsZwDIIfDIlwTsk=;
        b=vjAtB4B4NJgFT6gCBv/E6InqiuyPiWmY/T9X4Tx/7Xf6q+tPQUOuZzCaD/p6RrTpuW
         Y3kF7sEyoF31ckH1mtr0K7XiRkfB6JTLw9WMwX3eTzpb4Dz1SsJNx6Atxs/6oG/596cU
         k0w6JdLYk+fYR8IpBVPm8f1w226fp4Lk1fLjxnLOn3XxK4EuHNluWsCbbUbUN6dBxKfG
         VtpM2Dqe9Q5BD4VSPiMc302vmdnOUVPzjTR3E7VaCmc0IyP1W+AwKBsI2b9hUTzNfJYo
         8+pUpwyWyVuvBQbPmBdiYiKkRs5ct68ks8WV0I7UNpObZ13SY/8QXQh8+/VnN/GpuLf/
         7pQw==
X-Forwarded-Encrypted: i=1; AJvYcCUmWmhKcSB52qYlJJQcE+4sBUDF8ORjeYNzB1UelaD2WfZy6D/bKHshwjTTGtuVsDju4Y/3OGO8uaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtqx7jHIM/2pqu8inmjGpDkkhHKjBzS56LMSw1/KzFIGqrtUY1
	DBUF5Wbx5SAtWgch/S3tSsYswzSjLSMsZQoqZn0tG6AWbsItdukgAt/x5oUesxcVHsPgveZkMNL
	DZLRjrSs=
X-Gm-Gg: AY/fxX65KnEoqq0ZmhoAW68YYRSvrTPwhoD4MMW9HnmLo3Fe1O94QYy/9/ifsr5HA2i
	o6AXW2b0aVFDSD96pF6tdzSplaTF5mLhHGkbzv1CV3NY61fRdSLCEo2UqGhxaczLoZsGHjpqp3T
	cJpYa3yLawlMroW/BqdBtWMzq20orVtSTqdNUumF/p+vN2ILnD7w/Vn/sqfwTVIul2PJmdiTlEN
	kYlyC5YVx7WbRWUrSXHkIUzQxMsHCsXmmpdbiyinyqrqxB7qtCjsu4Yy2rMxplKxiZ+SH0TpDQt
	TLQbcXNSnixTQZFJIzqk9otgPa891+aG+KvPBn04pn406HGTqzbNf2DCy8m3rp9BW13R/XDzjcI
	6sOAoq+9bCEDaN9c4NmBek2z5Rbil39rGlzGwbb04FeDRx9MHdi9orY1UWA==
X-Received: by 2002:a17:906:f597:b0:b73:8639:334a with SMTP id a640c23a62f3a-b87968d0c82mr155084466b.13.1768558698592;
        Fri, 16 Jan 2026 02:18:18 -0800 (PST)
Received: from localhost ([151.57.145.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9763sm179042366b.35.2026.01.16.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:18:18 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2] i2c: Add FTDI FT4222H USB I2C adapter
Date: Fri, 16 Jan 2026 11:18:16 +0100
Message-Id: <20260116101816.1200416-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15908; i=flavra@baylibre.com; h=from:subject; bh=fY1vlaNG9rfSl7hZWIKtQdWuSfKXucxRWfFOOtNmcp8=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpahBY7vcb1UDBhvIwojAYmPs2plHtJeCDTHQlE hPra9PkHdOJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaWoQWAAKCRDt8TtzzpQ2 X6zjC/45vTBpd88uTLQEYIpfwa6z0SYbZR0/DIAea0NIc1LhGmniZBJFDXrhBlj0sjoFZyPWiqU 1e8JcmgrdNiHaJ3xwE90dj6cHlY5n4j+Or/pflHLPBdr7g/LBbUXswj58x4DbWJInuDh2pdWb7I iBo71/dY8KJKaVUUfRgMXbQED5N7M50HHNNwC/chE/dJMkNIBPrJn76v/TeuS5KJTu7XoZ+k19R wlY63LYtd8e0I4zn/XyCptHTV74tn1dGSNBfVULvnKnzYheqjRsaL9/dxaIrMy8x+mQF8VaoxH2 Luycw6tnEU9d/TNQGtuKYhUO8BopRZyJA7sCo0MV6KYA71RvjwC3NyMJAMc+KyLmwljSuipxFzY 61bh9jbun4p/uiy43AMgyEiC9XWHKeQUzu0UzPzkTFepv63+3J3cxLvENrk5HwfuHedCnIkdQPu Lw/SPUJ3sphL1k4rgQSCirkkrzqr0pkv+L1fShZOConH3+n70QC5TBri4k3vLBBQYtdzQ=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

FT4222H exports a USB interface to operate as I2C bus master when set up
(via the DCNF pins) in configuration mode 0 or 3.
The USB communication protocol implemented by the FT4222 chip is not
publicly documented, therefore the name assigned to the various defines
used in the USB communication code is a semi-educated guess after sniffing
USB traffic generated with the FTDI FT4222 userspace library.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---

Changes from v1 [1]:
- replaced magic numbers with symbolic constants
- changed enums to use capital letters
- decreased max retries in ft4222_i2c_get_status()
- removed not so useful dev_dbg() call
- removed handling of configuration modes 1 and 2
- miscellaneous stylistic changes

[1] https://lore.kernel.org/linux-i2c/20260106170807.3964886-1-flavra@baylibre.com/T/

 .../ABI/testing/sysfs-bus-i2c-devices-ft4222  |   7 +
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ft4222.c               | 455 ++++++++++++++++++
 4 files changed, 474 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-ft4222
 create mode 100644 drivers/i2c/busses/i2c-ft4222.c

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-ft4222 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-ft4222
new file mode 100644
index 000000000000..fdd921f723bd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-ft4222
@@ -0,0 +1,7 @@
+What:		/sys/bus/i2c/devices/i2c-<bus-id>/i2c_freq
+Date:		January 2026
+KernelVersion:	6.20
+Contact:	Francesco Lavra <flavra@baylibre.com>
+Description:	(RW) I2C bus clock frequency, expressed in Hz.
+		Accepted values range from 100000 (standard mode) to 3400000
+		(high-speed mode).
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index bcbc6693dbe4..313613e07abe 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1462,6 +1462,17 @@ config I2C_TINY_USB
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-tiny-usb.
 
+config I2C_FT4222
+	tristate "FTDI FT4222 USB to I2C interface"
+	depends on USB
+	help
+	  Include support for interfacing with I2C devices via an FTDI
+	  FT4222H USB device that acts as I2C master.
+	  The I2C interface is available when the chip is set up (via the
+	  DCNF0 and DCNF1 pins) in configuration mode 0 or 3.
+
+	  If built as a module, this driver creates a module called i2c-ft4222.
+
 config I2C_VIPERBOARD
 	tristate "Viperboard I2C master support"
 	depends on MFD_VIPERBOARD && USB
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index e1a71830321c..bb708372ef3a 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -144,6 +144,7 @@ obj-$(CONFIG_I2C_PCI1XXXX)	+= i2c-mchp-pci1xxxx.o
 obj-$(CONFIG_I2C_ROBOTFUZZ_OSIF)	+= i2c-robotfuzz-osif.o
 obj-$(CONFIG_I2C_TAOS_EVM)	+= i2c-taos-evm.o
 obj-$(CONFIG_I2C_TINY_USB)	+= i2c-tiny-usb.o
+obj-$(CONFIG_I2C_FT4222)	+= i2c-ft4222.o
 obj-$(CONFIG_I2C_VIPERBOARD)	+= i2c-viperboard.o
 
 # Other I2C/SMBus bus drivers
diff --git a/drivers/i2c/busses/i2c-ft4222.c b/drivers/i2c/busses/i2c-ft4222.c
new file mode 100644
index 000000000000..684c7a47c95f
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ft4222.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * FTDI FT4222H USB-to-I2C bridge
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+
+#define FT4222_CONF0	0x18
+#define FT4222_CONF3	0x17
+
+/* USB endpoints */
+#define FT4222_EP_CTRL	0
+#define FT4222_EP_RX	1
+#define FT4222_EP_TX	2
+
+/* USB request values */
+#define FT4222_REQ_CMD_GET	0x20
+#define FT4222_REQ_CMD_SET	0x21
+
+/* USB request types */
+#define FT4222_REQTYPE_CMD_GET	0xC0
+#define FT4222_REQTYPE_CMD_SET	0x40
+
+#define FT4222_REQIDX	0x0001
+
+#define FT4222_CMD_I2C_ENABLE	0x05
+#define FT4222_CMD_I2C_RESET	0x51
+#define FT4222_CMD_I2C_CLOCK	0x52
+
+#define FT4222_CMD_SYS_CLK	0x0004
+#define FT4222_CMD_I2C_STATUS	0xF5B4
+
+#define FT4222_I2C_CLK_M_LOW	8
+#define FT4222_I2C_CLK_M_HIGH	6
+#define FT4222_I2C_CLK_N_HIGH	0xC0
+
+/*
+ * Tx header:
+ * - I2C device address + R/W bit (1 byte)
+ * - flags (1 byte)
+ * - message length (2 bytes)
+ */
+#define FT4222_TX_HDRLEN	4
+
+#define FT4222_RX_HDRLEN	2
+
+#define FT4222_BULK_MAXLEN	512
+#define FT4222_IO_TIMEOUT	5000
+
+#define FT4222_FLAG_START	0x2
+#define FT4222_FLAG_RESTART	0x3
+#define FT4222_FLAG_STOP	0x4
+#define FT4222_FLAG_NONE	0x80
+
+/* Status flags */
+#define FT4222_I2C_CTRL_BUSY	(1 << 0)
+#define FT4222_I2C_ERROR	(1 << 1)
+#define FT4222_I2C_ADDR_NACK	(1 << 2)
+#define FT4222_I2C_DATA_NACK	(1 << 3)
+#define FT4222_I2C_ARB_LOST	(1 << 4)
+#define FT4222_I2C_CTRL_IDLE	(1 << 5)
+#define FT4222_I2C_BUS_BUSY	(1 << 6)
+
+enum ft4222_sys_clk {
+	FT4222_SYS_CLK_60 = 0,
+	FT4222_SYS_CLK_24,
+	FT4222_SYS_CLK_48,
+	FT4222_SYS_CLK_80,
+};
+
+struct ft4222_i2c {
+	struct i2c_adapter adapter;
+	struct usb_device *udev;
+	u8 ubuf[FT4222_BULK_MAXLEN];
+	unsigned int sys_clk;	/* system clock frequency */
+	unsigned int freq;	/* I2C bus frequency */
+};
+
+static int ft4222_cmd_set(struct ft4222_i2c *ftdi, u8 cmd, u8 val)
+{
+	struct usb_device *udev = ftdi->udev;
+
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, FT4222_EP_CTRL),
+			       FT4222_REQ_CMD_SET, FT4222_REQTYPE_CMD_SET,
+			       cmd | (((u16)val) << 8), FT4222_REQIDX, NULL, 0,
+			       FT4222_IO_TIMEOUT);
+}
+
+static int ft4222_cmd_get(struct ft4222_i2c *ftdi, u16 cmd, u8 *val)
+{
+	struct usb_device *udev = ftdi->udev;
+	int ret;
+
+	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, FT4222_EP_CTRL),
+			      FT4222_REQ_CMD_GET, FT4222_REQTYPE_CMD_GET, cmd,
+			      FT4222_REQIDX, ftdi->ubuf, sizeof(*val),
+			      FT4222_IO_TIMEOUT);
+	if (ret == sizeof(*val))
+		*val = ftdi->ubuf[0];
+	else if (ret >= 0)	/* unexpected number of bytes transferred */
+		ret = -EIO;
+	return ret;
+}
+
+static int ft4222_i2c_reset(struct ft4222_i2c *ftdi)
+{
+	return ft4222_cmd_set(ftdi, FT4222_CMD_I2C_RESET, 1);
+}
+
+static int ft4222_i2c_get_status(struct ft4222_i2c *ftdi)
+{
+	/*
+	 * Multiple retries are needed mostly when retrieving the controller
+	 * status after doing a write with the I2C bus operating at a low speed.
+	 * Empirical tests conducted at 100 kHz showed that after a
+	 * maximum-sized (512-byte) write, up to 11 retries are needed before
+	 * the chip clears its CTRL_BUSY flag. But under certain conditions more
+	 * retries may be needed: for example, when trying to do a write after
+	 * disconnecting the SCL line from the I2C slave, tests showed that up
+	 * to 64 retries are needed.
+	 */
+	const int max_retries = 70;
+	int retry;
+	u8 status;
+
+	for (retry = 0; retry < max_retries; retry++) {
+		int ret = ft4222_cmd_get(ftdi, FT4222_CMD_I2C_STATUS, &status);
+
+		if (ret < 0)
+			return ret;
+		if (!(status & FT4222_I2C_CTRL_BUSY))
+			break;
+	}
+	if (retry == max_retries) {
+		ft4222_i2c_reset(ftdi);
+		return -ETIMEDOUT;
+	}
+	if (!(status & FT4222_I2C_ERROR))
+		return 0;
+	if (status & FT4222_I2C_ADDR_NACK)
+		return -ENXIO;
+	else if (status & FT4222_I2C_DATA_NACK)
+		return -EIO;
+	else
+		return -EBUSY;
+}
+
+static int ft4222_i2c_write(struct ft4222_i2c *ftdi, u8 flags, u8 slave_addr,
+			    u8 *data, int len)
+{
+	struct usb_device *udev = ftdi->udev;
+	unsigned int pipe = usb_sndbulkpipe(udev, FT4222_EP_TX);
+	u8 *buf = ftdi->ubuf;
+	int written = 0;
+
+	dev_dbg(&ftdi->adapter.dev, "write to 0x%02x, flags 0x%02x, len %d",
+		slave_addr, flags, len);
+	buf[0] = slave_addr << 1;
+	buf[2] = buf[3] = 0;
+	do {
+		int pkt_len = min(FT4222_TX_HDRLEN + len - written,
+				  FT4222_BULK_MAXLEN);
+		bool first_pkt = (written == 0);
+		bool last_pkt = (written + pkt_len == FT4222_TX_HDRLEN + len);
+		int ret, actual_len;
+
+		buf[1] = 0;
+		if (first_pkt)
+			buf[1] |= flags & FT4222_FLAG_RESTART;
+		if (last_pkt)
+			buf[1] |= flags & FT4222_FLAG_STOP;
+		if (buf[1] == 0)
+			buf[1] = FT4222_FLAG_NONE;
+		memcpy(buf + FT4222_TX_HDRLEN, data + written,
+		       pkt_len - FT4222_TX_HDRLEN);
+		ret = usb_bulk_msg(udev, pipe, buf, pkt_len, &actual_len,
+				   FT4222_IO_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		if (actual_len < pkt_len)
+			return -EIO;
+		ret = ft4222_i2c_get_status(ftdi);
+		if (ret < 0)
+			return ret;
+		written += pkt_len - FT4222_TX_HDRLEN;
+	} while (written < len);
+	return 0;
+}
+
+static int ft4222_i2c_read(struct ft4222_i2c *ftdi, u8 flags, u8 slave_addr,
+			   u8 *data, int len)
+{
+	struct usb_device *udev = ftdi->udev;
+	unsigned int pipe = usb_rcvbulkpipe(udev, FT4222_EP_RX);
+	u8 *buf = ftdi->ubuf;
+	int actual_len;
+	int read = 0;
+	int ret;
+
+	dev_dbg(&ftdi->adapter.dev, "read from 0x%02x, flags 0x%02x, len %d",
+		slave_addr, flags, len);
+	buf[0] = (slave_addr << 1) | 1;
+	buf[1] = flags;
+	buf[2] = len >> 8;
+	buf[3] = len;
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, FT4222_EP_TX), buf,
+			   FT4222_TX_HDRLEN, &actual_len, FT4222_IO_TIMEOUT);
+	if (ret < 0)
+		return ret;
+	if (actual_len != FT4222_TX_HDRLEN)
+		return -EIO;
+	do {
+		int pkt_len = min(FT4222_RX_HDRLEN + len - read,
+				  FT4222_BULK_MAXLEN);
+
+		ret = usb_bulk_msg(udev, pipe, buf, pkt_len, &actual_len,
+				   FT4222_IO_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		if (actual_len < FT4222_RX_HDRLEN)
+			return -EIO;
+		actual_len -= FT4222_RX_HDRLEN;
+		memcpy(data + read, buf + FT4222_RX_HDRLEN, actual_len);
+		read += actual_len;
+	} while (read < len);
+	return ft4222_i2c_get_status(ftdi);
+}
+
+static int ft4222_i2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msg,
+			   int num)
+{
+	struct ft4222_i2c *ftdi = container_of(adapter, struct ft4222_i2c,
+					       adapter);
+	int ret;
+	int i;
+
+	dev_dbg(&adapter->dev, "transfer with %d message(s)", num);
+	for (i = 0; i < num; ++i) {
+		const u8 addr = msg[i].addr;
+		const u16 len = msg[i].len;
+		u8 *buf = msg[i].buf;
+		u8 flags;
+
+		flags = ((i == 0) ? FT4222_FLAG_START : FT4222_FLAG_RESTART);
+		if (i == num - 1)
+			flags |= FT4222_FLAG_STOP;
+		if (msg[i].flags & I2C_M_RD)
+			ret = ft4222_i2c_read(ftdi, flags, addr, buf, len);
+		else
+			ret = ft4222_i2c_write(ftdi, flags, addr, buf, len);
+		if (ret < 0)
+			goto err;
+	}
+	return num;
+err:
+	ft4222_i2c_reset(ftdi);
+	return ret;
+}
+
+static u32 ft4222_i2c_func(struct i2c_adapter *adapter)
+{
+	/*
+	 * The device seems to be unable to perform I2C transactions with 0 data
+	 * length, hence no support for SMBus quick command.
+	 */
+	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL_ALL & ~I2C_FUNC_SMBUS_QUICK);
+}
+
+static const struct i2c_algorithm ft4222_i2c_algo = {
+	.master_xfer = ft4222_i2c_xfer,
+	.functionality = ft4222_i2c_func,
+};
+
+static int ft4222_i2c_setup(struct ft4222_i2c *ftdi, unsigned int freq)
+{
+	bool hi_freq = (freq > I2C_MAX_FAST_MODE_FREQ);
+	const int m = hi_freq ? FT4222_I2C_CLK_M_HIGH : FT4222_I2C_CLK_M_LOW;
+	u8 n;
+	int ret;
+
+	if ((freq < I2C_MAX_STANDARD_MODE_FREQ) ||
+	    (freq > I2C_MAX_HIGH_SPEED_MODE_FREQ))
+		return -EINVAL;
+	n = DIV_ROUND_UP(ftdi->sys_clk, freq * m) - 1;
+	if (hi_freq)
+		n |= FT4222_I2C_CLK_N_HIGH;
+	ret = ft4222_cmd_set(ftdi, FT4222_CMD_I2C_CLOCK, n);
+	if (ret < 0)
+		return ret;
+	ret = ft4222_cmd_set(ftdi, FT4222_CMD_I2C_ENABLE, 1);
+	if (ret < 0)
+		return ret;
+	ftdi->freq = freq;
+	return 0;
+}
+
+static struct ft4222_i2c *ft4222_i2c_from_dev(struct device *dev)
+{
+	struct i2c_adapter *adapter = to_i2c_adapter(dev);
+
+	return container_of(adapter, struct ft4222_i2c, adapter);
+}
+
+static ssize_t i2c_freq_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct ft4222_i2c *ftdi = ft4222_i2c_from_dev(dev);
+
+	return sysfs_emit(buf, "%u\n", ftdi->freq);
+}
+
+static ssize_t i2c_freq_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	unsigned int i2c_freq;
+	int ret;
+
+	ret = kstrtouint(buf, 10, &i2c_freq);
+	if (!ret) {
+		struct ft4222_i2c *ftdi = ft4222_i2c_from_dev(dev);
+
+		ret = ft4222_i2c_setup(ftdi, i2c_freq);
+	}
+	return ret < 0 ? ret : count;
+}
+
+static DEVICE_ATTR_RW(i2c_freq);
+
+static struct attribute *ft4222_attrs[] = {
+	&dev_attr_i2c_freq.attr,
+	NULL
+};
+
+static const struct attribute_group ft4222_attr_group = {
+	.attrs = ft4222_attrs,
+};
+
+static const struct attribute_group *ft4222_attr_groups[] = {
+	&ft4222_attr_group,
+	NULL
+};
+
+static int ft4222_i2c_init(struct usb_interface *interface)
+{
+	struct device *dev = &interface->dev;
+	struct i2c_adapter *adapter;
+	struct ft4222_i2c *ftdi;
+	unsigned int sys_clk;
+	u8 sys_clk_enum;
+	int ret;
+
+	ftdi = devm_kmalloc(dev, sizeof(*ftdi), GFP_KERNEL);
+	if (!ftdi)
+		return -ENOMEM;
+	ftdi->udev = interface_to_usbdev(interface);
+
+	ret = ft4222_cmd_get(ftdi, FT4222_CMD_SYS_CLK, &sys_clk_enum);
+	if (ret < 0)
+		return ret;
+	switch (sys_clk_enum) {
+	case FT4222_SYS_CLK_60:
+		sys_clk = 60000000;
+		break;
+	case FT4222_SYS_CLK_24:
+		sys_clk = 24000000;
+		break;
+	case FT4222_SYS_CLK_48:
+		sys_clk = 48000000;
+		break;
+	case FT4222_SYS_CLK_80:
+		sys_clk = 80000000;
+		break;
+	default:
+		dev_err(dev, "unknown system clock setting %d", sys_clk_enum);
+		return -EOPNOTSUPP;
+	}
+	ftdi->sys_clk = sys_clk;
+
+	ret = ft4222_i2c_setup(ftdi, I2C_MAX_FAST_MODE_FREQ);
+	if (ret < 0)
+		return ret;
+	ret = ft4222_i2c_reset(ftdi);
+	if (ret < 0)
+		return ret;
+
+	adapter = &ftdi->adapter;
+	memset(adapter, 0, sizeof(*adapter));
+	adapter->owner = THIS_MODULE;
+	adapter->algo = &ft4222_i2c_algo;
+	adapter->dev.parent = dev;
+	adapter->dev.groups = ft4222_attr_groups;
+	snprintf(adapter->name, sizeof(adapter->name),
+		 "FT4222 USB-to-I2C %03d-%03d", ftdi->udev->bus->busnum,
+		 ftdi->udev->devnum);
+	ret = devm_i2c_add_adapter(dev, adapter);
+	if (ret < 0)
+		return ret;
+	dev_dbg(&adapter->dev, "system clock frequency %d Hz", sys_clk);
+	return 0;
+}
+
+static u8 ft4222_get_conf(struct usb_interface *interface)
+{
+	struct usb_device *udev = interface_to_usbdev(interface);
+	u16 dev_type = udev->descriptor.bcdDevice;
+
+	return dev_type >> 8;
+}
+
+static int ft4222_i2c_probe(struct usb_interface *interface,
+			    const struct usb_device_id *id)
+{
+	int intf = interface->cur_altsetting->desc.bInterfaceNumber;
+	u8 conf_mode;
+
+	/*
+	 * When FT4222H is set up (via the DCNF pins) in configuration mode 0 or
+	 * 3, its USB interface number 0 can be used to operate it as I2C bus
+	 * master.
+	 */
+	if (intf != 0)
+		return -ENODEV;
+	conf_mode = ft4222_get_conf(interface);
+	if ((conf_mode != FT4222_CONF0) && (conf_mode != FT4222_CONF3))
+		return -ENODEV;
+
+	return ft4222_i2c_init(interface);
+}
+
+static void ft4222_i2c_disconnect(struct usb_interface *interface)
+{
+}
+
+static const struct usb_device_id ft4222_id_table[] = {
+	{ USB_DEVICE(0x0403, 0x601C) },
+	{ }
+};
+MODULE_DEVICE_TABLE(usb, ft4222_id_table);
+
+static struct usb_driver ft4222_i2c_usb_driver = {
+	.name = "i2c-ft4222",
+	.probe = ft4222_i2c_probe,
+	.disconnect = ft4222_i2c_disconnect,
+	.id_table = ft4222_id_table,
+};
+
+module_usb_driver(ft4222_i2c_usb_driver);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("FT4222H USB-to-I2C bridge");
-- 
2.39.5


