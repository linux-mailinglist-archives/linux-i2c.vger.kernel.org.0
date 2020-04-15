Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAECA1AA931
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 15:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633784AbgDON4J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 09:56:09 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:11704 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633760AbgDON4I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 09:56:08 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75e9712678c0-6db47; Wed, 15 Apr 2020 21:55:51 +0800 (CST)
X-RM-TRANSID: 2ee75e9712678c0-6db47
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.208.246])
        by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e971263816-b78f1;
        Wed, 15 Apr 2020 21:55:51 +0800 (CST)
X-RM-TRANSID: 2ee75e971263816-b78f1
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     wsa@the-dreams.de, o.rempel@pengutronix.de,
        u.kleine-koenig@pengutronix.de, ardb@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: [PATCH] i2c: drivers: Omit superfluous error message in efm32_i2c_probe()
Date:   Wed, 15 Apr 2020 21:57:34 +0800
Message-Id: <20200415135734.14660-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the function efm32_i2c_probe(),when get irq failed,the function
platform_get_irq() logs an error message,so remove redundant message
here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
---
 drivers/i2c/busses/i2c-efm32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
index a8c6323e7..4de31fae7 100644
--- a/drivers/i2c/busses/i2c-efm32.c
+++ b/drivers/i2c/busses/i2c-efm32.c
@@ -352,7 +352,6 @@ static int efm32_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
-		dev_err(&pdev->dev, "failed to get irq (%d)\n", ret);
 		if (!ret)
 			ret = -EINVAL;
 		return ret;
-- 
2.20.1.windows.1



