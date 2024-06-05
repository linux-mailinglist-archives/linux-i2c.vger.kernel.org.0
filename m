Return-Path: <linux-i2c+bounces-3866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1CF8FD8C5
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66665283752
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1DD1761B3;
	Wed,  5 Jun 2024 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ltBgFluD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413115F3ED;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622625; cv=none; b=cx/FWYLL3tr/iFYRGKe2e3zmm2ZrqwZLoomIbQ/EEVZCrMAtEAE8U3HwU32AD6iKoFNg2Oo0RIwNldNmwqZXwnWRZ3JrmAkEtrDGizfE/xHV7nf8sjPieQrD3kAJ/cFVEEiHz7CA8jS1KnZoyhfaMPYjXuo1IwC/Xd5jghjMknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622625; c=relaxed/simple;
	bh=jtBdO608e54Gjo+WJW+8Z7TDVODmLr1O3UYpEi4xKMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZZdBr7kTVI/X0nKJR9U1tFqsjcSxcpHWMRJ0LW62log7gnuTZT4NLk8F1Vsy7JdbSEuk1IgClHZsJEcRhgig4ovXx6CJLZ+HcOkEjZRRT1L6oJoaiNq4UxF+gOlsWX+lT9ii5YY5AHxYHuU4kvyi7pW1Pu++gwoeLgozZjxl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ltBgFluD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455Kvepc014563;
	Wed, 5 Jun 2024 21:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=9EQ/udfwV4988NmJ64/g80BYsVL3x5pmmemzkAQ7CyI=;
 b=ltBgFluDaEC0cDE5S9NYhq/KsRKIS2KT5k/DxlEsPRKpM1WofkyomZTrOTPkyD/iNa4l
 Rk3Xdr/XM/Jk+alpmJK1X+ICHKMBeXM8kBa/dnCRwNdBL2OktR2/+kWV5GvtxNR7XItT
 FFBksn1xD31EE++M4MbDKPOqW027RrOl3i2QOkLhWVK0KM13Retev83AnKzgreSftZkp
 RYDQDe7/mLG24UhtFm8zE7nfMIGupv9+yn5XXukWGplc2XfDJ73TCez2v0anoajHU8x+
 FRR5t5u1BrTq8J8hERAbmn1iePj4aufzSDfs0cVtyrtwnDqi9xAxObeX2dZKbK2CzsYT vg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjygp81us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IRk5J008458;
	Wed, 5 Jun 2024 21:23:29 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:29 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNPWP61800790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:28 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF7885805E;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 982AD58072;
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
Subject: [PATCH v4 35/40] fsi: core: Add slave register read-only sysfs
Date: Wed,  5 Jun 2024 16:23:07 -0500
Message-Id: <20240605212312.349188-36-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: n-d35ugdjtO-3IBsEolZXLq35kxzyTg0
X-Proofpoint-ORIG-GUID: n-d35ugdjtO-3IBsEolZXLq35kxzyTg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

