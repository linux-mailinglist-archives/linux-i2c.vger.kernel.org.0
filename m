Return-Path: <linux-i2c+bounces-1799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69385704B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EF62B24D36
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FCD152E1F;
	Thu, 15 Feb 2024 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fj8zNQvb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E01509A0;
	Thu, 15 Feb 2024 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034919; cv=none; b=K62LukkKdtnVSeH0NSFr0ejNrzJ031t6RSFfRtXqi6Q2Xm0J/9DLfdGv5BSQwoIZIOHtoGjY+Qsze8LQhqbMp6bEdsEUapRPlA7bBy24qKEEsBYn5CjaGTuNlSDk1qgyFi/KNdDbTAi+Z5p5PnChs5bHexs9H/T7M8NoRYZY9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034919; c=relaxed/simple;
	bh=bDDSQ59Hx/k13de0sfVOys3VHSzqY9HF+wtdkABTdf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lWrOia8KfMeDj4OPjgT1yX0t22pVH57fFpDQDA7m0Vsyl90A6ujJPMq84hCLI8b743I7ajtwp/6lYmqnodJCDZ/ZQmoKJMNhiKXDxtZ0XaS6YfmI1c8wL9nsbyHSuS7an5ngku/UfRCYcAAxXq+dhDUx4PMFqd6PCcJxAGk/UaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fj8zNQvb; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLX2Vu019347;
	Thu, 15 Feb 2024 22:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SZMmT6FmPBWoUrdH2eDLCNYypdqIO9JdHa/iodwva98=;
 b=fj8zNQvbBlLZIXMo7bRzv/YrgL/RhBRVGviVCft2IfWqRS7UGEg1ooqYM4Zf2R+DzEwH
 qrTv6GhM0pdUF7miBABbjw7v1ZhtrhnmWMWeP8jbIE/QGKnpdw4u39C01tqi55nhd/Ir
 lRlqw54jiTC8BbZJP2cdtL0hcEox3YMagqKhvdJg6SsxG/mWY5qFBbdR2tiYUdX690Kf
 O4A39ycQmnARIccKaOzAjNLvGiXPMhb1Bb8zFpqLzvEweN4bAwQB8uuFecV2yhHRIeMV
 xdhv8qmHEqUxs7TEWl0K4oZU7IjGuL5j2/AgXsmPqsXlox5EU4NkzFPpjks6bee4gXmT Yw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9tmf8mwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:07 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJBGLo004329;
	Thu, 15 Feb 2024 22:08:06 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0qtm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM847M56361402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:06 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BE5D5807D;
	Thu, 15 Feb 2024 22:08:04 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C432E5807B;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:03 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 06/33] fsi: Expose master-specific local bus clock divider
Date: Thu, 15 Feb 2024 16:07:32 -0600
Message-Id: <20240215220759.976998-7-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: zxHsSbRPAxHVdAHvp4zPvqaJAxwuxL6y
X-Proofpoint-ORIG-GUID: zxHsSbRPAxHVdAHvp4zPvqaJAxwuxL6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

Instead of a hardcoded local bus clock divider, allow master drivers
to select their local bus clock divider. Also expose master clock
frequencies in the structure. This will allow FSI engine drivers
to set and calculate their bus (I2C, SPI, etc) frequencies.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c       | 27 ++++++++++++++++++++-------
 drivers/fsi/fsi-master-hub.c |  1 +
 drivers/fsi/fsi-master.h     |  2 ++
 drivers/fsi/fsi-slave.h      |  1 +
 include/linux/fsi.h          |  1 +
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8823e8e56dab..9610b5948550 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -109,6 +109,12 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 	return fsi_slave_read(dev->slave, addr, val, sizeof(uint32_t));
 }
 
+unsigned long fsi_device_local_bus_frequency(struct fsi_device *dev)
+{
+	return dev->slave->master->clock_frequency / dev->slave->master->lbus_divider;
+}
+EXPORT_SYMBOL_GPL(fsi_device_local_bus_frequency);
+
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
@@ -209,15 +215,15 @@ static inline uint32_t fsi_smode_sid(int x)
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
 
-static int fsi_slave_set_smode(struct fsi_slave *slave)
+static int fsi_slave_set_smode(struct fsi_slave *slave, int lbus_divider)
 {
 	uint32_t smode;
 	__be32 data;
@@ -225,7 +231,8 @@ static int fsi_slave_set_smode(struct fsi_slave *slave)
 	/* set our smode register with the slave ID field to 0; this enables
 	 * extended slave addressing
 	 */
-	smode = fsi_slave_smode(slave->id, slave->t_send_delay, slave->t_echo_delay);
+	smode = fsi_slave_smode(slave->id, lbus_divider, slave->t_send_delay,
+				slave->t_echo_delay);
 	data = cpu_to_be32(smode);
 
 	return fsi_master_write(slave->master, slave->link, slave->id,
@@ -281,7 +288,7 @@ static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
 	slave->t_send_delay = send_delay;
 	slave->t_echo_delay = echo_delay;
 
-	rc = fsi_slave_set_smode(slave);
+	rc = fsi_slave_set_smode(slave, master->lbus_divider);
 	if (rc)
 		return rc;
 
@@ -773,7 +780,7 @@ static ssize_t slave_send_echo_store(struct device *dev,
 	slave->t_send_delay = val;
 	slave->t_echo_delay = val;
 
-	rc = fsi_slave_set_smode(slave);
+	rc = fsi_slave_set_smode(slave, master->lbus_divider);
 	if (rc < 0)
 		return rc;
 	if (master->link_config)
@@ -1028,7 +1035,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 			 "can't set slbus on slave:%02x:%02x %d\n", link, id,
 			 rc);
 
-	rc = fsi_slave_set_smode(slave);
+	rc = fsi_slave_set_smode(slave, master->lbus_divider);
 	if (rc) {
 		dev_warn(&master->dev,
 				"can't set smode on slave:%02x:%02x %d\n",
@@ -1288,6 +1295,12 @@ int fsi_master_register(struct fsi_master *master)
 	if (!dev_name(&master->dev))
 		dev_set_name(&master->dev, "fsi%d", master->idx);
 
+	if (master->flags & FSI_MASTER_FLAG_SWCLOCK)
+		master->clock_frequency = 100000000; // POWER reference clock
+
+	if (!master->lbus_divider)
+		master->lbus_divider = FSI_SMODE_LBCRR_DEFAULT;
+
 	master->dev.class = &fsi_master_class;
 
 	mutex_lock(&master->scan_lock);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 36da643b3201..111bf7a11458 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -230,6 +230,7 @@ static int hub_master_probe(struct device *dev)
 	hub->master.dev.release = hub_master_release;
 	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
 
+	hub->master.lbus_divider = 1;
 	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
 	hub->master.read = hub_master_read;
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 967622c1cabf..26e636ad9ef6 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -120,6 +120,8 @@
 
 struct fsi_master {
 	struct device	dev;
+	unsigned long	clock_frequency;
+	int		lbus_divider;
 	int		idx;
 	int		n_links;
 	int		flags;
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index dca9db0a42e5..42af2fae0329 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -47,6 +47,7 @@
 #define FSI_SMODE_SD_DEFAULT	 16		/* Default send delay */
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
+#define FSI_SMODE_LBCRR_DEFAULT	 8		/* Default clk ratio */
 
 /*
  * SISS fields
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 3df8c54868df..e0309bf0ae07 100644
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


