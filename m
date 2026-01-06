Return-Path: <linux-i2c+bounces-14921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C34CF98A6
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 18:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F012030216AA
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 17:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAFD342CA9;
	Tue,  6 Jan 2026 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iQkksytG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30B337104
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719294; cv=none; b=ATqgwH0V5Mjx76x0LXEIj6d0JOtSZ2xitPBwVcDQvCJJDKxTrlYsZbx+WsHniqqyUfJybiaGLaMlSgaGto/IICo77IRRT7c+i35KNlAubvpEydUyTMf4gRA1SzCW2Mzs1SFJEntKba8G6p7A6xkxR8fP6ggWx7Gz2zFt51XLqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719294; c=relaxed/simple;
	bh=2wkr1mPlSoPWFPXeXwcjADyL6X9tU+VP+NcieIUq0bY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=IjPYGSKZ02aKfJ81CveR8ea3PqTeqAEVxYtkQfnATCbJ06Gg5Uyxy3aWRvDDMdaNGbcMg3VUITUF+jfVy+fOPRPTFMvfatJnMz5kHvGHJxKUO4//ZdkvNTenFXfELFNNWbvlJkzJlsDP9AnQmjnSLPrYOlMaeoonBic56+M0aOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iQkksytG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so53771a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767719290; x=1768324090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqm5qo9/ndO158m4ulOD6ef3eP6yrrQHl8rQdruzh6Q=;
        b=iQkksytG6Ae0LpqhJyAzq0mLwjpdpbmwD0YC9qAPpRrKBSmbif0kUSRdpANHsbIfun
         RghMdMQzOFHMzfYRs0BaNd2lhmL+TAMu4rcWbMEBoYuwahIeDVpS7Z827s06WzHm+VYB
         QpG2eE8D0vl+c7lPSpVT9C7tYU32PcPc4thcpIYvOPoqIICoCSgDOm2Ej/TYpiydobDA
         1rFsuPImASqfS1G4cMc0rDn1YknzzSlHUgensbx0qrj2iURbjZAaiD9RHSHp6kKySdwN
         PAbJCbM0Nfn8prSzXW+MFaAAOh2XuOoqyrO9VN75e1fvTQ7saW0+zph5Vvn7+P5HvVOI
         24Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767719290; x=1768324090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fqm5qo9/ndO158m4ulOD6ef3eP6yrrQHl8rQdruzh6Q=;
        b=NY1Xs2KifGBNeh3cokGXiS0VDHNkaw7HPLI0Mo9uoSAOsJ8mWKEFYhGk2F0tYW9/MH
         LMTnucgDo6nCkU91AT7kOznMfLLgMlLX2Z9w8hUYvl6jCQAdyNX9mj+3ezp6RnFA2K/d
         qW4uyJeEVfk39LbVDCe7jtuNF00AT/npKRXtiy80LxAYJDwBLIgXpttrzTVLTkWwny4e
         RXrhfo1A12rL4TW94DJXxoOIZap8AXHU/ah5Yso3uMn0pKM/qNSAS+d3hcaYc5rFNcfA
         cfYGOdvCdOaER3/QnfrnNs01t5T5KtgFD1+wd+YUjs8sXs5ThuGbPArTWHOJpJi2h++F
         adEA==
X-Forwarded-Encrypted: i=1; AJvYcCWDiQe6uywDPZHjmJXTd8WuOU0aOVFAsjrfiNYv3SqIoqRVZOJSKt7SW6BrGjUXc9HRb7qrSnrz7fY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zkzzNFG9T4RZwv+Pd1nSR1Zy+xl2/uzA+ayO3pAlwGaszPOY
	Hb4ua4gwUBhvjKojut+cH7dIl+XdWeNB74qrtu1vk0S8c9Kl6YQtuKg10GQ2V7Dqx5s=
X-Gm-Gg: AY/fxX5NpH9PYC5AIp5C9vCZ2j0+Hb1PqpMlY9R01qodl2e83AD0LwNw+I1AGALBvy7
	7AL+H8K8FdLZny3Q+/ifJ3Xdl4tG9LDeSU53pHp6MEOYxDM9L6VjTiI/du4NfZ2z/gjgCNxdKOi
	6w7pMSxFwoBa2xOqZxR5tKltbzvJfJ1eqDJQWnLofd7nKvbQWaoBom7+8yn68yVDJxVYXhQwJpC
	hXqlMbUzfhiCbN6BAFdeXlhe0R619D+y5YtYPvbiKeVmSMNx7ZG79QFKATuETUpFIkvdQQJkOkw
	ea3ZwdCt59vMxl40g/cKmqRRqOaKoCZt5oFAfNZj4oUqyJDSyMF2/pFvRJVu6SWhy7TtvKa13qY
	Ls356D9ipdD//jzhKQPV+KgrsD4uRZkM/blQKOxfMTuYlThJftnN+3dpvEUOegIR1xgJuNtQyTr
	01Yxme/Wg+0i0eJKs4jQY1H+SEcu6G9bOUFFNA32Li9Q==
