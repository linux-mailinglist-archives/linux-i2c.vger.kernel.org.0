Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E481F7AF778
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 02:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjI0AjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 20:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjI0AhH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 20:37:07 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AD72D75
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 16:48:10 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 537702C066D;
        Wed, 27 Sep 2023 12:48:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1695772088;
        bh=KR9YXJasf5jtvRl6VEb7GUZv9d995ayF9hchctxuvZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yoC0VhJ3EZVg8XM27manwPD9Ghj7zbdpeYO8W3Rt8RMx51ekI/8P/sLS2PUgmHiOV
         Dr+Ud48fuzjmUEjJ19Wg+u6uEiTV/5gpmyYWtqZU0/TDMsaTqHgl+EWVhjYML7wv9y
         A5rB17Td1K15jIfaY+UAldwsWx7/aS/Q/ifhehHS+r5SPCfVznZF2XBeRGskUH+z80
         JyDAvq8+odXGb637ey7EQonPxThtMD+nwqu83r7tckchFf4v/eoYEEXnhnjjBikutB
         PaZIBQIYChyEDoLMDfJ2ldYyzMNQYhVVC1oKR58c4aU9iXDUc67h0hMbKDhY2wr3wJ
         syOVqhNgBL0Kg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65136db80002>; Wed, 27 Sep 2023 12:48:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id EED7813EEA1;
        Wed, 27 Sep 2023 12:48:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id EDCB028160F; Wed, 27 Sep 2023 12:48:07 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, pierre.gondois@arm.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 3/3] i2c: mv64xxx: add support for FSM based recovery
Date:   Wed, 27 Sep 2023 12:48:01 +1300
Message-ID: <20230926234801.4078042-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
References: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=fOpHIqSe c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zNV7Rl7Rt7sA:10 a=B8jpvDMl2VDXHxTB5w4A:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some newer Marvell SoCs (AC5 and CN9130, possibly more) support a I2C
unstuck function. This provides a recovery function as part of the FSM
as an alternative to changing pinctrl modes and using the generic GPIO
based recovery. Allow for using this by adding an optional resource to
the platform data which contains the address of the I2C unstuck register
for the I2C controller.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 71 ++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
index fd8403b07fa6..4345ab19b89c 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -82,6 +83,13 @@
 /* Bridge Status values */
 #define	MV64XXX_I2C_BRIDGE_STATUS_ERROR			BIT(0)
=20
+/* Unstuck Register values */
+#define MV64XXX_I2C_UNSTUCK_TRIGGER			BIT(0)
+#define MV64XXX_I2C_UNSTUCK_ON_GOING			BIT(1)
+#define MV64XXX_I2C_UNSTUCK_ERROR			BIT(2)
+#define MV64XXX_I2C_UNSTUCK_COUNT(val)			((val & 0xf0) >> 4)
+#define MV64XXX_I2C_UNSTUCK_INPROGRESS (MV64XXX_I2C_UNSTUCK_TRIGGER|MV64=
XXX_I2C_UNSTUCK_ON_GOING)
+
 /* Driver states */
 enum {
 	MV64XXX_I2C_STATE_INVALID,
@@ -126,6 +134,7 @@ struct mv64xxx_i2c_data {
 	u32			aborting;
 	u32			cntl_bits;
 	void __iomem		*reg_base;
+	void __iomem		*unstuck_reg;
 	struct mv64xxx_i2c_regs	reg_offsets;
 	u32			addr1;
 	u32			addr2;
@@ -735,6 +744,33 @@ mv64xxx_i2c_can_offload(struct mv64xxx_i2c_data *drv=
_data)
 	return false;
 }
=20
+static int
+mv64xxx_i2c_recover_bus(struct i2c_adapter *adap)
+{
+	struct mv64xxx_i2c_data *drv_data =3D i2c_get_adapdata(adap);
+	int ret;
+	u32 val;
+
+	dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
+	writel(MV64XXX_I2C_UNSTUCK_TRIGGER, drv_data->unstuck_reg);
+	ret =3D readl_poll_timeout_atomic(drv_data->unstuck_reg, val,
+					!(val & MV64XXX_I2C_UNSTUCK_INPROGRESS),
+					1000, 5000);
+	if (ret) {
+		dev_err(&adap->dev, "recovery timeout\n");
+		return ret;
+	}
+
+	if (val & MV64XXX_I2C_UNSTUCK_ERROR) {
+		dev_err(&adap->dev, "recovery failed\n");
+		return -EBUSY;
+	}
+
+	dev_info(&adap->dev, "recovery complete after %d pulses\n", MV64XXX_I2C=
_UNSTUCK_COUNT(val));
+
+	return 0;
+}
+
 /*
  ***********************************************************************=
******
  *
@@ -914,7 +950,8 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 			drv_data->errata_delay =3D true;
 	}
=20
-	if (of_device_is_compatible(np, "marvell,mv78230-a0-i2c")) {
+	if (of_device_is_compatible(np, "marvell,mv78230-a0-i2c") ||
+	    of_device_is_compatible(np, "marvell,armada-8k-i2c")) {
 		drv_data->offload_enabled =3D false;
 		/* The delay is only needed in standard mode (100kHz) */
 		if (bus_freq <=3D I2C_MAX_STANDARD_MODE_FREQ)
@@ -936,8 +973,21 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
 }
 #endif /* CONFIG_OF */
