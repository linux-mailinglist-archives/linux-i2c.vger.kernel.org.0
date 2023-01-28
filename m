Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30CF067F54A
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 07:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbjA1Gvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 01:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbjA1Gvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 01:51:52 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1B2442CE;
        Fri, 27 Jan 2023 22:51:48 -0800 (PST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4P3lVB1d6Cz6FK2Q;
        Sat, 28 Jan 2023 14:51:46 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
        by mse-fl1.zte.com.cn with SMTP id 30S6pg3h077569;
        Sat, 28 Jan 2023 14:51:42 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Sat, 28 Jan 2023 14:51:44 +0800 (CST)
Date:   Sat, 28 Jan 2023 14:51:44 +0800 (CST)
X-Zmail-TransId: 2af963d4c600ffffffff9b6444a4
X-Mailer: Zmail v1.0
Message-ID: <202301281451442100100@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <wsa+renesas@sang-engineering.com>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IHdtdDogVXNlIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 30S6pg3h077569
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 63D4C602.000 by FangMail milter!
X-FangMail-Envelope: 1674888706/4P3lVB1d6Cz6FK2Q/63D4C602.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63D4C602.000/4P3lVB1d6Cz6FK2Q
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SPF_PERMERROR,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/i2c/busses/i2c-wmt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-wmt.c b/drivers/i2c/busses/i2c-wmt.c
index 7d4bc8736079..4a3e3985e418 100644
--- a/drivers/i2c/busses/i2c-wmt.c
+++ b/drivers/i2c/busses/i2c-wmt.c
@@ -372,7 +372,6 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct wmt_i2c_dev *i2c_dev;
 	struct i2c_adapter *adap;
-	struct resource *res;
 	int err;
 	u32 clk_rate;

@@ -380,8 +379,7 @@ static int wmt_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);

-- 
2.25.1
