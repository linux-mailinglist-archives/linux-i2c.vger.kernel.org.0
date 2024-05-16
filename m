Return-Path: <linux-i2c+bounces-3530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A78C7C35
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2A781C21464
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F47315AAD8;
	Thu, 16 May 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jqZnWPmM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93EB158A25;
	Thu, 16 May 2024 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883578; cv=none; b=DO60FzmozK8oOjYo3QtrhA4GPUb5b+EqrefzDl7SduAk6eSFcgLHhRF8P4EJo+q8JR/wJBqgBC4rEsWwks/lI3dIW60/6kRXaVKNRikjev3cgIliIpbcoyMNy8xIeBzEKPzyFsxdDZlLtbIvskUyFXmBH4DG8KSretvF6ZqXZ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883578; c=relaxed/simple;
	bh=F8ZhOF7lAw4Ct5EGIqFTZzJqJiZMbMfehj2luPDTxbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrB0x+tR0l4d+5vMBm6yb8BqQBSG6qQIlKeKyRAHSJtP9qzbn0xvEF6BZSvQ30XbHOqz81vpM9tBG/8CIqx4/Q+1vcWj+ziho9uyN9k+SUicrQi6LjKEJq7T/V9hyIuQufDPgAp4HxgRzIMh+kf/XSeTwFLImGK2biooj/ngoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jqZnWPmM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GG714X003960;
	Thu, 16 May 2024 18:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UaPvf6PO9NoXq8wwJQeNt9uuUYf2ak6wZVS6nw5xVWE=;
 b=jqZnWPmMUzAX42xPQS+NsysJQBmRY8X5XJ2bH7UXahVWqBdvdNf0Zgj5JjYIll8mzzrk
 71EkJc1Bz6EJKQvNkfspR74stf9datRUk/VL4fHfuwFFnWkxqJMSHrUrTbO0rE2ub5/p
 5L0X+gnQvBwiN3n7+NfznJmGaePCCbCWAswdXwL+ugUaI9I3vdvAa6fkS7NEVxgUNeZD
 5SxQtdYVZLwdHkn3GMDu3icBJuatoO+kVVvbYnOWkZR7Otuk937GqdIG6MU4twqEXigj
 Nz48dR9vZM+40vkJNZ9lbOZRYDCiNKs+fmYS2w/Rf95nFabHNcSfgbw66jw5AXmUS4RA Uw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5g6jh6u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHabl2005998;
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmud3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJI1G18678322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F4D85806B;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60A1C58069;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 37/40] fsi: core: Add different types of CFAM
Date: Thu, 16 May 2024 13:19:04 -0500
Message-Id: <20240516181907.3468796-38-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: BvFygxNzDn5UiTwaxCXe-fb5nnUBLwAP
X-Proofpoint-GUID: BvFygxNzDn5UiTwaxCXe-fb5nnUBLwAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Detect the CFAM type based on the chip id and set up the device
type based on the CFAM type.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 84 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 3d2bedb3ad51b..2785812a7d4ad 100644
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
+const struct device_type *fsi_get_cfam_type(u32 id)
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


