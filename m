Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B583C35FDDB
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbhDNWeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:18 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42404 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbhDNWeL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:11 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2635B891B1;
        Thu, 15 Apr 2021 10:33:43 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439623;
        bh=9hTk+o6gszZop0YmTZzeb1g3Oq+e6T1M8WWkYhM5Fzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CJkNHOrHF7yc3r7IkPXnKi4VnmG0Y/Vo9zoUX9XDUt9PD6nKZ7LBQMiBdqm95Qj/1
         SP/ksWbd4u1GudrzmOEs9eYos2mCOeZxzUksCCmkuj/KN/m/z4pG0uYIKP+vqYRbLh
         eYjN53YyWKnWQ4OdergLSiNW2zdlCZrWbnX+C8y8Ou7uWAxnhr1PikC/4qisJM2rHP
         pQvg+Ao4X6JFGp2OUUg0eMWqp0HrIrog0qZUmkCSWgTgpeN0BHTqg50U6+oYBmXen6
         hG02bzVPMt9QZCtC4cy82Td97C/Sd8QFg1GZpYeiPpbTwz1Bcw4fWPUnXDN5eWLL6V
         9btUmhQtRZGCw==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc70000>; Thu, 15 Apr 2021 10:33:43 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 980F513EEED;
        Thu, 15 Apr 2021 10:34:03 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 0095328945B; Thu, 15 Apr 2021 10:33:42 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 4/6] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Date:   Thu, 15 Apr 2021 10:33:23 +1200
Message-Id: <20210414223325.23352-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=4dUZb-rOqoENijjEvZsA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use __maybe_unused for the suspend()/resume() hooks and get rid of
the CONFIG_PM_SLEEP ifdeffery to improve the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v4:
    - Fix compile error due to MPC_I2C_PM_OPS not being defined

 drivers/i2c/busses/i2c-mpc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index d2209c04f67a..0865f7ac80bd 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -85,9 +85,7 @@ struct mpc_i2c {
 	struct i2c_adapter adap;
 	int irq;
 	u32 real_clk;
-#ifdef CONFIG_PM_SLEEP
 	u8 fdr, dfsrr;
-#endif
 	struct clk *clk_per;
 	u32 cntl_bits;
 	enum mpc_i2c_action action;
@@ -808,8 +806,7 @@ static int fsl_i2c_remove(struct platform_device *op)
 	return 0;
 };
=20
-#ifdef CONFIG_PM_SLEEP
-static int mpc_i2c_suspend(struct device *dev)
+static int __maybe_unused mpc_i2c_suspend(struct device *dev)
 {
 	struct mpc_i2c *i2c =3D dev_get_drvdata(dev);
=20
@@ -819,7 +816,7 @@ static int mpc_i2c_suspend(struct device *dev)
 	return 0;
 }
=20
-static int mpc_i2c_resume(struct device *dev)
+static int __maybe_unused mpc_i2c_resume(struct device *dev)
 {
 	struct mpc_i2c *i2c =3D dev_get_drvdata(dev);
=20
@@ -828,12 +825,7 @@ static int mpc_i2c_resume(struct device *dev)
=20
 	return 0;
 }
-
 static SIMPLE_DEV_PM_OPS(mpc_i2c_pm_ops, mpc_i2c_suspend, mpc_i2c_resume=
);
-#define MPC_I2C_PM_OPS	(&mpc_i2c_pm_ops)
-#else
-#define MPC_I2C_PM_OPS	NULL
-#endif
=20
 static const struct mpc_i2c_data mpc_i2c_data_512x =3D {
 	.setup =3D mpc_i2c_setup_512x,
@@ -876,7 +868,7 @@ static struct platform_driver mpc_i2c_driver =3D {
 	.driver =3D {
 		.name =3D DRV_NAME,
 		.of_match_table =3D mpc_i2c_of_match,
-		.pm =3D MPC_I2C_PM_OPS,
+		.pm =3D &mpc_i2c_pm_ops,
 	},
 };
=20
--=20
2.31.1

