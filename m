Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D8475DC4F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 14:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjGVMAJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 08:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbjGVMAI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 08:00:08 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6794730E3;
        Sat, 22 Jul 2023 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F1GaE+2/EobGnXaZrbvRPqDqY+YQjb0KaQg4mOcftS0=;
        b=Nxx985BTR1MUipNpPbGPhgeZ0+xVITtFXC6aNIc9OCPYwE45hc8r/mHsJIObHmz74FLnkA
        jZCf6OXVwU4FpeJ5DyZHbywvWstyZ9PtrLcfZsT74fYEiS53rVOjoj16Icy5GOFEOvX34J
        p8+cyKkBYYNQbUenTlujAxurASol9XM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>
Subject: [PATCH v2 22/22] i2c: mux: pca954x: Remove #ifdef guards for PM related functions
Date:   Sat, 22 Jul 2023 13:53:10 +0200
Message-Id: <20230722115310.27681-6-paul@crapouillou.net>
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
Acked-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 0ccee2ae5720..6965bf4c2348 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -530,7 +530,6 @@ static void pca954x_remove(struct i2c_client *client)
 	pca954x_cleanup(muxc);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int pca954x_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -544,14 +543,13 @@ static int pca954x_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(pca954x_pm, NULL, pca954x_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pca954x_pm, NULL, pca954x_resume);
 
 static struct i2c_driver pca954x_driver = {
 	.driver		= {
 		.name	= "pca954x",
-		.pm	= &pca954x_pm,
+		.pm	= pm_sleep_ptr(&pca954x_pm),
 		.of_match_table = pca954x_of_match,
 	},
 	.probe		= pca954x_probe,
-- 
2.40.1