The slave registers are commonly used for debugging or diagnosis
so provide them in sysfs files.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 144 +++++++++++++++++++++++++++++++++++++---
 drivers/fsi/fsi-slave.h |  21 ++++++
 2 files changed, 155 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4d2e14e2a9148..62a14a7f28498 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -887,22 +887,146 @@ static ssize_t cfam_id_show(struct device *dev,
 
 static DEVICE_ATTR_RO(cfam_id);
 
-static struct attribute *cfam_attr[] = {
+static ssize_t config_table_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	const unsigned int end = engine_page_size / sizeof(u32);
+	struct fsi_slave *slave = to_fsi_slave(dev);
+	__be32 data;
+	int len = 0;
+	u32 conf;
+	int rc;
+
+	for (unsigned int i = 0; i < end; ++i) {
+		rc = fsi_slave_read(slave, i * sizeof(data), &data, sizeof(data));
+		if (rc)
+			return rc;
+
+		conf = be32_to_cpu(data);
+		if (crc4(0, conf, 32))
+			return -EBADMSG;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", conf);
+		if (!(conf & FSI_SLAVE_CONF_NEXT_MASK))
+			break;
+	}
+
+	return len;
+}
+
+static DEVICE_ATTR_RO(config_table);
+
+struct fsi_slave_attribute {
+	struct device_attribute attr;
+	int reg;
+};
+
+static ssize_t slave_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_slave_attribute *fattr = container_of(attr, struct fsi_slave_attribute, attr);
+	struct fsi_slave *slave = to_fsi_slave(dev);
+	__be32 data;
+	int rc;
+
+	rc = fsi_slave_read(slave, FSI_SLAVE_BASE + fattr->reg, &data, sizeof(data));
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%08x\n", be32_to_cpu(data));
+}
+
+static ssize_t slave_reg_8bpp_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsi_slave_attribute *fattr = container_of(attr, struct fsi_slave_attribute, attr);
+	struct fsi_slave *slave = to_fsi_slave(dev);
+	__be32 data;
+	int len = 0;
+	int rc;
+	int i;
+
+	for (i = 0; i < 2; ++i) {
+		rc = fsi_slave_read(slave, FSI_SLAVE_BASE + fattr->reg + (i * 4), &data,
+				    sizeof(data));
+		if (rc)
+			return rc;
+
+		len += sysfs_emit_at(buf, len, "%08x\n", be32_to_cpu(data));
+	}
+
+	return len;
+}
+
+#define FSI_SLAVE_ATTR(name, reg) \
+	struct fsi_slave_attribute dev_attr_##name = { __ATTR(name, 0444, slave_reg_show, NULL), reg }
+#define FSI_SLAVE_ATTR_8BPP(name, reg) \
+	struct fsi_slave_attribute dev_attr_##name = { __ATTR(name, 0444, slave_reg_8bpp_show, NULL), reg }
+
+static FSI_SLAVE_ATTR(smode, FSI_SMODE);
+static FSI_SLAVE_ATTR(sdma, FSI_SDMA);
+static FSI_SLAVE_ATTR(sisc, FSI_SISC);
+static FSI_SLAVE_ATTR(sism, FSI_SISM);
+static FSI_SLAVE_ATTR(siss, FSI_SISS);
+static FSI_SLAVE_ATTR(sstat, FSI_SSTAT);
+static FSI_SLAVE_ATTR(si1m, FSI_SI1M);
+static FSI_SLAVE_ATTR(si1s, FSI_SI1S);
+static FSI_SLAVE_ATTR(sic, FSI_SIC);
+static FSI_SLAVE_ATTR(si2m, FSI_SI2M);
+static FSI_SLAVE_ATTR(si2s, FSI_SI2S);
+static FSI_SLAVE_ATTR(scmdt, FSI_SCMDT);
+static FSI_SLAVE_ATTR(sdata, FSI_SDATA);
+static FSI_SLAVE_ATTR(slastd, FSI_SLASTD);
+static FSI_SLAVE_ATTR(smbl, FSI_SMBL);
+static FSI_SLAVE_ATTR(soml, FSI_SOML);
+static FSI_SLAVE_ATTR(snml, FSI_SNML);
+static FSI_SLAVE_ATTR(smbr, FSI_SMBR);
+static FSI_SLAVE_ATTR(somr, FSI_SOMR);
+static FSI_SLAVE_ATTR(snmr, FSI_SNMR);
+static FSI_SLAVE_ATTR_8BPP(scrsic, FSI_ScRSIC0);
+static FSI_SLAVE_ATTR_8BPP(scrsim, FSI_ScRSIM0);
+static FSI_SLAVE_ATTR_8BPP(scrsis, FSI_ScRSIS0);
+static FSI_SLAVE_ATTR_8BPP(srsic, FSI_SRSIC0);
+static FSI_SLAVE_ATTR_8BPP(srsim, FSI_SRSIM0);
+static FSI_SLAVE_ATTR_8BPP(srsis, FSI_SRSIS0);
+static FSI_SLAVE_ATTR(llmode, FSI_LLMODE);
+static FSI_SLAVE_ATTR(llstat, FSI_LLSTAT);
+
+static struct attribute *cfam_attrs[] = {
 	&dev_attr_send_echo_delays.attr,
 	&dev_attr_chip_id.attr,
 	&dev_attr_cfam_id.attr,
 	&dev_attr_send_term.attr,
+	&dev_attr_config_table.attr,
+	&dev_attr_smode.attr.attr,
+	&dev_attr_sdma.attr.attr,
+	&dev_attr_sisc.attr.attr,
+	&dev_attr_sism.attr.attr,
+	&dev_attr_siss.attr.attr,
+	&dev_attr_sstat.attr.attr,
+	&dev_attr_si1m.attr.attr,
+	&dev_attr_si1s.attr.attr,
+	&dev_attr_sic.attr.attr,
+	&dev_attr_si2m.attr.attr,
+	&dev_attr_si2s.attr.attr,
+	&dev_attr_scmdt.attr.attr,
+	&dev_attr_sdata.attr.attr,
+	&dev_attr_slastd.attr.attr,
+	&dev_attr_smbl.attr.attr,
+	&dev_attr_soml.attr.attr,
+	&dev_attr_snml.attr.attr,
+	&dev_attr_smbr.attr.attr,
+	&dev_attr_somr.attr.attr,
+	&dev_attr_snmr.attr.attr,
+	&dev_attr_scrsic.attr.attr,
+	&dev_attr_scrsim.attr.attr,
+	&dev_attr_scrsis.attr.attr,
+	&dev_attr_srsic.attr.attr,
+	&dev_attr_srsim.attr.attr,
+	&dev_attr_srsis.attr.attr,
+	&dev_attr_llmode.attr.attr,
+	&dev_attr_llstat.attr.attr,
 	NULL,
 };
 