X-Google-Smtp-Source: AGHT+IHQdp4EKzQigFAMpZCHNzEg75i6x035P6wfmUTY5I9dFEsUWioHvsirwANnO7nj5TDHw5Olzg==
X-Received: by 2002:aa7:d556:0:b0:640:abb1:5eff with SMTP id 4fb4d7f45d1cf-6507bc63142mr2541393a12.8.1767719289554;
        Tue, 06 Jan 2026 09:08:09 -0800 (PST)
Received: from localhost (mob-176-245-131-134.net.vodafone.it. [176.245.131.134])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c446esm2636827a12.6.2026.01.06.09.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:08:09 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: Add FTDI FT4222H USB I2C adapter
Date: Tue,  6 Jan 2026 18:08:07 +0100
Message-Id: <20260106170807.3964886-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14241; i=flavra@baylibre.com; h=from:subject; bh=2wkr1mPlSoPWFPXeXwcjADyL6X9tU+VP+NcieIUq0bY=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpXUE5Fls5iF1toRYtixIatIR2GHD3sc9CmRSsa DJtXzjrErOJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaV1BOQAKCRDt8TtzzpQ2 X33cC/9/ZG87FP3Ze/D7AUuYDLM7j0hqIjcPTLyJ3982yC0G4Rge1fA+i5FPfvQJmo11jCaUqgn frjpRtoqU9BTn8Pnd3l6ro1xHmKPN0cCrfHCgxSI+Xt4FN+nUVj9YU1j2lM1eNd+WpIoLmT2wOa b+T7a0WYAT2mJHciTZgziy0Moa5R40d8wN4Yhk1LkyHPTSq4UMHqvg6yu9Q7r0m+hJ0Ip8dhqZA H5UWb4EC3DTXpB0wuHta3ak6y6+ZR33FgYPI0uAfygG2VzpqwGh6PkYQG16QzcGKlaq/FAGIvdK Xohw7KJLd1bMNrsEY+2f/y44sZ6P2kdUrmXPi7bdFCZOhqFfr7k9QxhxuNrA9ioYjsGsjRUGHXS A/WWMaMsefP8xUyg8ohYZ/O8e7oIGfMcD91aFvXHI7pyDgnTfCVRcb42zDntYtnGv0EJ0trrotC FAHNrW4of4iZAHLIvSeZIPRQULzNvICKto9z5Mv3oSojCqVz3XNxz3m3EefAlD6/ZeEK0=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

