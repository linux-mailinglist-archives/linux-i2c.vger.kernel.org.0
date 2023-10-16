Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287627C9D6D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 04:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjJPCfP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Oct 2023 22:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjJPCfN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Oct 2023 22:35:13 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B42C1
        for <linux-i2c@vger.kernel.org>; Sun, 15 Oct 2023 19:35:10 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E47942C0381;
        Mon, 16 Oct 2023 15:35:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697423707;
        bh=aCgNbznu5ctmkUYc5AaiEvFzQOMDXqXtMYjFRvtkLjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b5pXqZugtz0gQkC57FTOCbYsBpMB+TKmdU3EKS91m0zJl4LclBDOUZZwnE/k1l0ml
         9WgB2UcNNWPsN+8w3HFjRb/O+wtxmTWncJsVpk47mKmioYM0cKJKCI6EE1e9yUWadL
         fC9j5p98yjA4hFkoaijR3KyWVrL8lyyUR+iMLyZd+K3umqLYlDpyby0lGLUOW3140k
         wAxLJbF3hfhDENZk3jNcQm50wseILsgjrc4GlnJpzkEAZ3+BSwRRLeZ/06WdRWX7ba
         jeZnGkxwXcITPnuubE4LErIncETWjQVcZ0YYxqyakWdjeaoG5x+EnExH6jCYnzhcdw
         cJ9Iz/wuMGHsA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B652ca15b0002>; Mon, 16 Oct 2023 15:35:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id AFFF513EE9B;
        Mon, 16 Oct 2023 15:35:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id AE1D028140C; Mon, 16 Oct 2023 15:35:07 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/2] i2c: mv64xxx: add an optional reset-gpios property
Date:   Mon, 16 Oct 2023 15:35:04 +1300
Message-ID: <20231016023504.3976746-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016023504.3976746-1-chris.packham@alliedtelesis.co.nz>
References: <20231016023504.3976746-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=VsZq4EHS3crWG1I_hwYA:9
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

Notes:
    Changes in v2:
    - Add a property to cover the length of delay after releasing the res=
et
      GPIO
    - Use dev_err_probe() when requesing the GPIO fails

 drivers/i2c/busses/i2c-mv64xxx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv=
64xxx.c
index efd28bbecf61..50c470e5c4be 100644
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
@@ -1036,6 +1037,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	struct mv64xxx_i2c_data		*drv_data;
 	struct mv64xxx_i2c_pdata	*pdata =3D dev_get_platdata(&pd->dev);
 	struct resource *res;
+	u32	reset_udelay;
 	int	rc;
=20
 	if ((!pdata && !pd->dev.of_node))
@@ -1083,6 +1085,14 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	if (drv_data->irq < 0)
 		return drv_data->irq;
=20
+	drv_data->reset_gpio =3D devm_gpiod_get_optional(&pd->dev, "reset", GPI=
OD_OUT_HIGH);
+	if (IS_ERR(drv_data->reset_gpio))
+		return dev_err_probe(&pd->dev, PTR_ERR(drv_data->reset_gpio),
+				     "Cannot get reset gpio\n");
+	rc =3D device_property_read_u32(&pd->dev, "reset-delay-us", &reset_udel=
ay);
+	if (rc)
+		reset_udelay =3D 1;
+
 	if (pdata) {
 		drv_data->freq_m =3D pdata->freq_m;
 		drv_data->freq_n =3D pdata->freq_n;
@@ -1121,6 +1131,11 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 			goto exit_disable_pm;
 	}
=20
+	if (drv_data->reset_gpio) {
+		gpiod_set_value_cansleep(drv_data->reset_gpio, 0);
+		usleep_range(reset_udelay, reset_udelay + 10);
+	}
+
 	rc =3D request_irq(drv_data->irq, mv64xxx_i2c_intr, 0,
 			 MV64XXX_I2C_CTLR_NAME, drv_data);
 	if (rc) {
--=20
2.42.0

