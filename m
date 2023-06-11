Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E53C72B4B1
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 00:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjFKW6J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 18:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjFKW6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 18:58:08 -0400
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA28A8
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 15:58:05 -0700 (PDT)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.143.79])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id A561E235CB
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-h8vdf (unknown [10.110.103.36])
        by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1E5A01FD53;
        Sun, 11 Jun 2023 22:58:03 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
        by ghost-submission-6684bf9d7b-h8vdf with ESMTPSA
        id c51EBHtRhmQnbwIA+LR5NQ
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:03 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002f273ab78-8031-4814-8847-a87d03583266,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH 09/15] i2c: busses: owl: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:56 +0200
Message-Id: <20230611225702.891856-10-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5871286542760741430
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefghfdtfefgieejheethfeuueektdefuefhveehtdekhefhtdelhfetudffvedugeenucfkphepuddvjedrtddrtddruddpleefrdeiiedrfedurdekledpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
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
Cc: Andreas Färber <afaerber@suse.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/i2c/busses/i2c-owl.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 99ddd88949645..5f0ef8c351418 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -461,21 +461,16 @@ static int owl_i2c_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	i2c_dev->clk = devm_clk_get(dev, NULL);
+	i2c_dev->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(dev, "failed to get clock\n");
+		dev_err(dev, "failed to enable clock\n");
 		return PTR_ERR(i2c_dev->clk);
 	}
 
-	ret = clk_prepare_enable(i2c_dev->clk);
-	if (ret)
-		return ret;
-
 	i2c_dev->clk_rate = clk_get_rate(i2c_dev->clk);
 	if (!i2c_dev->clk_rate) {
 		dev_err(dev, "input clock rate should not be zero\n");
-		ret = -EINVAL;
-		goto disable_clk;
+		return -EINVAL;
 	}
 
 	init_completion(&i2c_dev->msg_complete);
@@ -496,15 +491,10 @@ static int owl_i2c_probe(struct platform_device *pdev)
 			       i2c_dev);
 	if (ret) {
 		dev_err(dev, "failed to request irq %d\n", irq);
-		goto disable_clk;
+		return ret;
 	}
 
 	return i2c_add_adapter(&i2c_dev->adap);
-
-disable_clk:
-	clk_disable_unprepare(i2c_dev->clk);
-
-	return ret;
 }
 
 static const struct of_device_id owl_i2c_of_match[] = {
-- 
2.40.1

