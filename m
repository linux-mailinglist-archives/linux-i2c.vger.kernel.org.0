Return-Path: <linux-i2c+bounces-7141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DF98BB92
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7277C283EED
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 11:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9711C2430;
	Tue,  1 Oct 2024 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LtQeucD+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F301C1ABE;
	Tue,  1 Oct 2024 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783651; cv=none; b=TSufoJgbublLBokFZXS1mUMmD3RqMV/9JuEHIq8S1zYzfryveJiIIxZZQ+WZKUd6pJmISdaCRJZZPVeOB5O/NcezSfLMOOWtpzHsHVS4RuGG8rwtmbA5hj9qPzZU9ocAAmibjrY8kV6OzgnXVtZdDyv/g4X73xMU+0IIF+AFNO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783651; c=relaxed/simple;
	bh=KDqmb3ktuc9m5IAQTHG4aDFNrvdGw74h2nSbelVa4A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldUEBvXft8ws/rJ7omva/74U5DYKz28ikMd3BmP+kRZO0m4rk7dxxmiTULsGZ3iwWJn4LFaLwTYwjd+dXA9pX9flnWrWpQYOaSUYDZA6ywCNQkp6hYyVa7Jjm/9fdmWTMdg+fc8sijbPmHOMvu44lRX5pH4oV85taHwpZkMhjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LtQeucD+; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FA7D40006;
	Tue,  1 Oct 2024 11:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727783646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCSDYGMQrc1XdlAUwurjNtgekrjkqYRs263mZ2xKJM0=;
	b=LtQeucD+Y8FdwLQi65BzzKt/Vmwb8yxGFEajTQYqOfxTAjG9FTJjfK2w/GCWYc/5gNR6e1
	JvZA0EfCCj17cWSw8wHZkbQ+nH/T2nuoH+CfzBVFtIHCpz3j80qWSBPcMYgD6dne1UrtSs
	REEz4nMjpEYVhhXoH+98NSfDS9gBWmkx6PqoRsCpmuGZuLwrZFmU0xcDHZ2mwowhsi3vHA
	r3oKfMBcXxNEKrE3RaF1opE0m2NJvLv5scfvbLRTOu92V0Ntyyh5WQyuDMf/EayIq/TMOf
	odyL3jJhSo3O1SzaJI5TFzd5EOdkgQMvw0yWgNdnjWgtVuE1qwSK8Ba7MuVi1A==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 01 Oct 2024 13:53:29 +0200
Subject: [PATCH v3 3/5] i2c: Congatec Board Controller i2c bus driver
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-congatec-board-controller-v3-3-39ceceed5c47@bootlin.com>
References: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
In-Reply-To: <20241001-congatec-board-controller-v3-0-39ceceed5c47@bootlin.com>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

Add i2c support for the Congatec Board Controller.

The Board Controller has two i2c busses, a General Purpose bus and a Power
Management bus.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/Kconfig    |  10 ++
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-cgbc.c | 406 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 417 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6b3ba7e5723a..4977abcd7c46 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -535,6 +535,16 @@ config I2C_CBUS_GPIO
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-cbus-gpio.
 
+config I2C_CGBC
+	tristate "Congatec I2C Controller"
+	depends on MFD_CGBC
+	help
+	  This driver supports the 2 I2C interfaces on the Congatec Board
+	  Controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called i2c-cgbc.ko.
+
 config I2C_CPM
 	tristate "Freescale CPM1 or CPM2 (MPC8xx/826x)"
 	depends on CPM1 || CPM2
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index ecc07c50f2a0..a6bcbf2febcf 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
 obj-$(CONFIG_I2C_BCM_IPROC)	+= i2c-bcm-iproc.o
 obj-$(CONFIG_I2C_CADENCE)	+= i2c-cadence.o
 obj-$(CONFIG_I2C_CBUS_GPIO)	+= i2c-cbus-gpio.o
+obj-$(CONFIG_I2C_CGBC)		+= i2c-cgbc.o
 obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
 obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
 obj-$(CONFIG_I2C_DESIGNWARE_CORE)			+= i2c-designware-core.o
diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
new file mode 100644
index 000000000000..eba0b205de11
--- /dev/null
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Congatec Board Controller I2C busses driver
+ *
+ * Copyright (C) 2024 Bootlin
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/cgbc.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define CGBC_I2C_PRIMARY_BUS_ID	0
+#define CGBC_I2C_PM_BUS_ID	4
+
+#define CGBC_I2C_CMD_START	0x40
+#define CGBC_I2C_CMD_STAT	0x48
+#define CGBC_I2C_CMD_DATA	0x50
+#define CGBC_I2C_CMD_SPEED	0x58
+
+#define CGBC_I2C_STAT_IDL	0x00
+#define CGBC_I2C_STAT_DAT	0x01
+#define CGBC_I2C_STAT_BUSY	0x02
+
+#define CGBC_I2C_START	0x80
+#define CGBC_I2C_STOP	0x40
+
+#define CGBC_I2C_LAST_ACK  0x80    /* send ACK on last read byte */
+
+/*
+ * Reference code defines 1kHz as min freq and 6.1MHz as max freq.
+ * But in practice, the board controller limits the frequency to 1MHz, and the
+ * 1kHz is not functional (minimal working freq is 50kHz).
+ * So use these values as limits.
+ */
+#define CGBC_I2C_FREQ_MIN_HZ	50000	/* 50 kHz */
+#define CGBC_I2C_FREQ_MAX_HZ	1000000 /* 1 MHz */
+
+#define CGBC_I2C_FREQ_UNIT_1KHZ		0x40
+#define CGBC_I2C_FREQ_UNIT_10KHZ	0x80
+#define CGBC_I2C_FREQ_UNIT_100KHZ	0xC0
+
+#define CGBC_I2C_FREQ_UNIT_MASK		0xC0
+#define CGBC_I2C_FREQ_VALUE_MASK	0x3F
+
+#define CGBC_I2C_READ_MAX_LEN	31
+#define CGBC_I2C_WRITE_MAX_LEN	32
+
+#define CGBC_I2C_CMD_HEADER_SIZE	4
+#define CGBC_I2C_CMD_SIZE		(CGBC_I2C_CMD_HEADER_SIZE + CGBC_I2C_WRITE_MAX_LEN)
+
+enum cgbc_i2c_state {
+	CGBC_I2C_STATE_DONE = 0,
+	CGBC_I2C_STATE_INIT,
+	CGBC_I2C_STATE_START,
+	CGBC_I2C_STATE_READ,
+	CGBC_I2C_STATE_WRITE,
+	CGBC_I2C_STATE_ERROR,
+};
+
+struct i2c_algo_cgbc_data {
+	u8		bus_id;
+	unsigned long	read_maxtime_us;
+};
+
+struct cgbc_i2c_data {
+	struct device		*dev;
+	struct cgbc_device_data *cgbc;
+	struct i2c_adapter      adap;
+	struct i2c_msg		*msg;
+	int			nmsgs;
+	int			pos;
+	enum cgbc_i2c_state	state;
+};
+
+struct cgbc_i2c_transfer {
+	u8 bus_id;
+	bool start;
+	bool stop;
+	bool last_ack;
+	u8 read;
+	u8 write;
+	u8 addr;
+	u8 data[CGBC_I2C_WRITE_MAX_LEN];
+};
+
+static u8 cgbc_i2c_freq_to_reg(unsigned int bus_frequency)
+{
+	u8 reg;
+
+	if (bus_frequency <= 10000)
+		reg = CGBC_I2C_FREQ_UNIT_1KHZ | (bus_frequency / 1000);
+	else if (bus_frequency <= 100000)
+		reg = CGBC_I2C_FREQ_UNIT_10KHZ | (bus_frequency / 10000);
+	else
+		reg = CGBC_I2C_FREQ_UNIT_100KHZ | (bus_frequency / 100000);
+
+	return reg;
+}
+
+static unsigned int cgbc_i2c_reg_to_freq(u8 reg)
+{
+	unsigned int freq = reg & CGBC_I2C_FREQ_VALUE_MASK;
+	u8 unit = reg & CGBC_I2C_FREQ_UNIT_MASK;
+
+	if (unit == CGBC_I2C_FREQ_UNIT_100KHZ)
+		return freq * 100000;
+	else if (unit == CGBC_I2C_FREQ_UNIT_10KHZ)
+		return freq * 10000;
+	else
+		return freq * 1000;
+}
+
+static int cgbc_i2c_get_status(struct i2c_adapter *adap)
+{
+	struct i2c_algo_cgbc_data *algo_data = adap->algo_data;
+	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
+	struct cgbc_device_data *cgbc = i2c->cgbc;
+	u8 cmd = CGBC_I2C_CMD_STAT | algo_data->bus_id;
+	u8 status;
+	int ret;
+
+	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), NULL, 0, &status);
+	if (ret)
+		return ret;
+
+	return status;
+}
+
+static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
+				  unsigned int bus_frequency)
+{
+	struct i2c_algo_cgbc_data *algo_data = adap->algo_data;
+	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
+	struct cgbc_device_data *cgbc = i2c->cgbc;
+	u8 cmd[2], data;
+	int ret;
+
+	if (bus_frequency > CGBC_I2C_FREQ_MAX_HZ ||
+	    bus_frequency < CGBC_I2C_FREQ_MIN_HZ) {
+		dev_info(i2c->dev, "invalid frequency %u, using default\n", bus_frequency);
+		bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
+	}
+
+	cmd[0] = CGBC_I2C_CMD_SPEED | algo_data->bus_id;
+	cmd[1] = cgbc_i2c_freq_to_reg(bus_frequency);
+
+	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
+	if (ret)
+		return dev_err_probe(i2c->dev, ret,
+				     "Failed to initialize I2C bus %s",
+				     adap->name);
+
+	cmd[1] = 0x00;
+
+	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
+	if (ret)
+		return dev_err_probe(i2c->dev, ret,
+				     "Failed to get I2C bus frequency");
+
+	bus_frequency = cgbc_i2c_reg_to_freq(data);
+
+	dev_dbg(i2c->dev, "%s is running at %d Hz\n", adap->name, bus_frequency);
+
+	/*
+	 * The read_maxtime_us variable represents the maximum time to wait
+	 * for data during a read operation. The maximum amount of data that
+	 * can be read by a command is CGBC_I2C_READ_MAX_LEN.
+	 * Therefore, calculate the max time to properly size the timeout.
+	 */
+	algo_data->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
+		* USEC_PER_SEC / bus_frequency;
+
+	return 0;
+}
+
+static unsigned int cgbc_i2c_xfer_to_cmd(struct cgbc_i2c_transfer xfer, u8 *cmd)
+{
+	int i = 0;
+
+	cmd[i++] = CGBC_I2C_CMD_START | xfer.bus_id;
+
+	cmd[i] = (xfer.start) ? CGBC_I2C_START : 0x00;
+	if (xfer.stop)
+		cmd[i] |= CGBC_I2C_STOP;
+	cmd[i++] |= (xfer.start) ? xfer.write + 1 : xfer.write;
+
+	cmd[i++] = (xfer.last_ack) ? (xfer.read | CGBC_I2C_LAST_ACK) : xfer.read;
+
+	if (xfer.start)
+		cmd[i++] = xfer.addr;
+
+	if (xfer.write > 0)
+		memcpy(&cmd[i], &xfer.data, xfer.write);
+
+	return i + xfer.write;
+}
+
+static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
+{
+	struct i2c_algo_cgbc_data *algo_data = adap->algo_data;
+	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
+	struct cgbc_device_data *cgbc = i2c->cgbc;
+	struct i2c_msg *msg = i2c->msg;
+	u8 cmd[CGBC_I2C_CMD_SIZE];
+	int ret, max_len, len, i;
+	unsigned int cmd_len;
+	u8 cmd_data;
+
+	struct cgbc_i2c_transfer xfer = {
+		.bus_id = algo_data->bus_id,
+		.addr = i2c_8bit_addr_from_msg(msg),
+	};
+
+	if (i2c->state == CGBC_I2C_STATE_DONE)
+		return 0;
+
+	ret = cgbc_i2c_get_status(adap);
+
+	if (ret == CGBC_I2C_STAT_BUSY)
+		return -EBUSY;
+	else if (ret < 0)
+		goto err;
+
+	if (i2c->state == CGBC_I2C_STATE_INIT ||
+	    (i2c->state == CGBC_I2C_STATE_WRITE && msg->flags & I2C_M_RD))
+		xfer.start = true;
+
+	i2c->state = (msg->flags & I2C_M_RD) ? CGBC_I2C_STATE_READ : CGBC_I2C_STATE_WRITE;
+
+	max_len = (i2c->state == CGBC_I2C_STATE_READ) ?
+		CGBC_I2C_READ_MAX_LEN : CGBC_I2C_WRITE_MAX_LEN;
+
+	if (msg->len - i2c->pos > max_len) {
+		len = max_len;
+	} else {
+		len = msg->len - i2c->pos;
+
+		if (i2c->nmsgs == 1)
+			xfer.stop = true;
+	}
+
+	if (i2c->state == CGBC_I2C_STATE_WRITE) {
+		xfer.write = len;
+		xfer.read = 0;
+
+		for (i = 0; i < len; i++)
+			xfer.data[i] = msg->buf[i2c->pos + i];
+
+		cmd_len = cgbc_i2c_xfer_to_cmd(xfer, &cmd[0]);
+
+		ret = cgbc_command(cgbc, &cmd, cmd_len, NULL, 0, NULL);
+		if (ret)
+			goto err;
+	} else if (i2c->state == CGBC_I2C_STATE_READ) {
+		xfer.write = 0;
+		xfer.read = len;
+
+		if (i2c->nmsgs > 1 || msg->len - i2c->pos > max_len)
+			xfer.read |= CGBC_I2C_LAST_ACK;
+
+		cmd_len = cgbc_i2c_xfer_to_cmd(xfer, &cmd[0]);
+		ret = cgbc_command(cgbc, &cmd, cmd_len, NULL, 0, NULL);
+		if (ret)
+			goto err;
+
+		ret = read_poll_timeout(cgbc_i2c_get_status, ret,
+					ret != CGBC_I2C_STAT_BUSY, 0,
+					2 * algo_data->read_maxtime_us, false, adap);
+		if (ret < 0)
+			goto err;
+
+		cmd_data = CGBC_I2C_CMD_DATA | algo_data->bus_id;
+		ret = cgbc_command(cgbc, &cmd_data, sizeof(cmd_data),
+				   msg->buf + i2c->pos, len, NULL);
+		if (ret)
+			goto err;
+	}
+
+	if (len == (msg->len - i2c->pos)) {
+		i2c->msg++;
+		i2c->nmsgs--;
+		i2c->pos = 0;
+	} else {
+		i2c->pos += len;
+	}
+
+	if (i2c->nmsgs == 0)
+		i2c->state = CGBC_I2C_STATE_DONE;
+
+	return 0;
+
+err:
+	i2c->state = CGBC_I2C_STATE_ERROR;
+	return ret;
+}
+
+static int cgbc_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			 int num)
+{
+	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
+	unsigned long timeout = jiffies + HZ;
+	int ret;
+
+	i2c->state = CGBC_I2C_STATE_INIT;
+	i2c->msg = msgs;
+	i2c->nmsgs = num;
+	i2c->pos = 0;
+
+	while (time_before(jiffies, timeout)) {
+		ret = cgbc_i2c_xfer_msg(adap);
+		if (i2c->state == CGBC_I2C_STATE_DONE)
+			return num;
+
+		if (i2c->state == CGBC_I2C_STATE_ERROR)
+			return ret;
+
+		if (ret == 0)
+			timeout = jiffies + HZ;
+	}
+
+	i2c->state = CGBC_I2C_STATE_ERROR;
+	return -ETIMEDOUT;
+}
+
+static u32 cgbc_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~(I2C_FUNC_SMBUS_QUICK));
+}
+
+static const struct i2c_algorithm cgbc_i2c_algorithm = {
+	.master_xfer	= cgbc_i2c_xfer,
+	.functionality	= cgbc_i2c_func,
+};
+
+static struct i2c_algo_cgbc_data cgbc_i2c_algo_data[] = {
+	{ .bus_id = CGBC_I2C_PRIMARY_BUS_ID },
+	{ .bus_id = CGBC_I2C_PM_BUS_ID },
+};
+
+static const struct i2c_adapter cgbc_i2c_adapter[] = {
+	{
+		.owner		= THIS_MODULE,
+		.name		= "Congatec General Purpose I2C adapter",
+		.class		= I2C_CLASS_DEPRECATED,
+		.algo		= &cgbc_i2c_algorithm,
+		.algo_data	= &cgbc_i2c_algo_data[0],
+		.nr		= -1,
+	},
+	{
+		.owner		= THIS_MODULE,
+		.name		= "Congatec Power Management I2C adapter",
+		.class		= I2C_CLASS_DEPRECATED,
+		.algo		= &cgbc_i2c_algorithm,
+		.algo_data	= &cgbc_i2c_algo_data[1],
+		.nr		= -1,
+	},
+};
+
+static int cgbc_i2c_probe(struct platform_device *pdev)
+{
+	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
+	struct cgbc_i2c_data *i2c;
+	int ret;
+
+	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->cgbc = cgbc;
+	i2c->dev = &pdev->dev;
+	i2c->adap = cgbc_i2c_adapter[pdev->id];
+	i2c->adap.dev.parent = i2c->dev;
+	i2c_set_adapdata(&i2c->adap, i2c);
+	platform_set_drvdata(pdev, i2c);
+
+	ret = cgbc_i2c_set_frequency(&i2c->adap, I2C_MAX_STANDARD_MODE_FREQ);
+	if (ret)
+		return ret;
+
+	return i2c_add_numbered_adapter(&i2c->adap);
+}
+
+static void cgbc_i2c_remove(struct platform_device *pdev)
+{
+	struct cgbc_i2c_data *i2c = platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&i2c->adap);
+}
+
+static struct platform_driver cgbc_i2c_driver = {
+	.driver = {
+		.name = "cgbc-i2c",
+	},
+	.probe		= cgbc_i2c_probe,
+	.remove_new	= cgbc_i2c_remove,
+};
+
+module_platform_driver(cgbc_i2c_driver);
+
+MODULE_DESCRIPTION("Congatec Board Controller I2C Driver");
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cgbc_i2c");

-- 
2.39.5


