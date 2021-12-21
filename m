Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EA347C583
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 18:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240716AbhLURxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 12:53:39 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:44637 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S240717AbhLURxi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 12:53:38 -0500
X-IronPort-AV: E=Sophos;i="5.88,224,1635174000"; 
   d="scan'208";a="104728798"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Dec 2021 02:53:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0A30C40C95EF;
        Wed, 22 Dec 2021 02:53:34 +0900 (JST)
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
Subject: [PATCH v2 3/3] i2c: riic: Use platform_get_irq() to get the interrupt
Date:   Tue, 21 Dec 2021 17:53:22 +0000
Message-Id: <20211221175322.7096-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/i2c/busses/i2c-riic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 78b84445ee6a..8dfd27dc6149 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -433,12 +433,12 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
-		res = platform_get_resource(pdev, IORESOURCE_IRQ, riic_irqs[i].res_num);
-		if (!res)
-			return -ENODEV;
+		ret = platform_get_irq(pdev, riic_irqs[i].res_num);
+		if (ret < 0)
+			return ret;
 
-		ret = devm_request_irq(&pdev->dev, res->start, riic_irqs[i].isr,
-					0, riic_irqs[i].name, riic);
+		ret = devm_request_irq(&pdev->dev, ret, riic_irqs[i].isr,
+				       0, riic_irqs[i].name, riic);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to request irq %s\n", riic_irqs[i].name);
 			return ret;
-- 
2.17.1

