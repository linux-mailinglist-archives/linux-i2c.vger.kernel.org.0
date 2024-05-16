Return-Path: <linux-i2c+bounces-3517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EF8C7BF7
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CD8DB22C5C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A69158202;
	Thu, 16 May 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pxEPVioM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47397157480;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883574; cv=none; b=sml10tRZWuLsEgEY40Lf/RBvst35C0w3H484JxCMT921vn8vlDsw1VYQGrTdGsEwtvKA9lMLbzrbL9nLZNJXaX8IQQ2+xIhRihzCXGvmuM4np8JKiJTIw1Hts/Z0Ir5E2eL/4/b0QESY8cI32HrKfp/tNmBiAQUjW2ZSoKtWKlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883574; c=relaxed/simple;
	bh=B0CdS5kElvMVR1I4RMssK8hzoJSvEEEupBSIlboCebc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VP9vO1pJ9cqNVV4qysjOb1pJuVtykiRyTmU8V29Z1xC7LpaqfKtVMPIkv/eUH0GHUIBRgD6gL5Tx771s/H6rv7jhGX2i2O49AmLHXLXGBXMT1hzvTPkdtnozKuHy7R4SwnzD6Ocdo7VU0UFVROJOAxq3Gv/0Eih1aTeKEXj7rBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pxEPVioM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI9XIt019715;
	Thu, 16 May 2024 18:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wgrp9mSZpxfDhxFWWnfZxUxl4xHvgw/nBvDHfI2klKI=;
 b=pxEPVioMDRil1pCqVMq7lC6ZNfwhpvjkslzhWpMcZefyDcZDOFNOTlY3JxuXuZ0w9cE5
 eeggip1/PRNgeh4vS1FibfA2UNz8RUoVGpHT0bEWYrcWBgYQmvKdzB7op1yvUtuC/EYl
 DNB3cMKZvEu+RVjygJkhxFPBTKUJYyOZ55XXyB91Q98qIxCD/mKS06FmLirb59v7DRh4
 ika9Y10Vm/o8935PcalWKfSud240yep/1Jg84DBdx2D8GRSLrOAq8IXFbmDIclCOqXVK
 25J/1afLdOKKiTO6zKMuFa1+x491p17u0w9ptYzajW+CQ3VLAWJbonjtEVESOKVo0HDy 7A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q5980mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:12 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GH0GoI018828;
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJ9pw57409906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CB8158084;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0E2B58088;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:08 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 05/40] fsi: Calculate local bus clock frequency
Date: Thu, 16 May 2024 13:18:32 -0500
Message-Id: <20240516181907.3468796-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pe6chPvis694aZ-ghQ3j2i0LNtrROURo
X-Proofpoint-ORIG-GUID: Pe6chPvis694aZ-ghQ3j2i0LNtrROURo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Instead of a hardcoded local bus clock divider, calculate the responder
local bus frequency from the FSI bus frequency.  This will allow FSI
engine drivers to set and calculate their bus (I2C, SPI, etc) frequencies.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Use cfam clock-frequency property instead of hardcoded master local bus
   divider
 - Change default local bus clock divider from 8 to 2

 drivers/fsi/fsi-core.c   | 22 +++++++++++++++++++---
 drivers/fsi/fsi-master.h |  1 +
 drivers/fsi/fsi-slave.h  |  2 ++
 include/linux/fsi.h      |  1 +
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 27235583183e5..44875f2350b04 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -109,6 +109,12 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
 }
 
+unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev)
+{
+	return dev->slave->master->clock_frequency / dev->slave->clock_div;
+}
+EXPORT_SYMBOL_GPL(fsi_device_local_bus_frequency);
+
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
@@ -209,12 +215,12 @@ static inline uint32_t fsi_smode_sid(int x)
 	return (x & FSI_SMODE_SID_MASK) << FSI_SMODE_SID_SHIFT;
 }
 
