Return-Path: <linux-i2c+bounces-1995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8130867D0F
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2558B1C2A946
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3757A133293;
	Mon, 26 Feb 2024 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="cYb1qWsZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469DB132499;
	Mon, 26 Feb 2024 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966434; cv=none; b=S97PmseE4nLZRbhzIFrR39rxgSsp1vwn9yi1ZNivTIQXZbFkamsRZq6/YkAHRqKFeuEhgAcqotFkP3843QibdB6qFel6xh7rGWSF7L4OaZFFnzz4RYDz7s0T8pEDB2RWwm5NQVLlrz77MKb1HGpimnnAbPLG8luB8t253bJqKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966434; c=relaxed/simple;
	bh=J/YFPtGFuZwFnq9P5eEqxyt+AdQR6C4+3VLiCYKWnjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sb8O4MKB8Hs2Uq39t0pJwmfnulVRlUSJxtzJmUr6H4JPYejwAXbYCv063R1aEBAk7Fwk8O/YecMZKwGNJztbA5RfAkooNVfGmDmcLXBo9MigWTC/xtOWjB7FjA4Zj57TIX5+YrecpbZMaPjYcqx/QyT6MB18KK38p43wyKn3RUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=cYb1qWsZ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG5gqA025499;
	Mon, 26 Feb 2024 16:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sgsnboEv26LhiTyNfYfFAh+jxPvF4LGnhtlgk/oYHyI=;
 b=cYb1qWsZ07bBxo0kiS5a5pHsMIL744bRhq3uT6bkr6DFpl/5FaZ4qEPpbkDVa0xzBoMz
 F3LSH4Xf+5ixxbD0fiUg3zf38AyaYcH1U6BIyVQC2M1iGimSQ+G4PAmXjjYusCKA71u6
 p+XY3iVkUGGLJZFs/N9wEkQ/L37XnkdrGJhQxbFpMzRwtCZ1YLpz1SJ2yM+2WN5/hqSX
 mISAFg1m5Hcv247Y4eGb5WI8n2UmU0DnV3SF4ExOy6yZlj9YNueodoh2beDAYPT3Q3Lo
 85ru5L5n1g4Jl4LERyxepaFFEIwEFRyWOhpi5KkOid/Ru9ldTiAurj1+3wPS2T1C0rKp gA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvsq33n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:41 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFGmdb008142;
	Mon, 26 Feb 2024 16:53:40 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9m2a0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:40 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrbnX7799336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:39 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48B7F58065;
	Mon, 26 Feb 2024 16:53:37 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F64958053;
	Mon, 26 Feb 2024 16:53:36 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 18/31] fsi: aspeed: Only read result register for successful read
Date: Mon, 26 Feb 2024 10:53:08 -0600
Message-Id: <20240226165321.91976-19-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: kmunfQXPC4eEI1gQTSNhWBZ1_cIwpHdP
X-Proofpoint-ORIG-GUID: kmunfQXPC4eEI1gQTSNhWBZ1_cIwpHdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

No reason to read the result in the error path, and remove the
null pointer check on the output, as it should never be null.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 64a5407a15ec..83f84ee6d6f4 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -175,8 +175,6 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 	writel(OPB0_XFER_ACK_EN, base + OPB_IRQ_STATUS);
 	status = readl(base + OPB0_STATUS);
 
-	result = readl(base + OPB0_FSI_DATA_R);
-
 	/* Return error when poll timed out */
 	if (ret) {
 		trace_fsi_master_aspeed_timeout(reg, status, true);
@@ -187,21 +185,20 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
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


