Return-Path: <linux-i2c+bounces-1297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8882D9E5
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 14:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58EE3B20F40
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611F3168D8;
	Mon, 15 Jan 2024 13:18:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31342168D0
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by albert.telenet-ops.be with bizsmtp
	id b1JF2B00534Hgv9061JFN4; Mon, 15 Jan 2024 14:18:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPMqI-00FdvR-7U;
	Mon, 15 Jan 2024 14:18:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPMr0-00C0Eo-WC;
	Mon, 15 Jan 2024 14:18:15 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile AG5 to new frequency calculation
Date: Mon, 15 Jan 2024 14:18:12 +0100
Message-Id: <f030f08f72dbcf83887013d000c1e2a1a9ffac81.1705324589.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the R-Mobile A1, R-Mobile APE6, and SH-Mobile AG5 SoCs to the new
frequency calculation formula, to (a) avoid running the I2C bus too fast,
and (b) bring the low/high ratio closer to the recommended ratio 5/4.

Measurement results on R-Mobile APE6 and SH-Mobile AG5 (fck=104 MHz,
clks_per_count=2):
  100 kHz: 106 kHz LH=1.12 before, 99.6 kHz L/H=1.22 after
  400 kHz: 384 kHz LH=1.67 before, 392 kHz L/H=1.27 after

Measurement results on R-Mobile A1 (fck=49.5 MHz, clks_per_count=1):
  100 kHz: 106 kHz L/H=1.09 before, 99.6 kHz L/H=1.20 after

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Measurements after applying "[PATCH 1/3] ARM: dts: renesas: r8a73a4: Fix
external clocks and clock rate"[1].  Before, the clock rates were even
4% higher.

Notes:
  - fast_clock_dt_config is now unused, so I guess we should drop it,
    and rename v2_freq_calc_dt_config to fast_clock_dt_config?
  - The formulas in the documentation for R-Mobile A1 do not include the
    "-1" and "-5", presumably this is for rounding?
  - The formulas in the documentation for SH-Mobile AG5 include
    the "-1" and "-5" in the example for 400 kHz, but not in the example
    for 100 kHz.
  - The SH-Mobile AG5 documentation suggests to use an L/H ratio of 5/3
    instead of 5/4 for 400 kHz, which means the old formula is better
    for 400 kHz?
  - Remaining users of the old formula are sh7343, sh7366, and sh772[234].
    At least for sh772[234], the "Transfer Rate" formula in the
    documentation is the same as for R-Mobile A1.  Hence probably we
    should switch the default_dt_config and the default fallback to the
    "v2" formula, too?
  - I am still a bit puzzled, as the "v2" formula introduced in commit
    4ecfb9d3b229fff5 ("i2c: sh_mobile: add new frequency calculation for
    later SoC") is basically what the driver did before commit
    23a612916a51cc37 ("i2c: i2c-sh_mobile: optimize ICCH/ICCL values
    according to I2C bus speed")?

[1] https://lore.kernel.org/r/1692bc8cd465d62168cbf110522ad62a7af3f606.1705315614.git.geert+renesas@glider.be
---
 drivers/i2c/busses/i2c-sh_mobile.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 5adbe62cf6212865..9e2e12d482d8e640 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -773,7 +773,7 @@ static int sh_mobile_i2c_r8a7740_workaround(struct sh_mobile_i2c_data *pd)
 	iic_wr(pd, ICCR, ICCR_TRS);
 	udelay(10);
 
-	return sh_mobile_i2c_init(pd);
+	return sh_mobile_i2c_v2_init(pd);
 }
 
 static const struct sh_mobile_dt_config default_dt_config = {
@@ -797,7 +797,7 @@ static const struct sh_mobile_dt_config r8a7740_dt_config = {
 };
 
 static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
-	{ .compatible = "renesas,iic-r8a73a4", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a73a4", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7740", .data = &r8a7740_dt_config },
 	{ .compatible = "renesas,iic-r8a774c0", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7790", .data = &v2_freq_calc_dt_config },
@@ -807,7 +807,7 @@ static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
 	{ .compatible = "renesas,iic-r8a7794", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a7795", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,iic-r8a77990", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-sh73a0", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-sh73a0", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,rcar-gen2-iic", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,rcar-gen3-iic", .data = &v2_freq_calc_dt_config },
 	{ .compatible = "renesas,rmobile-iic", .data = &default_dt_config },
-- 
2.34.1


