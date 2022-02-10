Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C144B0974
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 10:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238197AbiBJJ1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 04:27:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237964AbiBJJ1c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 04:27:32 -0500
X-Greylist: delayed 66 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 01:27:33 PST
Received: from qq.com (smtpbg468.qq.com [59.36.132.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8E81083
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 01:27:32 -0800 (PST)
X-QQ-mid: bizesmtp7t1644485113tmirrnd0j
Received: from localhost.localdomain (unknown [123.114.60.34])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 10 Feb 2022 17:25:11 +0800 (CST)
X-QQ-SSF: 01400000002000B0L000B00A0000000
X-QQ-FEAT: F3yR32iATbhAQRozjq/gd6A+ycs4suDR+IjPdybesPlhivT2B/iKjlYafIKa1
        1gbjBK7a9XUT5dF0hcYVcCXggTGbuooygvM7JwTfr5hDTSLTs1M+bPZWXDEIjT9maGOFsO2
        Co+dQ9S+7O19b0DtaYh2STMxy/YXPSAaiqGb1JSqozfIZUrNsVIu5ie6X5m3swdJRFEFm8I
        CRSo+S4fBfh8iTkloFw/8EA5YjNl2CWtfzipZU7mlVZhPf6tKR6y2I0X45b4XaohQCpRs+h
        nUkqwkRQTMyKkQauyWjsKMd41VACYmGI6ljvdtW3Z2jCs3xS4KEAqbjrFdg1RDr4AOTWgMJ
        ApMVPbz98T0rYwAWCDD8+LcTFeTcQ==
X-QQ-GoodBg: 2
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] i2c: bcm2835: Use platform_get_irq() to get the interrupt
Date:   Thu, 10 Feb 2022 17:25:06 +0800
Message-Id: <20220210092506.21251-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypassed the hierarchical setup and messed up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 37443edbf754..dfc534065595 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks bcm2835_i2c_quirks = {
 static int bcm2835_i2c_probe(struct platform_device *pdev)
 {
 	struct bcm2835_i2c_dev *i2c_dev;
-	struct resource *mem, *irq;
+	struct resource *mem;
 	int ret;
 	struct i2c_adapter *adap;
 	struct clk *mclk;
@@ -452,12 +452,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
-		return -ENODEV;
-	}
-	i2c_dev->irq = irq->start;
+	i2c_dev->irq = platform_get_irq(pdev, 0);
+	if (i2c_dev->irq < 0)
+		return i2c_dev->irq;
 
 	ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
 			  dev_name(&pdev->dev), i2c_dev);
-- 
2.20.1



