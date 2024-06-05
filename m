Return-Path: <linux-i2c+bounces-3848-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 224418FD880
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84ADE1F22837
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FB9161B52;
	Wed,  5 Jun 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="p9s/NhgB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C6E15FA9C;
	Wed,  5 Jun 2024 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622620; cv=none; b=lyUOKtCqz+E+8u1C6eooItkX9WR7K8inRhEGtDgT3ADn5bmzRtscO5EWpjgEKrl4x4G4ubVEyfo2OZaTtIWi5Py9BB7Gx0MtoD7IQdFJusixcBqF1hMMDt+/EE8Axq8HBHM/2LGb2yfxnC2FNPt2MgmTvpz+WOYIwy78oX7prDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622620; c=relaxed/simple;
	bh=B0CdS5kElvMVR1I4RMssK8hzoJSvEEEupBSIlboCebc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eDtj7n49xYa6zlCAYnVw2jdRPCjscLztl8K230dYBvGMkATV103UIMkQP6hNmu+OWFF3Vc+kvbdz+HzPvsCJA91hOFZeSkygMMEn1BlYwyCSAXMTHXqy6xelt0IgxEmJqxzYMN2RU+YPIAY7tqNsn5TFxUG1uHardBtdK43+0ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=p9s/NhgB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LE8uk012465;
	Wed, 5 Jun 2024 21:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=Wgrp9mSZpxfDhxFWWnfZxUxl4xHvgw/nBvDHfI2klKI=;
 b=p9s/NhgB2Zb0NT+dnQnHnoZhfgHdS2t1vs5jIds80DaIEsotF1tmA+Q7K021rk/76hd5
 FUBqGRH4J/UVhK+ErGbFPqbY4SXtMtVkGN8Ti0LkJXfeKkbt/ubAQIvralIJAr1R2ws6
 qREvgWx6/E1JaC0rZ2Kbi/SpNC3NwNpsS0idopobUyWPNVcP/5j/9hGMktljbUBEiy/X
 URI7B9dgbC6PaMHrQBXWCEMIEt8VsUJou1oCN9yKjQW8YKLiLaUcHe0tMgkEiiaxs7Yd
 pg51EzFT9QkRQLLK1lHf8d6XmTo+ZuzP4BSAPkrgkywvLH2m/5SeHNU+T298WZy0NI0t Aw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyr080rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455KFxdv022791;
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygg6med3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:17 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNFgY26215122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A6DF58059;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFA075805D;
	Wed,  5 Jun 2024 21:23:14 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:14 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 05/40] fsi: Calculate local bus clock frequency
Date: Wed,  5 Jun 2024 16:22:37 -0500
Message-Id: <20240605212312.349188-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tz4SFMVi367gKr_BaxpCBPbnRW3r8nbS
X-Proofpoint-ORIG-GUID: Tz4SFMVi367gKr_BaxpCBPbnRW3r8nbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

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


