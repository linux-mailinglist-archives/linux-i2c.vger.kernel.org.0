Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A6535FDD4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhDNWeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbhDNWeG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:06 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCF9C061574
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 15:33:44 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3AED2891B0;
        Thu, 15 Apr 2021 10:33:42 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439622;
        bh=GXqHUpuWokRfjbEd77W/9Qh6oklNNQBGyjI/Si1sIyg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=iBNHxbZcY5towZJEyYL3oZVjqIIrlQlqeF7MRiviet0yj1kJTlGDWqAKnb7SbgX/i
         o0Sw0FK9ENXK1bmZthaiaA8iA/1TokzG/CGV6FNI12Xx84G+tm8Z9Hc/X4rI4Kk2/a
         BnX/Cw14YLW6aV62Bb4hYhmOVZldHfAnY3zw4D+zxnQyULGea8dyuxUae2BnHyytcO
         wDTY9XbmeXJthIs5E5v1lsaxE6jQrtvaVVgUZdUF/nZt+k8Q9lOJO+hZ2h4i6Eg4/q
         cyrNZ5bTD/yC7waoQP6y0S8KO1MbRc7ixnYFQ1ki7/A80oOwgk9Pd6QmgSp4iXbt4F
         BP64lIqpq+JSg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc60000>; Thu, 15 Apr 2021 10:33:42 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AD69613EEED;
        Thu, 15 Apr 2021 10:34:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 15D0D28945B; Thu, 15 Apr 2021 10:33:42 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 3/6] i2c: mpc: Use devm_clk_get_optional()
Date:   Thu, 15 Apr 2021 10:33:22 +1200
Message-Id: <20210414223325.23352-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=Of28ciFWKInbQI-RSHcA:9 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The peripheral clock is optional and we may get an -EPROBE_DEFER error co=
de
which would not be propagated correctly, fix this by using
devm_clk_get_optional().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 37244138875a..d2209c04f67a 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -737,17 +737,18 @@ static int fsl_i2c_probe(struct platform_device *op=
)
 	 * enable clock for the I2C peripheral (non fatal),
 	 * keep a reference upon successful allocation
 	 */
-	clk =3D devm_clk_get(&op->dev, NULL);
-	if (!IS_ERR(clk)) {
-		err =3D clk_prepare_enable(clk);
-		if (err) {
-			dev_err(&op->dev, "failed to enable clock\n");
-			return err;
-		} else {
-			i2c->clk_per =3D clk;
-		}
+	clk =3D devm_clk_get_optional(&op->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	err =3D clk_prepare_enable(clk);
+	if (err) {
+		dev_err(&op->dev, "failed to enable clock\n");
+		return err;
 	}
=20
+	i2c->clk_per =3D clk;
+
 	if (of_property_read_bool(op->dev.of_node, "fsl,preserve-clocking")) {
 		clock =3D MPC_I2C_CLOCK_PRESERVE;
 	} else {
@@ -791,8 +792,7 @@ static int fsl_i2c_probe(struct platform_device *op)
 	return 0;
=20
  fail_add:
-	if (i2c->clk_per)
-		clk_disable_unprepare(i2c->clk_per);
+	clk_disable_unprepare(i2c->clk_per);
=20
 	return result;
 };
@@ -803,8 +803,7 @@ static int fsl_i2c_remove(struct platform_device *op)
=20
 	i2c_del_adapter(&i2c->adap);
=20
-	if (i2c->clk_per)
-		clk_disable_unprepare(i2c->clk_per);
+	clk_disable_unprepare(i2c->clk_per);
=20
 	return 0;
 };
--=20
2.31.1

