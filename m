Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C004934C14D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 03:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhC2Bwk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Mar 2021 21:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbhC2BwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Mar 2021 21:52:14 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C4FC0613B3
        for <linux-i2c@vger.kernel.org>; Sun, 28 Mar 2021 18:52:13 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AC4EC891B1;
        Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616982728;
        bh=CzEouL8AWNIiq/hqzRdp90thk9+SY8vaBGsdFSu1PGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OV1AF33tPIdzWAlhQx9rVjea7vcVlJ+mnRKGFtB24mjcCQx61YaTPnsyH0OCClnuD
         +2+wvsCyrKCXqJyrxCeUj3SnT2eS7P7JeDG+Daf//VSvo7cTjdI3CveQg7DXnsjx+9
         mAXtB9xzEbG2Ov468YfNnSLua7F+azkUgSoIdkyxk7CCDD7sSW/H4QCjiC+SM8UlRN
         fgjJchIqWxYDv1JuJB/U9smsvjZGDVTURUdbPPnHTQuQ9YoApDsf/raXFmQ4v9IqxW
         vtP0CNAMK/Ylob3fldu7ecrmwuc93a0DysqcGXYhAak7pRLquag+h96anvnP+J2d+J
         HP2CNNGRHLHAw==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B606132c80001>; Mon, 29 Mar 2021 14:52:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id E3AE213EED4;
        Mon, 29 Mar 2021 14:52:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1B23A284081; Mon, 29 Mar 2021 14:52:09 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 4/6] i2c: mpc: make interrupt mandatory and remove polling code
Date:   Mon, 29 Mar 2021 14:52:04 +1300
Message-Id: <20210329015206.17437-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=T_qO__Z0IpnnGzeVBEwA:9 a=fCgQI5UlmZDRPDxm0A3o:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All the in-tree dts files that use one of the compatible strings from
i2c-mpc.c provide an interrupt property. By making this mandatory we
can simplify the code.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 51 ++++++++++++++----------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 6a0d55e9e8e3..5b746a898e8e 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -123,37 +123,21 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)
=20
 static int i2c_wait(struct mpc_i2c *i2c, unsigned timeout, int writing)
 {
-	unsigned long orig_jiffies =3D jiffies;
 	u32 cmd_err;
-	int result =3D 0;
+	int result;
=20
-	if (!i2c->irq) {
-		while (!(readb(i2c->base + MPC_I2C_SR) & CSR_MIF)) {
-			schedule();
-			if (time_after(jiffies, orig_jiffies + timeout)) {
-				dev_dbg(i2c->dev, "timeout\n");
-				writeccr(i2c, 0);
-				result =3D -ETIMEDOUT;
-				break;
-			}
-		}
-		cmd_err =3D readb(i2c->base + MPC_I2C_SR);
-		writeb(0, i2c->base + MPC_I2C_SR);
-	} else {
-		/* Interrupt mode */
-		result =3D wait_event_timeout(i2c->queue,
+	result =3D wait_event_timeout(i2c->queue,
 			(i2c->interrupt & CSR_MIF), timeout);
=20
-		if (unlikely(!(i2c->interrupt & CSR_MIF))) {
-			dev_dbg(i2c->dev, "wait timeout\n");
-			writeccr(i2c, 0);
-			result =3D -ETIMEDOUT;
-		}
-
-		cmd_err =3D i2c->interrupt;
-		i2c->interrupt =3D 0;
+	if (unlikely(!(i2c->interrupt & CSR_MIF))) {
+		dev_dbg(i2c->dev, "wait timeout\n");
+		writeccr(i2c, 0);
+		result =3D -ETIMEDOUT;
 	}
=20
+	cmd_err =3D i2c->interrupt;
+	i2c->interrupt =3D 0;
+
 	if (result < 0)
 		return result;
=20
@@ -694,13 +678,16 @@ static int fsl_i2c_probe(struct platform_device *op=
)
 	}
=20
 	i2c->irq =3D irq_of_parse_and_map(op->dev.of_node, 0);
-	if (i2c->irq) { /* no i2c->irq implies polling */
-		result =3D request_irq(i2c->irq, mpc_i2c_isr,
-				     IRQF_SHARED, "i2c-mpc", i2c);
-		if (result < 0) {
-			dev_err(i2c->dev, "failed to attach interrupt\n");
-			goto fail_request;
-		}
+	if (i2c->irq < 0) {
+		result =3D i2c->irq;
+		goto fail_map;
+	}
+
+	result =3D request_irq(i2c->irq, mpc_i2c_isr,
+			IRQF_SHARED, "i2c-mpc", i2c);
+	if (result < 0) {
+		dev_err(i2c->dev, "failed to attach interrupt\n");
+		goto fail_request;
 	}
=20
 	/*
--=20
2.31.0

