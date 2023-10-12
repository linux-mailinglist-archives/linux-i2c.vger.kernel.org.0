Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6067C639E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 06:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbjJLEBc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 00:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235348AbjJLEBS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 00:01:18 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F7B2136
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 20:58:42 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 95A6B2C0806;
        Thu, 12 Oct 2023 16:58:39 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697083119;
        bh=ifZwplH9sagN0NTIjZH8ZM2CYg5lA3N8aVUArps8x2I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gjt70JchAEo3lFT+mTcjRQZEHFTWm4kkIMy90yFJcppKwahtB4dfrObAdEi2oHe/n
         F2HPaIv1UA6Oz+cK4FncrUrq+bvF9CzRo485BdekGScB15haVSH4ZrQYW+ZQ1P7beV
         EA0ueWg5hb7+qPjl0fb7tHB5qKQxvdSdAUzEWYsOeRNVhA/4WAQ72eV6YbIigELw8o
         l6roi+xCzPCn3H1NaJgiIaIwwa/Zp7OmJ9MYk+rR3YY9PTc1Ki1cUDdxDGKp7lBvO7
         9S1keH95OqPBP9Mu1MK0jUzM5L6oB9G+jaVTQ658ahSTcbc+SvSaKaBlxCYhE3eg/P
         Ls5CX1b5AnxSg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65276eef0002>; Thu, 12 Oct 2023 16:58:39 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 5552813EE9B;
        Thu, 12 Oct 2023 16:58:39 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 539DF2809D8; Thu, 12 Oct 2023 16:58:39 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Date:   Thu, 12 Oct 2023 16:58:38 +1300
Message-ID: <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=qKArIWvIHuvpQEZHLy4A:9
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

Some hardware designs have a GPIO used to control the reset of all the
devices on and I2C bus. It's not possible for every child node to
declare a reset-gpios property as only the first device probed would be
able to successfully request it (the others will get -EBUSY). Represent
this kind of hardware design by associating the reset-gpios with the
parent I2C bus. The reset line will be released prior to the child I2C
devices being probed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
index efd28bbecf61..b2ca31857cbd 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -160,6 +160,7 @@ struct mv64xxx_i2c_data {
 	bool			clk_n_base_0;
 	struct i2c_bus_recovery_info	rinfo;
 	bool			atomic;
+	struct gpio_desc	*reset_gpio;
 };
=20
 static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx =3D {
@@ -1083,6 +1084,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (drv_data->irq < 0)
 		return drv_data->irq;
=20
+	drv_data->reset_gpio =3D devm_gpiod_get_optional(&pd->dev, "reset", GPI=
OD_OUT_HIGH);
+	if (IS_ERR(drv_data->reset_gpio))
+		return PTR_ERR(drv_data->reset_gpio);
+
 	if (pdata) {
 		drv_data->freq_m =3D pdata->freq_m;
 		drv_data->freq_n =3D pdata->freq_n;
@@ -1121,6 +1126,12 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 			goto exit_disable_pm;
 	}
=20
+	if (drv_data->reset_gpio) {
+		udelay(1);
+		gpiod_set_value_cansleep(drv_data->reset_gpio, 0);
+		udelay(1);
+	}
+
 	rc =3D request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
 			 MV64XXX_I2C_CTLR_NAME, drv_data);
 	if (rc) {
--=20
2.42.0

