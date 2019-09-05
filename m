Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0500A9926
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 06:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfIEEAq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 00:00:46 -0400
Received: from condef-10.nifty.com ([202.248.20.75]:29013 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfIEEAp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 00:00:45 -0400
X-Greylist: delayed 681 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 00:00:44 EDT
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-10.nifty.com with ESMTP id x853kHxM009530
        for <linux-i2c@vger.kernel.org>; Thu, 5 Sep 2019 12:46:17 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x853jcTH003166;
        Thu, 5 Sep 2019 12:45:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x853jcTH003166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567655140;
        bh=7gaxoylNrSTAPifaXUMFJFcVml5WuDbSfw0bNdNYgYM=;
        h=From:To:Cc:Subject:Date:From;
        b=H2oqbZYUpS6xDMhaK5PhpPyCGgywVffCJmhNpiMupiVr7p6Xmid33GiuiI3bVqEHz
         QlUAC6hZHOSnIoOY9NFTEUP4r5IqpM7bwuCFB4DcfY4fumrIUAZXg+9t6hfu209rqe
         hNUp76bDcw31kvFpjY7Zc+mFrIoIW5rOniPZ4AZdLDGmB8kZurgrhtQS6LX+DRLdv6
         /BrKTX/5mc1KUp832Cx2zheldE8ijvghFp5i/bwNjDlIai/8c9/1/RuQQH058Y6v7f
         far3P6PeQsx3xlNLIY4ZlulKjoDVYE+6LxU2d6w+gGntBWRP5xxqsUY6Nygd8MH+gl
         jTdm/yKKxuCgg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: uniphier(-f): use devm_platform_ioremap_resource()
Date:   Thu,  5 Sep 2019 12:45:32 +0900
Message-Id: <20190905034533.9842-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace the chain of platform_get_resource() and devm_ioremap_resource()
with devm_platform_ioremap_resource().

This allows to remove the local variable for (struct resource *), and
have one function call less.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/i2c/busses/i2c-uniphier-f.c | 4 +---
 drivers/i2c/busses/i2c-uniphier.c   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 7acca2599f04..fc5354845ffa 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -538,7 +538,6 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct uniphier_fi2c_priv *priv;
-	struct resource *regs;
 	u32 bus_speed;
 	unsigned long clk_rate;
 	int irq, ret;
@@ -547,8 +546,7 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->membase = devm_ioremap_resource(dev, regs);
+	priv->membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->membase))
 		return PTR_ERR(priv->membase);
 
diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 0173840c32af..a6d7a3709051 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -326,7 +326,6 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct uniphier_i2c_priv *priv;
-	struct resource *regs;
 	u32 bus_speed;
 	unsigned long clk_rate;
 	int irq, ret;
@@ -335,8 +334,7 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->membase = devm_ioremap_resource(dev, regs);
+	priv->membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->membase))
 		return PTR_ERR(priv->membase);
 
-- 
2.17.1

