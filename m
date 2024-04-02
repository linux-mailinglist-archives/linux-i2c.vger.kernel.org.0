Return-Path: <linux-i2c+bounces-2723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1989558B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 15:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE75A1C21636
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 13:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DAB83CD5;
	Tue,  2 Apr 2024 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="V4PohgOI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4309463;
	Tue,  2 Apr 2024 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065237; cv=none; b=VtEsGC/fWTTilubsY0kGSHJY0hlNodRr6lkcu5zrOYVbx1vg1Ra/xhXe7URic9O0O1c1blmroSjzRERPntiRNXtmgtLyEYBAfBskZvN09VXggn83MttM5p82jGolY6Arih29PgtDodzpaGMaDUveb4sJJwiR6Yu5ma7ODGuhKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065237; c=relaxed/simple;
	bh=O4I7PnUrQ4yKzKJJoqB42JrYaglC3t0N7VGuEuP7EvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EqN5wCwNHoBtHrXDFseTaRm8rpfzx/JUeUDcEmCcX12AJKReCS+AYrs0dqYWBDIlpBZE69I9idniDDFjhRhxstgoHj2gefsGo1PyP2rVh0WC0zY1opy4HZYT4uJfswnMvyOafT6lNCH9dyFa6dsfBY3UcyRqpp/QoDFr2USn1Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=V4PohgOI; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43240qcL016915;
	Tue, 2 Apr 2024 06:40:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=tg85wy9gKnkj+wZNeONRKHtdHs+hZhP285GqdLuMH7Y=; b=V4P
	ohgOI4kuBt2KprI7IUVKPQHZ8ySTSFqCl3M/vhfr+Llrw8XU/1rEXNnPJyd8Q8j7
	FkLNKZ2RA69t/ZowRFv2104B0q2hExjMt4MYvJk65AbBalqsz68O/0YHgFL/bmgP
	idzf3npQrTyR9Ncs8jw/OqxtQQiVuQILWsfcACQpkKo01wkZXmlOkVNZeNzP9fNX
	kBnnG/sZNhXJ6flS3iuqx0P3R8eUy3yOon7RFNngYf81o9ZbS0PTnhPZuGlYpxxw
	/n4VJ/xaIfvNGSVmUEXAqQHtj4b8r1AJnERTl5t9wM4YRLAwKJnQ5/RuCjBoIRfM
	2Xt2FKS0mIbUTOgRR/g==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3x809fun57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 06:40:30 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 06:40:29 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 2 Apr 2024 06:40:29 -0700
Received: from Dell2s-9.sclab.marvell.com (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id 256683F706D;
	Tue,  2 Apr 2024 06:40:29 -0700 (PDT)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v6 1/4] i2c: thunderx: Clock divisor logic changes
Date: Tue, 2 Apr 2024 06:40:11 -0700
Message-ID: <20240402134018.2686919-2-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402134018.2686919-1-pmalgujar@marvell.com>
References: <20240402134018.2686919-1-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nVQJG2NqbAsFgURhvlucfQcjRIwwNJ3m
X-Proofpoint-ORIG-GUID: nVQJG2NqbAsFgURhvlucfQcjRIwwNJ3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02

From: Suneel Garapati <sgarapati@marvell.com>

Handle changes to clock divisor logic for OcteonTX2 SoC family using
subsystem ID and using default reference clock source as 100MHz.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 39 +++++++++++++++++++++---
 drivers/i2c/busses/i2c-octeon-core.h     | 17 +++++++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  7 +++++
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 845eda70b8cab52a0453c9f4cb545010fba4305d..75efb375d8e49479267e214772d4df48352be358 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -17,9 +17,14 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 
 #include "i2c-octeon-core.h"
 
