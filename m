Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94596BA1A7
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 22:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjCNV6O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 17:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjCNV6L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 17:58:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3ACC244B5;
        Tue, 14 Mar 2023 14:58:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46C9461A0D;
        Tue, 14 Mar 2023 21:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B146C433D2;
        Tue, 14 Mar 2023 21:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678831086;
        bh=Ug7yMMRBbQKExfo2xSNiSHY8spQSMj9D4Ct5iawgxf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fa/byld4tSABqFfREXP0bIMtGZLggNvGm0Oyzy/ZeazM3d9UlUNRH/W3XpmeCNCJi
         HaL/sgvHthhiRIgEBegZQFX7Kl7BYe0n4JQnuyn5oQD/3kufqIgjE67FZWN4ipcotj
         Cgn6OzxpeBsKivcwMPXGHv0h11ZC377xBe0fVRuy2Uv1+j5wErcjC0Ys8ZHQwGdFQF
         1BLlJ/kMgrPW9J3h6HijVDp0raILUInILV4O0Z6CU5zNM+3PGSgcTXd+AU2ueP0acg
         Zcwbk+aMjWoRTn6y1o0EQnTeMHMMdeMbqgunF2a48Dx2ChnibSXgdCU5xqHl0LmOdG
         wgWyGOCwfIoqw==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 2/3] i2c: mpc: Use of_property_read_u32 instead of of_get_property
Date:   Tue, 14 Mar 2023 22:56:11 +0100
Message-Id: <20230314215612.23741-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314215612.23741-1-andi.shyti@kernel.org>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

"of_property_read_u32()" is preferred to "of_get_property()" for
retreiving u32 from the device tree. Replace it.

Suggested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 81ac92bb4f6f1..87e5c1725750f 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -770,7 +770,6 @@ static const struct i2c_algorithm mpc_algo = {
 static struct i2c_adapter mpc_ops = {
 	.owner = THIS_MODULE,
 	.algo = &mpc_algo,
-	.timeout = HZ,
 };
 
 static struct i2c_bus_recovery_info fsl_i2c_recovery_info = {
@@ -781,11 +780,9 @@ static int fsl_i2c_probe(struct platform_device *op)
 {
 	const struct mpc_i2c_data *data;
 	struct mpc_i2c *i2c;
-	const u32 *prop;
-	u32 clock = MPC_I2C_CLOCK_LEGACY;
-	int result = 0;
-	int plen;
 	struct clk *clk;
+	int result;
+	u32 clock;
 	int err;
 
 	i2c = devm_kzalloc(&op->dev, sizeof(*i2c), GFP_KERNEL);
@@ -831,10 +828,10 @@ static int fsl_i2c_probe(struct platform_device *op)
 	if (of_property_read_bool(op->dev.of_node, "fsl,preserve-clocking")) {
 		clock = MPC_I2C_CLOCK_PRESERVE;
 	} else {
-		prop = of_get_property(op->dev.of_node, "clock-frequency",
-					&plen);
-		if (prop && plen == sizeof(u32))
-			clock = *prop;
+		result = of_property_read_u32(op->dev.of_node,
+					      "clock-frequency", &clock);
+		if (result)
+			clock = MPC_I2C_CLOCK_LEGACY;
 	}
 
 	data = device_get_match_data(&op->dev);
@@ -846,12 +843,16 @@ static int fsl_i2c_probe(struct platform_device *op)
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
-	prop = of_get_property(op->dev.of_node, "fsl,timeout", &plen);
-	if (prop && plen == sizeof(u32)) {
-		mpc_ops.timeout = *prop * HZ / 1000000;
+	result = of_property_read_u32(op->dev.of_node,
+				      "fsl,timeout", &mpc_ops.timeout);
+	if (!result) {
+		mpc_ops.timeout *= HZ / 1000000;
 		if (mpc_ops.timeout < 5)
 			mpc_ops.timeout = 5;
+	} else {
+		mpc_ops.timeout = HZ;
 	}
+
 	dev_info(i2c->dev, "timeout %u us\n", mpc_ops.timeout * 1000000 / HZ);
 
 	if (of_property_read_bool(op->dev.of_node, "fsl,i2c-erratum-a004447"))
-- 
2.39.2

