Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47580217A03
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jul 2020 23:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgGGVKr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jul 2020 17:10:47 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55318 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGGVKr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jul 2020 17:10:47 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A32958011F;
        Wed,  8 Jul 2020 09:10:40 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1594156240;
        bh=LIZaTJsVpo0fc9R6NrZDyGHqCTXkr77kbJtYcUTyeeY=;
        h=From:To:Cc:Subject:Date;
        b=VoeWPTYkyjGp1TCIpSRUpTYa41WqdVf2g2Yif/cCo1GmlQOFmMjCI+DSjGUY6oqvr
         aZGPedZbELz40rAmV06xDppbX7DBnak/JgCqzyoL1jaczE2xqLJBld1o2yxUUh+5ho
         gglKWRFKGkGA6gVWVhzjLSRiQ8ts2aV4YSo6tlXbu9PIw51H2GlNGSUl39vjalOMA7
         cmi/HeOD3RX9owELCSXuACs3jXkdSWUJFf3+pNJswwUD9SHGPjTMKnsenCSgMWN/U3
         HIa93UUSEg1NT8WnIniRloQ7ECy9Lzo4r9/zOnBlYMQvbgr5tdWzA2Lshr1Kkzfzl/
         cEF2HdcZiCkdA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f04e4d00000>; Wed, 08 Jul 2020 09:10:40 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id 2720D13EDDC;
        Wed,  8 Jul 2020 09:10:39 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 3C327341145; Wed,  8 Jul 2020 09:10:40 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] i2c: mv64xxx: Add bus error recovery
Date:   Wed,  8 Jul 2020 09:10:36 +1200
Message-Id: <20200707211036.12896-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds i2c bus recovery to the mv64xxx driver.

Implement bus recovery to recover from SCL/SDA stuck low.

This uses the generic recovery function, setting the clock/data lines as
GPIO pins, and sending 9 clocks to try and recover the bus.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 77 +++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
index 829b8c98ae51..e58853ba3ef0 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -147,6 +148,10 @@ struct mv64xxx_i2c_data {
 	bool			irq_clear_inverted;
 	/* Clk div is 2 to the power n, not 2 to the power n + 1 */
 	bool			clk_n_base_0;
+	struct pinctrl		*pinctrl;
+	struct i2c_bus_recovery_info	rinfo;
+	struct pinctrl_state	*pin_default_state;
+	struct pinctrl_state	*pin_gpio_state;
 };
=20
 static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx =3D {
@@ -325,7 +330,8 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u3=
2 status)
 			 drv_data->msg->flags);
 		drv_data->action =3D MV64XXX_I2C_ACTION_SEND_STOP;
 		mv64xxx_i2c_hw_init(drv_data);
-		drv_data->rc =3D -EIO;
+		i2c_recover_bus(&drv_data->adapter);
+		drv_data->rc =3D -EAGAIN;
 	}
 }
=20
@@ -563,6 +569,7 @@ mv64xxx_i2c_wait_for_completion(struct mv64xxx_i2c_da=
ta *drv_data)
 				"time_left: %d\n", drv_data->block,
 				(int)time_left);
 			mv64xxx_i2c_hw_init(drv_data);
+			i2c_recover_bus(&drv_data->adapter);
 		}
 	} else
 		spin_unlock_irqrestore(&drv_data->lock, flags);
@@ -872,6 +879,69 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 }
 #endif /* CONFIG_OF */
=20
+/*
+ * Switch to bit bang mode to prepare for i2c generic recovery.
+ */
+static void mv64xxx_i2c_prepare_recovery(struct i2c_adapter *adap)
+{
+	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
+
+	pinctrl_select_state(drv_data->pinctrl, drv_data->pin_gpio_state);
+}
+
+/*
+ * Return to normal i2c operation following recovery.
+ */
+static void mv64xxx_i2c_unprepare_recovery(struct i2c_adapter *adap)
+{
+	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
+
+	pinctrl_select_state(drv_data->pinctrl, drv_data->pin_default_state);
+}
+
+static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_d=
ata,
+					  struct platform_device *pd)
+{
+	struct i2c_bus_recovery_info *rinfo =3D &drv_data->rinfo;
+	struct device *dev =3D &pd->dev;
+
+	drv_data->pinctrl =3D devm_pinctrl_get(dev);
+	if (!drv_data->pinctrl || IS_ERR(drv_data->pinctrl)) {
+		dev_err(dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(drv_data->pinctrl);
+	}
+
+	drv_data->pin_default_state =3D pinctrl_lookup_state(drv_data->pinctrl,
+			PINCTRL_STATE_DEFAULT);
+	drv_data->pin_gpio_state =3D pinctrl_lookup_state(drv_data->pinctrl,
+			"gpio");
+	rinfo->scl_gpiod =3D devm_gpiod_get(dev, "scl",
+					  GPIOD_OUT_HIGH_OPEN_DRAIN);
+	rinfo->sda_gpiod =3D devm_gpiod_get(dev, "sda", GPIOD_IN);
+	if (PTR_ERR(rinfo->scl_gpiod) =3D=3D -EPROBE_DEFER ||
+	    PTR_ERR(rinfo->sda_gpiod) =3D=3D -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	if (IS_ERR(rinfo->sda_gpiod) ||
+	    IS_ERR(rinfo->scl_gpiod) ||
+	    IS_ERR(drv_data->pin_default_state) ||
+	    IS_ERR(drv_data->pin_gpio_state)) {
+		dev_dbg(dev, "recovery information incomplete\n");
+		return 0;
+	}
+
+	dev_dbg(dev, "using scl-gpio %d and sda-gpio %d for recovery\n",
+		rinfo->scl_gpiod ? desc_to_gpio(rinfo->scl_gpiod) : -1,
+		rinfo->sda_gpiod ? desc_to_gpio(rinfo->sda_gpiod) : -1);
+
+	rinfo->prepare_recovery =3D mv64xxx_i2c_prepare_recovery;
+	rinfo->unprepare_recovery =3D mv64xxx_i2c_unprepare_recovery;
+	rinfo->recover_bus =3D i2c_generic_scl_recovery;
+	drv_data->adapter.bus_recovery_info =3D rinfo;
+
+	return 0;
+}
+
 static int
 mv64xxx_i2c_probe(struct platform_device *pd)
 {
@@ -939,6 +1009,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
=20
 	mv64xxx_i2c_hw_init(drv_data);
=20
+	rc =3D mv64xxx_i2c_init_recovery_info(drv_data, pd);
+	if (rc =3D=3D -EPROBE_DEFER)
+		goto exit_reset;
+
 	rc =3D request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
 			 MV64XXX_I2C_CTLR_NAME, drv_data);
 	if (rc) {
@@ -951,6 +1025,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 			"mv64xxx: Can't add i2c adapter, rc: %d\n", -rc);
 		goto exit_free_irq;
 	}
+	i2c_recover_bus(&drv_data->adapter);
=20
 	return 0;
=20
--=20
2.27.0

