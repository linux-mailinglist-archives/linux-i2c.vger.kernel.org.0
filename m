Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6A672B517
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 03:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjFLB0l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 21:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjFLB0l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 21:26:41 -0400
Received: from 1.mo582.mail-out.ovh.net (1.mo582.mail-out.ovh.net [46.105.56.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B71619C
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 18:26:38 -0700 (PDT)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.20.107])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4986923EDF
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:47 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pmk5g (unknown [10.110.208.213])
        by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B237A1FE09;
        Sun, 11 Jun 2023 22:57:46 +0000 (UTC)
Received: from etezian.org ([37.59.142.105])
        by ghost-submission-6684bf9d7b-pmk5g with ESMTPSA
        id 2I7yKGpRhmQ5LA4AMMBGyw
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:46 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G006c556ebc1-14a3-4f8c-9edd-0f6c01aa3388,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 01/15] i2c: busses: emev2: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:48 +0200
Message-Id: <20230611225702.891856-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5866782941251701270
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
---
 drivers/i2c/busses/i2c-emev2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 4ba93cd91c0f0..d080b829f142b 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
 
-	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
+	priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
 	if (IS_ERR(priv->sclk))
 		return PTR_ERR(priv->sclk);
 
-	ret = clk_prepare_enable(priv->sclk);
-	if (ret)
-		return ret;
-
 	priv->adap.timeout = msecs_to_jiffies(100);
 	priv->adap.retries = 5;
 	priv->adap.dev.parent = &pdev->dev;
@@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	priv->irq = ret;
 	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
 				"em_i2c", priv);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	ret = i2c_add_adapter(&priv->adap);
 
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
 		 priv->irq);
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(priv->sclk);
-	return ret;
 }
 
 static void em_i2c_remove(struct platform_device *dev)
@@ -424,7 +416,6 @@ static void em_i2c_remove(struct platform_device *dev)
 	struct em_i2c_device *priv = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->sclk);
 }
 
 static const struct of_device_id em_i2c_ids[] = {
-- 
2.40.1

