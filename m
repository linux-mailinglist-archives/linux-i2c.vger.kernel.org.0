Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46BF72B4D6
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbjFKXhQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbjFKXhG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:37:06 -0400
X-Greylist: delayed 1784 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:36:52 PDT
Received: from 4.mo581.mail-out.ovh.net (4.mo581.mail-out.ovh.net [178.32.122.254])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C02139
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:36:51 -0700 (PDT)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.76])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id 976A823020
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:50 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bqp6v (unknown [10.110.103.167])
        by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E938F1FDE9;
        Sun, 11 Jun 2023 22:57:49 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
        by ghost-submission-6684bf9d7b-bqp6v with ESMTPSA
        id tS+9Mm1RhmRl3Q8A2le5ag
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:49 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R00296a076f8-0597-48ea-a108-55ad6848b1fa,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 03/15] i2c: busses: at91-core: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:50 +0200
Message-Id: <20230611225702.891856-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5867627367089572552
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
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
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 05ad3bc3578ac..2251e0deed29c 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -226,12 +226,11 @@ static int at91_twi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 
-	dev->clk = devm_clk_get(dev->dev, NULL);
+	dev->clk = devm_clk_get_enabled(dev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
-		dev_err(dev->dev, "no clock defined\n");
+		dev_err(dev->dev, "failed to enable clock\n");
 		return -ENODEV;
 	}
-	clk_prepare_enable(dev->clk);
 
 	snprintf(dev->adapter.name, sizeof(dev->adapter.name), "AT91");
 	i2c_set_adapdata(&dev->adapter, dev);
@@ -260,8 +259,6 @@ static int at91_twi_probe(struct platform_device *pdev)
 
 	rc = i2c_add_numbered_adapter(&dev->adapter);
 	if (rc) {
-		clk_disable_unprepare(dev->clk);
-
 		pm_runtime_disable(dev->dev);
 		pm_runtime_set_suspended(dev->dev);
 
@@ -278,7 +275,6 @@ static void at91_twi_remove(struct platform_device *pdev)
 	struct at91_twi_dev *dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&dev->adapter);
-	clk_disable_unprepare(dev->clk);
 
 	pm_runtime_disable(dev->dev);
 	pm_runtime_set_suspended(dev->dev);
-- 
2.40.1

