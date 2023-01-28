Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14C067F554
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jan 2023 07:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjA1Gx3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Jan 2023 01:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbjA1Gx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Jan 2023 01:53:28 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321AD577ED;
        Fri, 27 Jan 2023 22:53:19 -0800 (PST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4P3lWx5l8gz6FK2Q;
        Sat, 28 Jan 2023 14:53:17 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
        by mse-fl1.zte.com.cn with SMTP id 30S6r962078134;
        Sat, 28 Jan 2023 14:53:10 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Sat, 28 Jan 2023 14:53:12 +0800 (CST)
Date:   Sat, 28 Jan 2023 14:53:12 +0800 (CST)
X-Zmail-TransId: 2af963d4c6582f746de2
X-Mailer: Zmail v1.0
Message-ID: <202301281453121890132@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <michal.simek@xilinx.com>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IHhpaWM6IFVzZSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 30S6r962078134
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 63D4C65D.001 by FangMail milter!
X-FangMail-Envelope: 1674888797/4P3lWx5l8gz6FK2Q/63D4C65D.001/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63D4C65D.001/4P3lWx5l8gz6FK2Q
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
 drivers/i2c/busses/i2c-xiic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index bee5a2ef1f22..5114888f2916 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -752,7 +752,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
-	struct resource *res;
 	int ret, irq;
 	u8 i;
 	u32 sr;
@@ -761,8 +760,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(i2c->base))
 		return PTR_ERR(i2c->base);

-- 
2.25.1
