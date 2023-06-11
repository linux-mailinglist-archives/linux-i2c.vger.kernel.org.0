Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 869B072B4B4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 00:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbjFKW6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 18:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFKW6W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 18:58:22 -0400
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net [46.105.56.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FCAE47
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 15:58:20 -0700 (PDT)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.4.72])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id 37B182356E
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:19 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-sjm9b (unknown [10.110.208.177])
        by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F4361FDD6;
        Sun, 11 Jun 2023 22:58:18 +0000 (UTC)
Received: from etezian.org ([37.59.142.96])
        by ghost-submission-6684bf9d7b-sjm9b with ESMTPSA
        id eJG7E4pRhmRnRxAAgRmG/g
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:18 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R0019b62682e-042e-4ad5-b99a-a5b6e956abe5,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 14/15] i2c: busses: uniphier-f: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:57:01 +0200
Message-Id: <20230611225702.891856-15-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5875790140753709608
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
---
 drivers/i2c/busses/i2c-uniphier-f.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 54b1624ef87ea..dbc91c7c3788f 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -540,21 +540,16 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
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
@@ -575,15 +570,10 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 			       pdev->name, priv);
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
 
 static void uniphier_fi2c_remove(struct platform_device *pdev)
@@ -591,7 +581,6 @@ static void uniphier_fi2c_remove(struct platform_device *pdev)
 	struct uniphier_fi2c_priv *priv = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->clk);
 }
 
 static int __maybe_unused uniphier_fi2c_suspend(struct device *dev)
-- 
2.40.1

