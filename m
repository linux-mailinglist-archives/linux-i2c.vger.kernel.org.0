Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 211362A203C
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Nov 2020 18:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgKARSo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Nov 2020 12:18:44 -0500
Received: from viti.kaiser.cx ([85.214.81.225]:52312 "EHLO viti.kaiser.cx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727122AbgKARSn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 1 Nov 2020 12:18:43 -0500
Received: from dslb-188-104-063-075.188.104.pools.vodafone-ip.de ([188.104.63.75] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1kZH02-0000Pi-CM; Sun, 01 Nov 2020 18:18:38 +0100
From:   Martin Kaiser <martin@kaiser.cx>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/3] i2c: exynos5: fix platform_get_irq error handling
Date:   Sun,  1 Nov 2020 18:18:06 +0100
Message-Id: <20201101171807.8182-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201101171807.8182-1-martin@kaiser.cx>
References: <20201027214257.8099-1-martin@kaiser.cx>
 <20201101171807.8182-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If platform_get_irq returns an error, relay this error to the caller of
the probe function. Don't change all errors to -EINVAL. This breaks the
case where platform_get_irq returns -EPROBE_DEFER.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2
- split the patch in three parts

 drivers/i2c/busses/i2c-exynos5.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index c5f5fb28762d..fad1c52857aa 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -778,10 +778,8 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c->msg_complete);
 
 	i2c->irq = ret = platform_get_irq(pdev, 0);
-	if (ret <= 0) {
-		ret = -EINVAL;
+	if (ret <= 0)
 		goto err_clk;
-	}
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c);
-- 
2.20.1

