Return-Path: <linux-i2c+bounces-3054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BBE8ADE81
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3FE81C222CC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 07:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6548347A74;
	Tue, 23 Apr 2024 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="M3yPsnOD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915375102F;
	Tue, 23 Apr 2024 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713858407; cv=none; b=DVpXP9sDJtjgFWsT8zFCvR8hENthaV2AEQsZ6EsayfjogZ4Gvd387mI3QuqRRSUx37Abb4o1GnWGNbXl8kuGx+nqF+IrpfapRGjOxQBb5nh+M3WmgnYYnjuSQyspq5n2ulE2fhFNagpIK+NfYsMZ+HnHNDwKaqMeamzgnd0VICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713858407; c=relaxed/simple;
	bh=C28kU71cjvmxzvWuy+MPBYOMhhG5OyH8opbSZO472nU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i0nMEPMv8QEy6y9jrIhoNiXDcveJ/AbaOnBuKkS02oMS908sbNdumr05AcYMEceUQ4RUTmKg9H5ZALI3yYUdy1jpVFTFavHEhZ7bCSi/7kRiub6xQz7JvL/MXuNCUYBELJzp2q80aYRQvZ8nP8awoQV5x6yg10PvLxfeaE+wyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=M3yPsnOD; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5c1Je017553;
	Tue, 23 Apr 2024 00:46:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	pfpt0220; bh=JKgc/+UaHzFkFBC2/8RlAVEs0SkP8BXuKLlOkKLBEuM=; b=M3y
	PsnODmUHPsZfgQlGUYeJ+2LE+PgL1A8V27xxM5yE+OIOAnQXr1XRSXLM+6OzF4yH
	3OrgVXrcNKGEU2azOpH7oi+CUkZcz088wvH9qF3XidDWxmB6XLKppiyxzBagljY6
	82iUAuyycZJHzPzBPwDjfuY9OZ01RKXk4A+cS4DyF4Cb1z4yZSvEqfjq+0NHPCUL
	WQE6CYqjuO9f4kdH20gwJYo7A0aW+2cCOAN72md2WrTfz4h8bDf1B7TVaPxoKa6A
	nWYUZj6lV4WNzCdhhXwIZLtz3+XAbBmHc2IkDfb5ePFX1dwvKI8ROiquLD938C6S
	OAX9aYZ+fFPsG/yBISA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3xmd7gg83m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 00:46:39 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 23 Apr 2024 00:46:38 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 23 Apr 2024 00:46:38 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 22A713F7051;
	Tue, 23 Apr 2024 00:46:38 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v7 2/5] i2c: thunderx: Support for High speed mode
Date: Tue, 23 Apr 2024 00:46:05 -0700
Message-ID: <20240423074618.3278609-3-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423074618.3278609-1-pmalgujar@marvell.com>
References: <20240423074618.3278609-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jroGQQuKje9k23iZxoqVXN4PRV8wk6A-
X-Proofpoint-GUID: jroGQQuKje9k23iZxoqVXN4PRV8wk6A-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_04,2024-04-22_01,2023-05-22_02

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
 drivers/i2c/busses/i2c-octeon-core.c     | 68 +++++++++++++++---------
 drivers/i2c/busses/i2c-octeon-core.h     |  8 +++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  3 +-
 3 files changed, 54 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 75efb375d8e49479267e214772d4df48352be358..86be597866f81c1bce54563047e14d099743f593 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
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
+		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			mode |= TWSX_MODE_HS_MASK;
+		else
+			mode &= ~TWSX_MODE_HS_MASK;
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+	}
 }
 
 int octeon_i2c_init_lowlevel(struct octeon_i2c *i2c)
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 69bd62940f99eb786877026380cd1d02a4eaadb9..94c4401a4a567c3bbe15ddb219bcb1a4fcb751bf 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -94,11 +94,18 @@ struct octeon_i2c_reg_offset {
 	unsigned int sw_twsi;
 	unsigned int twsi_int;
 	unsigned int sw_twsi_ext;
+	unsigned int mode;
 };
 
 #define SW_TWSI(x)	(x->roff.sw_twsi)
 #define TWSI_INT(x)	(x->roff.twsi_int)
 #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
+#define MODE(x)		((x)->roff.mode)
+
+/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+#define TWSX_MODE_REFCLK_SRC	BIT(4)
+#define TWSX_MODE_HS_MODE	BIT(0)
+#define TWSX_MODE_HS_MASK	(TWSX_MODE_REFCLK_SRC | TWSX_MODE_HS_MODE)
 
 struct octeon_i2c {
 	wait_queue_head_t queue;
@@ -213,6 +220,7 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
 	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
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


