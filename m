Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5E075656E
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 15:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjGQNsU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 09:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjGQNsU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 09:48:20 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4FCBFFF;
        Mon, 17 Jul 2023 06:48:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="173153396"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 22:48:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 598D7400CF1A;
        Mon, 17 Jul 2023 22:48:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: mux: ltc4306: Drop enum ltc_type and split chips[]
Date:   Mon, 17 Jul 2023 14:48:07 +0100
Message-Id: <20230717134807.265302-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
References: <20230717134807.265302-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Drop enum ltc_type and split the array chips[] as individual
variables, and make lines shorter by referring to e.g. &ltc_4305_chip
instead of &chips[ltc_4305].

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index c7dfd5eba413..c4f090e8d6db 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -34,11 +34,6 @@
 #define LTC_GPIO_ALL_INPUT	0xC0
 #define LTC_SWITCH_MASK		0xF0
 
-enum ltc_type {
-	ltc_4305,
-	ltc_4306,
-};
-
 struct chip_desc {
 	u8 nchans;
 	u8 num_gpios;
@@ -50,14 +45,13 @@ struct ltc4306 {
 	const struct chip_desc *chip;
 };
 
-static const struct chip_desc chips[] = {
-	[ltc_4305] = {
-		.nchans = LTC4305_MAX_NCHANS,
-	},
-	[ltc_4306] = {
-		.nchans = LTC4306_MAX_NCHANS,
-		.num_gpios = 2,
-	},
+static const struct chip_desc ltc_4305_chip = {
+	.nchans = LTC4305_MAX_NCHANS
+};
+
+static const struct chip_desc ltc_4306_chip = {
+	.nchans = LTC4306_MAX_NCHANS,
+	.num_gpios = 2
 };
 
 static bool ltc4306_is_volatile_reg(struct device *dev, unsigned int reg)
@@ -192,15 +186,15 @@ static int ltc4306_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 }
 
 static const struct i2c_device_id ltc4306_id[] = {
-	{ "ltc4305", .driver_data = (kernel_ulong_t)&chips[ltc_4305] },
-	{ "ltc4306", .driver_data = (kernel_ulong_t)&chips[ltc_4306] },
+	{ "ltc4305", .driver_data = (kernel_ulong_t)&ltc_4305_chip },
+	{ "ltc4306", .driver_data = (kernel_ulong_t)&ltc_4306_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltc4306_id);
 
 static const struct of_device_id ltc4306_of_match[] = {
-	{ .compatible = "lltc,ltc4305", .data = &chips[ltc_4305] },
-	{ .compatible = "lltc,ltc4306", .data = &chips[ltc_4306] },
+	{ .compatible = "lltc,ltc4305", .data = &ltc_4305_chip },
+	{ .compatible = "lltc,ltc4306", .data = &ltc_4306_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltc4306_of_match);
-- 
2.25.1

