Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4C1623E9C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 10:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiKJJaY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 04:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKJJaY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 04:30:24 -0500
X-Greylist: delayed 367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Nov 2022 01:30:23 PST
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B6A60D9
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 01:30:23 -0800 (PST)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxct.zte.com.cn (FangMail) with ESMTPS id 4N7GcX0yJGz1Fqq
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 17:24:12 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxde.zte.com.cn (FangMail) with ESMTPS id 4N7GcS5c3dz64Wf1
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 17:24:08 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxus.zte.com.cn (FangMail) with ESMTPS id 4N7GcP1tb2zdmYkp
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 17:24:05 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N7GcK0MQnz4xVnk;
        Thu, 10 Nov 2022 17:24:01 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl2.zte.com.cn with SMTP id 2AA9NeBE000821;
        Thu, 10 Nov 2022 17:23:40 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
        by mapi (Zmail) with MAPI id mid31;
        Thu, 10 Nov 2022 17:23:42 +0800 (CST)
Date:   Thu, 10 Nov 2022 17:23:42 +0800 (CST)
X-Zmail-TransId: 2afa636cc31efffffffff0d0f058
X-Mailer: Zmail v1.0
Message-ID: <202211101723428058432@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <linux@rempel-privat.de>
Cc:     <kernel@pengutronix.de>, <shawnguo@kernel.org>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <chi.minghao@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IGlteDogdXNlIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AA9NeBE000821
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 636CC33B.000 by FangMail milter!
X-FangMail-Envelope: 1668072252/4N7GcX0yJGz1Fqq/636CC33B.000/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 636CC33B.000/4N7GcX0yJGz1Fqq
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Minghao Chi <chi.minghao@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3082183bd66a..1ce0cf7a323f 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1449,8 +1449,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.25.1
