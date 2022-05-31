Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670E8538CA8
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 10:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244832AbiEaIVE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 04:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244886AbiEaIVA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 04:21:00 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5824E980B1;
        Tue, 31 May 2022 01:20:56 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24ULPn32014522;
        Tue, 31 May 2022 01:20:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pfpt0220;
 bh=rr23qW5dZEJ991XM9xThrXeWgmUmY9cQy0IAfXk1qyg=;
 b=R1SHy1uAwx6tau8ZkuJ9DPXShxg9gyQODodDopAG474oqzaJLrOyPvlakiviC+A8kPGQ
 FcpU3SEzUmCBkqq3vGCYP4ID4RV8ZS1QF3y6ZvvLjJsJNRLDcV/esGvYFVIqg2oSaO43
 wpPIkaBDEwJvfaB4/Tsi5Y/7v7ZnorBbMwdH2fLH8ZyRyot+DcPwY3WRR+NDzwrzP8jt
 DwW0VDi8NkK8cnhj4pg6CijRidIuB7AKsZ5HrQPiz3MXvLq0wCXccA09hvC72gtnGD98
 70/FCZWCp9C/MyW1jKeJ4ex4pV914SzEf7JAXIvBLe4FLKFWRKjyKgKA3WziJTiP35EY ug== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3gbk8n8cch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 31 May 2022 01:20:53 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 May
 2022 01:20:50 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 May 2022 01:20:50 -0700
Received: from localhost.localdomain (unknown [10.110.150.250])
        by maili.marvell.com (Postfix) with ESMTP id DABCB3F704B;
        Tue, 31 May 2022 01:20:50 -0700 (PDT)
From:   Piyush Malgujar <pmalgujar@marvell.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <rric@kernel.org>, <wsa@kernel.org>, <sgarapati@marvell.com>,
        <cchavva@marvell.com>, Piyush Malgujar <pmalgujar@marvell.com>
Subject: [PATCH v2 2/2] drivers: i2c: thunderx: Add support for High speed mode
Date:   Tue, 31 May 2022 01:19:34 -0700
Message-ID: <20220531081934.29238-3-pmalgujar@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220531081934.29238-1-pmalgujar@marvell.com>
References: <20220531081934.29238-1-pmalgujar@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mWDPWHopwqPApIVh4negQ3sOFmRzcdhC
X-Proofpoint-GUID: mWDPWHopwqPApIVh4negQ3sOFmRzcdhC
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

Support High speed mode clock setup for OcteonTX2 platforms.

Signed-off-by: Suneel Garapati <sgarapati@marvell.com>
Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 64 +++++++++++++++---------
 drivers/i2c/busses/i2c-octeon-core.h     |  3 ++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |  3 +-
 3 files changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 49d07a63a01f0b0711f4fa7a5d13d684935e5cbc..1588d9186b198bfe6ae78626829b3f221d51b8d9 100644
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
 
@@ -665,10 +667,13 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 	 * Find divisors to produce target frequency, start with large delta
 	 * to cover wider range of divisors, note thp = TCLK half period.
 	 */
-	int thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
+	int ds = 10, thp = 0x18, mdiv = 2, ndiv = 0, delta_hz = huge_delta;
 
-	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
+	if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev))) {
 		thp = 0x3;
+		if (!IS_LS_FREQ(i2c->twsi_freq))
+			ds = 15;
+	}
 
 	for (ndiv_idx = 0; ndiv_idx < 8 && delta_hz != 0; ndiv_idx++) {
 		/*
@@ -680,7 +685,7 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
 			 * For given ndiv and mdiv values check the
 			 * two closest thp values.
 			 */
-			tclk = i2c->twsi_freq * (mdiv_idx + 1) * 10;
+			tclk = i2c->twsi_freq * (mdiv_idx + 1) * ds;
 			tclk *= (1 << ndiv_idx);
 			if (octeon_i2c_is_otx2(to_pci_dev(i2c->dev)))
 				thp_base = (i2c->sys_freq / tclk) - 2;
@@ -698,7 +703,9 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
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
@@ -712,6 +719,17 @@ void octeon_i2c_set_clock(struct octeon_i2c *i2c)
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