FT4222H exports a USB interface to operate as I2C bus master when set up
(via the DCNF pins) in configuration mode 0 or 3.
The USB communication protocol implemented by the FT4222 chip is not
publicly documented, therefore the USB communication code in the driver
contains several magic numbers that have been retrieved by sniffing USB
traffic generated with the FTDI FT4222 userspace library.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-ft4222  |   7 +
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ft4222.c               | 425 ++++++++++++++++++
 4 files changed, 444 insertions(+)
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
index 000000000000..9e4eeae4d618
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ft4222.c
@@ -0,0 +1,425 @@
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
+#define FT4222_FLAG_START	0x2
+#define FT4222_FLAG_RESTART	0x3
+#define FT4222_FLAG_STOP	0x4
+#define FT4222_FLAG_NONE	0x80
+
+/**
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
+/* Status flags */
+#define FT4222_I2C_CTRL_BUSY	(1 << 0)
+#define FT4222_I2C_ERROR	(1 << 1)
+#define FT4222_I2C_ADDR_NACK	(1 << 2)
+#define FT4222_I2C_DATA_NACK	(1 << 3)
+#define FT4222_I2C_ARB_LOST	(1 << 4)
+#define FT4222_I2C_CTRL_IDLE	(1 << 5)
+#define FT4222_I2C_BUS_BUSY	(1 << 6)
+
+enum ft4222_conf_mode {
+	ft4222_conf0,
+	ft4222_conf12,
+	ft4222_conf3,
+};
+
+enum ft4222_sys_clk {
+	ft4222_sys_clk_60 = 0,
+	ft4222_sys_clk_24,
+	ft4222_sys_clk_48,
+	ft4222_sys_clk_80,
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
+	return usb_control_msg(udev, usb_sndctrlpipe(udev, 0), 0x21, 0x40,
+			       cmd | (((u16)val) << 8), 0x0001, NULL, 0,
+			       FT4222_IO_TIMEOUT);
+}
+
+static int ft4222_cmd_get(struct ft4222_i2c *ftdi, u16 cmd, u8 *val)
+{
+	struct usb_device *udev = ftdi->udev;
+	int ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0), 0x20, 0xC0,
+				  cmd, 0x0001, ftdi->ubuf, sizeof(*val),
+				  FT4222_IO_TIMEOUT);
+
+	if (ret == sizeof(*val))
+		*val = ftdi->ubuf[0];
+	else if (ret >= 0)	/* unexpected number of bytes transferred */
+		ret = -EIO;
+	return ret;
+}
+
+static int ft4222_i2c_reset(struct ft4222_i2c *ftdi)
+{
+	return ft4222_cmd_set(ftdi, 0x51, 1);
+}
+
+static int ft4222_i2c_get_status(struct ft4222_i2c *ftdi)
+{
+	u8 status;
+	int retry;
+	const int max_retries = 512;
+
+	for (retry = 0; retry < max_retries; retry++) {
+		int ret = ft4222_cmd_get(ftdi, 0xf5b4, &status);
+
+		if (ret < 0)
+			return ret;
+		if (!(status & FT4222_I2C_CTRL_BUSY))
+			break;
+	}
+	dev_dbg(&ftdi->adapter.dev, "status 0x%02x (%d retries)", status,
+		retry);
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
+	unsigned int pipe = usb_sndbulkpipe(udev, 2);
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
+	unsigned int pipe = usb_rcvbulkpipe(udev, 1);
+	u8 *buf = ftdi->ubuf;
+	int ret;
+	int actual_len;
+	int read = 0;
+
+	dev_dbg(&ftdi->adapter.dev, "read from 0x%02x, flags 0x%02x, len %d",
+		slave_addr, flags, len);
+	buf[0] = (slave_addr << 1) | 1;
+	buf[1] = flags;
+	buf[2] = len >> 8;
+	buf[3] = len;
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, 2), buf,
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
+	int i;
+	int ret;
+
+	dev_dbg(&adapter->dev, "transfer with %d message(s)", num);
+	for (i = 0; i < num; ++i) {
+		const u8 addr = msg[i].addr;
+		u8 *buf = msg[i].buf;
+		const u16 len = msg[i].len;
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
+	/**
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
+	const int m = hi_freq ? 6 : 8;
+	u8 n;
+	int ret;
+
+	if ((freq < I2C_MAX_STANDARD_MODE_FREQ) ||
+	    (freq > I2C_MAX_HIGH_SPEED_MODE_FREQ))
+		return -EINVAL;
+	n = DIV_ROUND_UP(ftdi->sys_clk, freq * m) - 1;
+	if (hi_freq)
+		n |= 0xc0;
+	ret = ft4222_cmd_set(ftdi, 0x52, n);
+	if (ret < 0)
+		return ret;
+	ret = ft4222_cmd_set(ftdi, 0x05, 1);
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
+	int ret = kstrtouint(buf, 10, &i2c_freq);
+
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
+	struct ft4222_i2c *ftdi = devm_kmalloc(dev, sizeof(*ftdi), GFP_KERNEL);
+	int ret;
+	u8 sys_clk_enum;
+	unsigned int sys_clk;
+	struct i2c_adapter *adapter;
+
+	if (!ftdi)
+		return -ENOMEM;
+	ftdi->udev = interface_to_usbdev(interface);
+	ret = ft4222_cmd_get(ftdi, 0x0004, &sys_clk_enum);
+	if (ret < 0)
+		return ret;
+	switch (sys_clk_enum) {
+	case ft4222_sys_clk_60:
+		sys_clk = 60000000;
+		break;
+	case ft4222_sys_clk_24:
+		sys_clk = 24000000;
+		break;
+	case ft4222_sys_clk_48:
+		sys_clk = 48000000;
+		break;
+	case ft4222_sys_clk_80:
+		sys_clk = 80000000;
+		break;
+	default:
+		dev_err(dev, "unknown system clock setting %d", sys_clk_enum);
+		return -EOPNOTSUPP;
+	}
+	ftdi->sys_clk = sys_clk;
+	ret = ft4222_i2c_setup(ftdi, I2C_MAX_FAST_MODE_FREQ);
+	if (ret < 0)
+		return ret;
+	ret = ft4222_i2c_reset(ftdi);
+	if (ret < 0)
+		return ret;
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
+static int ft4222_get_conf(struct usb_interface *interface,
+			   enum ft4222_conf_mode *conf_mode)
+{
+	struct usb_device *udev = interface_to_usbdev(interface);
+	u16 dev_type = udev->descriptor.bcdDevice;
+
+	switch (dev_type >> 8) {
+	case 0x17:
+		*conf_mode = ft4222_conf3;
+		break;
+	case 0x18:
+		*conf_mode = ft4222_conf0;
+		break;
+	case 0x19:
+		*conf_mode = ft4222_conf12;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int ft4222_i2c_probe(struct usb_interface *interface,
+			    const struct usb_device_id *id)
+{
+	enum ft4222_conf_mode conf_mode;
+	int ret = ft4222_get_conf(interface, &conf_mode);
+	int intf = interface->cur_altsetting->desc.bInterfaceNumber;
+
+	if (ret)
+		return ret;
+	if (((conf_mode == ft4222_conf0) || (conf_mode == ft4222_conf3)) &&
+	    (intf == 0))
+		return ft4222_i2c_init(interface);
+	return -ENODEV;
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


