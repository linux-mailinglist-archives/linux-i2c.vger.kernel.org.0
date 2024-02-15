Return-Path: <linux-i2c+bounces-1791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 842EB857025
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D4EA1C217DE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C775814C5A2;
	Thu, 15 Feb 2024 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aUpU1rEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F0A14901C;
	Thu, 15 Feb 2024 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034912; cv=none; b=C+XKjCcIFNFWaLnKVn4jZ4fukIPFoq1Hpo9nkTilDLtVVjgWBU5Oe5kmqunxEZNJI48cKtaRQ/UNRa7rcnSoHRsq9ZLTrWMFHXLjXK1xg4mpC0CFmwzx9Z5x8xks5F4ZhleseEQpxd9xJqEt4FMH53J6SP/v5blVH6jAEBGyQnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034912; c=relaxed/simple;
	bh=H95OXKDiOnZPDBQirsADlzhMc6VAfrwQDtpLN9WMyRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O5p6ZwqAGCuIPzIazchOACipHOThkCB7jgjR+dC/tB3ssn4FZtADjHjO5043FM8uIzEt33T9anm0x6eLTZStkM0oryOX6AEaLQlPpW+YNB4AfVD/K+05iEQHX5wLxDjNwb8F88YZvJLZLQmZS6bjOeIVbzXwa1td6VK+F1+1rv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aUpU1rEt; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLPhFN030019;
	Thu, 15 Feb 2024 22:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VTP7z+tQ2W8GOsBuCAI+ahfXY5pZN8Q0NRIJ8nxWHJo=;
 b=aUpU1rEt26Ixm4wuXt4ARN+OBDwsdN/LfQSQmCjbUGrD7xkBj1r3W4JOTRYmcDLBk4mO
 ePXHlLuflhKQM2YVaTdAa6Oaj+G2F16rpmIAtMW3Tj4ttagB+tgfHMoO5coEKWU0DlN6
 jGXFtz66GZ2G4cmPHLnKZZ7gUSt7rjj+3trXLQgJ0zOb2XFlwfWmvGyX9BBN6T22p4s7
 rmFg34JIab+F97yEj+Zp+vctoGY5RezhF/IoqZAoDLXxEEFLN3WMSQBf5tmz8EpYX06e
 nHWRH71YsqStw/oSWVoEl/PDijUbQXHhZVOlnPXdN1oKuU/YPYzR5Evl7MNux1PJQSXt UQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9s0tjy8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJBGLv004329;
	Thu, 15 Feb 2024 22:08:17 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0qtng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:16 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8ED815729300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:16 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE14158073;
	Thu, 15 Feb 2024 22:08:12 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9371E58064;
	Thu, 15 Feb 2024 22:08:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 31/33] i2c: fsi: Define a function to check status error bits
Date: Thu, 15 Feb 2024 16:07:57 -0600
Message-Id: <20240215220759.976998-32-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: HJ1k8QJcGw75HAqAiCnMmu28CeQrKR_Y
X-Proofpoint-ORIG-GUID: HJ1k8QJcGw75HAqAiCnMmu28CeQrKR_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=928 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

This will be used more than once with interrupt support, so split
the error bit checks into a function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 38 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 096dc7e2369f..5f524fb6f0f8 100644
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


