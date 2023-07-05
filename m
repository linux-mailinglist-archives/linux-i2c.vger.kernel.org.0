Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60844748F4D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jul 2023 22:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbjGEUro (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 16:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbjGEUrm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 16:47:42 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7B51BC8;
        Wed,  5 Jul 2023 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688589830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X9yIGXHPT5jp8N9xR/28dXCRO2ICn60eWhZMTJMtiFc=;
        b=fB+4mhTlMVpe0N+hYq/Ezi20Lh6M7waKHsDwl8xAH4TQiqZihIDWfgWbFWMySliu2Ak7xS
        40AAKZsBq+y2IFY6ZT5HDGdj+SjMMkg4OaNEDQ7jxjxJz4jMyrR0vqQ3c7sl+tgZrQeRrc
        8pTUBAGqepJQMIdMQPh9j12q3WDkw5k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/23] i2c: pnx: Remove #ifdef guards for PM related functions
Date:   Wed,  5 Jul 2023 22:43:07 +0200
Message-Id: <20230705204314.89800-17-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-1-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/i2c/busses/i2c-pnx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 82400057f810..4ee7db512333 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -613,7 +613,6 @@ static const struct i2c_algorithm pnx_algorithm = {
 	.functionality = i2c_pnx_func,
 };
 
-#ifdef CONFIG_PM_SLEEP
 static int i2c_pnx_controller_suspend(struct device *dev)
 {
 	struct i2c_pnx_algo_data *alg_data = dev_get_drvdata(dev);
@@ -630,12 +629,9 @@ static int i2c_pnx_controller_resume(struct device *dev)
 	return clk_prepare_enable(alg_data->clk);
 }
 
-static SIMPLE_DEV_PM_OPS(i2c_pnx_pm,
-			 i2c_pnx_controller_suspend, i2c_pnx_controller_resume);
-#define PNX_I2C_PM	(&i2c_pnx_pm)
-#else
-#define PNX_I2C_PM	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(i2c_pnx_pm,
+				i2c_pnx_controller_suspend,
+				i2c_pnx_controller_resume);
 
 static int i2c_pnx_probe(struct platform_device *pdev)
 {
@@ -763,7 +759,7 @@ static struct platform_driver i2c_pnx_driver = {
 	.driver = {
 		.name = "pnx-i2c",
 		.of_match_table = of_match_ptr(i2c_pnx_of_match),
-		.pm = PNX_I2C_PM,
+		.pm = pm_sleep_ptr(&i2c_pnx_pm),
 	},
 	.probe = i2c_pnx_probe,
 	.remove_new = i2c_pnx_remove,
-- 
2.40.1

