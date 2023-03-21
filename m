Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76606C309C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Mar 2023 12:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjCULoP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 07:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjCULoP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 07:44:15 -0400
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB2B25956;
        Tue, 21 Mar 2023 04:44:13 -0700 (PDT)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PgqWc1Y6lz6FK2Q;
        Tue, 21 Mar 2023 19:44:12 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
        by mse-fl2.zte.com.cn with SMTP id 32LBi3le075071;
        Tue, 21 Mar 2023 19:44:03 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
        by mapi (Zmail) with MAPI id mid31;
        Tue, 21 Mar 2023 19:44:06 +0800 (CST)
Date:   Tue, 21 Mar 2023 19:44:06 +0800 (CST)
X-Zmail-TransId: 2afa6419988621d-ec893
X-Mailer: Zmail v1.0
Message-ID: <202303211944063761253@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <kdasu.kdev@gmail.com>
Cc:     <bcm-kernel-feedback-list@broadcom.com>, <f.fainelli@gmail.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IGJyY21zdGI6IHVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKCk=?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 32LBi3le075071
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6419988C.000/4PgqWc1Y6lz6FK2Q
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource_byname(), as this is exactly what
this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/i2c/busses/i2c-brcmstb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 69383be47905..ef942714642a 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -575,12 +575,10 @@ static void brcmstb_i2c_set_bsc_reg_defaults(struct brcmstb_i2c_dev *dev)
 static int bcm2711_release_bsc(struct brcmstb_i2c_dev *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->device);
-	struct resource *iomem;
 	void __iomem *autoi2c;

 	/* Map hardware registers */
-	iomem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "auto-i2c");
-	autoi2c = devm_ioremap_resource(&pdev->dev, iomem);
+	autoi2c = devm_platform_ioremap_resource_byname(pdev, "auto-i2c");
 	if (IS_ERR(autoi2c))
 		return PTR_ERR(autoi2c);

-- 
2.25.1
