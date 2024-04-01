Return-Path: <linux-i2c+bounces-2700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B489893869
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 08:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D35D7282CE9
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 06:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B370DB666;
	Mon,  1 Apr 2024 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="jm/fgZ3F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E19946C;
	Mon,  1 Apr 2024 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711953196; cv=none; b=YotzOgWLFJOu3PZkjfU3WQd42xTEfbO76RfuRxa0RQ1FxS1n96W2bSqUkk9zfScYmzsN96ubjtWEPPlGmkECCmNuznU57Smrj+UQOl2UVmjkAUCWGTVg0ZKpRxRyE2ttpQIQbvLNB9jhWeiuY4f1kFQyzViUeBqlL02W4c06vzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711953196; c=relaxed/simple;
	bh=6i9VV6aia7oRkAOV6jzVqtobnaLtA4FTDH5E4PemCHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/kvgPRwim42PA0PZ9GgsSYUlewWKyOD8KGAoluqw8C8N1KLKPD6XqcstjfFRGNUZj4kT0xAhxPkppyqgKHy1h4OZc4wYTEujM1Xgr8VI/ZeR9g7CUkXQyEvYknjHcYcugv3EeZL/zqY7+jkCgfHLDIa5iLHvo13G7SU6D9fS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=jm/fgZ3F; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42VMh5fS002259;
	Sun, 31 Mar 2024 23:33:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	pfpt0220; bh=82sI0ti5ys3oKIz4DNPaLw/dY7lsavOdmFRl2++8bRs=; b=jm/
	fgZ3FMyEl9GOFYkXg7cTnFc5ahFpdQv5gQWUhdLMOBmCOW2E5ROqBzvMjKQ79zzW
	JwwfF1H/YPgPZvDSIIoE4EZ0vrjnR7a77jqeUiO91tQU/+vdIaTn1osUuybPdP5D
	JWQqyuz6Dv/tHQlR3vHtz0Wiwf0jLv4HHGW44z8Pb62o7VIhZPF/Tjer26JqHyvp
	8xDPKU9YcLSV0zZtDi99ObjzKkNnkTakG3LSZ/STcNyCMfNY2rTfWBNCBSX8rXbS
	dpWkbYXnPkMcDJ2/sZip5w71NEPzBl9aWPpn0XK+WTTzuLQcsZZDtJpxPPbB5YJZ
	ztwUspZnAN0HKYf31Kw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x7a7bsqxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 Mar 2024 23:33:10 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 31 Mar 2024 23:32:53 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 31 Mar 2024 23:32:53 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 8E0BE3F705D;
	Sun, 31 Mar 2024 23:32:53 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v5 2/4] i2c: thunderx: Support for High speed mode
Date: Sun, 31 Mar 2024 23:32:16 -0700
Message-ID: <20240401063229.2112782-3-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240401063229.2112782-1-pmalgujar@marvell.com>
References: <20240401063229.2112782-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WeewOAQI7tOFoQOZ702tVU3ESxn9D-oR
X-Proofpoint-ORIG-GUID: WeewOAQI7tOFoQOZ702tVU3ESxn9D-oR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_03,2024-03-28_01,2023-05-22_02

From: Suneel Garapati <sgarapati@marvell.com>

To support bus operations for high speed bus frequencies greater than
400KHZ following control bits need to be setup accordingly
 - hs_mode (bit 0) field in Mode register to switch controller
   between low-speed and high-speed frequency operating mode.
 - Setup clock divisors for desired TWSI bus frequency using
   FOSCL output frequency divisor (D):
   0 - sets the divisor to 10 for low speed mode
   1 - sets the divisor to 15 for high speed mode.
The TWSI bus output frequency, in master mode is based on:
		TCLK = 100MHz / (THP + 2)
		FOSCL = FSAMP / (M+1)×D = TCLK / (2 ^ N × (M + 1) × 15)
		FSAMP = TCLK / 2 ^ N
where,
	N is <2:0> and M is <6:3> of TWSI Clock Control Register
	D is 10 for low speed or 15 for HS_MODE

With high speed mode support, HLC mode usage is limited to
low speed frequency (<=400KHz) bus transfers in hardware.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 100 ++++++++++++++---------
 drivers/i2c/busses/i2c-octeon-core.h     |  32 +++++---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +-
 3 files changed, 82 insertions(+), 53 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 75efb375d8e49479267e214772d4df48352be358..76a5ec100d3039b840ba28ae7a817da447923d4f 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -85,7 +85,7 @@ static int octeon_i2c_wait(struct octeon_i2c *i2c)
 
 static bool octeon_i2c_hlc_test_valid(struct octeon_i2c *i2c)
 {
-	return (__raw_readq(i2c->twsi_base + SW_TWSI(i2c)) & SW_TWSI_V) == 0;
+	return (__raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c)) & SW_TWSI_V) == 0;
 }
 
 static void octeon_i2c_hlc_int_clear(struct octeon_i2c *i2c)
