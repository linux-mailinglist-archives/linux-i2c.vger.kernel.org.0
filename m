Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 750BC1898E6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 11:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCRKHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 06:07:18 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:4011 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbgCRKHS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Mar 2020 06:07:18 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15e71f2b0a52-116c5; Wed, 18 Mar 2020 18:06:41 +0800 (CST)
X-RM-TRANSID: 2ee15e71f2b0a52-116c5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e71f2aeb06-c9ca4;
        Wed, 18 Mar 2020 18:06:41 +0800 (CST)
X-RM-TRANSID: 2ee75e71f2aeb06-c9ca4
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     linux@rempel-privat.de, s.hauer@pengutronix.de
Cc:     shawnguo@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] drivers/i2c/busses/i2c-imx.c:remove duplicate print after platform_get_irq()
Date:   Wed, 18 Mar 2020 18:07:48 +0800
Message-Id: <20200318100748.17540-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We don't need dev_err() message because when something goes wrong,
platform_get_irq() has print an error message itself, so we should
remove duplicate dev_err().

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a3b61336f..01fd46682 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1066,10 +1066,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "<%s>\n", __func__);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.20.1.windows.1



