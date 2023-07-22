Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C21F75DC14
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjGVLxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGVLxJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:53:09 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A167E2727;
        Sat, 22 Jul 2023 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aCBtZnf7ZolZh6vxbITAof/WnBpeVBEXlUL9lZM7z2k=;
        b=tmCONbRU0v7rE+WTQoD0bOYkNm1iaJN4OxUVchzyI5HtXszIbK2OrUpGqmns3sfjmrmcZ4
        tMTC3P/Ierkr1E8ykbit0YladierJliSHUe6ap4S9bJSuBWp8x14D+oGh0ZHkd5Jo+Yflw
        Hpj262UCDu4S01LPSxO99Zp0VigO8+k=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 07/22] i2c: hix5hd2: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:50:31 +0200
Message-Id: <20230722115046.27323-8-paul@crapouillou.net>
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

Note that this driver should probably use the
DEFINE_RUNTIME_DEV_PM_OPS() macro, which would allow the devices to be
runtime-suspended on system suspend.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/i2c/busses/i2c-hix5hd2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 784a5f56eb76..8e75515c3ca4 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -475,7 +475,6 @@ static void hix5hd2_i2c_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(priv->dev);
 }
 
-#ifdef CONFIG_PM
 static int hix5hd2_i2c_runtime_suspend(struct device *dev)
 {
 	struct hix5hd2_i2c_priv *priv = dev_get_drvdata(dev);
@@ -494,12 +493,11 @@ static int hix5hd2_i2c_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops hix5hd2_i2c_pm_ops = {
-	SET_RUNTIME_PM_OPS(hix5hd2_i2c_runtime_suspend,
-			      hix5hd2_i2c_runtime_resume,
-			      NULL)
+	RUNTIME_PM_OPS(hix5hd2_i2c_runtime_suspend,
+		       hix5hd2_i2c_runtime_resume,
+		       NULL)
 };
 
 static const struct of_device_id hix5hd2_i2c_match[] = {
@@ -513,7 +511,7 @@ static struct platform_driver hix5hd2_i2c_driver = {
 	.remove_new	= hix5hd2_i2c_remove,
 	.driver		= {
 		.name	= "hix5hd2-i2c",
-		.pm	= &hix5hd2_i2c_pm_ops,
+		.pm	= pm_ptr(&hix5hd2_i2c_pm_ops),
 		.of_match_table = hix5hd2_i2c_match,
 	},
 };
-- 
2.40.1

