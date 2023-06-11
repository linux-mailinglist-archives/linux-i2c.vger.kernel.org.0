Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A97872B4C0
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjFKXQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKXQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:16:23 -0400
Received: from 10.mo561.mail-out.ovh.net (10.mo561.mail-out.ovh.net [87.98.165.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA63BE9
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:16:21 -0700 (PDT)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.4.54])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id D76D723FBA
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5c4nf (unknown [10.111.208.12])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F0961FD4F;
        Sun, 11 Jun 2023 22:57:55 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
        by ghost-submission-6684bf9d7b-5c4nf with ESMTPSA
        id pYXzEnNRhmT62A8AHo92QQ
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:55 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003f65bf91f-46a1-44c3-8689-e20d3fa42f9a,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 06/15] i2c: busses: jz4780: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:53 +0200
Message-Id: <20230611225702.891856-7-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5869034741874887376
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
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
Cc: Paul Cercueil <paul@crapouillou.net>
---
 drivers/i2c/busses/i2c-jz4780.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 0dfe603995214..7f21611ca3262 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -792,26 +792,21 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret)
-		return ret;
-
 	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				   &clk_freq);
 	if (ret) {
 		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
-		goto err;
+		return ret;
 	}
 
 	i2c->speed = clk_freq / 1000;
 	if (i2c->speed == 0) {
-		ret = -EINVAL;
 		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
-		goto err;
+		return -EINVAL;
 	}
 	jz4780_i2c_set_speed(i2c);
 
@@ -827,22 +822,14 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err;
+		return ret;
 	i2c->irq = ret;
 	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
 			       dev_name(&pdev->dev), i2c);
 	if (ret)
-		goto err;
-
-	ret = i2c_add_adapter(&i2c->adap);
-	if (ret < 0)
-		goto err;
-
-	return 0;
+		return ret;
 
-err:
-	clk_disable_unprepare(i2c->clk);
-	return ret;
+	return i2c_add_adapter(&i2c->adap);
 }
 
 static void jz4780_i2c_remove(struct platform_device *pdev)
-- 
2.40.1

