Return-Path: <linux-i2c+bounces-1786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A35857011
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0139D1C218D5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA98714A086;
	Thu, 15 Feb 2024 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="L4l0zTZR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299941474C1;
	Thu, 15 Feb 2024 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034910; cv=none; b=GF83lywmInAtd5W5TXvLtDlZhekAaalMqyOf4zRyhhPryKdY2u46TQsQxyLTvtvK1QeowX/+ODY8JWt7Q4jPaS3/6jT3EAhyMXTZqgNX5i0lncORny6H+DDC9IocD91YDWlSwnthqkbnyhUjc0cZhH4f1uEpu8tlC47AAUBFNHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034910; c=relaxed/simple;
	bh=Nitj0lZrrDkxeMQ8i5VV2Bwzuo49UpxkAe+abtxsgAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XRGKu+6gkT9vuPEBFAQ9Di+2H8Ke/qoM53K12m3AtJk+xez2/mktq8ogfd949xopR/hpncRZKYpqm0hbpbi76PROdQEmS+TOPptd71AlXLXARatv+1/xiFCqfANfBLyIf+3OGZspFg5OEY7d3etLEbxHHPyUpSSKN1Ox+0/iUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=L4l0zTZR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLkHcq016092;
	Thu, 15 Feb 2024 22:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YFVgmE6fC8McLNPQMyrQ9AZdJJ8T1N9YLZ9PrKcr1ZY=;
 b=L4l0zTZRh0Sx/5nKaY4Sje5WkSOWOX0n/IkkDz/88sMoxuPL9J+a5MGuX664FZC3Sn/k
 l80mWaTFJsKJLkT6opv1vtMdmcVO4IsOo73xGFHVCneB9WCu7uloNfhHTx1hjY0q0p2H
 tAGfvTv7axRTTtgC6DjZj/FSKW8le4MqipxnIlZjRlZRHPpg/Fqt03YtKi2sCvLckypk
 TV0fUUUTYoB3BHBHCq453KicWrV50Og/I/wtxvtLJFIHhztKCk35UM21+U8eRGqj4Q7n
 dkzPfov5bAgaX+PFKJSsPBOmVJM+b5hpSyZMSaB+L1i94el6yzndsrcFPZNGIz2LvwQk qw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9tmf8n28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLB5um010083;
	Thu, 15 Feb 2024 22:08:14 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm781v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8BP325166376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:13 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C14125806F;
	Thu, 15 Feb 2024 22:08:09 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7613858064;
	Thu, 15 Feb 2024 22:08:09 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 22/33] fsi: aspeed: Use common master error handler
Date: Thu, 15 Feb 2024 16:07:48 -0600
Message-Id: <20240215220759.976998-23-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 8YXFbKlVAKmhtnmB7Gcf3aK36PmZktfK
X-Proofpoint-ORIG-GUID: 8YXFbKlVAKmhtnmB7Gcf3aK36PmZktfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

This will do the correct mmode manipulation to do the master
reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 92b47bc9917a..ac8835e4d1f8 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -220,27 +220,6 @@ static int opb_readb(struct fsi_master_aspeed *aspeed, uint32_t addr, u8 *out)
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
@@ -271,7 +250,8 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 		goto done;
 	}
 
-	ret = check_errors(aspeed, ret);
+	if (ret == -EIO)
+		fsi_master_error(&aspeed->master, link);
 done:
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	return ret;
@@ -307,7 +287,8 @@ static int aspeed_master_write(struct fsi_master *master, int link,
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


