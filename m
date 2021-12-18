Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02401479BD1
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 17:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbhLRQxO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 11:53:14 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:49487 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233679AbhLRQxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Dec 2021 11:53:12 -0500
X-IronPort-AV: E=Sophos;i="5.88,216,1635174000"; 
   d="scan'208";a="104388672"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Dec 2021 01:53:11 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C144940A560F;
        Sun, 19 Dec 2021 01:53:08 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to get the interrupt
Date:   Sat, 18 Dec 2021 16:52:57 +0000
Message-Id: <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq_optional() for DT users only.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 39 +++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 7b8caf172851..d887f351f53c 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -830,20 +830,41 @@ static void sh_mobile_i2c_release_dma(struct sh_mobile_i2c_data *pd)
 
 static int sh_mobile_i2c_hook_irqs(struct platform_device *dev, struct sh_mobile_i2c_data *pd)
 {
-	struct resource *res;
-	resource_size_t n;
+	struct device_node *np = dev_of_node(&dev->dev);
 	int k = 0, ret;
 
-	while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
-		for (n = res->start; n <= res->end; n++) {
-			ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
-					  0, dev_name(&dev->dev), pd);
+	if (!np) {
+		struct resource *res;
+		resource_size_t n;
+
+		while ((res = platform_get_resource(dev, IORESOURCE_IRQ, k))) {
+			for (n = res->start; n <= res->end; n++) {
+				ret = devm_request_irq(&dev->dev, n, sh_mobile_i2c_isr,
+						       0, dev_name(&dev->dev), pd);
+				if (ret) {
+					dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
+					return ret;
+				}
+			}
+			k++;
+		}
+	} else {
+		int irq;
+
+		do {
+			irq = platform_get_irq_optional(dev, k);
+			if (irq <= 0 && irq != -ENXIO)
+				return irq ? irq : -ENXIO;
+			if (irq == -ENXIO)
+				break;
+			ret = devm_request_irq(&dev->dev, irq, sh_mobile_i2c_isr,
+					       0, dev_name(&dev->dev), pd);
 			if (ret) {
-				dev_err(&dev->dev, "cannot request IRQ %pa\n", &n);
+				dev_err(&dev->dev, "cannot request IRQ %d\n", irq);
 				return ret;
 			}
-		}
-		k++;
+			k++;
+		} while (irq);
 	}
 
 	return k > 0 ? 0 : -ENOENT;
-- 
2.17.1

