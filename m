Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472A56B6C9A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 00:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjCLXgx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 19:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjCLXgu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 19:36:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778183B0F9;
        Sun, 12 Mar 2023 16:36:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 249D3B80DC2;
        Sun, 12 Mar 2023 23:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77865C433D2;
        Sun, 12 Mar 2023 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678664206;
        bh=88sh/0qmNZho5AB9/p+qRe7wGUzsLQrW9fXpLSBci6o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c4sTX34col0YRAGwDG19tO1bpdVEG3ryPq9nda3wK2n8l0frUIR/r33ZjSlwaCpov
         dBY4CxZ8Ij14EkeJRNhXaSZZYKjzX1YPP/JoNMluFaP+Y0Z99S1jn3fbwztZYTFxLw
         cyJLiKpDX5Ttvl24BnWRIG3XIYTvMotfamZr5+hYwDRGLZQDLoQ1RKxmpDIFJDilc1
         N5BO9PN7hVQxqMVWOq90M0vUwN9HvijI9WEj5MJT9uV6muNsDxnGqaTtmhrCilqmeM
         IwqXa9DaMbyjbN+xYZBbkWG84fXN/JQH5DaBC47t5YrPsK09IGoKiJTvUqi8a8w+q7
         EBkONXihk/nRg==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 2/3] i2c: mpc: Use of_property_read_u32 instead of of_get_property
Date:   Mon, 13 Mar 2023 00:36:12 +0100
Message-Id: <20230312233613.303408-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312233613.303408-1-andi.shyti@kernel.org>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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
---
 drivers/i2c/busses/i2c-mpc.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 81ac92bb4f6f..87e5c1725750 100644
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

