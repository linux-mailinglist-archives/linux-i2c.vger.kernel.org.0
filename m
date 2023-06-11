Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE9872B4B3
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 00:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjFKW6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 18:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFKW6T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 18:58:19 -0400
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6D1A8
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 15:58:18 -0700 (PDT)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.1.191])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8E5A323596
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-76kmb (unknown [10.110.171.117])
        by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 88E191FD53;
        Sun, 11 Jun 2023 22:58:16 +0000 (UTC)
Received: from etezian.org ([37.59.142.106])
        by ghost-submission-6684bf9d7b-76kmb with ESMTPSA
        id O1tDHohRhmQ1KA4As65hGw
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:16 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R006afcda076-0671-4210-bc2c-060fcf5e1703,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 13/15] i2c: busses: sun6i-p2wi: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:57:00 +0200
Message-Id: <20230611225702.891856-14-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5875227191981902443
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
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
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index 3cff1afe0caa2..ad8270cdbd3eb 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -239,15 +239,9 @@ static int p2wi_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	p2wi->clk = devm_clk_get(dev, NULL);
+	p2wi->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(p2wi->clk)) {
 		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to retrieve clk: %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(p2wi->clk);
-	if (ret) {
 		dev_err(dev, "failed to enable clk: %d\n", ret);
 		return ret;
 	}
@@ -256,15 +250,14 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(p2wi->rstc)) {
-		ret = PTR_ERR(p2wi->rstc);
 		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
-		goto err_clk_disable;
+		return PTR_ERR(p2wi->rstc);
 	}
 
 	ret = reset_control_deassert(p2wi->rstc);
 	if (ret) {
 		dev_err(dev, "failed to deassert reset line: %d\n", ret);
-		goto err_clk_disable;
+		return ret;
 	}
 
 	init_completion(&p2wi->complete);
@@ -307,9 +300,6 @@ static int p2wi_probe(struct platform_device *pdev)
 err_reset_assert:
 	reset_control_assert(p2wi->rstc);
 
-err_clk_disable:
-	clk_disable_unprepare(p2wi->clk);
-
 	return ret;
 }
 
@@ -318,7 +308,6 @@ static void p2wi_remove(struct platform_device *dev)
 	struct p2wi *p2wi = platform_get_drvdata(dev);
 
 	reset_control_assert(p2wi->rstc);
-	clk_disable_unprepare(p2wi->clk);
 	i2c_del_adapter(&p2wi->adapter);
 }
 
-- 
2.40.1

