Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74C52A2040
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Nov 2020 18:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgKARSw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Nov 2020 12:18:52 -0500
Received: from viti.kaiser.cx ([85.214.81.225]:52442 "EHLO viti.kaiser.cx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbgKARSv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 1 Nov 2020 12:18:51 -0500
Received: from dslb-188-104-063-075.188.104.pools.vodafone-ip.de ([188.104.63.75] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1kZH0A-0000Pi-L6; Sun, 01 Nov 2020 18:18:46 +0100
From:   Martin Kaiser <martin@kaiser.cx>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 3/3] i2c: exynos5: don't check for irq 0
Date:   Sun,  1 Nov 2020 18:18:07 +0100
Message-Id: <20201101171807.8182-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201101171807.8182-1-martin@kaiser.cx>
References: <20201027214257.8099-1-martin@kaiser.cx>
 <20201101171807.8182-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

platform_get_irq never returns 0. Don't check for this. Make it clear that
the error path always returns a negative error code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
changes in v2
- split the patch in three parts

 drivers/i2c/busses/i2c-exynos5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index fad1c52857aa..20a9881a0d6c 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -778,7 +778,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	init_completion(&i2c->msg_complete);
 
 	i2c->irq = ret = platform_get_irq(pdev, 0);
-	if (ret <= 0)
+	if (ret < 0)
 		goto err_clk;
 
 	ret = devm_request_irq(&pdev->dev, i2c->irq, exynos5_i2c_irq,
-- 
2.20.1

