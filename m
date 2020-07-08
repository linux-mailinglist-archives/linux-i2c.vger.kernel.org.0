Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F082180DD
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 09:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgGHHUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 03:20:19 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:54415 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730244AbgGHHUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jul 2020 03:20:16 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1400073|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0179064-0.000141561-0.981952;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03300;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=33;RT=33;SR=0;TI=SMTPD_---.I-8lwqE_1594192774;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I-8lwqE_1594192774)
          by smtp.aliyun-inc.com(10.147.40.26);
          Wed, 08 Jul 2020 15:20:07 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, megous@megous.com, stefan@olimex.com,
        bage@linutronix.de
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Frank Lee <frank@allwinnertech.com>
Subject: [PATCH v3 09/16] thermal: sun8i: Add A100's THS controller support
Date:   Wed,  8 Jul 2020 15:19:35 +0800
Message-Id: <20200708071942.22595-10-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200708071942.22595-1-frank@allwinnertech.com>
References: <20200708071942.22595-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch add thermal sensor controller support for A100,
which is similar to the previous ones.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
Reviewed-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index f423d44..f8b1307 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -590,6 +590,19 @@ static int sun8i_ths_remove(struct platform_device *pdev)
 	.calc_temp = sun8i_ths_calc_temp,
 };
 
+static const struct ths_thermal_chip sun50i_a100_ths = {
+	.sensor_num = 3,
+	.has_bus_clk_reset = true,
+	.ft_deviation = 8000,
+	.offset = 187744,
+	.scale = 672,
+	.temp_data_base = SUN50I_H6_THS_TEMP_DATA,
+	.calibrate = sun50i_h6_ths_calibrate,
+	.init = sun50i_h6_thermal_init,
+	.irq_ack = sun50i_h6_irq_ack,
+	.calc_temp = sun8i_ths_calc_temp,
+};
+
 static const struct ths_thermal_chip sun50i_h5_ths = {
 	.sensor_num = 2,
 	.has_mod_clk = true,
@@ -619,6 +632,7 @@ static int sun8i_ths_remove(struct platform_device *pdev)
 	{ .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
 	{ .compatible = "allwinner,sun8i-r40-ths", .data = &sun8i_r40_ths },
 	{ .compatible = "allwinner,sun50i-a64-ths", .data = &sun50i_a64_ths },
+	{ .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
 	{ .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
 	{ .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
 	{ /* sentinel */ },
-- 
1.9.1

