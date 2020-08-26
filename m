Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D664F253A48
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 00:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgHZWfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 18:35:24 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60500 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgHZWfX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 18:35:23 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BD46184487;
        Thu, 27 Aug 2020 10:35:17 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1598481317;
        bh=ycykCFdPIC6LZn0ehVlw9+WRGNFit1c0Yq5jeQ6Rg2Q=;
        h=From:To:Cc:Subject:Date;
        b=PPFtp7JXmI0TiB147eVC6fBKuFcGBYEpsYf4LRHb1WQJHabHrza/wlP7Rb/Lz1QOD
         3GIGdiQMUzjB7S6yB/qJzCgDoBhQY0N680BND/PM5EppVjlywOQA7eB8ttATsfe0oD
         DyjwBg2dOB84znEzZ7ggPcNkjgIDMfDpn+X9/7TQUMIZMugjpomlwq4CM1JCcRNwc0
         +U9SvBkcgifjFCl044v4jMU/4dkT7X1s5gIYTl4d2ZB6dI9tZOPJZexjB8BAJhEBsA
         smzFvAxhUgoDzZhFUatLgc+voqOMSeICEOVgjCFTELkjGXXo+lDsu56R4qXyeBKvXI
         Czb7J+MBm+d9Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f46e3a50000>; Thu, 27 Aug 2020 10:35:17 +1200
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id E588F13ED33;
        Thu, 27 Aug 2020 10:35:16 +1200 (NZST)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 9284234107C; Thu, 27 Aug 2020 10:35:17 +1200 (NZST)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     wsa@kernel.org, gregory.clement@bootlin.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH v3] i2c: mv64xxx: Add bus error recovery
Date:   Thu, 27 Aug 2020 10:35:16 +1200
Message-Id: <20200826223516.29737-1-mark.tomlinson@alliedtelesis.co.nz>
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

Changes in v3:
 - remove call to i2c_recover_bus() during probe.
 - change error message to info when pinctrl fails, matching other
   similar code.
 - handle a lack of pinctrl information better.

 drivers/i2c/busses/i2c-mv64xxx.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
index 8d9d4ffdcd24..5c5f1d797986 100644
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
@@ -871,6 +875,24 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
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
+		dev_info(dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(rinfo->pinctrl);
+	} else if (!rinfo->pinctrl)
+		return -ENODEV;
+
+	drv_data->adapter.bus_recovery_info =3D rinfo;
+	return 0;
+}
+
 static int
 mv64xxx_i2c_probe(struct platform_device *pd)
 {
@@ -927,6 +949,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
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
--=20
2.28.0

