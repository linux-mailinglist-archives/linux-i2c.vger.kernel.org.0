Return-Path: <linux-i2c+bounces-3871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8214B8FD8DB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD9EAB21D7D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677C917E903;
	Wed,  5 Jun 2024 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KtRDcV/W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3C16EBE6;
	Wed,  5 Jun 2024 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622627; cv=none; b=W4BM2UwiZtpmA4joGrMntU/iIBTxanK9LL3tml7OsP3WGGi80vhrxXjJDhKiNI7Zs09c/iWE2H80/JmvgdY4A2xYOtRyZWjlWO0DiFQfAdgWXa4jKBtKBg8Riw1Esq7BFAsPAAVz5zwk+VzlQPBO/RNL1U32fbg9Emtze1V1i4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622627; c=relaxed/simple;
	bh=RBqRbxabKv0CGQ2xdwAfaYcS7JbONGnPFvbJnA6bQPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FZIvgYy7bV0bWEoacln8ttPyH4n/g6Ih5Bj7ISJXR+UY+b6vfrIH/5xFJEKy57bCBxULhdCEYCgE9u1+InE5z6btoE69LawQfvCdV1vYLCm6VxKNdVdH83Cu0wfbLQelo7ipq6wEtJlw6u99quwE4YhRedZ3qKPNVCn4MTeyd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KtRDcV/W; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455Kvrrs008155;
	Wed, 5 Jun 2024 21:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=c/6bQez2W1iTAQVDpyKd+LW+AbhpZPBop+2GaDE/jcM=;
 b=KtRDcV/WU3VWNzAyfeVoOHy0aH0x4gvT9bjUoFBLbYdKy/e3So9avu9OHGNA/TSBjNUb
 +Ink67GWP5H7uBA65YKT/kecAzX1txlkv+aAfb/2evT7XRocJnGemUGi42Z8W3RRtKoj
 HCwxcKaZlDP1On/wlOvNiLxDHr8WdDtV0dY0CypRw+5Cy7uc5+o8XR3gPMY8nn6FT9KP
 Ggn1MMSFggTXGNSFaDFm5Mw1cEtIIiUf3hQf+7lGNyz+RE6EZewriaWeqF7NcIsVjEA3
 utDcQDKc4B/mltz+29RmfKox8JPUc7Z9VvFIcPCemHq/A6u90FviXnDMZ+6sY6HvJa4g YA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjygn01ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:30 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455J3GeD031147;
	Wed, 5 Jun 2024 21:23:29 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:28 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNPjm11338460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:27 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90A625806A;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 525DE5806F;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 34/40] fsi: core: Add master register read-only sysfs
Date: Wed,  5 Jun 2024 16:23:06 -0500
Message-Id: <20240605212312.349188-35-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 3nNZKFv8n3XJP9gSsQwxkWSXPGW9dMXw
X-Proofpoint-ORIG-GUID: 3nNZKFv8n3XJP9gSsQwxkWSXPGW9dMXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

