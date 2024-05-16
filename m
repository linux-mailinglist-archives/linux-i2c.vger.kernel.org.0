Return-Path: <linux-i2c+bounces-3540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1538C7C5E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD49328104F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9110915F318;
	Thu, 16 May 2024 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="S6JHHJzz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD74215ECE8;
	Thu, 16 May 2024 18:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883589; cv=none; b=iBl9opR9kjuM0jzJVcM+zoG2M2MLiw2Yxd4m/fhVWWpk1XZL9MKYUJC0dICjpeMbu7Hy844EZvq8zMJsJxT0thMCbyeET2QbkLhchgXfs9fiwWmyU8ubKqCYNyADFgVQc3hMuHhVOJ4eAGa2+kHqQ1Z3i8xZvNQx9AyqS8RS7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883589; c=relaxed/simple;
	bh=3+V1BYHv7imAhNsodfDuqzyVlub/3rC7336E+6Ul+HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=roQLl+pWiRKjJGenpQPo+Y3qFCrU06IfcZgQFVMzq0v00QUX8HcKiKU8XCUyKheHSdiguu3C/m2XQ6HTSdNYBp51MSxkwNnTyknvrxytMNKLsY2bbvjmvKbIVLGvO59uk8XpepAn6PQrDaWln1FLmmoYXf/IS6grYvSaktJPQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=S6JHHJzz; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHPJ0B028004;
	Thu, 16 May 2024 18:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kxSj0cj+SHG6G3CgN+VDhbwxi4I1ZjlQ60/1SQ/PgFM=;
 b=S6JHHJzz6KAnXYx712hsIj2stJW0R9yomexkW9PX4jxFnuH2HAZj9UhQupQ6ti2OQiJR
 9CDTGbIEVCO4dRNxK+VpTMLg+FECT60CgmtDpLYTx3MFaDjQJgzEvGAi37rnHQpYK8qD
 fmrZDF/7FoFCx+j8ArOi2hB+dzjobGrZJPxPanTpgBV6Up4JPB+DL0EcCxoVtfNMRyDr
 DK0xmDbI2RrHGi51s2+45/0j79rsMZNykN/4G94zyrVuYQXiX4xGXh3XXVLKUTuRcG3i
 0yk5BnmwDwmCYColkivezpQ8RtxN4BKdhZZ6fXx8vdKphW8SWx8wWUVKbG7OFQb/4Qa2 qg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5mce8frp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHVOC7020165;
	Thu, 16 May 2024 18:19:16 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd0bmck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:16 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJEeC21496474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:16 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DC5D58074;
	Thu, 16 May 2024 18:19:14 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E373858076;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 22/40] fsi: aspeed: Use common master error handler
Date: Thu, 16 May 2024 13:18:49 -0500
Message-Id: <20240516181907.3468796-23-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: mNQb2WIZQn7bcU-F0x82aAhQb5jhTRBU
X-Proofpoint-ORIG-GUID: mNQb2WIZQn7bcU-F0x82aAhQb5jhTRBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160132

This will do the correct mmode manipulation to do the master
reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c9f6d84e1a372..eecd64bc29512 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -226,27 +226,6 @@ static int opb_readb(struct fsi_master_aspeed *aspeed, uint32_t addr, u8 *out)
 	return __opb_read(aspeed, addr, XFER_BYTE, (void *)out);
 }
 
-static int check_errors(struct fsi_master_aspeed *aspeed, int err)
-{
-	int ret;
-
-	if (err == -EIO) {
-		/* Check MAEB (0x70) ? */
-
-		/* Then clear errors in master */
-		ret = opb_writel(aspeed, ctrl_base + FSI_MRESP0,
-				cpu_to_be32(FSI_MRESP_RST_ALL_MASTER));
-		if (ret) {
-			/* TODO: log? return different code? */
-			return ret;
-		}
-		/* TODO: confirm that 0x70 was okay */
-	}
-
-	/* This will pass through timeout errors */
-	return err;
-}
-
 static int aspeed_master_read(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, void *val, size_t size)
 {
@@ -277,7 +256,8 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		goto done;
 	}
 
-	ret = check_errors(aspeed, ret);
+	if (ret == -EIO)
+		fsi_master_error(&aspeed->master, link);
 done:
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
@@ -313,7 +293,8 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 		goto done;
 	}
 
-	ret = check_errors(aspeed, ret);
+	if (ret == -EIO)
+		fsi_master_error(&aspeed->master, link);
 done:
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
-- 
2.39.3


