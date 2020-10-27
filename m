Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81D229CBCB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Oct 2020 23:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374752AbgJ0WKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Oct 2020 18:10:18 -0400
Received: from viti.kaiser.cx ([85.214.81.225]:34064 "EHLO viti.kaiser.cx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505872AbgJ0WKR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Oct 2020 18:10:17 -0400
X-Greylist: delayed 1603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Oct 2020 18:10:16 EDT
Received: from dslb-178-004-168-045.178.004.pools.vodafone-ip.de ([178.4.168.45] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1kXWkY-0005q6-08; Tue, 27 Oct 2020 22:43:26 +0100
From:   Martin Kaiser <martin@kaiser.cx>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] i2c: exynos5: fix platform_get_irq error handling
Date:   Tue, 27 Oct 2020 22:42:57 +0100
Message-Id: <20201027214257.8099-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

platform_get_irq already prints an error message if the requested irq
was not found. Don't print another message in the driver.

If platform_get_irq returns an error, relay this error to the caller of the
probe function. Don't change all errors to -EINVAL. This breaks the case
where platform_get_irq returns -EPROBE_DEFER.

platform_get_irq never returns 0. Don't check for this. Make it clear that
the error path always returns a negative error code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/i2c/busses/i2c-exynos5.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 6ce3ec03b595..20a9881a0d6c 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -778,11 +778,8 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c->msg_complete);
 
 	i2c->irq = ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
-		dev_err(&pdev->dev, "cannot find HS-I2C IRQ\n");
-		ret = -EINVAL;
+	if (ret < 0)
 		goto err_clk;
-	}
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
-- 
2.20.1

