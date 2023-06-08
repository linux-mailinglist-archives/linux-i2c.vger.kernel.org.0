Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47ECE728CFE
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 03:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbjFIBUr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 21:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjFIBUp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 21:20:45 -0400
X-Greylist: delayed 8722 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Jun 2023 18:20:43 PDT
Received: from 6.mo584.mail-out.ovh.net (6.mo584.mail-out.ovh.net [188.165.36.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB83019AC
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 18:20:43 -0700 (PDT)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.146.143])
        by mo584.mail-out.ovh.net (Postfix) with ESMTP id 0907024EFE
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 22:55:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-r5hrj (unknown [10.110.103.79])
        by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 87C3E1FD40;
        Thu,  8 Jun 2023 22:55:19 +0000 (UTC)
Received: from etezian.org ([37.59.142.108])
        by ghost-submission-6684bf9d7b-r5hrj with ESMTPSA
        id GNtPBldcgmTQ6AMAFqiLJA
        (envelope-from <andi@etezian.org>); Thu, 08 Jun 2023 22:55:19 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002d3f2c125-dac2-4a81-ac3a-78dbcafc621b,
                    54E9E274CF50DDD2F5E08B3C3864B63AA558C9A4) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.216
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] i2c: hix5hd2: Make sure clk is disabled in remove
Date:   Fri,  9 Jun 2023 00:55:13 +0200
Message-Id: <20230608225513.1151574-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6653786977183795783
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtjedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveefffevkeekgefftdellefgjefgieelvefhjefguefgueffffeifeehfeeukefgnecuffhomhgrihhnpehlihhnuhigthgvshhtihhnghdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrvdduiedpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Alexey Khoroshilov <khoroshilov@ispras.ru>

pm_runtime_set_suspended() does not lead to call of suspend callback,
so clk may be left undisabled in hix5hd2_i2c_remove().

By the way, the patch adds error handling for clk_prepare_enable().

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Hi,

Look what I fished from the far December 2017 :)

It looked better to respin it rather than replying to such an old
mail.

I haven't made any modification to the patch exept for a little
rebase conflict. Here's a full changelog, anyway.

Changelog
=========
v1 -> v2:
 - Fished this out from the muddy pond.
 - Added my SoB
 - Fixed rebase conflict

Andi

 drivers/i2c/busses/i2c-hix5hd2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 0e34cbaca22dc..ec775ffefa9fc 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -421,7 +421,11 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "cannot get clock\n");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "cannot enable clock\n");
+		return ret;
+	}
 
 	strscpy(priv->adap.name, "hix5hd2-i2c", sizeof(priv->adap.name));
 	priv->dev = &pdev->dev;
@@ -469,8 +473,10 @@ static int hix5hd2_i2c_remove(struct platform_device *pdev)
 	struct hix5hd2_i2c_priv *priv = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adap);
-	pm_runtime_disable(priv->dev);
-	pm_runtime_set_suspended(priv->dev);
+
+	/* Make sure priv->clk is disabled */
+	pm_runtime_force_suspend(priv->dev);
+
 	clk_disable_unprepare(priv->clk);
 
 	return 0;
-- 
2.40.1

