Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A7272B4B2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 00:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjFKW6T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 18:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFKW6S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 18:58:18 -0400
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF37E47
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 15:58:17 -0700 (PDT)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.138.180])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id AF7E62356E
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k74kh (unknown [10.110.208.218])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 59D221FD4F;
        Sun, 11 Jun 2023 22:58:15 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
        by ghost-submission-6684bf9d7b-k74kh with ESMTPSA
        id MNZkFIdRhmRctQ0AM1KJvg
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001906012f9-c51b-4319-9f96-1079f17fbcdd,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 12/15] i2c: busses: stm32f7: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:59 +0200
Message-Id: <20230611225702.891856-13-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5874664242430413431
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace the pair of functions, devm_clk_get() and
clk_prepare_enable(), with a single function
devm_clk_get_enabled().

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 37 +++++++++++---------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index e897d9101434d..e556ba073bc0c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2131,23 +2131,16 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
 						    "wakeup-source");
 
-	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c_dev->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
-				     "Failed to get controller clock\n");
-
-	ret = clk_prepare_enable(i2c_dev->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to prepare_enable clock\n");
-		return ret;
-	}
+				     "Failed to enable controller clock\n");
 
 	rst = devm_reset_control_get(&pdev->dev, NULL);
-	if (IS_ERR(rst)) {
-		ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
-				    "Error: Missing reset ctrl\n");
-		goto clk_free;
-	}
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "Error: Missing reset ctrl\n");
+
 	reset_control_assert(rst);
 	udelay(2);
 	reset_control_deassert(rst);
@@ -2162,7 +2155,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq event %i\n",
 			irq_event);
-		goto clk_free;
+		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq_error, stm32f7_i2c_isr_error, 0,
@@ -2170,29 +2163,28 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq error %i\n",
 			irq_error);
-		goto clk_free;
+		return ret;
 	}
 
 	setup = of_device_get_match_data(&pdev->dev);
 	if (!setup) {
 		dev_err(&pdev->dev, "Can't get device data\n");
-		ret = -ENODEV;
-		goto clk_free;
+		return -ENODEV;
 	}
 	i2c_dev->setup = *setup;
 
 	ret = stm32f7_i2c_setup_timing(i2c_dev, &i2c_dev->setup);
 	if (ret)
-		goto clk_free;
+		return ret;
 
 	/* Setup Fast mode plus if necessary */
 	if (i2c_dev->bus_rate > I2C_MAX_FAST_MODE_FREQ) {
 		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
 		if (ret)
-			goto clk_free;
+			return ret;
 		ret = stm32f7_i2c_write_fm_plus_bits(i2c_dev, true);
 		if (ret)
-			goto clk_free;
+			return ret;
 	}
 
 	adap = &i2c_dev->adap;
@@ -2303,9 +2295,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 fmp_clear:
 	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
 
-clk_free:
-	clk_disable_unprepare(i2c_dev->clk);
-
 	return ret;
 }
 
@@ -2339,8 +2328,6 @@ static void stm32f7_i2c_remove(struct platform_device *pdev)
 	}
 
 	stm32f7_i2c_write_fm_plus_bits(i2c_dev, false);
-
-	clk_disable_unprepare(i2c_dev->clk);
 }
 
 static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
-- 
2.40.1

