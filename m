Return-Path: <linux-i2c+bounces-3055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1B8ADE83
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57FCC284747
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 07:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8A647A76;
	Tue, 23 Apr 2024 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="RViE9OBn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BA481B7;
	Tue, 23 Apr 2024 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713858410; cv=none; b=pPP7AMvO2k6sBguluawUVGgznWAikvinQ3b24Ht6BsynPRZjtRK3VBRkIHBepUq/aU95Ac5Eg7vITTa/xvHIg51XIN280v8Zx8iSDm2Mdv58yo6w7V+y5kZ5r//gJ0xT9lvug2w6zfp+QvV+7A6BqO6k2G1Wao8hzjxGDNXRDoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713858410; c=relaxed/simple;
	bh=DfuLPtimc+FTbqtrwg0edoLuFfteFlg/XCAeGA04M/s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKRCZYioMUlFvb90dUCzqd5KSM/UiLBXQpf9ZChfe2+PLerL2M0YznOFhKbEEf5uQnJRZ1mYFJfc+1SCR+ii07dFUEWKyjv4c4HJtlrR/YYQfYosWHC4mHx6VpDRSQ9CAfi/doPLmA7Z47Lr+BiL+Fa4KWcsH9IjJl0NY75t7LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=RViE9OBn; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N5bmwl016941;
	Tue, 23 Apr 2024 00:46:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=rxa1ZFjWzEyYtAAvy6cqeLXLrONIRjBnKukl5JS68MQ=; b=RVi
	E9OBnC3IXA4ElFzmsyL6vYj8EgFe7LEZKdvFXxm4r4VZaxHrHAwSJ4bHxqFMIX0W
	9fS7wsOtwhxjwT2DyBvydN53FB/gOBAAJPwfAa6VP/L3mbVuhMvvN+FZ9zYvBc1o
	++C+qOd5F8gWNxAAnzbfso+LeGtz26d9mcFWa+8jxtVy22PsJxdCVvK/pDBTFEZf
	cRdk//laK3Ad8IAeYN6jQV1reC1GE7mhw/bwSYLMDBUee0ij3eDy+vpTRr1X6GOU
	9ORaP33eMLMecX/1ULs36jKMOwBziKwn4/vvizxB2xCLrUeGwobcfmlmU/laeYod
	tode/iG3bCfOnCKoHBQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3xmd7gg83q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 00:46:45 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 23 Apr 2024 00:46:43 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 23 Apr 2024 00:46:43 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 8321D3F7051;
	Tue, 23 Apr 2024 00:46:43 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v7 3/5] i2c: octeon: Add platform prefix to macros
Date: Tue, 23 Apr 2024 00:46:06 -0700
Message-ID: <20240423074618.3278609-4-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423074618.3278609-1-pmalgujar@marvell.com>
References: <20240423074618.3278609-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: in0PuS3VnhcOZRurVuCcPfL3CNCb2i5d
X-Proofpoint-GUID: in0PuS3VnhcOZRurVuCcPfL3CNCb2i5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_04,2024-04-22_01,2023-05-22_02

The macros for TWSI register's offset are generically
named, rename them to be platform specific macros by
adding 'OCTEON_REG' as prefix.

Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c | 36 ++++++++++++++--------------
 drivers/i2c/busses/i2c-octeon-core.h | 26 ++++++++++----------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 86be597866f81c1bce54563047e14d099743f593..76a5ec100d3039b840ba28ae7a817da447923d4f 100644
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
 
@@ -737,13 +737,13 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	if (is_plat_otx2) {
 		u64 mode;
 
-		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		mode = __raw_readq(i2c->twsi_base + OCTEON_REG_MODE(i2c));
 		/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
 		if (!IS_LS_FREQ(i2c->twsi_freq))
 			mode |= TWSX_MODE_HS_MASK;
 		else
 			mode &= ~TWSX_MODE_HS_MASK;
-		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + OCTEON_REG_MODE(i2c));
 	}
 }
 
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 94c4401a4a567c3bbe15ddb219bcb1a4fcb751bf..39481e23e36fad098cf72dfd764e368e778f2840 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -97,10 +97,10 @@ struct octeon_i2c_reg_offset {
 	unsigned int mode;
 };
 
-#define SW_TWSI(x)	(x->roff.sw_twsi)
-#define TWSI_INT(x)	(x->roff.twsi_int)
-#define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
-#define MODE(x)		((x)->roff.mode)
+#define OCTEON_REG_SW_TWSI(x)		((x)->roff.sw_twsi)
+#define OCTEON_REG_TWSI_INT(x)		((x)->roff.twsi_int)
+#define OCTEON_REG_SW_TWSI_EXT(x)	((x)->roff.sw_twsi_ext)
+#define OCTEON_REG_MODE(x)		((x)->roff.mode)
 
 /* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
 #define TWSX_MODE_REFCLK_SRC	BIT(4)
@@ -143,16 +143,16 @@ static inline void octeon_i2c_writeq_flush(u64 val, void __iomem *addr)
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
@@ -178,9 +178,9 @@ static inline int octeon_i2c_reg_read(struct octeon_i2c *i2c, u64 eop_reg,
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
@@ -200,24 +200,24 @@ static inline int octeon_i2c_reg_read(struct octeon_i2c *i2c, u64 eop_reg,
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
 
 #define IS_LS_FREQ(twsi_freq)	((twsi_freq) <= 400000)
-- 
2.43.0


