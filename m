Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04240250BEA
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 00:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgHXWxI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Aug 2020 18:53:08 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57218 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgHXWxI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Aug 2020 18:53:08 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D23B38011F;
        Tue, 25 Aug 2020 10:53:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1598309584;
        bh=/gGPixE+zN9sxlkK3LfyjPst9BmKbiY9VyruYUE28dM=;
        h=From:To:Cc:Subject:Date;
        b=jPuYqFPoQ83D1hAB6CTyM6ijNsY8dgPPerdKb2jCueR1CFd1Noi8NrQisDFg/SGjz
         BLYxf0wCmucnz08DsKtKLj26oxv8wRuTDKem+jSMgFbVhbyvAHxldcu/kF7/V6tcfx
         5VhUUEGe7dYF6ksUJyyzX0LlnOYYSRaQOnYYSiJn11nskShAJ3YyUIo4NtiohlV7y4
         M0OeTKdw20GaAnGw6D/rFDs2JtbiNR0Iu0Ye2TYKIfkctOQTkmz8Vfs6Yd6eCsisFo
         5mvujyd4fnS5bVgn+bamp4kejevaRoN/W0q4eL+tJ8rOVxVWmWjVpdWjTcvC8FD54Y
         jfdl8XI0s6S5A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f4444d00000>; Tue, 25 Aug 2020 10:53:04 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id CE5E813ED33;
        Tue, 25 Aug 2020 10:53:03 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 760A03410D0; Tue, 25 Aug 2020 10:53:04 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     wsa@kernel.org, gregory.clement@bootlin.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH v2] i2c: mv64xxx: Add bus error recovery
Date:   Tue, 25 Aug 2020 10:52:54 +1200
Message-Id: <20200824225254.1114-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
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
Changes in v2:
 - use generic GPIO recovery function.

 drivers/i2c/busses/i2c-mv64xxx.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
index 8d9d4ffdcd24..e0f0c76c0d3b 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/mv643xx_i2c.h>
 #include <linux/platform_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -147,6 +148,7 @@ struct mv64xxx_i2c_data {
 	bool			irq_clear_inverted;
 	/* Clk div is 2 to the power n, not 2 to the power n + 1 */
 	bool			clk_n_base_0;
+	struct i2c_bus_recovery_info	rinfo;
 };
=20
 static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx =3D {
@@ -325,7 +327,8 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u3=
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
@@ -562,6 +565,7 @@ mv64xxx_i2c_wait_for_completion(struct mv64xxx_i2c_da=
ta *drv_data)
 				"time_left: %d\n", drv_data->block,
 				(int)time_left);
 			mv64xxx_i2c_hw_init(drv_data);
+			i2c_recover_bus(&drv_data->adapter);
 		}
 	} else
 		spin_unlock_irqrestore(&drv_data->lock, flags);
@@ -871,6 +875,22 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 }
 #endif /* CONFIG_OF */
=20
+static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_d=
ata,
+					  struct device *dev)
+{
+	struct i2c_bus_recovery_info *rinfo =3D &drv_data->rinfo;
+
+	rinfo->pinctrl =3D devm_pinctrl_get(dev);
+	if (IS_ERR(rinfo->pinctrl)) {
+		if (PTR_ERR(rinfo->pinctrl) =3D=3D -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_err(dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(rinfo->pinctrl);
+	}
+	drv_data->adapter.bus_recovery_info =3D rinfo;
+	return 0;
+}
+
 static int
 mv64xxx_i2c_probe(struct platform_device *pd)
 {
@@ -927,6 +947,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 		goto exit_reset;
 	}
=20
+	rc =3D mv64xxx_i2c_init_recovery_info(drv_data, &pd->dev);
+	if (rc =3D=3D -EPROBE_DEFER)
+		goto exit_reset;
+
 	drv_data->adapter.dev.parent =3D &pd->dev;
 	drv_data->adapter.algo =3D &mv64xxx_i2c_algo;
 	drv_data->adapter.owner =3D THIS_MODULE;
@@ -950,6 +974,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 			"mv64xxx: Can't add i2c adapter, rc: %d\n", -rc);
 		goto exit_free_irq;
 	}
+	i2c_recover_bus(&drv_data->adapter);
=20
 	return 0;
=20
--=20
2.28.0