@@ -185,10 +185,10 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 
 	/*
 	 * This is ugly... in HLC mode the status is not in the status register
-	 * but in the lower 8 bits of SW_TWSI.
+	 * but in the lower 8 bits of OCTEON_REG_SW_TWSI.
 	 */
 	if (i2c->hlc_enabled)
-		stat = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+		stat = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	else
 		stat = octeon_i2c_stat_read(i2c);
 
@@ -424,12 +424,12 @@ static int octeon_i2c_hlc_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
 	else
 		cmd |= SW_TWSI_OP_7;
 
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	ret = octeon_i2c_hlc_wait(i2c);
 	if (ret)
 		goto err;
 
-	cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	if ((cmd & SW_TWSI_R) == 0)
 		return octeon_i2c_check_status(i2c, false);
 
@@ -437,7 +437,7 @@ static int octeon_i2c_hlc_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
 		msgs[0].buf[j] = (cmd >> (8 * i)) & 0xff;
 
 	if (msgs[0].len > 4) {
-		cmd = __raw_readq(i2c->twsi_base + SW_TWSI_EXT(i2c));
+		cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
 		for (i = 0; i  < msgs[0].len - 4 && i < 4; i++, j--)
 			msgs[0].buf[j] = (cmd >> (8 * i)) & 0xff;
 	}
@@ -474,15 +474,15 @@ static int octeon_i2c_hlc_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
 
 		for (i = 0; i < msgs[0].len - 4 && i < 4; i++, j--)
 			ext |= (u64)msgs[0].buf[j] << (8 * i);
-		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
 	}
 
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	ret = octeon_i2c_hlc_wait(i2c);
 	if (ret)
 		goto err;
 
-	cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	if ((cmd & SW_TWSI_R) == 0)
 		return octeon_i2c_check_status(i2c, false);
 
@@ -515,19 +515,19 @@ static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs
 		cmd |= SW_TWSI_EIA;
 		ext = (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
 		cmd |= (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
-		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
 	} else {
 		cmd |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
 	}
 
 	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 
 	ret = octeon_i2c_hlc_wait(i2c);
 	if (ret)
 		goto err;
 
-	cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	if ((cmd & SW_TWSI_R) == 0)
 		return octeon_i2c_check_status(i2c, false);
 
@@ -535,7 +535,7 @@ static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs
 		msgs[1].buf[j] = (cmd >> (8 * i)) & 0xff;
 
 	if (msgs[1].len > 4) {
-		cmd = __raw_readq(i2c->twsi_base + SW_TWSI_EXT(i2c));
+		cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
 		for (i = 0; i  < msgs[1].len - 4 && i < 4; i++, j--)
 			msgs[1].buf[j] = (cmd >> (8 * i)) & 0xff;
 	}
@@ -582,16 +582,16 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msg
 		set_ext = true;
 	}
 	if (set_ext)
-		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
 
 	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 
 	ret = octeon_i2c_hlc_wait(i2c);
 	if (ret)
 		goto err;
 
-	cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	if ((cmd & SW_TWSI_R) == 0)
 		return octeon_i2c_check_status(i2c, false);
 
@@ -612,25 +612,27 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	struct octeon_i2c *i2c = i2c_get_adapdata(adap);
 	int i, ret = 0;
 
