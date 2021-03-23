Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348D73456D3
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 05:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCWEe2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 00:34:28 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39048 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhCWEdx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 00:33:53 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 83C2F891B2;
        Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616474028;
        bh=lXzkv/KDPQjWWEnwXmHPF8yt1n77/EQsw/crJ9mVwf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZQ0fuAqM/eFxF09+bbzPBS+2jhOCOLgWrCkT3VIgSRl6bC/It5vk1u+G8xgvz6Nzz
         2Om1pAuL+Q5DCBCrDTnLozYIehyWJZ4GNkmqWlidsW31Z3Yzr58vP/ET42dS7LkCEg
         d8yLDfPm3+7Dnn1aDQKu2js/HcYe+vP2liQt+q0iAT8UmI+mZ4rIDyk5JrMen5ScYQ
         kh92ymvTKkzP0a4P+TBnyEMMBwxke4WMGsxJK/djRGvg2CjfKDMXHmgSiY1e6pjnNS
         SQlKq0DNGkXFyXrBBKA0H2hnWFwxYET0X5oo5p8uiSB4i71Plwhta73m/HzG5pGP9X
         tae0FRvJcazzQ==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60596fac0002>; Tue, 23 Mar 2021 17:33:48 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id E612813EED4;
        Tue, 23 Mar 2021 17:34:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 64F0428409A; Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 5/6] i2c: mpc: use device managed APIs
Date:   Tue, 23 Mar 2021 17:33:30 +1300
Message-Id: <20210323043331.21878-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=X0Xs-PVj3CX0DAvrFM0A:9
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
2.30.2

