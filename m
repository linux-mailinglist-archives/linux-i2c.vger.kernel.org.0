Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E89572B4CF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjFKXg0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjFKXg0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:36:26 -0400
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net [87.98.184.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293DC193
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:36:25 -0700 (PDT)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.16.251])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 31F4B2403E
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:00 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bnf6w (unknown [10.110.171.220])
        by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BDAB91FD53;
        Sun, 11 Jun 2023 22:57:59 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
        by ghost-submission-6684bf9d7b-bnf6w with ESMTPSA
        id MPyaK3dRhmTR0gAA3EbPLg
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:57:59 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-109S003c5df0168-3016-4d9a-b272-019080fd8893,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, Stefan Roese <sr@denx.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 08/15] i2c: busses: mt7621: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:55 +0200
Message-Id: <20230611225702.891856-9-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5870442115460303571
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
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
Cc: Stefan Roese <sr@denx.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index f9c294e2bd3c5..104bb194e9906 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -282,16 +282,11 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk)) {
-		dev_err(&pdev->dev, "no clock defined\n");
+		dev_err(&pdev->dev, "Failed to enable clock\n");
 		return PTR_ERR(i2c->clk);
 	}
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable clock\n");
-		return ret;
-	}
 
 	i2c->dev = &pdev->dev;
 
@@ -301,8 +296,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	if (i2c->bus_freq == 0) {
 		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
-		ret = -EINVAL;
-		goto err_disable_clk;
+		return -EINVAL;
 	}
 
 	adap = &i2c->adap;
@@ -320,23 +314,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	ret = i2c_add_adapter(adap);
 	if (ret < 0)
-		goto err_disable_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
 
 	return 0;
-
-err_disable_clk:
-	clk_disable_unprepare(i2c->clk);
-
-	return ret;
 }
 
 static void mtk_i2c_remove(struct platform_device *pdev)
 {
 	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(i2c->clk);
 	i2c_del_adapter(&i2c->adap);
 }
 
-- 
2.40.1

