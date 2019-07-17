Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4626B894
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2019 10:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729793AbfGQItk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jul 2019 04:49:40 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52696 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbfGQItj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jul 2019 04:49:39 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F593200352;
        Wed, 17 Jul 2019 10:49:38 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DD4EF2000A5;
        Wed, 17 Jul 2019 10:49:32 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id ED985402D5;
        Wed, 17 Jul 2019 16:49:25 +0800 (SGT)
From:   Anson.Huang@nxp.com
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 2/2] i2c: imx-lpi2c: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 17 Jul 2019 16:40:17 +0800
Message-Id: <20190717084017.30987-2-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190717084017.30987-1-Anson.Huang@nxp.com>
References: <20190717084017.30987-1-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Use the new helper devm_platform_ioremap_resource() which wraps the
platform_get_resource() and devm_ioremap_resource() together, to
simplify the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index dc00fab..c92b564 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -545,7 +545,6 @@ MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
 static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
-	struct resource *res;
 	unsigned int temp;
 	int irq, ret;
 
@@ -553,8 +552,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lpi2c_imx->base = devm_ioremap_resource(&pdev->dev, res);
+	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
-- 
2.7.4

