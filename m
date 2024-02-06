Return-Path: <linux-i2c+bounces-1637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46184B415
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 13:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 364A8B23B1D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9C713175D;
	Tue,  6 Feb 2024 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="LuS2IpRv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C564131E33;
	Tue,  6 Feb 2024 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219902; cv=none; b=BwuRn4RXzSLdfEi4vV6IphB7auZTIbJNXXHQ7vZGMT5CRyRYfzdsN1hOJqbQsr4jjmcy17DvePheeNqAuPHNljkWv1WCaPKIbH/oO42BInH+Q1SRoci4es1cnX4h5hINUO910I3lMXMYVfkD5dHQxXNfY9Im+UN0ozjqAs2ga4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219902; c=relaxed/simple;
	bh=g4n7QrSkD5h6OGYag/2Ky4TCrp8ytBA18eY+bA/8dMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5tFw4F1tz60h++2Adj/gkZnhpBoWwMHVtOIpqWkLkddp4Um6vSFyp8t+5a0IvoXdOUDAUNgVu9bxGnqP7Y9kBFWh1e6JEqgwgKObpRKBF5Q69eXUGuH7SxY2lu+2ukOwomhUsFWo7Ucjwts+cY99gxRooxFSx3fnqtdnx8Us8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=LuS2IpRv; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 416B2Acf024715;
	Tue, 6 Feb 2024 03:44:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=C/7FJMK/S8fhHx1QXDFcUQaidLGVGc2n44lkTILdK5Q=; b=LuS
	2IpRv/YxoC+UlbU3ovLOAR2H2MQMQ6SjD15RmV8ugSLUsZVNWhnJcsfyGp3IcdmB
	2Q+daThLqWKbovPBL2FTQcM+qjNGp2D4xaih7gcf55cCBUSOttWi4TcwKGZK7w8y
	cRnaO0UN0HxKPySSi4CvEAfJgnrg8n9Q/KLl/08FRRNF5abDGwxvx+0zO9anIeEl
	EsKnhnEwPxEbt+4+uVr5nE6kOj49uvJtI5eFc0TfHfy5bV8n/7D0wY9CSuybcsIr
	J74X8tbxJFI1+M5VG2Da+hB2+X94ruUPtB3vfZQIA2zyVLjdMpG3QNDy04ZeLLuK
	H78U+Rfo8zfuQXGY8Vw==
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3w38y4hyyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 03:44:58 -0800 (PST)
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 6 Feb
 2024 03:44:56 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Tue, 6 Feb 2024 03:44:56 -0800
Received: from localhost.localdomain (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 7F7E43F7085;
	Tue,  6 Feb 2024 03:44:56 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v3 2/4] i2c: thunderx: Add support for High speed mode
Date: Tue, 6 Feb 2024 03:43:47 -0800
Message-ID: <20240206114349.32197-3-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240206114349.32197-1-pmalgujar@marvell.com>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WAPG1hkwoFCKqmxo-Z3ENI_PpV6LpfS9
X-Proofpoint-GUID: WAPG1hkwoFCKqmxo-Z3ENI_PpV6LpfS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02

From: Suneel Garapati <sgarapati@marvell.com>

Support High speed mode clock setup for OcteonTX2 platforms.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 61 +++++++++++++++---------
 drivers/i2c/busses/i2c-octeon-core.h     |  6 +++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  3 +-
 3 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 1d8e1f4ad859dc44c08629637530842a0ed50bc4..6636719ca8f005056230620e2cee19de7154e024 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -608,25 +608,27 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
 
@@ -666,11 +668,13 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	 * Find divisors to produce target frequency, start with large delta
 	 * to cover wider range of divisors, note thp = TCLK half period.
 	 */
-	unsigned int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
+	unsigned int ds = 10, thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
 
 	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
 		thp = 0x3;
 		mdiv_min = 0;
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			ds = 15;
 	}
 
 	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
@@ -683,7 +687,7 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 			 * For given ndiv and mdiv values check the
 			 * two closest thp values.
 			 */
-			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
+			tclk = i2c->twsi_freq * (mdiv_idx + 1) * ds;
 			tclk *= (1 << ndiv_idx);
 			if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
 				thp_base = (i2c->sys_freq / tclk) - 2;
@@ -701,7 +705,9 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 					foscl = i2c->sys_freq /
 						(2 * (thp_idx + 1));
 				foscl = foscl / (1 << ndiv_idx);
-				foscl = foscl / (mdiv_idx + 1) / 10;
+				foscl = foscl / (mdiv_idx + 1) / ds;
+				if (foscl > i2c->twsi_freq)
+					continue;
 				diff = abs(foscl - i2c->twsi_freq);
 				/* Use it if smaller diff from target */
 				if (diff < delta_hz) {
@@ -715,6 +721,17 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	}
 	octeon_i2c_reg_write(i2c, SW_TWSI_OP_TWSI_CLK, thp);
 	octeon_i2c_reg_write(i2c, SW_TWSI_EOP_TWSI_CLKCTL, (mdiv << 3) | ndiv);
+	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
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
index 694c24cecb7b144c1021549d1661b040c21bb998..e89f041550ace5f7cbcdd94146d0193abe51d466 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -93,14 +93,19 @@ struct octeon_i2c_reg_offset {
 	unsigned int sw_twsi;
 	unsigned int twsi_int;
 	unsigned int sw_twsi_ext;
+	unsigned int mode;
 };
 
 #define SW_TWSI(x)	(x->roff.sw_twsi)
 #define TWSI_INT(x)	(x->roff.twsi_int)
 #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
+#define MODE(x)		(x->roff.mode)
 
 #define INITIAL_DELTA_HZ	1000000
 
+/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+#define TWSX_MODE_HS_MASK	(BIT(4) | BIT(0))
+
 struct octeon_i2c {
 	wait_queue_head_t queue;
 	struct i2c_adapter adap;
@@ -214,6 +219,7 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
 	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
 }
 
+#define IS_LS_FREQ(twsi_freq) ((twsi_freq) <= 400000)
 #define PCI_SUBSYS_DEVID_9XXX 0xB
 /**
  * octeon_i2c_is_otx2 - check for chip ID
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
2.42.0


