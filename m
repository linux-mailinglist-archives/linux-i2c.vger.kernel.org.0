Return-Path: <linux-i2c+bounces-1977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A82867CC9
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21B51F25C73
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1986A12DDAA;
	Mon, 26 Feb 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AfhZeMNN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EE12C7FC;
	Mon, 26 Feb 2024 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966422; cv=none; b=G3GLpHD6+F9FLYSOuLOa5CuUWXfogmdIgZ4LaFbtWGOxPB3BxCGOABfT3sTqljaI1sfkgbRNi5etPwrdno1+fJZ1XhYqO3oaUIw2Gidi37zmjGmOJVmOPDV22qGruXlPfKBm+IBMGs6SDQoywWH9PeYMd8wL56RLJRPuEgD6w3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966422; c=relaxed/simple;
	bh=gT16x+suHzi4RJDxnpVIxo63PiknxpyG8sAgpETh/No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C18aW4D5v+etRDMCA+RqxNL7euhKTfLjpjTrjkqrDJ57qJB7WubP9mjSnLGNDLZuuHbDH9LiUZA7oohhLT0ixMpATvJQewtf85EgdM4n+/XcZ4uyonsT+SDAeTnRlFWgULKFEHMneBvscMQW14LnKijTIVsPyHp+f5MWdyOUMFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AfhZeMNN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGgXK8003017;
	Mon, 26 Feb 2024 16:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RLpioKRBvBvjG6X7CZTJJIG/dvzFzjHsdAqj+Tw9e24=;
 b=AfhZeMNNflhS5TlF0OCbInsUq8fnMnbB5orPGZGIpKBIUZ1e/8jtujywLdDW05JL5vUG
 PtSrtp3J7ub1IJT80KlLH8cR9v/Z+XSEJYqkQCkU7AzyWPtV7MzBa1VXK8YLUVlmi7aZ
 ICft/iwRVJ5gyPqL+1gj9L82tsqo40lurcGokFd/Z6m34biM+DcMKufT7jqNXHaGxuqQ
 lVDSAX1H/g6XtD/HRVqH0NXswot/aAJNn6Hc+inEYh073WVL5GYCM0FzuDHa79ErUMu6
 kuHh6YBdaJ4qwZnQ5gjAb5sKX/y719FTfPfl7KVyKy+hTLixfC78fiUUjIcH2AqjlKw4 mw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgxd4g9r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:28 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFNDw3024154;
	Mon, 26 Feb 2024 16:53:27 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0k23er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:27 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrP6a14222036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:27 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2983B58053;
	Mon, 26 Feb 2024 16:53:25 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67E0658043;
	Mon, 26 Feb 2024 16:53:24 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 03/31] fsi: Use a defined value for default echo delay
Date: Mon, 26 Feb 2024 10:52:53 -0600
Message-Id: <20240226165321.91976-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BzkZT1ZBTfjOdMiCTz16bdgXKFfgIfAD
X-Proofpoint-ORIG-GUID: BzkZT1ZBTfjOdMiCTz16bdgXKFfgIfAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Avoid hardcoding '16' several times.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c  | 6 +++---
 drivers/fsi/fsi-slave.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1c687eb021a0..8823e8e56dab 100644
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
index dba65bd4e083..dca9db0a42e5 100644
--- a/drivers/fsi/fsi-slave.h
+++ b/drivers/fsi/fsi-slave.h
@@ -41,8 +41,10 @@
 #define FSI_SMODE_SID_MASK	3		/* ID Mask */
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


