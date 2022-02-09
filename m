Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64B14B0168
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 00:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiBIXib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 18:38:31 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiBIXiG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 18:38:06 -0500
X-Greylist: delayed 603 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 15:38:09 PST
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1992AE051EB2
        for <linux-i2c@vger.kernel.org>; Wed,  9 Feb 2022 15:38:08 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,356,1635174000"; 
   d="scan'208";a="110784889"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Feb 2022 08:22:44 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 592F84004CFB;
        Thu, 10 Feb 2022 08:22:42 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] i2c: riic: Simplify reset handling
Date:   Wed,  9 Feb 2022 23:22:32 +0000
Message-Id: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Read reset phandle as optional instead of exclusive so that all the DT's
passing the reset phandle can be used to assert/deassert the reset line.
With this change we don't have to differentiate the RZ/G2L SoC.

With the above changes we no longer need the "renesas,riic-r9a07g044"
compatible string, so drop it from riic_i2c_dt_ids[]. No changes are
required to the r9a07g044.dtsi as we already have "renesas,riic-rz" as a
fallback compatible string.

While at it, check the return code of reset_control_deassert() as it might
fail and also add a devres action to assert the reset line.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 8dfd27dc6149..cded77e06670 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -88,11 +88,6 @@
 
 #define RIIC_INIT_MSG	-1
 
-enum riic_type {
-	RIIC_RZ_A,
-	RIIC_RZ_G2L,
-};
-
 struct riic_dev {
 	void __iomem *base;
 	u8 *buf;
@@ -396,6 +391,11 @@ static struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 5, .isr = riic_tend_isr, .name = "riic-nack" },
 };
 
+static void riic_reset_control_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct riic_dev *riic;
@@ -404,7 +404,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	struct i2c_timings i2c_t;
 	struct reset_control *rstc;
 	int i, ret;
-	enum riic_type type;
 
 	riic = devm_kzalloc(&pdev->dev, sizeof(*riic), GFP_KERNEL);
 	if (!riic)
@@ -421,16 +420,18 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(riic->clk);
 	}
 
-	type = (enum riic_type)of_device_get_match_data(&pdev->dev);
-	if (type == RIIC_RZ_G2L) {
-		rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (IS_ERR(rstc)) {
-			dev_err(&pdev->dev, "Error: missing reset ctrl\n");
-			return PTR_ERR(rstc);
-		}
+	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+				     "Error: missing reset ctrl\n");
 
-		reset_control_deassert(rstc);
-	}
+	ret = reset_control_deassert(rstc);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, riic_reset_control_assert, rstc);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
 		ret = platform_get_irq(pdev, riic_irqs[i].res_num);
@@ -492,8 +493,7 @@ static int riic_i2c_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-r9a07g044", .data = (void *)RIIC_RZ_G2L },
-	{ .compatible = "renesas,riic-rz", .data = (void *)RIIC_RZ_A },
+	{ .compatible = "renesas,riic-rz", },
 	{ /* Sentinel */ },
 };
 
-- 
2.17.1