-static uint32_t fsi_slave_smode(int id, u8 t_senddly, u8 t_echodly)
+static uint32_t fsi_slave_smode(int id, int div, u8 t_senddly, u8 t_echodly)
 {
 	return FSI_SMODE_WSC | FSI_SMODE_ECRC
 		| fsi_smode_sid(id)
 		| fsi_smode_echodly(t_echodly - 1) | fsi_smode_senddly(t_senddly - 1)
-		| fsi_smode_lbcrr(0x8);
+		| fsi_smode_lbcrr(div - 1);
 }
 
 static int fsi_slave_set_smode(struct fsi_slave *slave, uint8_t id)
@@ -225,7 +231,8 @@ static int fsi_slave_set_smode(struct fsi_slave *slave, uint8_t id)
 	/* set our smode register with the slave ID field to 0; this enables
 	 * extended slave addressing
 	 */
-	smode = fsi_slave_smode(slave->id, slave->t_send_delay, slave->t_echo_delay);
+	smode = fsi_slave_smode(slave->id, slave->clock_div, slave->t_send_delay,
+				slave->t_echo_delay);
 	data = cpu_to_be32(smode);
 
 	return fsi_master_write(slave->master, slave->link, id, FSI_SLAVE_BASE + FSI_SMODE,
@@ -950,6 +957,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	struct fsi_slave *slave;
 	uint8_t crc;
 	__be32 data, llmode, slbus;
+	u32 clock;
 	int rc;
 
 	/* Currently, we only support single slaves on a link, and use the
@@ -1003,6 +1011,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	slave->dev.of_node = fsi_slave_find_of_node(master, link, id);
 	slave->dev.release = fsi_slave_release;
 	device_initialize(&slave->dev);
+	slave->clock_div = FSI_SMODE_LBCRR_DEFAULT;
 	slave->cfam_id = cfam_id;
 	slave->master = master;
 	slave->link = link;
@@ -1020,6 +1029,10 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	}
 
+	if (master->clock_frequency && !device_property_read_u32(&slave->dev, "clock-frequency",
+								 &clock) && clock)
+		slave->clock_div = DIV_ROUND_UP(master->clock_frequency, clock);
+
 	slbus = cpu_to_be32(FSI_SLBUS_FORCE);
 	rc = fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SLBUS,
 			      &slbus, sizeof(slbus));
@@ -1289,6 +1302,9 @@ int fsi_master_register(struct fsi_master *master)
 	if (!dev_name(&master->dev))
 		dev_set_name(&master->dev, "fsi%d", master->idx);
 
+	if (master->flags & FSI_MASTER_FLAG_SWCLOCK)
+		master->clock_frequency = 100000000; // POWER reference clock
+
 	master->dev.class = &fsi_master_class;
 
 	mutex_lock(&master->scan_lock);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index a0d7ad0f0f7cc..ff23983ea84c8 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -121,6 +121,7 @@
 
 struct fsi_master {
 	struct device	dev;
+	unsigned long	clock_frequency;
 	int		idx;
 	int		n_links;
 	int		flags;
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 45190b06fa027..fabc0b66d5bf3 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -48,6 +48,7 @@
 #define FSI_SMODE_SD_DEFAULT	 16		/* Default send delay */
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+#define FSI_SMODE_LBCRR_DEFAULT	 2		/* Default clk ratio */
 
 /*
  * SISS fields
@@ -104,6 +105,7 @@ struct fsi_slave {
 	int			id;	/* FSI address */
 	int			link;	/* FSI link# */
 	u32			cfam_id;
+	u32			clock_div;
 	int			chip_id;
 	uint32_t		size;	/* size of slave address space */
 	u8			t_send_delay;
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 3df8c54868df5..e0309bf0ae072 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -24,6 +24,7 @@ extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
 extern int fsi_device_write(struct fsi_device *dev, uint32_t addr,
 		const void *val, size_t size);
 extern int fsi_device_peek(struct fsi_device *dev, void *val);
+extern unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev);
 
 struct fsi_device_id {
 	u8	engine_type;
-- 
2.39.3


