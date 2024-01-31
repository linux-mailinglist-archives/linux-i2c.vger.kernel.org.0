Return-Path: <linux-i2c+bounces-1559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 851878443BB
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 17:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEF9DB281D4
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 16:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149A212AAC5;
	Wed, 31 Jan 2024 16:09:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306E12837F
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717381; cv=none; b=N9dx10ZcBSbQI3CHsYCG+ElCzlSGzrt8/gwSqr8q8quv47U4WNcLNlUeGYZa8Lxgsbg89zevLBxMOB870tIk250vc5a4smuNz7MUsZgQjTjsOkN5CbPbjK2XwaeWyDKvwHgjpLGGnQreKqrPPxbm7PZGw8RAEcwJnrKSwrsR5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717381; c=relaxed/simple;
	bh=4RL/w/D+JHU+k8ENIavvpxCr8XQWjO8Rks06Xew+uDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pmHFWiAK0xT6vhsn9YH++Qk2xDBgcYMuHyqbfG6jtIwoemymY5dJSQdk3EJrwvA9R67upqsxsjtzYwusldD2KLEgDqkEwOicshamAqL3WEIhr9Q1ES3C0Ov8IY8PMwGne6D3nORLrmIdN5xIif9ptOO+20wpESLAmpkCzRR2ZL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by albert.telenet-ops.be with bizsmtp
	id hU9X2B00N4efzLr06U9XBs; Wed, 31 Jan 2024 17:09:32 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVD8h-00GrUz-9d;
	Wed, 31 Jan 2024 17:09:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVD9X-008lVm-HS;
	Wed, 31 Jan 2024 17:09:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile AG5 to new frequency calculation
Date: Wed, 31 Jan 2024 17:09:30 +0100
Message-Id: <93f3b97c20164510ed80928500a8d443d7e23adb.1706717315.git.geert+renesas@glider.be>
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

As this makes fast_clock_dt_config and v2_freq_calc_dt_config identical,
merge them into a single fast_clock_dt_config.

Legacy SH users (sh7343, sh7366, and sh772[234]) are left alone, and
still use the old formula.

Measurement results on R-Mobile APE6 and SH-Mobile AG5 (fck=104 MHz,
clks_per_count=2):
  100 kHz: 106 kHz LH=1.12 before, 99.6 kHz L/H=1.22 after
  400 kHz: 384 kHz LH=1.67 before, 392 kHz L/H=1.27 after

Measurement results on R-Mobile A1 (fck=49.5 MHz, clks_per_count=1):
  100 kHz: 106 kHz L/H=1.09 before, 99.6 kHz L/H=1.20 after

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Merge fast_clock_dt_config and v2_freq_calc_dt_config,
  - Document that legacy SH users are untouched.
---
 drivers/i2c/busses/i2c-sh_mobile.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 5adbe62cf6212865..c65ac3d7eadc5b58 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -773,7 +773,7 @@ static int sh_mobile_i2c_r8a7740_workaround(struct sh_mobile_i2c_data *pd)
 	iic_wr(pd, ICCR, ICCR_TRS);
 	udelay(10);
 
-	return sh_mobile_i2c_init(pd);
+	return sh_mobile_i2c_v2_init(pd);
 }
 
 static const struct sh_mobile_dt_config default_dt_config = {
@@ -782,11 +782,6 @@ static const struct sh_mobile_dt_config default_dt_config = {
 };
 
 static const struct sh_mobile_dt_config fast_clock_dt_config = {
-	.clks_per_count = 2,
-	.setup = sh_mobile_i2c_init,
-};
-
-static const struct sh_mobile_dt_config v2_freq_calc_dt_config = {
 	.clks_per_count = 2,
 	.setup = sh_mobile_i2c_v2_init,
 };
@@ -799,17 +794,17 @@ static const struct sh_mobile_dt_config r8a7740_dt_config = {
 static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
 	{ .compatible = "renesas,iic-r8a73a4", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,iic-r8a7740", .data = &r8a7740_dt_config },
-	{ .compatible = "renesas,iic-r8a774c0", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7790", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7791", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7792", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7793", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7794", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a7795", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,iic-r8a77990", .data = &v2_freq_calc_dt_config },
+	{ .compatible = "renesas,iic-r8a774c0", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7790", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7791", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7792", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7793", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7794", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a7795", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,iic-r8a77990", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,iic-sh73a0", .data = &fast_clock_dt_config },
-	{ .compatible = "renesas,rcar-gen2-iic", .data = &v2_freq_calc_dt_config },
-	{ .compatible = "renesas,rcar-gen3-iic", .data = &v2_freq_calc_dt_config },
+	{ .compatible = "renesas,rcar-gen2-iic", .data = &fast_clock_dt_config },
+	{ .compatible = "renesas,rcar-gen3-iic", .data = &fast_clock_dt_config },
 	{ .compatible = "renesas,rmobile-iic", .data = &default_dt_config },
 	{},
 };
-- 
2.34.1


