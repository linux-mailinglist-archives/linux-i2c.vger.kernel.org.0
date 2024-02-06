Return-Path: <linux-i2c+bounces-1636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB6C84B413
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 12:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284DD1F25408
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 11:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA588130E49;
	Tue,  6 Feb 2024 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Jdfw+7WA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5721130E48;
	Tue,  6 Feb 2024 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219894; cv=none; b=aAwYib4W82WNh2KmNSjy8r5ZsWycrEi2IC4PHlRcjGk0kd1yO63ijdSDGJ0YsoE6zLt61WeFvzlWgP8Wrqsve6mQ8W7Dx4LQzeQE3b2IlGHgezO94xZs28lUug/XgaQDvMlHeadX1UP/be3Nyr+/NDtL+tBP0iIulYrjq2KPnQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219894; c=relaxed/simple;
	bh=HmzDG0AiV7w0OKL7BZvlkkqTDKXM+dijNSIJal0cpS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tX9hEETKt3buDQKMWW+0Mc1l1QB8UciZXK+hGlw4ukAv1GOoxWr326L9s+AfmajjDYHy0Zjw0ZCoZUQMAQCzDEV3Vx2udD9SVA+0xtOWKrzmLisV3InVYtAxbiFfQF0mwHd6IICMOgnDVBETdlonmcVD4VKuY0G1H6wQVqrABfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Jdfw+7WA; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415Mr1BV028264;
	Tue, 6 Feb 2024 03:44:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=B5mI7VIbKym+fTTfsiZYmoPh7jPpg7En2bzpHJh3tJg=; b=Jdf
	w+7WAb966YGVnnuwV5vKw2doqOyvVl4oiIRYyC9rspnztM0SBH+zqsLh58rhy/8d
	8gBZuBf78fcW54x0KmeDR6OxPKFhEiiZ8+muMybmS9xMe8dfqT3bkMd/Omk/TXzo
	+TALnKkA6OQDzd/KTpfow2dBG4KlUaSuz3vIU95NkbkeZYSWUcI/q0N1aeD7imwD
	7BOpiTwHSfTNXX3iWtm8kG8poN/UndD/Jvv8Id5Wk7CTTcOaNyqK9CuNMlJxPJU5
	KXauLfSN8OZlun+mGC320FZm5MNFawxZp9LnOubyAAM1m8NE7H+jmtYZLVcnZgCA
	Jnb6OH6q/dPekPaElrw==
Received: from dc5-exch02.marvell.com ([199.233.59.182])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3w38u81xur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 03:44:49 -0800 (PST)
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 6 Feb
 2024 03:44:47 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Tue, 6 Feb 2024 03:44:47 -0800
Received: from localhost.localdomain (unknown [10.110.150.250])
	by maili.marvell.com (Postfix) with ESMTP id EECB73F7041;
	Tue,  6 Feb 2024 03:44:46 -0800 (PST)
From: Piyush Malgujar <pmalgujar@marvell.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <sgarapati@marvell.com>, <cchavva@marvell.com>, <jannadurai@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v3 1/4] i2c: thunderx: Clock divisor logic changes
Date: Tue, 6 Feb 2024 03:43:46 -0800
Message-ID: <20240206114349.32197-2-pmalgujar@marvell.com>
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
X-Proofpoint-ORIG-GUID: rCvXaKtdDjjl3MF5DsDteJp67qwfC4VN
X-Proofpoint-GUID: rCvXaKtdDjjl3MF5DsDteJp67qwfC4VN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02

From: Suneel Garapati <sgarapati@marvell.com>

Handle changes to clock divisor logic for OcteonTX2 SoC family using
subsystem ID and using default reference clock source as 100MHz.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
---
 MAINTAINERS                              |  1 +
 drivers/i2c/busses/i2c-octeon-core.c     | 29 ++++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     | 17 ++++++++++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  7 ++++++
 4 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 960512bec42885c0f1632a7c90851c3d32fbf20e..92b0a55c36e41cf54c7cbf52576d5424b591aa31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4725,6 +4725,7 @@ F:	drivers/net/wireless/ath/carl9170/
 
 CAVIUM I2C DRIVER
 M:	Robert Richter <rric@kernel.org>
+M:	Suneel Garapati <sgarapati@marvell.com>
 S:	Odd Fixes
 W:	http://www.marvell.com
 F:	drivers/i2c/busses/i2c-octeon*
diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 845eda70b8cab52a0453c9f4cb545010fba4305d..1d8e1f4ad859dc44c08629637530842a0ed50bc4 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 
 #include "i2c-octeon-core.h"
 
@@ -658,31 +659,51 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 {
 	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
-	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = 1000000;
+	int mdiv_min = 2;
+	/* starting value on search for lowest diff */
+	const int huge_delta = INITIAL_DELTA_HZ;
+	/*
+	 * Find divisors to produce target frequency, start with large delta
+	 * to cover wider range of divisors, note thp = TCLK half period.
+	 */
+	unsigned int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
+
+	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
+		thp = 0x3;
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
+			if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
+				thp_base = (i2c->sys_freq / tclk) - 2;
+			else
+				thp_base = (i2c->sys_freq / (tclk * 2)) - 1;
 
 			for (inc = 0; inc <= 1; inc++) {
 				thp_idx = thp_base + inc;
 				if (thp_idx < 5 || thp_idx > 0xff)
 					continue;
 
-				foscl = i2c->sys_freq / (2 * (thp_idx + 1));
+				if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
+					foscl = i2c->sys_freq / (thp_idx + 2);
+				else
+					foscl = i2c->sys_freq /
+						(2 * (thp_idx + 1));
 				foscl = foscl / (1 << ndiv_idx);
 				foscl = foscl / (mdiv_idx + 1) / 10;
 				diff = abs(foscl - i2c->twsi_freq);
+				/* Use it if smaller diff from target */
 				if (diff < delta_hz) {
 					delta_hz = diff;
 					thp = thp_idx;
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 9bb9f64fdda0392364638ecbaafe3fab5612baf6..694c24cecb7b144c1021549d1661b040c21bb998 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -7,6 +7,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/pci.h>
 
 /* Controller command patterns */
 #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
@@ -98,6 +99,8 @@ struct octeon_i2c_reg_offset {
 #define TWSI_INT(x)	(x->roff.twsi_int)
 #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
 
+#define INITIAL_DELTA_HZ	1000000
+
 struct octeon_i2c {
 	wait_queue_head_t queue;
 	struct i2c_adapter adap;
@@ -211,6 +214,20 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
 	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
 }
 
+#define PCI_SUBSYS_DEVID_9XXX 0xB
+/**
+ * octeon_i2c_is_otx2 - check for chip ID
+ * @pdev: PCI dev structure
+ *
+ * Returns TRUE if OcteonTX2, FALSE otherwise.
+ */
+static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev)
+{
+	u32 chip_id = (pdev->subsystem_device >> 12) & 0xF;
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
2.42.0


