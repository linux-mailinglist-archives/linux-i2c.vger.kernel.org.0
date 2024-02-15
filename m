Return-Path: <linux-i2c+bounces-1798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B0857042
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EAF71C21D03
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BFB150998;
	Thu, 15 Feb 2024 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TjZ6KKlE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D58414A4C1;
	Thu, 15 Feb 2024 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034916; cv=none; b=QW/cdZYrD+PjAU9MrDu8B0Ykk7bnt9RCUWWuEywE0iPHXWbV94dihxPPude2S/gbaXtcwtPw1EEEL24ajqVksJ+um5xHMbLVc7umgRXVawab+qc/JNCBIHiWhcTCcCGl7KGKcl+LSmcVzgWRsARBuZbbYdLQYc1iduJ8Hy68WhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034916; c=relaxed/simple;
	bh=B6y6B9hxIpjalSu4scT5stwo1nniyRvVqX9pFP5A6O0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8WJV3twDb3eZZwYHyYUlwoUvBWLGoEmoh/slpElzh8qZAywaF/UIfP8wnibmc0aIM/6/LnZn8b5pIw5MUXYGR6zZvf5m/kP06LeNedEdLAWIKanIgdNCDjn33c+jhFJm2a98jxAmRfWvfI2G+JZMgBIZOxtz3aJTjahOYJVYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TjZ6KKlE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLV5IF028067;
	Thu, 15 Feb 2024 22:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nC6nQKgwIVNRNF/ysirTWFmoYra4yeqE06hfgRfw7Bw=;
 b=TjZ6KKlEUNNd/JLjA5jRMWbNh+gIIw/09DtVrHv1b3xZ1GngHrebVRPjfyogbdqO77h/
 IQT7LFpA9E/+CJ3wi/WxNUVchna98OuZ240BBfK6KEr+VBciZ+/esGGxOul5ybkNHw1Q
 /LXgvZjTaefmEhoFiCBy4//GxpFgO+Fq+KtudvEe21il1XMFBY8niGptj7t7YlQDRGc6
 kqq38ffq0EFm1EIsw2fi+oXsr/nUdJ57Mbu1EboxCVEXFCyNehIXEMEIfNEIDXqUx4rI
 gSDykn2fl8GJGFpuIwAjMvRKynVD22YvzYGNdWZpsvHumqhISsmAjJOrF4ofilyxaFSA rw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q8n597e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJlBEd016517;
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mymyhc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM86nM35782988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F00758077;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3948E5807B;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 13/33] fsi: core: Add common regmap master functions
Date: Thu, 15 Feb 2024 16:07:39 -0600
Message-Id: <20240215220759.976998-14-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T7DeW3ZIPTcxULpAgB0Xn3S3Tcr74UPr
X-Proofpoint-ORIG-GUID: T7DeW3ZIPTcxULpAgB0Xn3S3Tcr74UPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

For hardware FSI masters (Aspeed and hub at the moment), the
initialization, link enable, and error recovery procedures are
common. Add a regmap pointer to the master structure so that master
drivers can let the common code handle these procedures.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/Kconfig        |   2 +
 drivers/fsi/fsi-core.c     | 161 ++++++++++++++++++++++++++++++++++++-
 drivers/fsi/fsi-master.h   |  16 ++++
 include/trace/events/fsi.h |  17 ++++
 4 files changed, 194 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 79a31593618a..a6760870538d 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -7,6 +7,7 @@ menuconfig FSI
 	tristate "FSI support"
 	depends on OF
 	select CRC4
+	select REGMAP
 	help
 	  FSI - the FRU Support Interface - is a simple bus for low-level
 	  access to POWER-based hardware.
@@ -37,6 +38,7 @@ config FSI_MASTER_GPIO
 
 config FSI_MASTER_HUB
 	tristate "FSI hub master"
+	select REGMAP_FSI
 	help
 	This option enables a FSI hub master driver.  Hub is a type of FSI
 	master that is connected to the upstream master via a slave.  Hubs
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 95f6ce81f8f4..693e7c51b4af 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/cdev.h>
@@ -1148,18 +1149,50 @@ static int fsi_master_write(struct fsi_master *master, int link,
 	return rc;
 }
 
