Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB4672AFF2
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jun 2023 03:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjFKBnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 21:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjFKBnD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 21:43:03 -0400
X-Greylist: delayed 348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Jun 2023 18:43:01 PDT
Received: from 9.mo583.mail-out.ovh.net (9.mo583.mail-out.ovh.net [178.32.96.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AFCF9
        for <linux-i2c@vger.kernel.org>; Sat, 10 Jun 2023 18:43:01 -0700 (PDT)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.20.172])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id 00B7D250D5
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 01:37:10 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kbn2q (unknown [10.111.172.215])
        by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A44391FD48;
        Sun, 11 Jun 2023 01:37:09 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
        by ghost-submission-6684bf9d7b-kbn2q with ESMTPSA
        id TTG8JEUlhWSDHQoAzNwXuw
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 01:37:09 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001b0d3709a-d66c-403f-a71d-a9678c160044,
                    457C5B0377F35283987BC361B5457E8A7F11D0C4) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 1/3] i2c: busses: i2c-nomadik: Remove unnecessary goto label
Date:   Sun, 11 Jun 2023 03:36:59 +0200
Message-Id: <20230611013701.1464025-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611013701.1464025-1-andi.shyti@kernel.org>
References: <20230611013701.1464025-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2685834230988999239
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduuddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The err_no_mem goto label doesn't do anything. Remove it.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-nomadik.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 5004b9dd98563..8b9577318388e 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -971,10 +971,9 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	u32 max_fifo_threshold = (vendor->fifodepth / 2) - 1;
 
 	dev = devm_kzalloc(&adev->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto err_no_mem;
-	}
+	if (!dev)
+		return -ENOMEM;
+
 	dev->vendor = vendor;
 	dev->adev = adev;
 	nmk_i2c_of_probe(np, dev);
@@ -995,30 +994,27 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 	dev->virtbase = devm_ioremap(&adev->dev, adev->res.start,
 				resource_size(&adev->res));
-	if (!dev->virtbase) {
-		ret = -ENOMEM;
-		goto err_no_mem;
-	}
+	if (!dev->virtbase)
+		return -ENOMEM;
 
 	dev->irq = adev->irq[0];
 	ret = devm_request_irq(&adev->dev, dev->irq, i2c_irq_handler, 0,
 				DRIVER_NAME, dev);
 	if (ret) {
 		dev_err(&adev->dev, "cannot claim the irq %d\n", dev->irq);
-		goto err_no_mem;
+		return ret;
 	}
 
 	dev->clk = devm_clk_get(&adev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
 		dev_err(&adev->dev, "could not get i2c clock\n");
-		ret = PTR_ERR(dev->clk);
-		goto err_no_mem;
+		return PTR_ERR(dev->clk);
 	}
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
 		dev_err(&adev->dev, "can't prepare_enable clock\n");
-		goto err_no_mem;
+		return ret;
 	}
 
 	init_hw(dev);
@@ -1049,7 +1045,6 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
  err_no_adap:
 	clk_disable_unprepare(dev->clk);
- err_no_mem:
 
 	return ret;
 }
-- 
2.40.1

