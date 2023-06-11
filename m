Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8972B4BC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjFKXGi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKXGh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:06:37 -0400
X-Greylist: delayed 525 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:06:35 PDT
Received: from 15.mo582.mail-out.ovh.net (15.mo582.mail-out.ovh.net [188.165.39.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8A7E47
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:06:35 -0700 (PDT)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.16.251])
        by mo582.mail-out.ovh.net (Postfix) with ESMTP id 8464723D68
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-t8tzp (unknown [10.110.208.112])
        by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4BBCF1FDB7;
        Sun, 11 Jun 2023 22:57:54 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
        by ghost-submission-6684bf9d7b-t8tzp with ESMTPSA
        id PSsIEXJRhmSd5AMAZZgHpQ
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:54 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S004398a087b-c0d8-476b-b996-4b66e0b5cc12,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 05/15] i2c: busses: hix5hd2: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:52 +0200
Message-Id: <20230611225702.891856-6-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5868753268240026183
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
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
 drivers/i2c/busses/i2c-hix5hd2.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 64feaa9dca619..aecbe967e2640 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -416,12 +416,11 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
+		dev_err(&pdev->dev, "cannot enable clock\n");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
 
 	strscpy(priv->adap.name, "hix5hd2-i2c", sizeof(priv->adap.name));
 	priv->dev = &pdev->dev;
@@ -442,7 +441,7 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), priv);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "cannot request HS-I2C IRQ %d\n", irq);
-		goto err_clk;
+		return ret;
 	}
 
 	pm_runtime_set_autosuspend_delay(priv->dev, MSEC_PER_SEC);
@@ -459,8 +458,7 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 err_runtime:
 	pm_runtime_disable(priv->dev);
 	pm_runtime_set_suspended(priv->dev);
-err_clk:
-	clk_disable_unprepare(priv->clk);
+
 	return ret;
 }
 
@@ -471,7 +469,6 @@ static void hix5hd2_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&priv->adap);
 	pm_runtime_disable(priv->dev);
 	pm_runtime_set_suspended(priv->dev);
-	clk_disable_unprepare(priv->clk);
 }
 
 #ifdef CONFIG_PM
-- 
2.40.1

