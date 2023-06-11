Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96CAE72B4C2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjFKXRJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKXRI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:17:08 -0400
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:17:07 PDT
Received: from 13.mo581.mail-out.ovh.net (13.mo581.mail-out.ovh.net [87.98.150.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414FEE5
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:17:07 -0700 (PDT)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.146.163])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4673523213
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wjzs9 (unknown [10.110.171.220])
        by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A69F91FD60;
        Sun, 11 Jun 2023 22:57:58 +0000 (UTC)
Received: from etezian.org ([37.59.142.108])
        by ghost-submission-6684bf9d7b-wjzs9 with ESMTPSA
        id e3MRInZRhmTO1A8AYBT6iw
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0029d335423-99e2-42c1-a7ca-16d0a4c5d0a9,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 07/15] i2c: busses: lpc2k: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:54 +0200
Message-Id: <20230611225702.891856-8-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5870160643544975949
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
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
Cc: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/i2c/busses/i2c-lpc2k.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 469fe907723e8..5c6d965547539 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -365,23 +365,17 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&i2c->wait);
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "error getting clock\n");
+		dev_err(&pdev->dev, "failed to enable clock.\n");
 		return PTR_ERR(i2c->clk);
 	}
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "unable to enable clock.\n");
-		return ret;
-	}
-
 	ret = devm_request_irq(&pdev->dev, i2c->irq, i2c_lpc2k_handler, 0,
 			       dev_name(&pdev->dev), i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "can't request interrupt.\n");
-		goto fail_clk;
+		return ret;
 	}
 
 	disable_irq_nosync(i2c->irq);
@@ -397,8 +391,7 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 	clkrate = clk_get_rate(i2c->clk);
 	if (clkrate == 0) {
 		dev_err(&pdev->dev, "can't get I2C base clock\n");
-		ret = -EINVAL;
-		goto fail_clk;
+		return -EINVAL;
 	}
 
 	/* Setup I2C dividers to generate clock with proper duty cycle */
@@ -424,15 +417,11 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
-		goto fail_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "LPC2K I2C adapter\n");
 
 	return 0;
-
-fail_clk:
-	clk_disable_unprepare(i2c->clk);
-	return ret;
 }
 
 static void i2c_lpc2k_remove(struct platform_device *dev)
@@ -440,7 +429,6 @@ static void i2c_lpc2k_remove(struct platform_device *dev)
 	struct lpc2k_i2c *i2c = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&i2c->adap);
-	clk_disable_unprepare(i2c->clk);
 }
 
 #ifdef CONFIG_PM
-- 
2.40.1

