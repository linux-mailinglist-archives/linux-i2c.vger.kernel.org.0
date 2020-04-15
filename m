Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089F51AA95C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 16:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633931AbgDOOFd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 10:05:33 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:47046 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633951AbgDOOF3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 10:05:29 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65e97148777f-6d7eb; Wed, 15 Apr 2020 22:04:56 +0800 (CST)
X-RM-TRANSID: 2ee65e97148777f-6d7eb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.208.246])
        by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e97148659f-b8795;
        Wed, 15 Apr 2020 22:04:56 +0800 (CST)
X-RM-TRANSID: 2ee75e97148659f-b8795
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     wsa@the-dreams.de, o.rempel@pengutronix.de,
        u.kleine-koenig@pengutronix.de, ardb@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Subject: [PATCH] i2c: drivers: Avoid unnecessary check in efm32_i2c_probe()
Date:   Wed, 15 Apr 2020 22:06:40 +0800
Message-Id: <20200415140640.19948-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The function efm32_i2c_probe() is only called with an
openfirmware platform device.Therefore there is no need
to check that it has an openfirmware node.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
---
 drivers/i2c/busses/i2c-efm32.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
index 4de31fae7..4786ef6b2 100644
--- a/drivers/i2c/busses/i2c-efm32.c
+++ b/drivers/i2c/busses/i2c-efm32.c
@@ -312,9 +312,6 @@ static int efm32_i2c_probe(struct platform_device *pdev)
 	int ret;
 	u32 clkdiv;
 
-	if (!np)
-		return -EINVAL;
-
 	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
-- 
2.20.1.windows.1



