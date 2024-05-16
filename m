Return-Path: <linux-i2c+bounces-3533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3518C7C3C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36B7E1F21474
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D1B15B150;
	Thu, 16 May 2024 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CBpF0bfq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8638158D96;
	Thu, 16 May 2024 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883579; cv=none; b=Eg6+YI6fvw23YBNe7VH7AUkVusGcC/K0PyxZlo2ongXzXf6pPOGzjbA1YuppS84ojaWhWC7lkwF7m5zoSlgQBl9tct/umfH/GAGgfSXKBev0EFMS3z5RaHOeWONoFrnVzsIkOYTVGVpzy3AZ1SL2mhSNOZZO44zrPbyTroYY3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883579; c=relaxed/simple;
	bh=Go/Sw2mfEMY8QsnrCy8Zm/3ksaghSmu3WnFOYYCPdrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/FBz5aii2v3s5OiFu81Ysi20sSqhMI5FbYWKuXV/SIXowlW8a82HhQVVE8UKPy33h0xrUUW+CH/CuQz+782TRCJLaDD3mHrAo1a3JQ/zfS6rfiYPO6LVPZfuCvv63JZI3R1CCkUhPMT19zN12d8CSAtVUbUCGRJ428uYWb87aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CBpF0bfq; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGGhsV017307;
	Thu, 16 May 2024 18:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VVh0pOteeIri9qqbCA+sDhPXPbv1rTPqRDlFd5iwUgU=;
 b=CBpF0bfq14Bidhp2u9USoXYqO32AsN5P4l6L1UXf44LnWOXNYObxr8i4XW5VDzB//2BT
 bVPCfW4cj8XDufo45+2ZLx6/eak1t2H52FLL8pT0k2gNHqSb9Jadcbk3JaW5BNL/0cy1
 RV5FqESr2ZJIPq2yCGyGwcVIYPiBVCn+XxVoGoc4uRrBS614rcbWy8GY/H4xdS77i3KM
 Tm2I3JLqcD4rF4UlZvm6vb/mS6h0YFIBgyf7ka6FO2Wob9fVATUWHN1x8zrZowSGP85t
 WlJwJwfeHq9yqdadr7AD0EyDhZ9WughihlOXMeK10ytK42UMCQkRySm5kKx8mHn1zRi0 4g== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5g6jh6u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHGL9l020367;
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd0bmcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJGs547186520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8341C58070;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44C2758077;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 30/40] i2c: fsi: Define a function to check status error bits
Date: Thu, 16 May 2024 13:18:57 -0500
Message-Id: <20240516181907.3468796-31-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: l4qsawXBH5DZE4kPrPiIerJHHxTa_PJ2
X-Proofpoint-GUID: l4qsawXBH5DZE4kPrPiIerJHHxTa_PJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxlogscore=915 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

This will be used more than once with interrupt support, so split
the error bit checks into a function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 38 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index f3b97bf88d0f9..022f1287aa0e3 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -507,6 +507,26 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 	return -ETIMEDOUT;
 }
 
+static int fsi_i2c_error_status_to_rc(u32 status)
+{
+	if (status & I2C_STAT_INV_CMD)
+		return -EINVAL;
+
+	if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN | I2C_STAT_BE_ACCESS))
+		return -EPROTO;
+
+	if (status & I2C_STAT_NACK)
+		return -ENXIO;
+
+	if (status & I2C_STAT_LOST_ARB)
+		return -EAGAIN;
+
+	if (status & I2C_STAT_STOP_ERR)
+		return -EBADMSG;
+
+	return -EIO;
+}
+
 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 				 struct i2c_msg *msg, u32 status)
 {
@@ -518,23 +538,7 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 		if (rc)
 			return rc;
 
-		if (status & I2C_STAT_INV_CMD)
-			return -EINVAL;
-
-		if (status & (I2C_STAT_PARITY | I2C_STAT_BE_OVERRUN |
-		    I2C_STAT_BE_ACCESS))
-			return -EPROTO;
-
-		if (status & I2C_STAT_NACK)
-			return -ENXIO;
-
-		if (status & I2C_STAT_LOST_ARB)
-			return -EAGAIN;
-
-		if (status & I2C_STAT_STOP_ERR)
-			return -EBADMSG;
-
-		return -EIO;
+		return fsi_i2c_error_status_to_rc(status);
 	}
 
 	if (status & I2C_STAT_DAT_REQ) {
-- 
2.39.3


