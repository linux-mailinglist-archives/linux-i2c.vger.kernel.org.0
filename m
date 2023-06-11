Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A1872B4D0
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjFKXg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjFKXg0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:36:26 -0400
X-Greylist: delayed 2315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:36:24 PDT
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net [87.98.184.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EDC191
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:36:24 -0700 (PDT)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.143.145])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 3777D24000
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-vgw46 (unknown [10.110.171.111])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A75BB1FD4F;
        Sun, 11 Jun 2023 22:58:19 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
        by ghost-submission-6684bf9d7b-vgw46 with ESMTPSA
        id DoQ/J4tRhmSm/Q8A5Gss9Q
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:19 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002a87088b6-a647-43ff-8b8b-d4874057fad8,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 15/15] i2c: busses: uniphier: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:57:02 +0200
Message-Id: <20230611225702.891856-16-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5876071616441813544
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace the pair of functions, devm_clk_get() and
clk_prepare_enable(), with a single function
devm_clk_get_enabled().

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
---
 drivers/i2c/busses/i2c-uniphier.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 96b1eb7489a3c..854ac25b58628 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -335,21 +335,16 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get clock\n");
+		dev_err(dev, "failed to enable clock\n");
 		return PTR_ERR(priv->clk);
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
 	clk_rate = clk_get_rate(priv->clk);
 	if (!clk_rate) {
 		dev_err(dev, "input clock rate should not be zero\n");
-		ret = -EINVAL;
-		goto disable_clk;
+		return -EINVAL;
 	}
 
 	priv->clk_cycle = clk_rate / bus_speed;
@@ -369,15 +364,10 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 			       priv);
 	if (ret) {
 		dev_err(dev, "failed to request irq %d\n", irq);
-		goto disable_clk;
+		return ret;
 	}
 
-	ret = i2c_add_adapter(&priv->adap);
-disable_clk:
-	if (ret)
-		clk_disable_unprepare(priv->clk);
-
-	return ret;
+	return i2c_add_adapter(&priv->adap);
 }
 
 static void uniphier_i2c_remove(struct platform_device *pdev)
@@ -385,7 +375,6 @@ static void uniphier_i2c_remove(struct platform_device *pdev)
 	struct uniphier_i2c_priv *priv = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->clk);
 }
 
 static int __maybe_unused uniphier_i2c_suspend(struct device *dev)
-- 
2.40.1

