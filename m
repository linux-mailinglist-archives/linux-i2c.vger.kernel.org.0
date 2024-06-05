Return-Path: <linux-i2c+bounces-3850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D048FD886
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB841F21F06
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4BF1667D0;
	Wed,  5 Jun 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oUef40pX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8511607B2;
	Wed,  5 Jun 2024 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622620; cv=none; b=EIfsJ7/TPfa5dvztydHxJb22mreBDokcpC4q+caUCrqymh1N7amrArZ6+1av4CoPhK5zMQwLftqAS/LRWWW//X8TN3Dp4qiVUJuzNjZpXnyeGbhXvMZAwUyfojpXfgXH9+HSRHKhPduS/elSqk6FqMVizCCWM1EcY5XgqwCK7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622620; c=relaxed/simple;
	bh=gcQ2zkmKa+fmA+wA1USWs3UuxyNB+5m2pTe6OU5K/+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XKxJIIdgtiPPp4lI2NAIoqq4wPFLySAtaQ1C0k98pYirAgFOG2OfsVyz2anNi8T5hnbshWBaOZElbNstAbjBrQv5HgVtC3kICuJvgPzGNx7fWAAvikaTN+dN87qwVT5T1QOWKhhDug5JAcriKPlD7pFO5Qx8UVDHdQ5evJpCxKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oUef40pX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KuLSu008989;
	Wed, 5 Jun 2024 21:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=4QzZpzonx2C/GWGQRLgt495aUpGk9FXO31kMVCNBj/A=;
 b=oUef40pXu2VwbN+gnGv2CX56jn8pFY2xm7G+c8AYpNC0tN1y+hvhkaUQhnHRfBMoHdnt
 yJ0C+DJfY7bprR+k+LNI0uAAZ18fHhN69kX3Pl3yDGFasYh2xWyZzWTqnh4hH7zSVI7C
 0xDEGXGhLSVbp2Hqdm31mblNWE9md8O+mGvakg9LAmJw1l0ZJLHmwxsK6VK4YjZ9oCSG
 N1pwz4mC3GiUfQfzuwBUtQOqMyFNKQQe/cozNcoFLLVsdHzwKm4h7bMztxMqmEn3JNn+
 qRV13Ed8wQNXjY0gJpk5LLSl+6H7RmupKlpjWogMOdQ/8lw2jEYMj37nLKNGWna/M2MB 8w== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjy09g4hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IKamw000800;
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu6wsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNJ3X35914296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:21 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BD6F58043;
	Wed,  5 Jun 2024 21:23:19 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3CFE58069;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 19/40] fsi: aspeed: Only read result register for successful read
Date: Wed,  5 Jun 2024 16:22:51 -0500
Message-Id: <20240605212312.349188-20-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: WyZUdmPUEFb-KTk3rBj0-JV6II_TORz0
X-Proofpoint-GUID: WyZUdmPUEFb-KTk3rBj0-JV6II_TORz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

No reason to read the result in the error path, and remove the
null pointer check on the output, as it should never be null.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f840c7c4a56b9..10ca23cf58c2e 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -181,8 +181,6 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	writel(OPB0_XFER_ACK_EN, base + OPB_IRQ_STATUS);
 	status = readl(base + OPB0_STATUS);
 
-	result = readl(base + OPB0_FSI_DATA_R);
-
 	/* Return error when poll timed out */
 	if (ret) {
 		trace_fsi_master_aspeed_timeout(reg, status, true);
@@ -193,21 +191,20 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	if (status & STATUS_ERR_ACK)
 		return -EIO;
 
-	if (out) {
-		switch (transfer_size) {
-		case XFER_BYTE:
-			*(u8 *)out = result;
-			break;
-		case XFER_HALFWORD:
-			*(u16 *)out = result;
-			break;
-		case XFER_FULLWORD:
-			*(u32 *)out = result;
-			break;
-		default:
-			return -EINVAL;
-		}
+	result = readl(base + OPB0_FSI_DATA_R);
 
+	switch (transfer_size) {
+	case XFER_BYTE:
+		*(u8 *)out = result;
+		break;
+	case XFER_HALFWORD:
+		*(u16 *)out = result;
+		break;
+	case XFER_FULLWORD:
+		*(u32 *)out = result;
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	trace_fsi_master_aspeed_opb_xfer(addr, transfer_size + 1, result, true);
-- 
2.39.3


