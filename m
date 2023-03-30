Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75936D0724
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 15:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjC3Nnl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 09:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjC3Nnc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 09:43:32 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA30C143;
        Thu, 30 Mar 2023 06:43:23 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UDAlfp014499;
        Thu, 30 Mar 2023 06:43:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=igFSrGhqRX8iWs6tf11H1rqPYle1i6Jji98Fd+QZRA8=;
 b=B3RdYZp/XBcb5GO8LOkOlYeTK/i1jE84TjOBYkhAxUKU6o9tnyYXpLo8Ijm8157gnm82
 S7DcpnmKeUrWqa0a2ZVHW62Jja8lnMsLzupNlHFZNlvaXz3hlv6be3Rdh0Hos5KqqS2I
 wm6+WSJd09nRHoHvTr0+uQEnnzZP4R4+Bir8Pt6dCc0hKRhqo9rXgJhUy9TY3ANNBl+z
 5aCdRXQMJHCZhreY3Od3W9Qphv+DCv/7pYzxwgqzSoPEvKx1NrzdZPKVfnTTQYdDGSLs
 rOdajWoUvEpBYDTE+s91LO1wC+3q7UwOj55hJcjMbfz+PWb4h4Qbm0IlfcIGN48vhLu5 2Q== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3pn2ty2nvq-11
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 30 Mar 2023 06:43:20 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 30 Mar
 2023 06:40:26 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 30 Mar 2023 06:40:25 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id DB85F3F704A;
        Thu, 30 Mar 2023 06:40:25 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>, <rric@kernel.org>
CC:     <jannadurai@marvell.com>, <cchavva@marvell.com>,
        Suneel Garapati <sgarapati@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH 1/3] i2c: thunderx: Clock divisor logic changes
Date:   Thu, 30 Mar 2023 06:39:51 -0700
Message-ID: <20230330133953.21074-2-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330133953.21074-1-pmalgujar@marvell.com>
References: <20230330133953.21074-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dfDfPFFKH7tN6h7L9r6DizhTM7dfuWbX
X-Proofpoint-ORIG-GUID: dfDfPFFKH7tN6h7L9r6DizhTM7dfuWbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Suneel Garapati <sgarapati@marvell.com>

Handle changes to clock divisor logic for OcteonTX2 SoC family using
subsystem ID and using default reference clock source as 100MHz.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 29 ++++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     | 15 ++++++++++++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  6 +++++
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 845eda70b8cab52a0453c9f4cb545010fba4305d..dfd58bbec47b1f0554ae0c100c680b6ba9be61ec 100644
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
+	const int huge_delta = 1000000;
+	/*
+	 * Find divisors to produce target frequency, start with large delta
+	 * to cover wider range of divisors, note thp = TCLK half period.
+	 */
+	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
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

