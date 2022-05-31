Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4A2538CB1
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 10:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244854AbiEaIUv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 04:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244797AbiEaIUr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 04:20:47 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3C295DDA;
        Tue, 31 May 2022 01:20:42 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24UMvrnd006745;
        Tue, 31 May 2022 01:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=qRX5fdV7HmgTmQCqHjMmGiFsplcFMaLKiyjwfiVrcek=;
 b=jtjcE9cgdmcHN4LSiTFrzVQuUfuMzDdNFrRiqVzWAOigbchG5bW5/sidLTYFLuA62NOZ
 AuLP6iep1D31FP/XDmROJyMhwUr8lEOQt0YNfLnhsNVKOiU2ClMAAj4/hG8OrYwE/0Ny
 TVymrWk49vcyxc3AAjgCWr03+eVlatrQS4poPCif+MF9+5bnI8a6G5w/R6t28P1JYyj4
 8WxoGRxsXGs3baORNhBKdjqXhU97YmidkLa+kdNYq2b+4PLEQGVFZ0uRQeKqNpCkowTA
 wpHjsjoJkVNw6MeAr0kZNveM5PdvdJxqrcn46NQpjm2kWQnVXuf+POiGOYlgRwRkPL3e Rw== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3gbk8n8cbu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 31 May 2022 01:20:39 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 31 May
 2022 01:20:37 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 31 May 2022 01:20:37 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 58F183F704B;
        Tue, 31 May 2022 01:20:37 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rric@kernel.org>, <wsa@kernel.org>, <sgarapati@marvell.com>,
        <cchavva@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v2 1/2] drivers: i2c: thunderx: octeontx2 clock divisor logic changes
Date:   Tue, 31 May 2022 01:19:33 -0700
Message-ID: <20220531081934.29238-2-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220531081934.29238-1-pmalgujar@marvell.com>
References: <20220531081934.29238-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NRqUvOgJdEhqhtScOBUWgdbOIQn_0zLb
X-Proofpoint-GUID: NRqUvOgJdEhqhtScOBUWgdbOIQn_0zLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_02,2022-05-30_03,2022-02-23_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Handle changes to clock divisor logic for OcteonTX2 SoC family using
subsystem ID and using default reference clock source as 100MHz.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 24 +++++++++++++++++++++---
 drivers/i2c/busses/i2c-octeon-core.h     | 15 +++++++++++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  6 ++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 845eda70b8cab52a0453c9f4cb545010fba4305d..49d07a63a01f0b0711f4fa7a5d13d684935e5cbc 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 
 #include "i2c-octeon-core.h"
 
@@ -658,7 +659,16 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 {
 	int tclk, thp_base, inc, thp_idx, mdiv_idx, ndiv_idx, foscl, diff;
-	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = 1000000;
+	/* starting value on search for lowest diff */
+	const int huge_delta = 1000000;
+	/*
+	 * Find divisors to produce target frequency, start with large delta
+	 * to cover wider range of divisors, note thp = TCLK half period.
+	 */
+	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
+
+	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
+		thp = 0x3;
 
 	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
 		/*
@@ -672,17 +682,25 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
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
index 9bb9f64fdda0392364638ecbaafe3fab5612baf6..8a0033c94a8a291fb255b0da03858274035c46f4 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -7,6 +7,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/pci.h>
 
 /* Controller command patterns */
 #define SW_TWSI_V		BIT_ULL(63)	/* Valid bit */
@@ -211,6 +212,20 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
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
index a77cd86fe75ed7401bc041b27c651b9fedf67285..eecd27f9f1730e522dcccafc9f12ea891a3b59ef 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -205,6 +205,12 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	if (ret)
 		goto error;
 
+	/*
+	 * For OcteonTX2 chips, set reference frequency to 100MHz
+	 * as refclk_src in TWSI_MODE register defaults to 100MHz.
+	 */
+	if (octeon_i2c_is_otx2(pdev))
+		i2c->sys_freq = 100000000;
 	octeon_i2c_set_clock(i2c);
 
 	i2c->adap = thunderx_i2c_ops;
-- 
2.17.1

