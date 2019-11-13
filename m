Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69EFEFAE4C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2019 11:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfKMKO5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Nov 2019 05:14:57 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:40408 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbfKMKO5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Nov 2019 05:14:57 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id RNEu2100q5USYZQ01NEupn; Wed, 13 Nov 2019 11:14:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUpfq-0002Lt-IQ; Wed, 13 Nov 2019 11:14:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iUpfq-0007Kt-GB; Wed, 13 Nov 2019 11:14:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: rcar: Remove superfluous call to clk_get_rate()
Date:   Wed, 13 Nov 2019 11:14:53 +0100
Message-Id: <20191113101453.28157-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Variable "rate" already contains the current clock rate, so use that
rather than calling clk_get_rate() again.

Fixes: 8d0494037bb2af32 ("i2c: rcar: get clock rate only once and simplify calculation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 531c01100b560be3..879f0e61a4968a08 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -317,7 +317,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv, struct i2c_timin
 
 scgd_find:
 	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
-		scl, t->bus_freq_hz, clk_get_rate(priv->clk), round, cdf, scgd);
+		scl, t->bus_freq_hz, rate, round, cdf, scgd);
 
 	/* keep icccr value */
 	priv->icccr = scgd << cdf_width | cdf;
-- 
2.17.1

