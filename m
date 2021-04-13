Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BDB35D6D1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 07:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhDMFK0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 01:10:26 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39517 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhDMFK0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 01:10:26 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 65D9E891AE;
        Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618290603;
        bh=YQWkrH0SI9VX1r8tmkITSg99SKuuXe6bbesf0jF7XQs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=diDrl6FN8VjnRLOcy4ahTgYnlib4KcBlWFuNhaRIs2hUp18KIisWLf38NJ3jAJTss
         R+M0WLpWC1eHu6lcUN0NTzWXzSu8fGcqnR3BzvZDp3jnUxV8rO08Qd2mGL84+XP+Od
         O3ievNO/Eimjk/7I7/TXaxSz8fUOHT7SLBCQEMUdAAIkzKpHVh5Q1KLMbSH0VUBm9u
         xnRyrAqPJHwe4ZBOpYHmvW9WKEmV+ImXTP8bTHY/2nzhaM30rIFLccM6b9tZtV4zoR
         9NLZH+rShQCaQ5dmO1y4PNkuMZJFe2WTn7FYq4FsdSpvzUuXb3iWC3Q/YsCpCRHzMw
         cBwU8eW1DhD8w==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B607527ab0001>; Tue, 13 Apr 2021 17:10:03 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 5D11C13EEED;
        Tue, 13 Apr 2021 17:10:23 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 23772284083; Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/4] i2c: mpc: use device managed APIs
Date:   Tue, 13 Apr 2021 17:09:52 +1200
Message-Id: <20210413050956.23264-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=cF2D5sdhiM_WJbguQtAA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use device managed functions an clean up error handling.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Notes:
    Changes in v3:
    - Assuming 09aab7add7bf is reverted I've folded in the fix from Wei
      Yongjun[1] into the original patch. If Wei's patch is applied on to=
p
      of whats already in i2c/for-next then this patch can be ignored.
   =20
    [1] - https://lore.kernel.org/linux-i2c/20210412160026.194423-1-weiyo=
ngjun1@huawei.com/

 drivers/i2c/busses/i2c-mpc.c | 52 +++++++++++++-----------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 5b746a898e8e..6e5614acebac 100644
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
@@ -769,12 +759,6 @@ static int fsl_i2c_remove(struct platform_device *op=
)
 	if (i2c->clk_per)
 		clk_disable_unprepare(i2c->clk_per);
=20
-	if (i2c->irq)
-		free_irq(i2c->irq, i2c);
-
-	irq_dispose_mapping(i2c->irq);
-	iounmap(i2c->base);
-	kfree(i2c);
 	return 0;
 };
=20
--=20
2.31.1

