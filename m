Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9287772B4C3
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjFKXRK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbjFKXRJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:17:09 -0400
X-Greylist: delayed 615 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:17:08 PDT
Received: from 8.mo581.mail-out.ovh.net (8.mo581.mail-out.ovh.net [46.105.77.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FFDCE
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:17:07 -0700 (PDT)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.4.85])
        by mo581.mail-out.ovh.net (Postfix) with ESMTP id 2A2C922FA4
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:57:49 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pm5xw (unknown [10.110.103.73])
        by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AF2C01FD71;
        Sun, 11 Jun 2023 22:57:48 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
        by ghost-submission-6684bf9d7b-pm5xw with ESMTPSA
        id tk1tDWxRhmSYZwoAd+tFlQ
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:48 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G0046797f24f-7da4-4297-924b-90d5f53172b3,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Michal Simek <michal.simek@amd.com>
Subject: [PATCH 02/15] i2c: busses: xiic: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:49 +0200
Message-Id: <20230611225702.891856-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5867345891608758943
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
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
Cc: Michal Simek <michal.simek@amd.com>
---
 drivers/i2c/busses/i2c-xiic.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 61288f8dd0672..f879af4def5ed 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1256,16 +1256,11 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	mutex_init(&i2c->lock);
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
-				     "input clock not found.\n");
+				     "failed to enable input clock.\n");
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-		return ret;
-	}
 	i2c->dev = &pdev->dev;
 	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(i2c->dev);
@@ -1286,7 +1281,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Cannot claim IRQ\n");
-		goto err_clk_dis;
+		goto err_pm_disable;
 	}
 
 	i2c->singlemaster =
@@ -1307,14 +1302,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = xiic_reinit(i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Cannot xiic_reinit\n");
-		goto err_clk_dis;
+		goto err_pm_disable;
 	}
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		goto err_clk_dis;
+		goto err_pm_disable;
 	}
 
 	if (pdata) {
@@ -1328,10 +1323,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_clk_dis:
+err_pm_disable:
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(i2c->clk);
+
 	return ret;
 }
 
@@ -1352,7 +1347,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(i2c->dev);
-	clk_disable_unprepare(i2c->clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.40.1

