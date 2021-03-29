Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E609534C154
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 03:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhC2Bwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Mar 2021 21:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbhC2BwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Mar 2021 21:52:14 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DFDC0613B2
        for <linux-i2c@vger.kernel.org>; Sun, 28 Mar 2021 18:52:13 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D2CAE891B2;
        Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616982728;
        bh=L9pm5Iq3Pj6uFeQniH1UYrq3tTBstnIrSaVCcog7wnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=j0mRKfHucAMKREOh9wsb0+Z/BA/9D7Eh5fBgIck/TC12+GOBGPrGYmb/VM87wTCpX
         NN9fhTbsd0R7GmCHwq3ECKWZ/tqyC2CwbL23uHu0H4vlw2ekADR4FgJkBcuNT2OQ5z
         Sxqq7O8MNCYffJNI0/TYJaIzm+8PdNiwgCp6X736m/gME0qqz6v3igqH6CBKnLEQZ5
         8H8YYMwVtavw2IaL7jCFK3o7xppFUPrE9gNNexnUB6JGpqtza6qZufJ+yJ3wOpQ7l3
         z2yOFbXSYopuDQrIBLHTszRZdYJSYEVKl8Yo9RwBv/tf2biRTEZhgsjr0XC6kStnhr
         ctIjoj3YRBbBg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B606132c80002>; Mon, 29 Mar 2021 14:52:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 14A3513EED4;
        Mon, 29 Mar 2021 14:52:26 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 3EDCC284081; Mon, 29 Mar 2021 14:52:09 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 5/6] i2c: mpc: use device managed APIs
Date:   Mon, 29 Mar 2021 14:52:05 +1300
Message-Id: <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=X0Xs-PVj3CX0DAvrFM0A:9 a=fCgQI5UlmZDRPDxm0A3o:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use device managed functions an clean up error handling.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 46 ++++++++++++++----------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 5b746a898e8e..46cdb36e2f9b 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -654,7 +654,6 @@ static int fsl_i2c_probe(struct platform_device *op)
 	u32 clock =3D MPC_I2C_CLOCK_LEGACY;
 	int result =3D 0;
 	int plen;
-	struct resource res;
 	struct clk *clk;
 	int err;
=20
@@ -662,7 +661,7 @@ static int fsl_i2c_probe(struct platform_device *op)
 	if (!match)
 		return -EINVAL;
=20
-	i2c =3D kzalloc(sizeof(*i2c), GFP_KERNEL);
+	i2c =3D devm_kzalloc(&op->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
=20
@@ -670,24 +669,21 @@ static int fsl_i2c_probe(struct platform_device *op=
)
=20
 	init_waitqueue_head(&i2c->queue);
=20
-	i2c->base =3D of_iomap(op->dev.of_node, 0);
-	if (!i2c->base) {
+	i2c->base =3D devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(i2c->base)) {
 		dev_err(i2c->dev, "failed to map controller\n");
-		result =3D -ENOMEM;
-		goto fail_map;
+		return PTR_ERR(i2c->base);
 	}
=20
-	i2c->irq =3D irq_of_parse_and_map(op->dev.of_node, 0);
-	if (i2c->irq < 0) {
-		result =3D i2c->irq;
-		goto fail_map;
-	}
+	i2c->irq =3D platform_get_irq(op, 0);
+	if (i2c->irq < 0)
+		return i2c->irq;
=20
-	result =3D request_irq(i2c->irq, mpc_i2c_isr,
+	result =3D devm_request_irq(&op->dev, i2c->irq, mpc_i2c_isr,
 			IRQF_SHARED, "i2c-mpc", i2c);
 	if (result < 0) {
 		dev_err(i2c->dev, "failed to attach interrupt\n");
-		goto fail_request;
+		return result;
 	}
=20
 	/*
@@ -699,7 +695,7 @@ static int fsl_i2c_probe(struct platform_device *op)
 		err =3D clk_prepare_enable(clk);
 		if (err) {
 			dev_err(&op->dev, "failed to enable clock\n");
-			goto fail_request;
+			return err;
 		} else {
 			i2c->clk_per =3D clk;
 		}
@@ -731,32 +727,26 @@ static int fsl_i2c_probe(struct platform_device *op=
)
 	}
 	dev_info(i2c->dev, "timeout %u us\n", mpc_ops.timeout * 1000000 / HZ);
=20
-	platform_set_drvdata(op, i2c);
-
 	i2c->adap =3D mpc_ops;
-	of_address_to_resource(op->dev.of_node, 0, &res);
 	scnprintf(i2c->adap.name, sizeof(i2c->adap.name),
-		  "MPC adapter at 0x%llx", (unsigned long long)res.start);
-	i2c_set_adapdata(&i2c->adap, i2c);
+		  "MPC adapter (%s)", of_node_full_name(op->dev.of_node));
 	i2c->adap.dev.parent =3D &op->dev;
+	i2c->adap.nr =3D op->id;
 	i2c->adap.dev.of_node =3D of_node_get(op->dev.of_node);
 	i2c->adap.bus_recovery_info =3D &fsl_i2c_recovery_info;
+	platform_set_drvdata(op, i2c);
+	i2c_set_adapdata(&i2c->adap, i2c);
=20
-	result =3D i2c_add_adapter(&i2c->adap);
-	if (result < 0)
+	result =3D i2c_add_numbered_adapter(&i2c->adap);
+	if (result)
 		goto fail_add;
=20
-	return result;
+	return 0;
=20
  fail_add:
 	if (i2c->clk_per)
 		clk_disable_unprepare(i2c->clk_per);
-	free_irq(i2c->irq, i2c);
- fail_request:
-	irq_dispose_mapping(i2c->irq);
-	iounmap(i2c->base);
- fail_map:
-	kfree(i2c);
+
 	return result;
 };
=20
--=20
2.31.0