-	if (num == 1) {
-		if (msgs[0].len > 0 && msgs[0].len <= 8) {
-			if (msgs[0].flags & I2C_M_RD)
-				ret = octeon_i2c_hlc_read(i2c, msgs);
-			else
-				ret = octeon_i2c_hlc_write(i2c, msgs);
-			goto out;
-		}
-	} else if (num == 2) {
-		if ((msgs[0].flags & I2C_M_RD) == 0 &&
-		    (msgs[1].flags & I2C_M_RECV_LEN) == 0 &&
-		    msgs[0].len > 0 && msgs[0].len <= 2 &&
-		    msgs[1].len > 0 && msgs[1].len <= 8 &&
-		    msgs[0].addr == msgs[1].addr) {
-			if (msgs[1].flags & I2C_M_RD)
-				ret = octeon_i2c_hlc_comp_read(i2c, msgs);
-			else
-				ret = octeon_i2c_hlc_comp_write(i2c, msgs);
-			goto out;
+	if (IS_LS_FREQ(i2c->twsi_freq)) {
+		if (num == 1) {
+			if (msgs[0].len > 0 && msgs[0].len <= 8) {
+				if (msgs[0].flags & I2C_M_RD)
+					ret = octeon_i2c_hlc_read(i2c, msgs);
+				else
+					ret = octeon_i2c_hlc_write(i2c, msgs);
+				goto out;
+			}
+		} else if (num == 2) {
+			if ((msgs[0].flags & I2C_M_RD) == 0 &&
+			    (msgs[1].flags & I2C_M_RECV_LEN) == 0 &&
+			    msgs[0].len > 0 && msgs[0].len <= 2 &&
+			    msgs[1].len > 0 && msgs[1].len <= 8 &&
+			    msgs[0].addr == msgs[1].addr) {
+				if (msgs[1].flags & I2C_M_RD)
+					ret = octeon_i2c_hlc_comp_read(i2c, msgs);
+				else
+					ret = octeon_i2c_hlc_comp_write(i2c, msgs);
+				goto out;
+			}
 		}
 	}
 
@@ -664,12 +666,12 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 {
 	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
 	bool is_plat_otx2;
-	unsigned int mdiv_min = 2;
 	/*
 	 * Find divisors to produce target frequency, start with large delta
-	 * to cover wider range of divisors, note thp = TCLK half period.
+	 * to cover wider range of divisors, note thp = TCLK half period and
+	 * ds is OSCL output frequency divisor.
 	 */
-	unsigned int thp = TWSI_MASTER_CLK_REG_DEF_VAL, mdiv = 2, ndiv = 0;
+	unsigned int thp, mdiv_min, mdiv = 2, ndiv = 0, ds = 10;
 	unsigned int delta_hz = INITIAL_DELTA_HZ;
 
 	is_plat_otx2 = octeon_i2c_is_otx2(to_pci_dev(i2c->dev));
@@ -677,6 +679,11 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	if (is_plat_otx2) {
 		thp = TWSI_MASTER_CLK_REG_OTX2_VAL;
 		mdiv_min = 0;
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			ds = 15;
+	} else {
+		thp = TWSI_MASTER_CLK_REG_DEF_VAL;
+		mdiv_min = 2;
 	}
 
 	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
@@ -689,7 +696,7 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 			 * For given ndiv and mdiv values check the
 			 * two closest thp values.
 			 */
-			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
+			tclk = i2c->twsi_freq * (mdiv_idx + 1) * ds;
 			tclk *= (1 << ndiv_idx);
 			if (is_plat_otx2)
 				thp_base = (i2c->sys_freq / tclk) - 2;
@@ -707,7 +714,9 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 					foscl = i2c->sys_freq /
 						(2 * (thp_idx + 1));
 				foscl = foscl / (1 << ndiv_idx);
-				foscl = foscl / (mdiv_idx + 1) / 10;
+				foscl = foscl / (mdiv_idx + 1) / ds;
+				if (foscl > i2c->twsi_freq)
+					continue;
 				diff = abs(foscl - i2c->twsi_freq);
 				/*
 				 * Diff holds difference between calculated frequency
@@ -725,6 +734,17 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	}
 	octeon_i2c_reg_write(i2c, SW_TWSI_OP_TWSI_CLK, thp);
 	octeon_i2c_reg_write(i2c, SW_TWSI_EOP_TWSI_CLKCTL, (mdiv << 3) | ndiv);
+	if (is_plat_otx2) {
+		u64 mode;
+
+		mode = __raw_readq(i2c->twsi_base + OCTEON_REG_MODE(i2c));
+		/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			mode |= TWSX_MODE_HS_MASK;
+		else
+			mode &= ~TWSX_MODE_HS_MASK;
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + OCTEON_REG_MODE(i2c));
+	}
 }
 
 int octeon_i2c_init_lowlevel(struct octeon_i2c *i2c)
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 38140bf2f9e32ebb0b241ba1b73715dda8431f9a..883337d3ecb0d4a91117d2eb3fbe6e8edaf9e484 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -93,11 +93,18 @@ struct octeon_i2c_reg_offset {
 	unsigned int sw_twsi;
 	unsigned int twsi_int;
 	unsigned int sw_twsi_ext;
+	unsigned int mode;
 };
 
-#define SW_TWSI(x)	(x->roff.sw_twsi)
-#define TWSI_INT(x)	(x->roff.twsi_int)
-#define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
+#define OCTEON_REG_SW_TWSI(x)		((x)->roff.sw_twsi)
+#define OCTEON_REG_TWSI_INT(x)		((x)->roff.twsi_int)
+#define OCTEON_REG_SW_TWSI_EXT(x)	((x)->roff.sw_twsi_ext)
+#define OCTEON_REG_MODE(x)		((x)->roff.mode)
+
+/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+#define TWSX_MODE_REFCLK_SRC	BIT(4)
+#define TWSX_MODE_HS_MODE	BIT(0)
+#define TWSX_MODE_HS_MASK	(TWSX_MODE_REFCLK_SRC | TWSX_MODE_HS_MODE)
 
 struct octeon_i2c {
 	wait_queue_head_t queue;
@@ -135,16 +142,16 @@ static inline void octeon_i2c_writeq_flush(u64 val, void __iomem *addr)
  * @eop_reg: Register selector
  * @data: Value to be written
  *
- * The I2C core registers are accessed indirectly via the SW_TWSI CSR.
+ * The I2C core registers are accessed indirectly via the OCTEON_REG_SW_TWSI CSR.
  */
 static inline void octeon_i2c_reg_write(struct octeon_i2c *i2c, u64 eop_reg, u8 data)
 {
 	int tries = 1000;
 	u64 tmp;
 
-	__raw_writeq(SW_TWSI_V | eop_reg | data, i2c->twsi_base + SW_TWSI(i2c));
+	__raw_writeq(SW_TWSI_V | eop_reg | data, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	do {
-		tmp = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+		tmp = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 		if (--tries < 0)
 			return;
 	} while ((tmp & SW_TWSI_V) != 0);
@@ -170,9 +177,9 @@ static inline int octeon_i2c_reg_read(struct octeon_i2c *i2c, u64 eop_reg,
 	int tries = 1000;
 	u64 tmp;
 
-	__raw_writeq(SW_TWSI_V | eop_reg | SW_TWSI_R, i2c->twsi_base + SW_TWSI(i2c));
+	__raw_writeq(SW_TWSI_V | eop_reg | SW_TWSI_R, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	do {
-		tmp = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+		tmp = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 		if (--tries < 0) {
 			/* signal that the returned data is invalid */
 			if (error)
@@ -192,26 +199,27 @@ static inline int octeon_i2c_reg_read(struct octeon_i2c *i2c, u64 eop_reg,
 	octeon_i2c_reg_read(i2c, SW_TWSI_EOP_TWSI_STAT, NULL)
 
 /**
- * octeon_i2c_read_int - read the TWSI_INT register
+ * octeon_i2c_read_int - read the OCTEON_REG_TWSI_INT register
  * @i2c: The struct octeon_i2c
  *
  * Returns the value of the register.
  */
 static inline u64 octeon_i2c_read_int(struct octeon_i2c *i2c)
 {
-	return __raw_readq(i2c->twsi_base + TWSI_INT(i2c));
+	return __raw_readq(i2c->twsi_base + OCTEON_REG_TWSI_INT(i2c));
 }
 
 /**
- * octeon_i2c_write_int - write the TWSI_INT register
+ * octeon_i2c_write_int - write the OCTEON_REG_TWSI_INT register
  * @i2c: The struct octeon_i2c
  * @data: Value to be written
  */
 static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
 {
-	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
+	octeon_i2c_writeq_flush(data, i2c->twsi_base + OCTEON_REG_TWSI_INT(i2c));
 }
 
+#define IS_LS_FREQ(twsi_freq)	((twsi_freq) <= 400000)
 #define PCI_SUBSYS_DEVID_9XXX	0xB
 #define PCI_SUBSYS_MASK		GENMASK(15, 12)
 /**
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 75569774003857dc984e8540ef8f4d1bb084cfb0..31f11b77ab663626967c86086a03213876bf4a07 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -166,6 +166,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	i2c->roff.sw_twsi = 0x1000;
 	i2c->roff.twsi_int = 0x1010;
 	i2c->roff.sw_twsi_ext = 0x1018;
+	i2c->roff.mode = 0x1038;
 
 	i2c->dev = dev;
 	pci_set_drvdata(pdev, i2c);
@@ -210,7 +211,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	 * For OcteonTX2 chips, set reference frequency to 100MHz
 	 * as refclk_src in TWSI_MODE register defaults to 100MHz.
 	 */
-	if (octeon_i2c_is_otx2(pdev))
+	if (octeon_i2c_is_otx2(pdev) && IS_LS_FREQ(i2c->twsi_freq))
 		i2c->sys_freq = OTX2_REF_FREQ_DEFAULT;
 	octeon_i2c_set_clock(i2c);
 
-- 
2.43.0