-static const struct attribute_group cfam_attr_group = {
-	.attrs = cfam_attr,
-};
-
-static const struct attribute_group *cfam_attr_groups[] = {
-	&cfam_attr_group,
-	NULL,
-};
+ATTRIBUTE_GROUPS(cfam);
 
 static char *cfam_devnode(const struct device *dev, umode_t *mode,
 			  kuid_t *uid, kgid_t *gid)
@@ -919,7 +1043,7 @@ static char *cfam_devnode(const struct device *dev, umode_t *mode,
 static const struct device_type cfam_type = {
 	.name = "cfam",
 	.devnode = cfam_devnode,
-	.groups = cfam_attr_groups
+	.groups = cfam_groups
 };
 
 static char *fsi_cdev_devnode(const struct device *dev, umode_t *mode,
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index 762636e7c8633..ccc394e92a93f 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -14,6 +14,7 @@
  * FSI slave engine control register offsets
  */
 #define FSI_SMODE		0x0	/* R/W: Mode register */
+#define FSI_SDMA		0x4	/* R/W: DMA control */
 #define FSI_SISC		0x8	/* R  : Interrupt condition */
 #define FSI_SCISC		0x8	/* C  : Clear interrupt condition */
 #define FSI_SISM		0xc	/* R/W: Interrupt mask */
@@ -21,11 +22,30 @@
 #define FSI_SSISM		0x10	/* S  : Set interrupt mask */
 #define FSI_SCISM		0x14	/* C  : Clear interrupt mask */
 #define FSI_SSTAT		0x14	/* R  : Slave status */
+#define FSI_SI1M		0x18	/* R/W: Interrupt 1 mask */
 #define FSI_SI1S		0x1c	/* R  : Slave interrupt 1 status */
 #define FSI_SSI1M		0x1c	/* S  : Set slave interrupt 1 mask */
+#define FSI_SIC			0x20	/* R  : Interrupt 1 condition */
 #define FSI_SCI1M		0x20	/* C  : Clear slave interrupt 1 mask */
+#define FSI_SI2M		0x24	/* R/W: Interrupt 2 mask */
+#define FSI_SI2S		0x28	/* R  : Interrupt 2 status */
+#define FSI_SCMDT		0x2c	/* R  : Last command trace */
+#define FSI_SDATA		0x30	/* R  : Last data trace */
 #define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
+#define FSI_SLASTD		0x34	/* R  : Last data sent */
 #define FSI_SRES		0x34	/* W  : Reset */
+#define FSI_SMBL		0x38
+#define FSI_SOML		0x3c
+#define FSI_SNML		0x40
+#define FSI_SMBR		0x44
+#define FSI_SOMR		0x48
+#define FSI_SNMR		0x4c
+#define FSI_ScRSIC0		0x50
+#define FSI_ScRSIC4		0x54
+#define FSI_ScRSIM0		0x58
+#define FSI_ScRSIM4		0x5c
+#define FSI_ScRSIS0		0x60
+#define FSI_ScRSIS4		0x64
 #define FSI_SRSIC0		0x68	/* C  : Clear remote interrupt condition */
 #define FSI_SRSIC4		0x6c	/* C  : Clear remote interrupt condition */
 #define FSI_SRSIM0		0x70	/* R/W: Remote interrupt mask */
@@ -33,6 +53,7 @@
 #define FSI_SRSIS0		0x78	/* R  : Remote interrupt status */
 #define FSI_SRSIS4		0x7c	/* R  : Remote interrupt status */
 #define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
+#define FSI_LLSTAT		0x104
 
 /*
  * SMODE fields
-- 
2.39.3


