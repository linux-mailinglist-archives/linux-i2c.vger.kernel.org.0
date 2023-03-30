Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A08A6D0728
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 15:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbjC3Nnm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 09:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjC3Nnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 09:43:33 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEEEBDD5;
        Thu, 30 Mar 2023 06:43:25 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UDAlft014499;
        Thu, 30 Mar 2023 06:43:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=WlBWc0WvmdUB+duMbK1s8vpVWPj7G4Dqho4AHs2Pg4c=;
 b=fgj5so1Zv0JpUtJO+F2Q8TBpVIFa7NltvC1TkePu2MjYpYsWtuBlLIaHalq4q2DdgZSr
 qi5ikzC43Ty20wZyj0jOu2Gpv9Ny1ONf6x0j8forCCpVsCOQyQGPMlJhMQ+Ku9SlbSaR
 D9wA5+QDtsOb7hjmR+bXlVLTJcvfDviC3grOneQUvp6yU1vEvYchrq36JCno3zvY1zZO
 kO0jrHAlHsFp9vYFdGStaSQ3fLMsewbBVvwtEfecMAjodMd8xWvYt4njuwU55wDRpBmR
 yDjzhX26qJFaEmbY7AZtKaoHC2rc59fRhV/6Wiu+k09EzgII7ofktcKsy/sGb8mOoTiq Gg== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3pn2ty2nw9-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 30 Mar 2023 06:43:22 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 30 Mar
 2023 06:40:38 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 30 Mar 2023 06:40:38 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id 502C93F704A;
        Thu, 30 Mar 2023 06:40:38 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>, <rric@kernel.org>
CC:     <jannadurai@marvell.com>, <cchavva@marvell.com>,
        Suneel Garapati <sgarapati@marvell.com>,
        Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH 2/3] i2c: thunderx: Add support for High speed mode
Date:   Thu, 30 Mar 2023 06:39:52 -0700
Message-ID: <20230330133953.21074-3-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330133953.21074-1-pmalgujar@marvell.com>
References: <20230330133953.21074-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: p0XX1zR1KU1kLDc40tQKlVv6n4MvkkUE
X-Proofpoint-ORIG-GUID: p0XX1zR1KU1kLDc40tQKlVv6n4MvkkUE
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

Support High speed mode clock setup for OcteonTX2 platforms.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 78 ++++++++++++++++--------
 drivers/i2c/busses/i2c-octeon-core.h     |  3 +
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  3 +-
 3 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index dfd58bbec47b1f0554ae0c100c680b6ba9be61ec..7c49dc8ccbd2ef05fec675d282193b98f2b69835 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -61,10 +61,19 @@ static int octeon_i2c_wait(struct octeon_i2c *i2c)
 		return octeon_i2c_test_iflg(i2c) ? 0 : -ETIMEDOUT;
 	}
 
-	i2c->int_enable(i2c);
-	time_left = wait_event_timeout(i2c->queue, octeon_i2c_test_iflg(i2c),
-				       i2c->adap.timeout);
-	i2c->int_disable(i2c);
+	if (IS_LS_FREQ(i2c->twsi_freq)) {
+		i2c->int_enable(i2c);
+		time_left = wait_event_timeout(i2c->queue,
+					       octeon_i2c_test_iflg(i2c),
+					       i2c->adap.timeout);
+		i2c->int_disable(i2c);
+	} else {
+		time_left = 1000; /* 1ms */
+		do {
+			if (time_left--)
+				__udelay(1);
+		} while (!octeon_i2c_test_iflg(i2c) && time_left);
+	}
 
 	if (i2c->broken_irq_check && !time_left &&
 	    octeon_i2c_test_iflg(i2c)) {
@@ -608,25 +617,27 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
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
 
@@ -666,11 +677,13 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	 * Find divisors to produce target frequency, start with large delta
 	 * to cover wider range of divisors, note thp = TCLK half period.
 	 */
-	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
+	int ds = 10, thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
 
 	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
 		thp = 0x3;
 		mdiv_min = 0;
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			ds = 15;
 	}
 
 	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
@@ -683,7 +696,7 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 			 * For given ndiv and mdiv values check the
 			 * two closest thp values.
 			 */
-			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
+			tclk = i2c->twsi_freq * (mdiv_idx + 1) * ds;
 			tclk *= (1 << ndiv_idx);
 			if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
 				thp_base = (i2c->sys_freq / tclk) - 2;
@@ -701,7 +714,9 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
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
@@ -715,6 +730,17 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	}
 	octeon_i2c_reg_write(i2c, SW_TWSI_OP_TWSI_CLK, thp);
 	octeon_i2c_reg_write(i2c, SW_TWSI_EOP_TWSI_CLKCTL, (mdiv << 3) | ndiv);
+	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
+		u64 mode;
+
+		mode = __raw_readq(i2c->twsi_base + MODE(i2c));
+		/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			mode |= BIT(4) | BIT(0);
+		else
+			mode &= ~(BIT(4) | BIT(0));
+		octeon_i2c_writeq_flush(mode, i2c->twsi_base + MODE(i2c));
+	}
 }
 
 int octeon_i2c_init_lowlevel(struct octeon_i2c *i2c)
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2c-octeon-core.h
index 8a0033c94a8a291fb255b0da03858274035c46f4..89d7d3bb8e30bd5787978d17d5a9b20ab0d41e22 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -93,11 +93,13 @@ struct octeon_i2c_reg_offset {
 	unsigned int sw_twsi;
 	unsigned int twsi_int;
 	unsigned int sw_twsi_ext;
+	unsigned int mode;
 };
 
 #define SW_TWSI(x)	(x->roff.sw_twsi)
 #define TWSI_INT(x)	(x->roff.twsi_int)
 #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
+#define MODE(x)		(x->roff.mode)
 
 struct octeon_i2c {
 	wait_queue_head_t queue;
@@ -212,6 +214,7 @@ static inline void octeon_i2c_write_int(struct octeon_i2c *i2c, u64 data)
 	octeon_i2c_writeq_flush(data, i2c->twsi_base + TWSI_INT(i2c));
 }
 
+#define IS_LS_FREQ(twsi_freq) ((twsi_freq) <= 400000)
 #define PCI_SUBSYS_DEVID_9XXX 0xB
 /**
  * octeon_i2c_is_otx2 - check for chip ID
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index eecd27f9f1730e522dcccafc9f12ea891a3b59ef..3dd5a4d798f99e9b5282360cf9d5840042fc8dcc 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -165,6 +165,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	i2c->roff.sw_twsi = 0x1000;
 	i2c->roff.twsi_int = 0x1010;
 	i2c->roff.sw_twsi_ext = 0x1018;
+	i2c->roff.mode = 0x1038;
 
 	i2c->dev = dev;
 	pci_set_drvdata(pdev, i2c);
@@ -209,7 +210,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	 * For OcteonTX2 chips, set reference frequency to 100MHz
 	 * as refclk_src in TWSI_MODE register defaults to 100MHz.
 	 */
-	if (octeon_i2c_is_otx2(pdev))
+	if (octeon_i2c_is_otx2(pdev) && IS_LS_FREQ(i2c->twsi_freq))
 		i2c->sys_freq = 100000000;
 	octeon_i2c_set_clock(i2c);
 
-- 
2.17.1

