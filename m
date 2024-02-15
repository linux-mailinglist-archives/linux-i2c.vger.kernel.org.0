Return-Path: <linux-i2c+bounces-1780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C6856FFA
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B08E2877D4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED226148302;
	Thu, 15 Feb 2024 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DS7eEBFs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8F1468E5;
	Thu, 15 Feb 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034908; cv=none; b=ty5rwp5ZXbsS+AmVsM9II1veseBx5SGlhz+PfHexOylS7gTHEHwYVJPqt9dj77tSrxfw+tRLxZIaLpHqUzw+Z+cBs2Z8LglfBlBRLx3pbzqisOeln0EFiQDJ/9C4CNGlhrMstSSC/7Omb2Mky/VkjS5vrBFJeVHIRriznSjYExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034908; c=relaxed/simple;
	bh=J/YFPtGFuZwFnq9P5eEqxyt+AdQR6C4+3VLiCYKWnjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d3Aot4yF21BFmGk1sV2J5agrjsOlnik6qcNd1XjUZk7+6rdQgZnkZBatLMUXl1cIgARh17JR0oBTlYe3n0MqDZYQt6jEggj1V5PdWqksPwzeEtjEJErU4FUCzD+3ld41gWH8UuREEh7s+ZQIAN7u5KZ6R5vmXcF2rDoy5T5DFjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DS7eEBFs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0cQG018096;
	Thu, 15 Feb 2024 22:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sgsnboEv26LhiTyNfYfFAh+jxPvF4LGnhtlgk/oYHyI=;
 b=DS7eEBFsS1WD9rDcLCYgPn8oSGulCVGF+NPI2Id+0v3231q5tembzTTH4eKKUB/q/ve3
 eCQpONIlTdlXakHi4DVt0Ku085gzlhoedUvSIwKw+P5b75RsAl78Qrcd110oj9J/4/cb
 RSJX/edlXjDfrKjXffxcFcCigJtmgXoofB2jLFSVVZw6w/rHMdvorqZkeLB7CSMmWyDw
 MRDnS8skOrXrWoQXfTauAY+p44oLMRHFdCBR8q20UlmEdNi0qrAuUroXh9W4hTKchqRD
 cp0Yc/eVWxaw0faisK72/nYj4na4fPRWSswjCf436gPucyAYIzLrZ2AEukWx103atKwQ lQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg6b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:13 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLB5uj010083;
	Thu, 15 Feb 2024 22:08:12 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm781k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:12 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8AJ545810374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:12 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B066D58081;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6683358061;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 19/33] fsi: aspeed: Only read result register for successful read
Date: Thu, 15 Feb 2024 16:07:45 -0600
Message-Id: <20240215220759.976998-20-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: r6Q28LyMcXJ1VHOef_sDs1gUTO3TLGow
X-Proofpoint-ORIG-GUID: r6Q28LyMcXJ1VHOef_sDs1gUTO3TLGow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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


