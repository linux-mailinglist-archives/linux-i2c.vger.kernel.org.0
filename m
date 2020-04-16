Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272A01AC858
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 17:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730484AbgDPPHO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 11:07:14 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:47501 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392425AbgDPNvu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 09:51:50 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.15]) by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e9862d6afc-86b80; Thu, 16 Apr 2020 21:51:21 +0800 (CST)
X-RM-TRANSID: 2ee65e9862d6afc-86b80
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.1.173.7])
        by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee85e9862d5013-68f46;
        Thu, 16 Apr 2020 21:51:20 +0800 (CST)
X-RM-TRANSID: 2ee85e9862d5013-68f46
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     wsa@the-dreams.de, manivannan.sadhasivam@linaro.org,
        thor.thayer@linux.intel.com, rrichter@marvell.com,
        bjorn.andersson@linaro.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] i2c: busses: Omit superfluous error message in img_i2c_probe()
Date:   Thu, 16 Apr 2020 21:53:02 +0800
Message-Id: <20200416135302.13740-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the function img_i2c_probe(), when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant message
here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/i2c/busses/i2c-img-scb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index c937ea7..98a8930 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1342,10 +1342,8 @@ static int img_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
 	if (IS_ERR(i2c->sys_clk)) {
-- 
2.7.4