The master registers are commonly used for debugging or diagnosis so
provide them in sysfs files.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c   | 144 +++++++++++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master.h |   6 ++
 2 files changed, 150 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 58cb6bc6ccc91..4d2e14e2a9148 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1392,6 +1392,141 @@ static ssize_t master_break_store(struct device *dev,
 
 static DEVICE_ATTR(break, 0200, NULL, master_break_store);
 
+struct fsi_master_attribute {
+	struct device_attribute attr;
+	int reg;
+};
+
+static ssize_t master_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int reg;
+	int rc;
+	
+	rc = regmap_read(master->map, fattr->reg, &reg);
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%08x\n", reg);
+}
+
+static ssize_t master_reg_1bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int count = (master->n_links + 31) / 32;
+	unsigned int reg;
+	unsigned int i;
+	int len = 0;
+	int rc;
+	
+	for (i = 0; i < count; ++i) {
+		rc = regmap_read(master->map, fattr->reg + (i * 4), &reg);
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", reg);
+	}
+
+	return len;
+}
+
+static ssize_t master_reg_4bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int count = (master->n_links + 7) / 8;
+	unsigned int reg;
+	unsigned int i;
+	int len = 0;
+	int rc;
+	
+	for (i = 0; i < count; ++i) {
+		rc = regmap_read(master->map, fattr->reg + (i * 4), &reg);
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", reg);
+	}
+
+	return len;
+}
+
+static ssize_t master_reg_32bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_master_attribute *fattr = container_of(attr, struct fsi_master_attribute, attr);
+	struct fsi_master *master = to_fsi_master(dev);
+	unsigned int reg;
+	int len = 0;
+	int rc;
+	int i;
+	
+	for (i = 0; i < master->n_links; ++i) {
+		rc = regmap_read(master->map, fattr->reg + (i * 4), &reg);
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", reg);
+	}
+
+	return len;
+}
+
+#define FSI_MASTER_ATTR(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_show, NULL), reg }
+#define FSI_MASTER_ATTR_1BPP(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_1bpp_show, NULL), reg }
+#define FSI_MASTER_ATTR_4BPP(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_4bpp_show, NULL), reg }
+#define FSI_MASTER_ATTR_32BPP(name, reg) \
+	struct fsi_master_attribute dev_attr_##name = { __ATTR(name, 0444, master_reg_32bpp_show, NULL), reg }
+
+static FSI_MASTER_ATTR(mmode, FSI_MMODE);
+static FSI_MASTER_ATTR(mdlyr, FSI_MDLYR);
+static FSI_MASTER_ATTR_1BPP(mcrsp, FSI_MCRSP);
+static FSI_MASTER_ATTR_1BPP(menp, FSI_MENP0);
+static FSI_MASTER_ATTR_1BPP(mlevp, FSI_MLEVP0);
+static FSI_MASTER_ATTR_1BPP(mrefp, FSI_MREFP0);
+static FSI_MASTER_ATTR_1BPP(mhpmp, FSI_MHPMP0);
+static FSI_MASTER_ATTR_4BPP(msiep, FSI_MSIEP0);
+static FSI_MASTER_ATTR_1BPP(maesp, FSI_MAESP0);
+static FSI_MASTER_ATTR(maeb, FSI_MAEB);
+static FSI_MASTER_ATTR(mver, FSI_MVER);
+static FSI_MASTER_ATTR_1BPP(mbsyp, FSI_MBSYP0);
+static FSI_MASTER_ATTR_32BPP(mstap, FSI_MSTAP0);
+static FSI_MASTER_ATTR(mesrb, FSI_MESRB0);
+static FSI_MASTER_ATTR(mscsb, FSI_MSCSB0);
+static FSI_MASTER_ATTR(matrb, FSI_MATRB0);
+static FSI_MASTER_ATTR(mdtrb, FSI_MDTRB0);
+static FSI_MASTER_ATTR(mectrl, FSI_MECTRL);
+
+static struct attribute *master_mapped_attrs[] = {
+	&dev_attr_mmode.attr.attr,
+	&dev_attr_mdlyr.attr.attr,
+	&dev_attr_mcrsp.attr.attr,
+	&dev_attr_menp.attr.attr,
+	&dev_attr_mlevp.attr.attr,
+	&dev_attr_mrefp.attr.attr,
+	&dev_attr_mhpmp.attr.attr,
+	&dev_attr_msiep.attr.attr,
+	&dev_attr_maesp.attr.attr,
+	&dev_attr_maeb.attr.attr,
+	&dev_attr_mver.attr.attr,
+	&dev_attr_mbsyp.attr.attr,
+	&dev_attr_mstap.attr.attr,
+	&dev_attr_mesrb.attr.attr,
+	&dev_attr_mscsb.attr.attr,
+	&dev_attr_matrb.attr.attr,
+	&dev_attr_mdtrb.attr.attr,
+	&dev_attr_mectrl.attr.attr,
+	NULL
+};
+
+static const struct attribute_group master_mapped_group = {
+	.attrs = master_mapped_attrs,
+};
+
 static struct attribute *master_attrs[] = {
 	&dev_attr_break.attr,
 	&dev_attr_rescan.attr,
@@ -1665,6 +1800,12 @@ int fsi_master_register(struct fsi_master *master)
 	}
 out:
 	mutex_unlock(&master->scan_lock);
+
+	if (!rc && master->map) {
+		if (!sysfs_create_group(&master->dev.kobj, &master_mapped_group))
+			master->groups = true;
+	}
+
 	return rc;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
@@ -1675,6 +1816,9 @@ void fsi_master_unregister(struct fsi_master *master)
 
 	trace_fsi_master_unregister(master);
 
+	if (master->groups)
+		sysfs_remove_group(&master->dev.kobj, &master_mapped_group);
+
 	mutex_lock(&master->scan_lock);
 	fsi_master_unscan(master);
 	master->n_links = 0;
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 2104902091e05..1fa101a477899 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/irq.h>
 #include <linux/mutex.h>
+#include <linux/sysfs.h>
 
 /*
  * Master registers
@@ -27,12 +28,16 @@
 #define FSI_MENP0		0x10		/* R/W: enable */
 #define FSI_MLEVP0		0x18		/* R: plug detect */
 #define FSI_MSENP0		0x18		/* S: Set enable */
+#define FSI_MREFP0		0x20		/* R: Plug reference */
 #define FSI_MCENP0		0x20		/* C: Clear enable */
+#define FSI_MHPMP0		0x28		/* R: Plug monitor */
 #define FSI_MSIEP0		0x30		/* R/W: interrupt enable */
+#define FSI_MAESP0		0x50		/* R: Any error port */
 #define FSI_MSSIEP0		0x50		/* S: Set interrupt enable */
 #define FSI_MCSIEP0		0x70		/* C: Clear interrupt enable */
 #define FSI_MAEB		0x70		/* R: Error address */
 #define FSI_MVER		0x74		/* R: master version/type */
+#define FSI_MBSYP0		0x78		/* R: Port busy */
 #define FSI_MSTAP0		0xd0		/* R: Port status */
 #define FSI_MRESP0		0xd0		/* W: Port reset */
 #define FSI_MESRB0		0x1d0		/* R: Master error status */
@@ -151,6 +156,7 @@ struct fsi_master {
 	int		(*link_config)(struct fsi_master *, int link,
 				       u8 t_send_delay, u8 t_echo_delay);
 	u8		remote_interrupt_status;
+	bool		groups;
 };
 
 #define to_fsi_master(d) container_of(d, struct fsi_master, dev)
-- 
2.39.3


