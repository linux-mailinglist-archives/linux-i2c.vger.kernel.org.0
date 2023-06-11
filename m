Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6E672AFED
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jun 2023 03:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjFKBhS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 21:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjFKBhR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 21:37:17 -0400
Received: from 10.mo561.mail-out.ovh.net (10.mo561.mail-out.ovh.net [87.98.165.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A672D41
        for <linux-i2c@vger.kernel.org>; Sat, 10 Jun 2023 18:37:14 -0700 (PDT)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.16.177])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 3DFC622EAC
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 01:37:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k74kh (unknown [10.110.208.213])
        by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9B7BB1FDF5;
        Sun, 11 Jun 2023 01:37:11 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
        by ghost-submission-6684bf9d7b-k74kh with ESMTPSA
        id grODI0clhWT1gwoAM1KJvg
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 01:37:11 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-99G00307afac82-1ce9-4646-8f23-06c3426a4ec5,
                    457C5B0377F35283987BC361B5457E8A7F11D0C4) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 2/3] i2c: busses: nomadik: Use devm_clk_get_enabled()
Date:   Sun, 11 Jun 2023 03:37:00 +0200
Message-Id: <20230611013701.1464025-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611013701.1464025-1-andi.shyti@kernel.org>
References: <20230611013701.1464025-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2686678655319935559
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduuddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
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
---
 drivers/i2c/busses/i2c-nomadik.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 8b9577318388e..2141ba05dfece 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1005,18 +1005,12 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 		return ret;
 	}
 
-	dev->clk = devm_clk_get(&adev->dev, NULL);
+	dev->clk = devm_clk_get_enabled(&adev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
-		dev_err(&adev->dev, "could not get i2c clock\n");
+		dev_err(&adev->dev, "could enable i2c clock\n");
 		return PTR_ERR(dev->clk);
 	}
 
-	ret = clk_prepare_enable(dev->clk);
-	if (ret) {
-		dev_err(&adev->dev, "can't prepare_enable clock\n");
-		return ret;
-	}
-
 	init_hw(dev);
 
 	adap = &dev->adap;
@@ -1037,16 +1031,11 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 	ret = i2c_add_adapter(adap);
 	if (ret)
-		goto err_no_adap;
+		return ret;
 
 	pm_runtime_put(&adev->dev);
 
 	return 0;
-
- err_no_adap:
-	clk_disable_unprepare(dev->clk);
-
-	return ret;
 }
 
 static void nmk_i2c_remove(struct amba_device *adev)
@@ -1060,7 +1049,6 @@ static void nmk_i2c_remove(struct amba_device *adev)
 	clear_all_interrupts(dev);
 	/* disable the controller */
 	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
-	clk_disable_unprepare(dev->clk);
 	release_mem_region(res->start, resource_size(res));
 }
 
-- 
2.40.1

