Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C30547C57D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240693AbhLURxc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:53:32 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:48991 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231318AbhLURxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:53:32 -0500
X-IronPort-AV: E=Sophos;i="5.88,224,1635174000"; 
   d="scan'208";a="104728787"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Dec 2021 02:53:31 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C198540C99CA;
        Wed, 22 Dec 2021 02:53:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Prabhakarprabhakar.csengg@gmail.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] i2c: bcm2835: Use platform_get_irq() to get the interrupt
Date:   Tue, 21 Dec 2021 17:53:20 +0000
Message-Id: <20211221175322.7096-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* Dropped IRQ0 check
---
 drivers/i2c/busses/i2c-bcm2835.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 37443edbf754..dfc534065595 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks bcm2835_i2c_quirks = {
 static int bcm2835_i2c_probe(struct platform_device *pdev)
 {
 	struct bcm2835_i2c_dev *i2c_dev;
-	struct resource *mem, *irq;
+	struct resource *mem;
 	int ret;
 	struct i2c_adapter *adap;
 	struct clk *mclk;
@@ -452,12 +452,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
-		return -ENODEV;
-	}
-	i2c_dev->irq = irq->start;
+	i2c_dev->irq = platform_get_irq(pdev, 0);
+	if (i2c_dev->irq < 0)
+		return i2c_dev->irq;
 
 	ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
 			  dev_name(&pdev->dev), i2c_dev);
-- 
2.17.1

