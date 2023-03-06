Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 592416AB4F3
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 04:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjCFDK1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Mar 2023 22:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCFDK1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Mar 2023 22:10:27 -0500
X-Greylist: delayed 1239 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Mar 2023 19:10:26 PST
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A497693
        for <linux-i2c@vger.kernel.org>; Sun,  5 Mar 2023 19:10:25 -0800 (PST)
Received: from localhost.localdomain ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 3262m5om002740-3262m5op002740
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 6 Mar 2023 10:48:09 +0800
From:   Dongliang Mu <dzm91@hust.edu.cn>
To:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Dongliang Mu <dzm91@hust.edu.cn>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: i2c: remove dead code in davinci_i2c_probe
Date:   Mon,  6 Mar 2023 10:45:23 +0800
Message-Id: <20230306024523.248216-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From the comment of platform_get_irq, it only returns non-zero IRQ
number and negative error number, other than zero.

Fix this by removing the if condition.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/i2c/busses/i2c-davinci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index c836cf884185..9750310f2c96 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -764,11 +764,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	int r, irq;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (!irq)
-			irq = -ENXIO;
+	if (irq < 0)
 		return dev_err_probe(&pdev->dev, irq, "can't get irq resource\n");
-	}
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(struct davinci_i2c_dev),
 			GFP_KERNEL);
-- 
2.39.2

