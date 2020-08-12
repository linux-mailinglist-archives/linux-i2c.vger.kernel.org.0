Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB818242465
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 05:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgHLDuz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Aug 2020 23:50:55 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47766 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgHLDuz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Aug 2020 23:50:55 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BDD4D200AE0;
        Wed, 12 Aug 2020 05:50:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0A9C0200A8D;
        Wed, 12 Aug 2020 05:50:50 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1454D402DD;
        Wed, 12 Aug 2020 05:50:45 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@rempel-privat.de, kernel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] i2c: imx: Use dev_err_probe() to simplify error handling
Date:   Wed, 12 Aug 2020 11:45:54 +0800
Message-Id: <1597203954-1803-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dev_err_probe() can reduce code size, uniform error handling and record the
defer probe reason etc., use it to simplify the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 0ab5381..63f4367 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1159,11 +1159,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	/* Get I2C clock */
 	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(i2c_imx->clk)) {
-		if (PTR_ERR(i2c_imx->clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "can't get I2C clock\n");
-		return PTR_ERR(i2c_imx->clk);
-	}
+	if (IS_ERR(i2c_imx->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
+				     "can't get I2C clock\n");
 
 	ret = clk_prepare_enable(i2c_imx->clk);
 	if (ret) {
-- 
2.7.4