+int fsi_master_link_enable(struct fsi_master *master, int link, bool enable)
+{
+	u32 msiep = 0x80000000 >> (4 * (link % 8));
+	u32 menp = 0x80000000 >> (link % 32);
+	int enable_idx = 4 * (link / 32);
+	int irq_idx = 4 * (link / 8);
+	int rc;
+
+	if (enable) {
+		rc = regmap_write(master->map, FSI_MSENP0 + enable_idx, menp);
+		if (rc)
+			return rc;
+
+		mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+		rc = regmap_write(master->map, FSI_MSSIEP0 + irq_idx, msiep);
+	} else {
+		rc = regmap_write(master->map, FSI_MCSIEP0 + irq_idx, msiep);
+		if (rc)
+			return rc;
+
+		rc = regmap_write(master->map, FSI_MCENP0 + enable_idx, menp);
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(fsi_master_link_enable);
+
 static int fsi_master_link_disable(struct fsi_master *master, int link)
 {
 	if (master->link_enable)
 		return master->link_enable(master, link, false);
+	else if (master->map)
+		return fsi_master_link_enable(master, link, false);
 
 	return 0;
 }
 
-static int fsi_master_link_enable(struct fsi_master *master, int link)
+static int _fsi_master_link_enable(struct fsi_master *master, int link)
 {
 	if (master->link_enable)
 		return master->link_enable(master, link, true);
+	else if (master->map)
+		return fsi_master_link_enable(master, link, true);
 
 	return 0;
 }
@@ -1187,7 +1220,7 @@ static int fsi_master_scan(struct fsi_master *master)
 
 	trace_fsi_master_scan(master, true);
 	for (link = 0; link < master->n_links; link++) {
-		rc = fsi_master_link_enable(master, link);
+		rc = _fsi_master_link_enable(master, link);
 		if (rc) {
 			dev_dbg(&master->dev,
 				"enable link %d failed: %d\n", link, rc);
@@ -1284,6 +1317,130 @@ static struct class fsi_master_class = {
 	.dev_groups = master_groups,
 };
 
+void fsi_master_error(struct fsi_master *master, int link)
+{
+	u32 bits = FSI_MMODE_EIP | FSI_MMODE_RELA;
+	bool mmode = master->mmode & bits;
+
+	if (trace_fsi_master_error_regs_enabled()) {
+		unsigned int mesrb = 0xffffffff;
+		unsigned int mstap = 0xffffffff;
+
+		regmap_read(master->map, FSI_MESRB0, &mesrb);
+		regmap_read(master->map, FSI_MSTAP0 + (link * 4), &mstap);
+
+		trace_fsi_master_error_regs(master->idx, mesrb, mstap);
+	}
+
+	if (mmode)
+		regmap_write(master->map, FSI_MMODE, master->mmode & ~bits);
+
+	regmap_write(master->map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER);
+
+	if (mmode)
+		regmap_write(master->map, FSI_MMODE, master->mmode);
+}
+EXPORT_SYMBOL_GPL(fsi_master_error);
+
+static inline u32 fsi_mmode_crs0(u32 x)
+{
+	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
+}
+
+static inline u32 fsi_mmode_crs1(u32 x)
+{
+	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
+}
+
+int fsi_master_init(struct fsi_master *master, unsigned long parent_clock_frequency)
+{
+	unsigned int mlevp;
+	unsigned int maeb;
+	int div = 1;
+	int rc;
+
+	if (parent_clock_frequency) {
+		u32 clock_frequency = parent_clock_frequency;
+
+		if (!device_property_read_u32(&master->dev, "clock-frequency", &clock_frequency)) {
+			if (!clock_frequency)
+				clock_frequency = parent_clock_frequency;
+		}
+
+		div = (parent_clock_frequency + (clock_frequency - 1)) / clock_frequency;
+		master->clock_frequency = parent_clock_frequency / div;
+	}
+
+	rc = regmap_write(master->map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER |
+			  FSI_MRESP_RST_ALL_LINK | FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(master->map, FSI_MECTRL, FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
+	if (rc)
+		return rc;
+
+	master->mmode = FSI_MMODE_ECRC | FSI_MMODE_EPC | fsi_mmode_crs0(div) |
+		fsi_mmode_crs1(div) | FSI_MMODE_P8_TO_LSB;
+	rc = regmap_write(master->map, FSI_MMODE, master->mmode);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(master->map, FSI_MDLYR, 0xffff0000);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(master->map, FSI_MSENP0, 0xffffffff);
+	if (rc)
+		return rc;
+
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+	rc = regmap_write(master->map, FSI_MCENP0, 0xffffffff);
+	if (rc)
+		return rc;
+
+	rc = regmap_read(master->map, FSI_MAEB, &maeb);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(master->map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER |
+			  FSI_MRESP_RST_ALL_LINK);
+	if (rc)
+		return rc;
+
+	rc = regmap_read(master->map, FSI_MLEVP0, &mlevp);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(master->map, FSI_MRESB0, FSI_MRESB_RST_GEN);
+	if (rc)
+		return rc;
+
+	rc = regmap_write(master->map, FSI_MRESB0, FSI_MRESB_RST_ERR);
+	if (rc)
+		return rc;
+
+	if (master->flags & FSI_MASTER_FLAG_INTERRUPT)
+		master->mmode |= FSI_MMODE_EIP;
+	if (master->flags & FSI_MASTER_FLAG_RELA)
+		master->mmode |= FSI_MMODE_RELA;
+	return regmap_write(master->map, FSI_MMODE, master->mmode);
+}
+EXPORT_SYMBOL_GPL(fsi_master_init);
+
+void fsi_master_regmap_config(struct regmap_config *config)
+{
+	config->reg_bits = 32;
+	config->val_bits = 32;
+	config->disable_locking = true;	// master driver will lock
+	config->fast_io = true;
+	config->cache_type = REGCACHE_NONE;
+	config->val_format_endian = REGMAP_ENDIAN_NATIVE;
+	config->can_sleep = false;
+}
+EXPORT_SYMBOL_GPL(fsi_master_regmap_config);
+
 int fsi_master_register(struct fsi_master *master)
 {
 	int rc;
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 26e636ad9ef6..f4cecdff3834 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -27,6 +27,9 @@
 #define FSI_MLEVP0		0x18		/* R: plug detect */
 #define FSI_MSENP0		0x18		/* S: Set enable */
 #define FSI_MCENP0		0x20		/* C: Clear enable */
+#define FSI_MSIEP0		0x30		/* R/W: interrupt enable */
+#define FSI_MSSIEP0		0x50		/* S: Set interrupt enable */
+#define FSI_MCSIEP0		0x70		/* C: Clear interrupt enable */
 #define FSI_MAEB		0x70		/* R: Error address */
 #define FSI_MVER		0x74		/* R: master version/type */
 #define FSI_MSTAP0		0xd0		/* R: Port status */
@@ -108,9 +111,15 @@
 
 /* Misc */
 #define	FSI_CRC_SIZE		4
+#define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
 /* fsi-master definition and flags */
 #define FSI_MASTER_FLAG_SWCLOCK		0x1
+#define FSI_MASTER_FLAG_INTERRUPT	0x2
+#define FSI_MASTER_FLAG_RELA		0x4
+
+struct regmap;
+struct regmap_config;
 
 /*
  * Structures and function prototypes
@@ -120,6 +129,8 @@
 
 struct fsi_master {
 	struct device	dev;
+	struct regmap	*map;
+	u32		mmode;
 	unsigned long	clock_frequency;
 	int		lbus_divider;
 	int		idx;
@@ -140,6 +151,11 @@ struct fsi_master {
 
 #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
 
+void fsi_master_error(struct fsi_master *master, int link);
+int fsi_master_init(struct fsi_master *master, unsigned long parent_clock_frequency);
+int fsi_master_link_enable(struct fsi_master *master, int link, bool enable);
+void fsi_master_regmap_config(struct regmap_config *config);
+
 /**
  * fsi_master registration & lifetime: the fsi_master_register() and
  * fsi_master_unregister() functions will take ownership of the master, and
diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
index 5509afc98ee8..da977d59e163 100644
--- a/include/trace/events/fsi.h
+++ b/include/trace/events/fsi.h
@@ -67,6 +67,23 @@ TRACE_EVENT(fsi_master_error,
 		  &__entry->data, __entry->ret)
 );
 
+TRACE_EVENT(fsi_master_error_regs,
+	TP_PROTO(int master_idx, uint32_t mesrb, uint32_t mstap),
+	TP_ARGS(master_idx, mesrb, mstap),
+	TP_STRUCT__entry(
+		__field(int, master_idx)
+		__field(uint32_t, mesrb)
+		__field(uint32_t, mstap)
+	),
+	TP_fast_assign(
+		__entry->master_idx = master_idx;
+		__entry->mesrb = mesrb;
+		__entry->mstap = mstap;
+	),
+	TP_printk("fsi%d mesrb:%08x mstap:%08x", __entry->master_idx, __entry->mesrb,
+		  __entry->mstap)
+);
+
 TRACE_EVENT(fsi_master_break,
 	TP_PROTO(const struct fsi_master *master, int link),
 	TP_ARGS(master, link),
-- 
2.39.3


