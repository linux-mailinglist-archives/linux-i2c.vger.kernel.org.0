Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3A172B4EE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 02:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjFLAQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 20:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjFLAQ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 20:16:57 -0400
X-Greylist: delayed 3601 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 17:16:55 PDT
Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net [178.33.251.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A5DC7
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 17:16:55 -0700 (PDT)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.146.5])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id DB1FF2342E
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:14 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8s98b (unknown [10.110.171.220])
        by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 30A7C1FD58;
        Sun, 11 Jun 2023 22:58:14 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
        by ghost-submission-6684bf9d7b-8s98b with ESMTPSA
        id hqMECIZRhmQv0g8AyNC6/Q
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:14 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R00460118613-6016-4ed0-9d2f-7be3cb034c47,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 11/15] i2c: busses: stm32f4: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:58 +0200
Message-Id: <20230611225702.891856-12-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5874382765866158711
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-stm32f4.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 6ad06a5a22b43..7bbb0acbdf74d 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -784,23 +784,17 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	i2c_dev->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Error: Missing controller clock\n");
+		dev_err(&pdev->dev, "Failed to enable clock\n");
 		return PTR_ERR(i2c_dev->clk);
 	}
-	ret = clk_prepare_enable(i2c_dev->clk);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Failed to prepare_enable clock\n");
-		return ret;
-	}
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
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
@@ -817,7 +811,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq event %i\n",
 			irq_event);
-		goto clk_free;
+		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq_error, stm32f4_i2c_isr_error, 0,
@@ -825,12 +819,12 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq error %i\n",
 			irq_error);
-		goto clk_free;
+		return ret;
 	}
 
 	ret = stm32f4_i2c_hw_config(i2c_dev);
 	if (ret)
-		goto clk_free;
+		return ret;
 
 	adap = &i2c_dev->adap;
 	i2c_set_adapdata(adap, i2c_dev);
@@ -846,7 +840,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		goto clk_free;
+		return ret;
 
 	platform_set_drvdata(pdev, i2c_dev);
 
@@ -855,10 +849,6 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 	dev_info(i2c_dev->dev, "STM32F4 I2C driver registered\n");
 
 	return 0;
-
-clk_free:
-	clk_disable_unprepare(i2c_dev->clk);
-	return ret;
 }
 
 static void stm32f4_i2c_remove(struct platform_device *pdev)
@@ -866,8 +856,6 @@ static void stm32f4_i2c_remove(struct platform_device *pdev)
 	struct stm32f4_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adap);
-
-	clk_unprepare(i2c_dev->clk);
 }
 
 static const struct of_device_id stm32f4_i2c_match[] = {
-- 
2.40.1

