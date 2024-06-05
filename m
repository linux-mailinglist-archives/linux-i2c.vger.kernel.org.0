Return-Path: <linux-i2c+bounces-3838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 175628FD85D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCD01C21FB0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DE715FA67;
	Wed,  5 Jun 2024 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oKOhFWtH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5012E63;
	Wed,  5 Jun 2024 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622616; cv=none; b=jDiwpO61te53tQClmgJeYkSuRXmur9Okpp9ZwgRJCLkyPuJbJ76uffH3d84L1ShDCd6hj6goVIXdvQrc9ufzkXt4Z49dQGcUldPJdqkE2Pu+z1LQVvRVu9UK4PGY/h+mv3k/byWj3lNOEWE+uiQXDV0q5GVDNThUeVray3wjk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622616; c=relaxed/simple;
	bh=c6X5cBeVcHCy2khqupbb2XqaXAyq1jU0VNJD2arVWzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XaFO1cEUNgKJ1V6eFPfBkkGIVPDw55IDP27haaLTxMQQtcl7jYnblDKZv9am6a20T2DSLuGjqPsaFv8eKItjCUTDqAJb2fUXN7w/PbhlpRgfQ/VT5gCQT6CXNpwxvze/p5s+n3SIWFkteyO+LFHmSIzqSMsly4GqfNUkr17Ujao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oKOhFWtH; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LBh1p011765;
	Wed, 5 Jun 2024 21:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=c52WiDs0KUXzepuhSz5qr9KqOUKGpDG3JkjIGvE1bYo=;
 b=oKOhFWtHKvw6MSyp/9rHmBc0XnItfj8TU5sdvxNqtGaNAQRj3576bYwaNS8r980FL85s
 3BD157qf8RAQZGxT9z+7iv+2VpbsIwhQ5HBCzUGLpcDIIOKinrIxRo/vXh9aqmAaHQE1
 pwSIIJ0qHCaKUTqMqkb7u/n727FYLeWIWSfDNZg5GwyKUAsDDo4f99mVFAhz/oeHzWjj
 fTD/yxw/asDGcungrNbcGicG6rKQqMcFQOq/WZjymBk9s6rCwS4eyV+UKS/+Y+mgUjkc
 QYdy0yv2kO6f9kXeJLdfnQwszyLQo7Ptm1kmFYKFKrA154i/HkuPuCbfuqxKFW/uCya1 JA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:19 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JVcN9031129;
	Wed, 5 Jun 2024 21:23:18 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNEWG7733802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7F9B58060;
	Wed,  5 Jun 2024 21:23:14 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45BFD58059;
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
Subject: [PATCH v4 04/40] fsi: Use a defined value for default echo delay
Date: Wed,  5 Jun 2024 16:22:36 -0500
Message-Id: <20240605212312.349188-5-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: rpB8W7vUEWK5uwd-GLpsqm9PfjL9BVOj
X-Proofpoint-ORIG-GUID: rpB8W7vUEWK5uwd-GLpsqm9PfjL9BVOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

Avoid hardcoding '16' several times.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 6 +++---
 drivers/fsi/fsi-slave.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e8dbf5e95c234..27235583183e5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1008,8 +1008,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	slave->link = link;
 	slave->id = id;
 	slave->size = FSI_SLAVE_SIZE_23b;
-	slave->t_send_delay = 16;
-	slave->t_echo_delay = 16;
+	slave->t_send_delay = FSI_SMODE_SD_DEFAULT;
+	slave->t_echo_delay = FSI_SMODE_ED_DEFAULT;
 
 	/* Get chip ID if any */
 	slave->chip_id = -1;
@@ -1160,7 +1160,7 @@ static int fsi_master_break(struct fsi_master *master, int link)
 	if (master->send_break)
 		rc = master->send_break(master, link);
 	if (master->link_config)
-		master->link_config(master, link, 16, 16);
+		master->link_config(master, link, FSI_SMODE_SD_DEFAULT, FSI_SMODE_ED_DEFAULT);
 
 	return rc;
 }
diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
index f6cca04131a92..45190b06fa027 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -42,8 +42,10 @@
 #define FSI_SMODE_SID_BREAK	3		/* ID after break command */
 #define FSI_SMODE_ED_SHIFT	20		/* Echo delay shift */
 #define FSI_SMODE_ED_MASK	0xf		/* Echo delay mask */
+#define FSI_SMODE_ED_DEFAULT	 16		/* Default echo delay */
 #define FSI_SMODE_SD_SHIFT	16		/* Send delay shift */
 #define FSI_SMODE_SD_MASK	0xf		/* Send delay mask */
+#define FSI_SMODE_SD_DEFAULT	 16		/* Default send delay */
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
 
-- 
2.39.3


