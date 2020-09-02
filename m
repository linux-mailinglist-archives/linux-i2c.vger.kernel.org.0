Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54C525AE5A
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 17:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgIBPHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 11:07:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:44088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727897AbgIBPHO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 11:07:14 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63A872098B;
        Wed,  2 Sep 2020 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599059232;
        bh=cSQFmywcXooFcP8VNV2UCrqNvF5ouq7dUikOFo9zEuE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HbkL8XGjlZRIsnFjTWTb8qGh7g6TA7XNjmlnpLsW6jen2ejlREFL339vj7TAxnvIE
         Wm0UUO3He96/92GV1im9eWcxkprkOuAb+PHY8CHUpgOq1DEhLH0ya0vRS/Q632PTR+
         3K+ywjp4pqrqiWIsSqKLLtjF27yD5l/9OL2ccxik=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michal Simek <michal.simek@xilinx.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/9] i2c: cadence: Simplify with dev_err_probe()
Date:   Wed,  2 Sep 2020 17:06:38 +0200
Message-Id: <20200902150643.14839-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902150643.14839-1-krzk@kernel.org>
References: <20200902150643.14839-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/i2c-cadence.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e4b7f2a951ad..eefde554c50c 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1214,11 +1214,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
 
 	id->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(id->clk)) {
-		if (PTR_ERR(id->clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "input clock not found.\n");
-		return PTR_ERR(id->clk);
-	}
+	if (IS_ERR(id->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
+				     "input clock not found.\n");
+
 	ret = clk_prepare_enable(id->clk);
 	if (ret)
 		dev_err(&pdev->dev, "Unable to enable clock.\n");
-- 
2.17.1

