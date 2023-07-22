Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C608C75DC38
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjGVL5O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGVL5L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:57:11 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF282D6D;
        Sat, 22 Jul 2023 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TfQRq1hemavY+YX0FEbEmN3TekAHVwUrnPJMhDDzA/k=;
        b=WY/igbIyaZc/ejPjOv7Z2UDJVmXXfMMdntziAbpepvVzLhCyA1uOf1Xz3c1PEQSvtuG7XR
        /mQHzOpitHgLX7Qo8yr9AOw4puVOnbuJuevFe+d7UnaefTyZzrexLgbDPgiuUVcA4Lue7t
        mZ5kokvPPVt6YTVQsJkYZU0b0izmIzs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 15/22] i2c: pnx: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:39 +0200
Message-Id: <20230722115046.27323-16-paul@crapouillou.net>
In-Reply-To: <20230722115046.27323-1-paul@crapouillou.net>
References: <20230722115046.27323-1-paul@crapouillou.net>
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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

