Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCD535FDD6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbhDNWeH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:07 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42382 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233448AbhDNWeG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:06 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 05046891B2;
        Thu, 15 Apr 2021 10:33:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439624;
        bh=VIQygqXKl3C1+kqTjQdEy2ihuKoZ6FNIjf1GGmaqJK0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jHcnZ0hofIJQhWqKp97D242yBeRr9LV8VSGMo+wsEjCE300wzH8PtlyWKxdFLNUMA
         DdESgOPsJx61WxoLavsOrIbH6LsxU1K5olfRqSbp9l5vyaxLnpGqu5mIHyktQtc5rT
         kz1xvFOIRp5ZgPIkqdzReXJKomqjS+oUfaRD0JU9EyS+voZqnoAMJq20VAXpN5gRNm
         nWp76EqIQ7sxYK/kC2pZQrpLjNbLwG7eM8NfIJu0LqnQChBoxJxVZoni75RiOzVtOs
         a7tAZK/ouDTUnseb7TkoOI3bcNtHsVh/r+SRD0mF2jsPBfJKdLnfWnUCqWbtG8ENqE
         UJ55I0a3Q6kYA==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc70001>; Thu, 15 Apr 2021 10:33:43 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 7630213EEED;
        Thu, 15 Apr 2021 10:34:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id D2DDF28945B; Thu, 15 Apr 2021 10:33:43 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 5/6] i2c: mpc: Use device_get_match_data() helper
Date:   Thu, 15 Apr 2021 10:33:24 +1200
Message-Id: <20210414223325.23352-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
References: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=Fv5Vi14XzDhZvuwu7T4A:9 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use the device_get_match_data() helper instead of open coding.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 0865f7ac80bd..7a9abeeb6da0 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -14,6 +14,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/slab.h>
=20
 #include <linux/clk.h>
@@ -689,10 +690,9 @@ static struct i2c_bus_recovery_info fsl_i2c_recovery=
_info =3D {
 	.recover_bus =3D fsl_i2c_bus_recovery,
 };
=20
-static const struct of_device_id mpc_i2c_of_match[];
 static int fsl_i2c_probe(struct platform_device *op)
 {
-	const struct of_device_id *match;
+	const struct mpc_i2c_data *data;
 	struct mpc_i2c *i2c;
 	const u32 *prop;
 	u32 clock =3D MPC_I2C_CLOCK_LEGACY;
@@ -701,10 +701,6 @@ static int fsl_i2c_probe(struct platform_device *op)
 	struct clk *clk;
 	int err;
=20
-	match =3D of_match_device(mpc_i2c_of_match, &op->dev);
-	if (!match)
-		return -EINVAL;
-
 	i2c =3D devm_kzalloc(&op->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
@@ -756,8 +752,8 @@ static int fsl_i2c_probe(struct platform_device *op)
 			clock =3D *prop;
 	}
=20
-	if (match->data) {
-		const struct mpc_i2c_data *data =3D match->data;
+	data =3D device_get_match_data(&op->dev);
+	if (data) {
 		data->setup(op->dev.of_node, i2c, clock);
 	} else {
 		/* Backwards compatibility */
--=20
2.31.1

