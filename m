Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B42267B9D2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 19:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbjAYSrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 13:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235341AbjAYSrK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 13:47:10 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33595A829;
        Wed, 25 Jan 2023 10:47:06 -0800 (PST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PIV230015117;
        Wed, 25 Jan 2023 18:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : in-reply-to : references; s=pps0720;
 bh=pQtra/WobKd101GoyU/4O1i0e//dQv+Zr0Gr+L9maCs=;
 b=jIqTQLtbIXhuXayEn0ebIdxo0q19SHX/Z7zH5Jm4WWvdOsT7CuqORNNY1hdO9+YKQ8Qi
 gPkm2XpnZRHUqllO7PW4RN+xKxpQXYS+dkZFdfoZyneF57ZHdqA4gFKOPAmiuBycKw/S
 ZaPcyOvTz0ZyAt1nbvMXm/AZOBNj+a/pljPteeJ1cvN3eLMnTUOXyvTASvkeQKTmNFeF
 HC4FrzLpZ2yDKpq9tSoo33KIASkdCOhG4TTrbdZZMT7pc6ofrryMYL13PFcGJle+waTD
 EKnYTLjkgl2R1LwJ2zIRq3zHdDjt5mY86gT+oiwxsqkvzZNDGbOO5S6KsE7e7jCa4TQB xg== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nb9s10597-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Jan 2023 18:46:45 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 349B5802B86;
        Wed, 25 Jan 2023 18:46:44 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
        by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTP id 77019808D86;
        Wed, 25 Jan 2023 18:46:43 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        joel@jms.id.au
Subject: [PATCH v4 1/5] i2c: hpe: Add GXP SoC I2C Controller
Date:   Wed, 25 Jan 2023 12:44:34 -0600
Message-Id: <20230125184438.28483-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125184438.28483-1-nick.hawkins@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: xhUJ7xFcXsJl8Pvt6wHxVl5lgdYlCydY
X-Proofpoint-ORIG-GUID: xhUJ7xFcXsJl8Pvt6wHxVl5lgdYlCydY
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250165
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

The GXP SoC supports 10 I2C engines. Each I2C engine is completely
independent and can function both as an I2C master and I2C slave. The
I2C master can operate in a multi master environment. The engines support
a scalable speed from 8kHZ to 1.5 Mhz.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>

---

v4:
 *Disable IRQ on device remove by register write
 *Switch engine variable to u32
v3:
 *Disable IRQ on device remove
 *Remove use of I2C_CLASS_DEPRECATED
 *Use i2c_parse_fw_timings instead of of_property_read_u32
 *Remove redundant dev_err_probe as platform_get_irq already has one
 *Used __iomem instead of res->start to find physical address
 *Use BIT in gxp_i2c_irq_handler
 *Made value u8 instead of u16
v2:
 *Removed rogue tab in structure
 *Removed use of __iomem base local variables as it was unnecessary
 *Switched #if IS_ENABLED() -> if (IS_ENABLED()) inside functions
 *Removed use of pr_* functions
 *Removed informational prints in register and unregister functions
 *Removed print from interrupt handler
 *No informational prints in probe function
 *Switched dev_err for dev_err_probe in probe function
 *Use respective helper for mapping the resource to __iomem
---
 drivers/i2c/busses/Kconfig   |   7 +
 drivers/i2c/busses/Makefile  |   1 +
 drivers/i2c/busses/i2c-gxp.c | 603 +++++++++++++++++++++++++++++++++++
 3 files changed, 611 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-gxp.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e50f9603d189..8b3951e0ca5c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1457,4 +1457,11 @@ config I2C_VIRTIO
           This driver can also be built as a module. If so, the module
           will be called i2c-virtio.
 
+config I2C_GXP
+	tristate "GXP I2C Interface"
+	depends on ARCH_HPE_GXP || COMPILE_TEST
+	help
+	  This enables support for GXP I2C interface. The I2C engines can be
+	  either I2C master or I2C slaves.
+
 endmenu
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index e73cdb1d2b5a..dcc96eab6d68 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -127,6 +127,7 @@ obj-$(CONFIG_I2C_THUNDERX)	+= i2c-thunderx.o
 obj-$(CONFIG_I2C_XILINX)	+= i2c-xiic.o
 obj-$(CONFIG_I2C_XLP9XX)	+= i2c-xlp9xx.o
 obj-$(CONFIG_I2C_RCAR)		+= i2c-rcar.o
+obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
 
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
new file mode 100644
index 000000000000..37272261ce8d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -0,0 +1,603 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define GXP_MAX_I2C_ENGINE 10
+static const char * const gxp_i2c_name[] = {
+	"gxp-i2c0", "gxp-i2c1", "gxp-i2c2", "gxp-i2c3",
+	"gxp-i2c4", "gxp-i2c5", "gxp-i2c6", "gxp-i2c7",
+	"gxp-i2c8", "gxp-i2c9" };
+
+/* GXP I2C Global interrupt status/enable register*/
+#define GXP_I2CINTSTAT		0x00
+#define GXP_I2CINTEN		0x04
+
+/* GXP I2C registers */
+#define GXP_I2CSTAT		0x00
+#define MASK_STOP_EVENT		0x20
+#define MASK_ACK		0x08
+#define MASK_RW			0x04
+#define GXP_I2CEVTERR		0x01
+#define MASK_SLAVE_CMD_EVENT	0x01
+#define MASK_SLAVE_DATA_EVENT	0x02
+#define MASK_MASTER_EVENT	0x10
+#define GXP_I2CSNPDAT		0x02
+#define GXP_I2CMCMD		0x04
+#define GXP_I2CSCMD		0x06
+#define GXP_I2CSNPAA		0x09
+#define GXP_I2CADVFEAT		0x0A
+#define GXP_I2COWNADR		0x0B
+#define GXP_I2CFREQDIV		0x0C
+#define GXP_I2CFLTFAIR		0x0D
+#define GXP_I2CTMOEDG		0x0E
+#define GXP_I2CCYCTIM		0x0F
+
+static bool i2c_global_init_done;
+
+enum {
+	GXP_I2C_IDLE = 0,
+	GXP_I2C_ADDR_PHASE,
+	GXP_I2C_RDATA_PHASE,
+	GXP_I2C_WDATA_PHASE,
+	GXP_I2C_ADDR_NACK,
+	GXP_I2C_DATA_NACK,
+	GXP_I2C_ERROR,
+	GXP_I2C_COMP
+};
+
+struct gxp_i2c_drvdata {
+	struct device *dev;
+	void __iomem *base;
+	struct i2c_timings t;
+	u32 engine;
+	int irq;
+	struct completion completion;
+	struct i2c_adapter adapter;
+	struct i2c_msg *curr_msg;
+	int msgs_remaining;
+	int msgs_num;
+	u8 *buf;
+	size_t buf_remaining;
+	unsigned char state;
+	struct i2c_client *slave;
+	unsigned char stopped;
+};
+
+static struct regmap *i2cg_map;
+
+static void gxp_i2c_start(struct gxp_i2c_drvdata *drvdata)
+{
+	u16 value;
+
+	drvdata->buf = drvdata->curr_msg->buf;
+	drvdata->buf_remaining = drvdata->curr_msg->len;
+
+	/* Note: Address in struct i2c_msg is 7 bits */
+	value = drvdata->curr_msg->addr << 9;
+
+	if (drvdata->curr_msg->flags & I2C_M_RD) {
+		/* Read */
+		value |= 0x05;
+	} else {
+		/* Write */
+		value |= 0x01;
+	}
+
+	drvdata->state = GXP_I2C_ADDR_PHASE;
+	writew(value, drvdata->base + GXP_I2CMCMD);
+}
+
+static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
+			       struct i2c_msg *msgs, int num)
+{
+	int ret;
+	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(adapter);
+	unsigned long time_left;
+
+	drvdata->msgs_remaining = num;
+	drvdata->curr_msg = msgs;
+	drvdata->msgs_num = num;
+	reinit_completion(&drvdata->completion);
+
+	gxp_i2c_start(drvdata);
+
+	time_left = wait_for_completion_timeout(&drvdata->completion,
+						adapter->timeout);
+	ret = num - drvdata->msgs_remaining;
+	if (time_left == 0) {
+		switch (drvdata->state) {
+		case GXP_I2C_WDATA_PHASE:
+			dev_err(drvdata->dev,
+				"gxp_i2c_start:write Data phase timeout at msg[%d]\n",
+			ret);
+			break;
+		case GXP_I2C_RDATA_PHASE:
+			dev_err(drvdata->dev,
+				"gxp_i2c_start:read Data phase timeout at msg[%d]\n",
+			ret);
+			break;
+		case GXP_I2C_ADDR_PHASE:
+			dev_err(drvdata->dev,
+				"gxp_i2c_start:Addr phase timeout\n");
+			break;
+		default:
+			dev_err(drvdata->dev,
+				"gxp_i2c_start:i2c transfer timeout state=%d\n",
+			drvdata->state);
+			break;
+		}
+		return -ETIMEDOUT;
+	}
+
+	if (drvdata->state == GXP_I2C_ADDR_NACK) {
+		dev_err(drvdata->dev,
+			"gxp_i2c_start:No ACK for address phase\n");
+		return -EIO;
+	} else if (drvdata->state == GXP_I2C_DATA_NACK) {
+		dev_err(drvdata->dev, "gxp_i2c_start:No ACK for data phase\n");
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static u32 gxp_i2c_func(struct i2c_adapter *adap)
+{
+	if (IS_ENABLED(CONFIG_I2C_SLAVE))
+		return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SLAVE;
+
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int gxp_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
+
+	if (drvdata->slave)
+		return -EBUSY;
+
+	if (slave->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	drvdata->slave = slave;
+
+	writeb(slave->addr << 1, drvdata->base + GXP_I2COWNADR);
+	writeb(0x69, drvdata->base + GXP_I2CSCMD);
+
+	return 0;
+}
+
+static int gxp_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
+
+	WARN_ON(!drvdata->slave);
+
+	writeb(0x00, drvdata->base + GXP_I2COWNADR);
+	writeb(0xF0, drvdata->base + GXP_I2CSCMD);
+
+	drvdata->slave = NULL;
+
+	return 0;
+}
+#endif
+
+static const struct i2c_algorithm gxp_i2c_algo = {
+	.master_xfer   = gxp_i2c_master_xfer,
+	.functionality = gxp_i2c_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave     = gxp_i2c_reg_slave,
+	.unreg_slave   = gxp_i2c_unreg_slave,
+#endif
+};
+
+static void gxp_i2c_stop(struct gxp_i2c_drvdata *drvdata)
+{
+	/* Clear event and send stop */
+	writeb(0x82, drvdata->base + GXP_I2CMCMD);
+
+	complete(&drvdata->completion);
+}
+
+static void gxp_i2c_restart(struct gxp_i2c_drvdata *drvdata)
+{
+	u16 value;
+
+	drvdata->buf = drvdata->curr_msg->buf;
+	drvdata->buf_remaining = drvdata->curr_msg->len;
+
+	value = drvdata->curr_msg->addr << 9;
+
+	if (drvdata->curr_msg->flags & I2C_M_RD) {
+		/* Read and clear master event */
+		value |= 0x85;
+	} else {
+		/* Write and clear master event */
+		value |= 0x81;
+	}
+
+	drvdata->state = GXP_I2C_ADDR_PHASE;
+
+	writew(value, drvdata->base + GXP_I2CMCMD);
+}
+
+static void gxp_i2c_chk_addr_ack(struct gxp_i2c_drvdata *drvdata)
+{
+	u16 value;
+
+	value = readb(drvdata->base + GXP_I2CSTAT);
+	if (!(value & MASK_ACK)) {
+		/* Got no ack, stop */
+		drvdata->state = GXP_I2C_ADDR_NACK;
+		gxp_i2c_stop(drvdata);
+		return;
+	}
+
+	if (drvdata->curr_msg->flags & I2C_M_RD) {
+		/* Start to read data from slave */
+		if (drvdata->buf_remaining == 0) {
+			/* No more data to read, stop */
+			drvdata->msgs_remaining--;
+			drvdata->state = GXP_I2C_COMP;
+			gxp_i2c_stop(drvdata);
+			return;
+		}
+		drvdata->state = GXP_I2C_RDATA_PHASE;
+
+		if (drvdata->buf_remaining == 1) {
+			/* The last data, do not ack */
+			writeb(0x84, drvdata->base + GXP_I2CMCMD);
+		} else {
+			/* Read data and ack it */
+			writeb(0x8C, drvdata->base + GXP_I2CMCMD);
+		}
+	} else {
+		/* Start to write first data to slave */
+		if (drvdata->buf_remaining == 0) {
+			/* No more data to write, stop */
+			drvdata->msgs_remaining--;
+			drvdata->state = GXP_I2C_COMP;
+			gxp_i2c_stop(drvdata);
+			return;
+		}
+		value = *drvdata->buf;
+		value = value << 8;
+		/* Clear master event */
+		value |= 0x80;
+		drvdata->buf++;
+		drvdata->buf_remaining--;
+		drvdata->state = GXP_I2C_WDATA_PHASE;
+		writew(value, drvdata->base + GXP_I2CMCMD);
+	}
+}
+
+static void gxp_i2c_ack_data(struct gxp_i2c_drvdata *drvdata)
+{
+	u8 value;
+
+	/* Store the data returned */
+	value = readb(drvdata->base + GXP_I2CSNPDAT);
+	*drvdata->buf = value;
+	drvdata->buf++;
+	drvdata->buf_remaining--;
+
+	if (drvdata->buf_remaining == 0) {
+		/* No more data, this message is completed. */
+		drvdata->msgs_remaining--;
+
+		if (drvdata->msgs_remaining == 0) {
+			/* No more messages, stop */
+			drvdata->state = GXP_I2C_COMP;
+			gxp_i2c_stop(drvdata);
+			return;
+		}
+		/* Move to next message and start transfer */
+		drvdata->curr_msg++;
+		gxp_i2c_restart(drvdata);
+		return;
+	}
+
+	/* Ack the slave to make it send next byte */
+	drvdata->state = GXP_I2C_RDATA_PHASE;
+	if (drvdata->buf_remaining == 1) {
+		/* The last data, do not ack */
+		writeb(0x84, drvdata->base + GXP_I2CMCMD);
+	} else {
+		/* Read data and ack it */
+		writeb(0x8C, drvdata->base + GXP_I2CMCMD);
+	}
+}
+
+static void gxp_i2c_chk_data_ack(struct gxp_i2c_drvdata *drvdata)
+{
+	u16 value;
+
+	value = readb(drvdata->base + GXP_I2CSTAT);
+	if (!(value & MASK_ACK)) {
+		/* Received No ack, stop */
+		drvdata->state = GXP_I2C_DATA_NACK;
+		gxp_i2c_stop(drvdata);
+		return;
+	}
+
+	/* Got ack, check if there is more data to write */
+	if (drvdata->buf_remaining == 0) {
+		/* No more data, this message is completed */
+		drvdata->msgs_remaining--;
+
+		if (drvdata->msgs_remaining == 0) {
+			/* No more messages, stop */
+			drvdata->state = GXP_I2C_COMP;
+			gxp_i2c_stop(drvdata);
+			return;
+		}
+		/* Move to next message and start transfer */
+		drvdata->curr_msg++;
+		gxp_i2c_restart(drvdata);
+		return;
+	}
+
+	/* Write data to slave */
+	value = *drvdata->buf;
+	value = value << 8;
+
+	/* Clear master event */
+	value |= 0x80;
+	drvdata->buf++;
+	drvdata->buf_remaining--;
+	drvdata->state = GXP_I2C_WDATA_PHASE;
+	writew(value, drvdata->base + GXP_I2CMCMD);
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static bool gxp_i2c_slave_irq_handler(struct gxp_i2c_drvdata *drvdata)
+{
+	u8 value;
+	u8 buf;
+	int ret;
+
+	value = readb(drvdata->base + GXP_I2CEVTERR);
+
+	/* Received start or stop event */
+	if (value & MASK_SLAVE_CMD_EVENT) {
+		value = readb(drvdata->base + GXP_I2CSTAT);
+		/* Master sent stop */
+		if (value & MASK_STOP_EVENT) {
+			if (drvdata->stopped == 0)
+				i2c_slave_event(drvdata->slave, I2C_SLAVE_STOP, &buf);
+			writeb(0x69, drvdata->base + GXP_I2CSCMD);
+			drvdata->stopped = 1;
+		} else {
+			/* Master sent start and  wants to read */
+			drvdata->stopped = 0;
+			if (value & MASK_RW) {
+				i2c_slave_event(drvdata->slave,
+						I2C_SLAVE_READ_REQUESTED, &buf);
+				value = buf << 8 | 0x61;
+				writew(value, drvdata->base + GXP_I2CSCMD);
+			} else {
+				/* Master wants to write to us */
+				ret = i2c_slave_event(drvdata->slave,
+						      I2C_SLAVE_WRITE_REQUESTED, &buf);
+				if (!ret) {
+					/* Ack next byte from master */
+					writeb(0x69, drvdata->base + GXP_I2CSCMD);
+				} else {
+					/* Nack next byte from master */
+					writeb(0x61, drvdata->base + GXP_I2CSCMD);
+				}
+			}
+		}
+	} else if (value & MASK_SLAVE_DATA_EVENT) {
+		value = readb(drvdata->base + GXP_I2CSTAT);
+		/* Master wants to read */
+		if (value & MASK_RW) {
+			/* Master wants another byte */
+			if (value & MASK_ACK) {
+				i2c_slave_event(drvdata->slave,
+						I2C_SLAVE_READ_PROCESSED, &buf);
+				value = buf << 8 | 0x61;
+				writew(value, drvdata->base + GXP_I2CSCMD);
+			} else {
+				/* No more bytes needed */
+				writew(0x69, drvdata->base + GXP_I2CSCMD);
+			}
+		} else {
+			/* Master wants to write to us */
+			value = readb(drvdata->base + GXP_I2CSNPDAT);
+			buf = (uint8_t)value;
+			ret = i2c_slave_event(drvdata->slave,
+					      I2C_SLAVE_WRITE_RECEIVED, &buf);
+			if (!ret) {
+				/* Ack next byte from master */
+				writeb(0x69, drvdata->base + GXP_I2CSCMD);
+			} else {
+				/* Nack next byte from master */
+				writeb(0x61, drvdata->base + GXP_I2CSCMD);
+			}
+		}
+	} else {
+		return false;
+	}
+
+	return true;
+}
+#endif
+
+static irqreturn_t gxp_i2c_irq_handler(int irq, void *_drvdata)
+{
+	struct gxp_i2c_drvdata *drvdata = (struct gxp_i2c_drvdata *)_drvdata;
+	u32 value;
+
+	/* Check if the interrupt is for the current engine */
+	regmap_read(i2cg_map, GXP_I2CINTSTAT, &value);
+	if (!(value & BIT(drvdata->engine)))
+		return IRQ_NONE;
+
+	value = readb(drvdata->base + GXP_I2CEVTERR);
+
+	/* Error */
+	if (value & ~(MASK_MASTER_EVENT | MASK_SLAVE_CMD_EVENT |
+				MASK_SLAVE_DATA_EVENT)) {
+		/* Clear all events */
+		writeb(0x00, drvdata->base + GXP_I2CEVTERR);
+		drvdata->state = GXP_I2C_ERROR;
+		gxp_i2c_stop(drvdata);
+		return IRQ_HANDLED;
+	}
+
+	if (IS_ENABLED(CONFIG_I2C_SLAVE)) {
+		/* Slave mode */
+		if (value & (MASK_SLAVE_CMD_EVENT | MASK_SLAVE_DATA_EVENT)) {
+			if (gxp_i2c_slave_irq_handler(drvdata))
+				return IRQ_HANDLED;
+			return IRQ_NONE;
+		}
+	}
+
+	/*  Master mode */
+	switch (drvdata->state) {
+	case GXP_I2C_ADDR_PHASE:
+		gxp_i2c_chk_addr_ack(drvdata);
+		break;
+
+	case GXP_I2C_RDATA_PHASE:
+		gxp_i2c_ack_data(drvdata);
+		break;
+
+	case GXP_I2C_WDATA_PHASE:
+		gxp_i2c_chk_data_ack(drvdata);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void gxp_i2c_init(struct gxp_i2c_drvdata *drvdata)
+{
+	drvdata->state = GXP_I2C_IDLE;
+	writeb(2000000 / drvdata->t.bus_freq_hz,
+	       drvdata->base + GXP_I2CFREQDIV);
+	writeb(0x32, drvdata->base + GXP_I2CFLTFAIR);
+	writeb(0x0a, drvdata->base + GXP_I2CTMOEDG);
+	writeb(0x00, drvdata->base + GXP_I2CCYCTIM);
+	writeb(0x00, drvdata->base + GXP_I2CSNPAA);
+	writeb(0x00, drvdata->base + GXP_I2CADVFEAT);
+	writeb(0xF0, drvdata->base + GXP_I2CSCMD);
+	writeb(0x80, drvdata->base + GXP_I2CMCMD);
+	writeb(0x00, drvdata->base + GXP_I2CEVTERR);
+	writeb(0x00, drvdata->base + GXP_I2COWNADR);
+}
+
+static int gxp_i2c_probe(struct platform_device *pdev)
+{
+	struct gxp_i2c_drvdata *drvdata;
+	int rc;
+	struct i2c_adapter *adapter;
+
+	if (!i2c_global_init_done) {
+		i2cg_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+							   "hpe,sysreg");
+		if (IS_ERR(i2cg_map)) {
+			return dev_err_probe(&pdev->dev, IS_ERR(i2cg_map),
+					     "failed to map i2cg_handle\n");
+		}
+
+		/* Disable interrupt */
+		regmap_update_bits(i2cg_map, GXP_I2CINTEN, 0x00000FFF, 0);
+		i2c_global_init_done = true;
+	}
+
+	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata),
+			       GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, drvdata);
+	drvdata->dev = &pdev->dev;
+	init_completion(&drvdata->completion);
+
+	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	/* Use physical memory address to determine which I2C engine this is. */
+	drvdata->engine = ((u32)drvdata->base & 0xf00) >> 8;
+
+	if (drvdata->engine >= GXP_MAX_I2C_ENGINE) {
+		return dev_err_probe(&pdev->dev, -EINVAL, "i2c engine% is unsupported\n",
+			drvdata->engine);
+	}
+
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
+
+	drvdata->irq = rc;
+	rc = devm_request_irq(&pdev->dev, drvdata->irq, gxp_i2c_irq_handler,
+			      IRQF_SHARED, gxp_i2c_name[drvdata->engine], drvdata);
+	if (rc < 0)
+		return dev_err_probe(&pdev->dev, rc, "irq request failed\n");
+
+	i2c_parse_fw_timings(&pdev->dev, &drvdata->t, true);
+
+	gxp_i2c_init(drvdata);
+
+	/* Enable interrupt */
+	regmap_update_bits(i2cg_map, GXP_I2CINTEN, BIT(drvdata->engine),
+			   BIT(drvdata->engine));
+
+	adapter = &drvdata->adapter;
+	i2c_set_adapdata(adapter, drvdata);
+
+	adapter->owner = THIS_MODULE;
+	strscpy(adapter->name, "HPE GXP I2C adapter", sizeof(adapter->name));
+	adapter->algo = &gxp_i2c_algo;
+	adapter->dev.parent = &pdev->dev;
+	adapter->dev.of_node = pdev->dev.of_node;
+
+	rc = i2c_add_adapter(adapter);
+	if (rc)
+		return dev_err_probe(&pdev->dev, rc, "i2c add adapter failed\n");
+
+	return 0;
+}
+
+static int gxp_i2c_remove(struct platform_device *pdev)
+{
+	struct gxp_i2c_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	/* Disable interrupt */
+	regmap_update_bits(i2cg_map, GXP_I2CINTEN, BIT(drvdata->engine), 0);
+	i2c_del_adapter(&drvdata->adapter);
+
+	return 0;
+}
+
+static const struct of_device_id gxp_i2c_of_match[] = {
+	{ .compatible = "hpe,gxp-i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gxp_i2c_of_match);
+
+static struct platform_driver gxp_i2c_driver = {
+	.probe	= gxp_i2c_probe,
+	.remove = gxp_i2c_remove,
+	.driver = {
+		.name = "gxp-i2c",
+		.of_match_table = gxp_i2c_of_match,
+	},
+};
+module_platform_driver(gxp_i2c_driver);
+
+MODULE_AUTHOR("Nick Hawkins <nick.hawkins@hpe.com>");
+MODULE_DESCRIPTION("HPE GXP I2C bus driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

