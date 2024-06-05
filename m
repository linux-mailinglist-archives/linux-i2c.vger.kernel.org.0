Return-Path: <linux-i2c+bounces-3873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31858FD8DF
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33228288FE9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A361017F4E9;
	Wed,  5 Jun 2024 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qmEeshXr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B016C6B3;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622627; cv=none; b=pjdPkuKyPIerVRQ6ZOrxfokQrS7/iVWjA4WmifDCQiV7wM8yAnCvh51D+PTePWwmHNupfODB2KbsWkkc2eynGgMPTj7SBaTob4K5/MZrKDGI4c/8823jTo/XA/IcYWox7jBrgxLroNSZAE0PPM6plB1v24SyPSMLxXgKrTq2fHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622627; c=relaxed/simple;
	bh=R8kfSOGnIrv271rmukmsk0724R5JFYbq2WSrn+gmnEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O4o/dIDChl4qJ6Gru++P1RNjCDqvP3Fhc0BBGPY0KNKfer58zCPS1tYuZVf8/MPQRwFkuN3YU5cGAcsbLfCqcwyuxnpFP5UpvgSBTRnNxuo2uaAgpgXCPwR5MaAy2wFXHAaUry3qUaACrKEdBV7t4Dg5Pv0oWypFmrDyuOcwJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qmEeshXr; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LBooK011894;
	Wed, 5 Jun 2024 21:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=ZC7HnfyHXbwd7VWU1F8seLX5ZR6fsIL25JIyeogTRXM=;
 b=qmEeshXr7URZ2+lbu7EdCLysiHc3JOjmm8AixjQgkFKHOA73kjH5fQ0JW9hHiJ1iaqKD
 6hoYxcWS/RRMhF1U+cblXZHNUXo/h2eJ1M9doTPye9DRcXxpy09Y+xEXSjWpoH2O588u
 GCknrE1kLuoBdRPpfSoa039LJ6DFzoXkrKF+jrEvzFOPu3yuZeGpZXvw7xmL7RNN185R
 Y9fQltKG/S0M1zaMRizkZlwT2wPiHRVEh+MsK8xrolCZ3s8Cc/Ba/PohqXNWeoj8hNHh
 VtyahXuU8Gcpj3xfAgkdo95CnfuEVoS2f0DxSYmpGTeoe3A8yp9KRxAxGN/5xEARH7e8 EA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjyqf00ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:28 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JOb5T026899;
	Wed, 5 Jun 2024 21:23:27 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygffn6hjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:27 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNO0l41288270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:26 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3841858066;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6C5558060;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 36/40] fsi: i2cr: Adjust virtual CFAM ID to match Odyssey chip
Date: Wed,  5 Jun 2024 16:23:08 -0500
Message-Id: <20240605212312.349188-37-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: DsH2nPR5Oj99-N18TNLN9fOXaMSyNBrS
X-Proofpoint-ORIG-GUID: DsH2nPR5Oj99-N18TNLN9fOXaMSyNBrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=875 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406050160

The CFAM ID for the I2CR should be the same as the Odyssey chip.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-i2cr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e52..c032ba7938815 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -22,7 +22,7 @@
 #define I2CR_LOG_CMD		0x60008
 
 static const u8 i2cr_cfam[] = {
-	0xc0, 0x02, 0x0d, 0xa6,
+	0xc0, 0x01, 0x0c, 0x07,
 	0x80, 0x01, 0x10, 0x02,
 	0x80, 0x01, 0x10, 0x02,
 	0x80, 0x01, 0x10, 0x02,
-- 
2.39.3


