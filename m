Return-Path: <linux-i2c+bounces-675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE08808DFE
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 17:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8CBDB20BD4
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 16:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7BA481B0;
	Thu,  7 Dec 2023 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="kJoK+n6O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0F510CB;
	Thu,  7 Dec 2023 08:50:40 -0800 (PST)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B7GEDlR017036;
	Thu, 7 Dec 2023 08:50:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=JBpg3XQkmCBz3Kv0dFxnQnb8vyeZOmOhSrnSMapbmMs=;
 b=kJoK+n6OcrVV8RMiBjmAnFlRZaTyR6ZvS7NAIPgWNcjzlrsG61IlCCQ9XCDB0pmZHurY
 N0sLJ8JsnId5YsXZ/2Z9SXh3zxvgp9Rt6gPfjGoif/lQZZp9LVRYB3H8W/+vapUbiO28
 F2WjVOWzXEpNfv7qPGW3x6eJHZ4Lbgh4gOu4cQc1zxFeHqLLDgHNX8R3FCsLK7vwuJbY
 5sivwjnmYBCOKpLsRHyLuVe8iXB+L/2HI9C0olxEQ3rLWXS2XgY699C18QgnHzBhOr91
 64HQY3tiLICy0iqcXTLOdTidZCxOTg8cfazGgV4R9dwqtmLxwBdvrra4Y85MVJLldoXs lw== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3uu8qea43c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 08:50:35 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 7 Dec
 2023 08:50:34 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 7 Dec 2023 08:50:34 -0800
Received: from dc3lp-swdev041.marvell.com (dc3lp-swdev041.marvell.com [10.6.60.191])
	by maili.marvell.com (Postfix) with ESMTP id 7CA623F70A0;
	Thu,  7 Dec 2023 08:50:32 -0800 (PST)
From: Elad Nachman <enachman@marvell.com>
To: <gregory.clement@bootlin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>, <cyuval@marvell.com>
Subject: [PATCH v2 1/1] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Date: Thu, 7 Dec 2023 18:50:27 +0200
Message-ID: <20231207165027.2628302-2-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207165027.2628302-1-enachman@marvell.com>
References: <20231207165027.2628302-1-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vFBI55SvjzwbEBsHqqcDmbAtSZk5uiGr
X-Proofpoint-ORIG-GUID: vFBI55SvjzwbEBsHqqcDmbAtSZk5uiGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_14,2023-12-07_01,2023-05-22_02

From: Elad Nachman <enachman@marvell.com>

Some i2c slaves, mainly SFPs, might cause the bus to lose arbitration
while slave is in the middle of responding.
This means that the i2c slave has not finished the transmission, but
the master has already finished toggling the clock, probably due to
the slave missing some of the master's clocks.
This was seen with Ubiquity SFP module.
This is typically caused by slaves which do not adhere completely
to the i2c standard.

The solution is to change the I2C mode from mpps to gpios, and toggle
the i2c_scl gpio to emulate bus clock toggling, so slave will finish
its transmission, driven by the manual clock toggling, and will release
the i2c bus.

Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 113 +++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index dc160cbc3155..954b94334772 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -26,6 +26,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/delay.h>
+#include <linux/of_gpio.h>
 
 #define MV64XXX_I2C_ADDR_ADDR(val)			((val & 0x7f) << 1)
 #define MV64XXX_I2C_BAUD_DIV_N(val)			(val & 0x7)
