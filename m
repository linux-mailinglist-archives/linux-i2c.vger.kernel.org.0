Return-Path: <linux-i2c+bounces-3869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C98FD8D1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ABE51F24A94
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B8116FF26;
	Wed,  5 Jun 2024 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KPCEMYYU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AB16C86C;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622626; cv=none; b=ZeI89Vq0xc3kqtGMQGcd5Jh4mOCBr3EFWlTYcA7roWVVov/umwFm84Ao491MGHM40QqTDgQLv3X2c42BOg1uXZDkGWf5Qb5vA6X7x0QFfdoEM1+A+odJKBQUslSbWSL94qeZ30mtO5l+d1DLEuJFZIyczZg7bNE1d8Ews9UjJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622626; c=relaxed/simple;
	bh=kU908GL/srmIXI7xAwaPMDqc8xqY+P18Q4IHnIBP/W4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lr85eI7W75L7Q25igdN4QoYhQwvOeWRClRLoyrvSZxb1AiTGdHIUGFkWN8yXaU2TWeO7TfFr+abyQwwbbl/1wWqSUgNID7rbqqYGxTgNxOtgmd1OSyt3cZHQfLcD/i1TPxZZGdWleiFg301FEtU9iR5bAXuZdH6oQiDcosdJa50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KPCEMYYU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KuMLg009075;
	Wed, 5 Jun 2024 21:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=BxMhdEaKT8dV7A/LdNz6MzdJUjUzgPRl+V7XDXpB1LI=;
 b=KPCEMYYUm+TLLe7S1jz+3KW2OLMmABfIhuw/jJStuad6ofleXlJpYq4YlGZ/FVdO+LYB
 0duXeY06eWCcB9gjeCna0Pi54ULsA0gD6adyKWzJYaNTj9iM/N+LGjpEsUqL8isAqIPZ
 PYj0eDIbR9RwbJSsQVTGy6ydXq15C+VFKnkWQ0Sx7bEDDtCGPJ8Pa2mObzexkyNZsN1i
 bT4+8Ha/6gpDdlw8IvmSs9av11Dbojsr3cTzpK3Gp3qZ0Db3KtMLcv8qOToQgiqZFkmO
 zJ0wI8tIF82Ui08RRoEc14eLqfKLYd0O+q1yyaeI+cd6ATlaLEqGGg0UrUTkd45yUH7h Mg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjy09g4hv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:29 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455J3GeC031147;
	Wed, 5 Jun 2024 21:23:27 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:27 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNOfK29098574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:26 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AE2458060;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EA085805D;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 37/40] fsi: core: Add different types of CFAM
Date: Wed,  5 Jun 2024 16:23:09 -0500
Message-Id: <20240605212312.349188-38-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: oq3YQgc51Bj1t642DBPdkOGSijCMXwYa
X-Proofpoint-GUID: oq3YQgc51Bj1t642DBPdkOGSijCMXwYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

Detect the CFAM type based on the chip id and set up the device
type based on the CFAM type.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Define fsi_get_cfam_type as static

 drivers/fsi/fsi-core.c | 84 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 62a14a7f28498..bc561d1b2701c 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1028,6 +1028,37 @@ static struct attribute *cfam_attrs[] = {
 
 ATTRIBUTE_GROUPS(cfam);
 
+static struct attribute *cfam_s_attrs[] = {
+	&dev_attr_send_echo_delays.attr,
+	&dev_attr_chip_id.attr,
+	&dev_attr_cfam_id.attr,
+	&dev_attr_send_term.attr,
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
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(cfam_s);
+
 static char *cfam_devnode(const struct device *dev, umode_t *mode,
 			  kuid_t *uid, kgid_t *gid)
 {
@@ -1046,6 +1077,57 @@ static const struct device_type cfam_type = {
 	.groups = cfam_groups
 };
 
+static char *cfam_ody_devnode(const struct device *dev, umode_t *mode, kuid_t *uid, kgid_t *gid)
+{
+	const struct fsi_slave *slave = to_fsi_slave(dev);
+
+#ifdef CONFIG_FSI_NEW_DEV_NODE
+	return kasprintf(GFP_KERNEL, "fsi/ody%d", slave->cdev_idx);
+#else
+	return kasprintf(GFP_KERNEL, "ody%d", slave->cdev_idx);
+#endif
+}
+
+static const struct device_type cfam_ody_type = {
+	.name = "ody",
+	.devnode = cfam_ody_devnode
+};
+
+static char *cfam_s_devnode(const struct device *dev, umode_t *mode, kuid_t *uid, kgid_t *gid)
+{
+	const struct fsi_slave *slave = to_fsi_slave(dev);
+
+#ifdef CONFIG_FSI_NEW_DEV_NODE
+	return kasprintf(GFP_KERNEL, "fsi/cfam-s%d", slave->cdev_idx);
+#else
+	return kasprintf(GFP_KERNEL, "cfam-s%d", slave->cdev_idx);
+#endif
+}
+
+static const struct device_type cfam_s_type = {
+	.name = "cfam-s",
+	.devnode = cfam_s_devnode,
+	.groups = cfam_s_groups,
+};
+
+static const struct device_type *fsi_get_cfam_type(u32 id)
+{
+	u32 major = (id & 0xf00) >> 8;
+	u32 minor = (id & 0xf0) >> 4;
+
+	switch (major) {
+	case 0x9:
+		return &cfam_s_type;
+	case 0xc:
+		if (minor == 0)
+			return &cfam_ody_type;
+		fallthrough;
+	case 0xd:
+	default:
+		return &cfam_type;
+	}
+}
+
 static char *fsi_cdev_devnode(const struct device *dev, umode_t *mode,
 			      kuid_t *uid, kgid_t *gid)
 {
@@ -1202,7 +1284,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	spin_lock_init(&slave->lock);
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, id);
-	slave->dev.type = &cfam_type;
+	slave->dev.type = fsi_get_cfam_type(cfam_id);
 	slave->dev.parent = &master->dev;
 	slave->dev.of_node = fsi_slave_find_of_node(master, link, id);
 	slave->dev.release = fsi_slave_release;
-- 
2.39.3


