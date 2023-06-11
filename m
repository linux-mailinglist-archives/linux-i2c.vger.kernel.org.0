Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCE672B4BB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 01:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjFKXFx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 19:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKXFw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 19:05:52 -0400
X-Greylist: delayed 77320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jun 2023 16:05:51 PDT
Received: from 19.mo584.mail-out.ovh.net (19.mo584.mail-out.ovh.net [87.98.179.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060F2E47
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 16:05:50 -0700 (PDT)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.20.147])
        by mo584.mail-out.ovh.net (Postfix) with ESMTP id 48E1223AE4
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 22:58:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-sfjmc (unknown [10.110.103.92])
        by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1EFA61FD58;
        Sun, 11 Jun 2023 22:58:04 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
        by ghost-submission-6684bf9d7b-sfjmc with ESMTPSA
        id J3v7BXxRhmR/+w8AwB7amg
        (envelope-from <andi@etezian.org>); Sun, 11 Jun 2023 22:58:04 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S004a201eaff-6adb-4323-9b16-a2c463c3f090,
                    CC7C3CD7EA035B6EDB7D18A077CE8F666EF926BD) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 93.66.31.89
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 10/15] i2c: busses: pasemi-platform: Use devm_clk_get_enabled()
Date:   Mon, 12 Jun 2023 00:56:57 +0200
Message-Id: <20230611225702.891856-11-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611225702.891856-1-andi.shyti@kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5874101293241404151
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgfduveejteegteelhfetueetheegfeehhfektddvleehtefhheevkeduleeuueevnecukfhppeduvdejrddtrddtrddupdelfedrieeirdefuddrkeelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/i2c/busses/i2c-pasemi-platform.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
index 0a44f64897c7a..5fbfb9b417440 100644
--- a/drivers/i2c/busses/i2c-pasemi-platform.c
+++ b/drivers/i2c/busses/i2c-pasemi-platform.c
@@ -66,22 +66,18 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &frequency))
 		frequency = I2C_MAX_STANDARD_MODE_FREQ;
 
-	data->clk_ref = devm_clk_get(dev, NULL);
+	data->clk_ref = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(data->clk_ref))
 		return PTR_ERR(data->clk_ref);
 
-	error = clk_prepare_enable(data->clk_ref);
-	if (error)
-		return error;
-
 	error = pasemi_platform_i2c_calc_clk_div(data, frequency);
 	if (error)
-		goto out_clk_disable;
+		return error;
 
 	smbus->adapter.dev.of_node = pdev->dev.of_node;
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
-		goto out_clk_disable;
+		return error;
 
 	irq_num = platform_get_irq(pdev, 0);
 	error = devm_request_irq(smbus->dev, irq_num, pasemi_irq_handler, 0, "pasemi_apple_i2c", (void *)smbus);
@@ -91,19 +87,9 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, data);
 
 	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(data->clk_ref);
-
-	return error;
 }
 
-static void pasemi_platform_i2c_remove(struct platform_device *pdev)
-{
-	struct pasemi_platform_i2c_data *data = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(data->clk_ref);
-}
+static void pasemi_platform_i2c_remove(struct platform_device *pdev) { }
 
 static const struct of_device_id pasemi_platform_i2c_of_match[] = {
 	{ .compatible = "apple,t8103-i2c" },
-- 
2.40.1