@@ -104,6 +105,7 @@ enum {
 	MV64XXX_I2C_ACTION_RCV_DATA,
 	MV64XXX_I2C_ACTION_RCV_DATA_STOP,
 	MV64XXX_I2C_ACTION_SEND_STOP,
+	MV64XXX_I2C_ACTION_UNLOCK_BUS
 };
 
 struct mv64xxx_i2c_regs {
@@ -150,6 +152,11 @@ struct mv64xxx_i2c_data {
 	bool			clk_n_base_0;
 	struct i2c_bus_recovery_info	rinfo;
 	bool			atomic;
+	/* I2C mpp states & gpios needed for arbitration lost recovery */
+	int			scl_gpio, sda_gpio;
+	bool			soft_reset;
+	struct pinctrl_state *i2c_mpp_state;
+	struct pinctrl_state *i2c_gpio_state;
 };
 
 static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
@@ -318,6 +325,11 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 		drv_data->state = MV64XXX_I2C_STATE_IDLE;
 		break;
 
+	case MV64XXX_I2C_STATUS_MAST_LOST_ARB: /* 0x38 */
+		drv_data->action = MV64XXX_I2C_ACTION_UNLOCK_BUS;
+		drv_data->state = MV64XXX_I2C_STATE_IDLE;
+		break;
+
 	case MV64XXX_I2C_STATUS_MAST_WR_ADDR_NO_ACK: /* 0x20 */
 	case MV64XXX_I2C_STATUS_MAST_WR_NO_ACK: /* 30 */
 	case MV64XXX_I2C_STATUS_MAST_RD_ADDR_NO_ACK: /* 48 */
@@ -356,6 +368,9 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2c_data *drv_data)
 static void
 mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 {
+	struct pinctrl *pc;
+	int i, ret;
+
 	switch(drv_data->action) {
 	case MV64XXX_I2C_ACTION_SEND_RESTART:
 		/* We should only get here if we have further messages */
@@ -409,6 +424,56 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 			drv_data->reg_base + drv_data->reg_offsets.control);
 		break;
 
+	case MV64XXX_I2C_ACTION_UNLOCK_BUS:
+		if (!drv_data->soft_reset)
+			break;
+
+		pc = devm_pinctrl_get(drv_data->adapter.dev.parent);
+		if (IS_ERR(pc)) {
+			dev_err(&drv_data->adapter.dev,
+				"failed to get pinctrl for bus unlock!\n");
+			break;
+		}
+
+		/* Change i2c MPPs state to act as GPIOs: */
+		if (pinctrl_select_state(pc, drv_data->i2c_gpio_state) >= 0) {
+			if (!ret) {
+				/*
+				 * Toggle i2c scl (serial clock) 10 times.
+				 * 10 clocks are enough to transfer a full
+				 * byte plus extra as seen from tests with
+				 * Ubiquity SFP module causing the issue.
+				 * This allows the slave that occupies
+				 * the bus to transmit its remaining data,
+				 * so it can release the i2c bus:
+				 */
+				for (i = 0; i < 10; i++) {
+					gpio_set_value(drv_data->scl_gpio, 1);
+					udelay(100);
+					gpio_set_value(drv_data->scl_gpio, 0);
+				};
+			}
+
+			/* restore i2c pin state to MPPs: */
+			pinctrl_select_state(pc, drv_data->i2c_mpp_state);
+		}
+
+		/*
+		 * Trigger controller soft reset
+		 * This register is write only, with none of the bits defined.
+		 * So any value will do.
+		 * 0x1 just seems more intuitive than 0x0 ...
+		 */
+		writel(0x1, drv_data->reg_base + drv_data->reg_offsets.soft_reset);
+		/* wait for i2c controller to complete reset: */
+		udelay(100);
+		/*
+		 * need to proceed to the data stop condition generation clause.
+		 * This is needed after clock toggling to put the i2c slave
+		 * in the correct state.
+		 */
+		fallthrough;
+
 	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
 		drv_data->msg->buf[drv_data->byte_posn++] =
 			readl(drv_data->reg_base + drv_data->reg_offsets.data);
@@ -985,6 +1050,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 {
 	struct mv64xxx_i2c_data		*drv_data;
 	struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
+	struct pinctrl *pc;
 	int	rc;
 
 	if ((!pdata && !pd->dev.of_node))
@@ -1040,6 +1106,46 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (rc == -EPROBE_DEFER)
 		return rc;
 
+	/*
+	 * Start with arbitration lost soft reset enabled as to false.
+	 * Try to locate the necessary items in the device tree to
+	 * make this feature work.
+	 * Only after we verify that the device tree contains all of
+	 * the needed information and that it is sound and usable,
+	 * then we enable this flag.
+	 * This information should be defined, but the driver maintains
+	 * backward compatibility with old dts files, so it will not fail
+	 * the probe in case these are missing.
+	 */
+	drv_data->soft_reset = false;
+	pc = devm_pinctrl_get(&pd->dev);
+	if (!IS_ERR(pc)) {
+		drv_data->i2c_mpp_state =
+			pinctrl_lookup_state(pc, "default");
+		drv_data->i2c_gpio_state =
+			pinctrl_lookup_state(pc, "gpio");
+		drv_data->scl_gpio =
+			of_get_named_gpio(pd->dev.of_node, "scl-gpios", 0);
+		drv_data->sda_gpio =
+			of_get_named_gpio(pd->dev.of_node, "sda-gpios", 0);
+
+		if (!IS_ERR(drv_data->i2c_gpio_state) &&
+		    !IS_ERR(drv_data->i2c_mpp_state) &&
+		    gpio_is_valid(drv_data->scl_gpio) &&
+		    gpio_is_valid(drv_data->sda_gpio)) {
+			rc = devm_gpio_request_one(&pd->dev, drv_data->scl_gpio,
+						   GPIOF_DIR_OUT, NULL);
+			rc |= devm_gpio_request_one(&pd->dev, drv_data->sda_gpio,
+						    GPIOF_DIR_OUT, NULL);
+			if (!rc)
+				drv_data->soft_reset = true;
+		}
+	}
+
+	if (!drv_data->soft_reset)
+		dev_info(&pd->dev,
+			"mv64xxx: missing arbitration-lost recovery definitions in dts file\n");
+
 	drv_data->adapter.dev.parent = &pd->dev;
 	drv_data->adapter.algo = &mv64xxx_i2c_algo;
 	drv_data->adapter.owner = THIS_MODULE;
@@ -1088,6 +1194,13 @@ mv64xxx_i2c_remove(struct platform_device *pd)
 {
 	struct mv64xxx_i2c_data		*drv_data = platform_get_drvdata(pd);
 
+	if (drv_data->soft_reset) {
+		devm_gpiod_put(drv_data->adapter.dev.parent,
+			       gpio_to_desc(drv_data->scl_gpio));
+		devm_gpiod_put(drv_data->adapter.dev.parent,
+			       gpio_to_desc(drv_data->sda_gpio));
+	}
+
 	i2c_del_adapter(&drv_data->adapter);
 	free_irq(drv_data->irq, drv_data);
 	pm_runtime_disable(&pd->dev);
-- 
2.25.1


