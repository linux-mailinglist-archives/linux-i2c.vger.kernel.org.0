Return-Path: <linux-i2c+bounces-3539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C28C7C59
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA0728177E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAB115EFAD;
	Thu, 16 May 2024 18:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nVUma1ij"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525815ECCD;
	Thu, 16 May 2024 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883588; cv=none; b=mRy7gi29YUNE9i4mJIyFc8fK1O9BXk+2fHqGR5J+iTykcfwvmoqaUr8g8O66N+m1AaHglu84Gky2dMma2nQVGugoxxyt1DeoIpx9/+vW/p2GlFSRNMgASWFAKiyejYADqhoyYsHYakRoRbXKpqSDw3JKfp/srNq2nxBV4QCvHxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883588; c=relaxed/simple;
	bh=R8kfSOGnIrv271rmukmsk0724R5JFYbq2WSrn+gmnEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chm1Ja9CnePheqE95J/POfXLA2K20DtOT5DA4pprFiWumncJzzyabh0ysu79VYvP/M5iTQMh4cW3ZYA6Onnpaz+zW30+Yw6dsBg/iQB+ORBFuLpTI/4sO4OUUSV0oc78x5+lgTPIpqUxcRU4/HVpy6DnaFCRXXke0m1/+IAEruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nVUma1ij; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHc1KK010912;
	Thu, 16 May 2024 18:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZC7HnfyHXbwd7VWU1F8seLX5ZR6fsIL25JIyeogTRXM=;
 b=nVUma1ij5cGidjjt05EOxmpZVJwe5pSrz9fm9Brq4MX4S2v0haE6Qjz4fz3D3Uxu8ISx
 lbNewkfpl8IGqI1m7DmM1X/euv7CmS1D4PFOvzH0xrWSLAE8lo31fHoVRSWUOHuNZ59h
 cNx2YFuJtsOs5sHfMQUSCryR46Acobq0thliYFnFCvyrVyX0kX7iQ4zQZGOl+nFR0hgD
 +VRoydLMEfUANWMwFSOwwzpuypbNlw9lsS1idLnckHWhvQIMALNCcIKOswKYzgVIOLxs
 +bY5vttkgSAVjOdh54vIZsIy1Q8DW3+TmBsLLcGJPoD5GD9gzyWIKmxflHwbXFRK6BwD bQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pq5r36b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GFVnDw029571;
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m34mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJIHR23724566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:20 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 587ED58068;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 107F75806A;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 36/40] fsi: i2cr: Adjust virtual CFAM ID to match Odyssey chip
Date: Thu, 16 May 2024 13:19:03 -0500
Message-Id: <20240516181907.3468796-37-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: KT-Gr733a-CMLZ2zRrfFUMS4dqD5j0SW
X-Proofpoint-ORIG-GUID: KT-Gr733a-CMLZ2zRrfFUMS4dqD5j0SW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=870 priorityscore=1501 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

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


