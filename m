Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332CD3A7993
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jun 2021 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhFOI4T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Jun 2021 04:56:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:29801 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231224AbhFOI4T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Jun 2021 04:56:19 -0400
X-IronPort-AV: E=Sophos;i="5.83,275,1616425200"; 
   d="scan'208";a="84276847"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Jun 2021 17:54:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.147])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9AE2241EB34E;
        Tue, 15 Jun 2021 17:54:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/2] i2c: riic: Add RZ/G2L support
Date:   Tue, 15 Jun 2021 09:54:00 +0100
Message-Id: <20210615085400.4251-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210615085400.4251-1-biju.das.jz@bp.renesas.com>
References: <20210615085400.4251-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RZ/G2L i2c controller is compatible with RZ/A i2c controller.
By default IP is in reset state, so need to perform release
reset before accessing any register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2->v3:
  * Dropped select for "RESET_CONTROLLER" from i2c KCONFIG
  * Added Rb tags from Philipp and Geert.
v1->v2
  * Changed to devm_reset_control_get_exclusive API for reset_control_get.
  * Updated KCONFIG to enable RESET_CONTROLLER only if it is RZ/G2L SoC.
  * Filled .data for RIIC_RZ_A.
---
 drivers/i2c/busses/i2c-riic.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 4eccc0f69861..78b84445ee6a 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -42,8 +42,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #define RIIC_ICCR1	0x00
 #define RIIC_ICCR2	0x04
@@ -86,6 +88,11 @@
 
 #define RIIC_INIT_MSG	-1
 
+enum riic_type {
+	RIIC_RZ_A,
+	RIIC_RZ_G2L,
+};
+
 struct riic_dev {
 	void __iomem *base;
 	u8 *buf;
@@ -395,7 +402,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct resource *res;
 	struct i2c_timings i2c_t;
+	struct reset_control *rstc;
 	int i, ret;
+	enum riic_type type;
 
 	riic = devm_kzalloc(&pdev->dev, sizeof(*riic), GFP_KERNEL);
 	if (!riic)
@@ -412,6 +421,17 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(riic->clk);
 	}
 
+	type = (enum riic_type)of_device_get_match_data(&pdev->dev);
+	if (type == RIIC_RZ_G2L) {
+		rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(rstc)) {
+			dev_err(&pdev->dev, "Error: missing reset ctrl\n");
+			return PTR_ERR(rstc);
+		}
+
+		reset_control_deassert(rstc);
+	}
+
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
 		res = platform_get_resource(pdev, IORESOURCE_IRQ, riic_irqs[i].res_num);
 		if (!res)
@@ -472,7 +492,8 @@ static int riic_i2c_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-rz" },
+	{ .compatible = "renesas,riic-r9a07g044", .data = (void *)RIIC_RZ_G2L },
+	{ .compatible = "renesas,riic-rz", .data = (void *)RIIC_RZ_A },
 	{ /* Sentinel */ },
 };
 
-- 
2.17.1