=20
-static int mv64xxx_i2c_init_recovery_info(struct mv64xxx_i2c_data *drv_d=
ata,
-					  struct device *dev)
+static int mv64xxx_i2c_init_fsm_recovery_info(struct mv64xxx_i2c_data *d=
rv_data,
+					      struct device *dev)
+{
+	struct i2c_bus_recovery_info *rinfo =3D &drv_data->rinfo;
+
+	dev_info(dev, "using FSM for recovery\n");
+	rinfo->recover_bus =3D mv64xxx_i2c_recover_bus;
+	drv_data->adapter.bus_recovery_info =3D rinfo;
+
+	return 0;
+
+}
+
+static int mv64xxx_i2c_init_gpio_recovery_info(struct mv64xxx_i2c_data *=
drv_data,
+					       struct device *dev)
 {
 	struct i2c_bus_recovery_info *rinfo =3D &drv_data->rinfo;
=20
@@ -986,6 +1036,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 {
 	struct mv64xxx_i2c_data		*drv_data;
 	struct mv64xxx_i2c_pdata	*pdata =3D dev_get_platdata(&pd->dev);
+	struct resource *res;
 	int	rc;
=20
 	if ((!pdata && !pd->dev.of_node))
@@ -1000,6 +1051,14 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (IS_ERR(drv_data->reg_base))
 		return PTR_ERR(drv_data->reg_base);
=20
+	/* optional unstuck support */
+	res =3D platform_get_resource(pd, IORESOURCE_MEM, 1);
+	if (res) {
+		drv_data->unstuck_reg =3D devm_ioremap_resource(&pd->dev, res);
+		if (IS_ERR(drv_data->unstuck_reg))
+			return PTR_ERR(drv_data->unstuck_reg);
+	}
+
 	strscpy(drv_data->adapter.name, MV64XXX_I2C_CTLR_NAME " adapter",
 		sizeof(drv_data->adapter.name));
=20
@@ -1037,7 +1096,11 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 			return rc;
 	}
=20
-	rc =3D mv64xxx_i2c_init_recovery_info(drv_data, &pd->dev);
+	if (drv_data->unstuck_reg)
+		rc =3D mv64xxx_i2c_init_fsm_recovery_info(drv_data, &pd->dev);
+	else
+		rc =3D mv64xxx_i2c_init_gpio_recovery_info(drv_data, &pd->dev);
+
 	if (rc =3D=3D -EPROBE_DEFER)
 		return rc;
=20
--=20
2.42.0

