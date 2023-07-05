Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD78748F5A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbjGEUsr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbjGEUsk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:48:40 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E179919B;
        Wed,  5 Jul 2023 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u8odNBvwa1RbYmh0myTo3jtKpD3/rEw7Dp/gFhlC4/Y=;
        b=Ot+tCvpcg8ue4zDTCiHBtC8l3m40/mszgWD/8ZebAgihkLFV972KdCTYcGXCtNQ0tfZdC1
        JvfRyMZPQxs2tM1GDkL8VMbdL7twoZDkJ9Gj8+WwSPDDVKllEPtJFZ0rDfDXkXSRtxWA+Z
        r52BdkiulFXCR0RKd0pRY2Sz+NQkyTg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 19/23] i2c: rcar: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:45:17 +0200
Message-Id: <20230705204521.90050-1-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/i2c/busses/i2c-rcar.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 2d9c37410ebd..6b7f0f27d0c3 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1169,7 +1169,6 @@ static void rcar_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rcar_i2c_suspend(struct device *dev)
 {
 	struct rcar_i2c_priv *priv = dev_get_drvdata(dev);
@@ -1187,19 +1186,14 @@ static int rcar_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rcar_i2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(rcar_i2c_suspend, rcar_i2c_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(rcar_i2c_suspend, rcar_i2c_resume)
 };
 
-#define DEV_PM_OPS (&rcar_i2c_pm_ops)
-#else
-#define DEV_PM_OPS NULL
-#endif /* CONFIG_PM_SLEEP */
-
 static struct platform_driver rcar_i2c_driver = {
 	.driver	= {
 		.name	= "i2c-rcar",
 		.of_match_table = rcar_i2c_dt_ids,
-		.pm	= DEV_PM_OPS,
+		.pm	= pm_sleep_ptr(&rcar_i2c_pm_ops),
 	},
 	.probe		= rcar_i2c_probe,
 	.remove_new	= rcar_i2c_remove,
-- 
2.40.1