+#define INITIAL_DELTA_HZ		1000000
+#define TWSI_MASTER_CLK_REG_DEF_VAL	0x18
+#define TWSI_MASTER_CLK_REG_OTX2_VAL	0x3
+
 /* interrupt service routine */
 irqreturn_t octeon_i2c_isr(int irq, void *dev_id)
 {
@@ -658,31 +663,57 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 {
 	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
-	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = 1000000;
+	bool is_plat_otx2;
+	unsigned int mdiv_min = 2;
+	/*
+	 * Find divisors to produce target frequency, start with large delta
+	 * to cover wider range of divisors, note thp = TCLK half period.
+	 */
+	unsigned int thp = TWSI_MASTER_CLK_REG_DEF_VAL, mdiv = 2, ndiv = 0;
+	unsigned int delta_hz = INITIAL_DELTA_HZ;
+
+	is_plat_otx2 = octeon_i2c_is_otx2(to_pci_dev(i2c->dev));
+
+	if (is_plat_otx2) {
+		thp = TWSI_MASTER_CLK_REG_OTX2_VAL;
+		mdiv_min = 0;
+	}
 
 	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
 		/*
 		 * An mdiv value of less than 2 seems to not work well
 		 * with ds1337 RTCs, so we constrain it to larger values.
 		 */
-		for (mdiv_idx = 15; mdiv_idx >= 2 && delta_hz != 0; mdiv_idx--) {
+		for (mdiv_idx = 15; mdiv_idx >= mdiv_min && delta_hz != 0; mdiv_idx--) {
 			/*
 			 * For given ndiv and mdiv values check the
 			 * two closest thp values.
 			 */
 			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
 			tclk *= (1 << ndiv_idx);
-			thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
+			if (is_plat_otx2)
+				thp_base = (i2c->sys_freq / tclk) - 2;
+			else
+				thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
 
 			for (inc = 0; inc <= 1; inc++) {
 				thp_idx = thp_base + inc;
 				if (thp_idx < 5 || thp_idx > 0xff)
 					continue;
 
-				foscl = i2c->sys_freq / (2 * (thp_idx + 1));
+				if (is_plat_otx2)
+					foscl = i2c->sys_freq / (thp_idx + 2);
+				else
+					foscl = i2c->sys_freq /
+						(2 * (thp_idx + 1));
 				foscl = foscl / (1 << ndiv_idx);
 				foscl = foscl / (mdiv_idx + 1) / 10;
 				diff = abs(foscl - i2c->twsi_freq);
+				/*
+				 * Diff holds difference between calculated frequency
+				 * value vs desired frequency.
+				 * Delta_hz is updated with last minimum diff.
+				 */
 				if (diff < delta_hz) {
 					delta_hz = diff;
 					thp = thp_idx;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 9bb9f64fdda0392364638ecbaafe3fab5612baf6..69bd62940f99eb786877026380cd1d02a4eaadb9 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/atomic.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -7,6 +8,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/pci.h>
 
 /* Controller command patterns */
 #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
@@ -211,6 +213,21 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
 	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
 }
 
+#define PCI_SUBSYS_DEVID_9XXX	0xB
+#define PCI_SUBSYS_MASK		GENMASK(15, 12)
+/**
+ * octeon_i2c_is_otx2 - check for chip ID
+ * @pdev: PCI dev structure
+ *
+ * Returns true if the device is an OcteonTX2, false otherwise.
+ */
+static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev)
+{
+	u32 chip_id = FIELD_GET(PCI_SUBSYS_MASK, pdev->subsystem_device);
+
+	return (chip_id == PCI_SUBSYS_DEVID_9XXX);
+}
+
 /* Prototypes */
 irqreturn_t octeon_i2c_isr(int irq, void *dev_id);
 int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index a77cd86fe75ed7401bc041b27c651b9fedf67285..75569774003857dc984e8540ef8f4d1bb084cfb0 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -28,6 +28,7 @@
 #define PCI_DEVICE_ID_THUNDER_TWSI	0xa012
 
 #define SYS_FREQ_DEFAULT		700000000
+#define OTX2_REF_FREQ_DEFAULT		100000000
 
 #define TWSI_INT_ENA_W1C		0x1028
 #define TWSI_INT_ENA_W1S		0x1030
@@ -205,6 +206,12 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	if (ret)
 		goto error;
 
+	/*
+	 * For OcteonTX2 chips, set reference frequency to 100MHz
+	 * as refclk_src in TWSI_MODE register defaults to 100MHz.
+	 */
+	if (octeon_i2c_is_otx2(pdev))
+		i2c->sys_freq = OTX2_REF_FREQ_DEFAULT;
 	octeon_i2c_set_clock(i2c);
 
 	i2c->adap = thunderx_i2c_ops;
-- 
2.43.0


