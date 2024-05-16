Return-Path: <linux-i2c+bounces-3527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A908C7C28
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D95301C20893
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E187C158D94;
	Thu, 16 May 2024 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="a4hg0xmo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DBE15884A;
	Thu, 16 May 2024 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883577; cv=none; b=dr/lRLXXlGq3BXfwfQesPPa03m8MCZwTr4wYytYBVYqfB5jqFLVv4P0YocRm1BHETctNIFvukCc9RoyRA+ulR6+fhTXBnS+v3mCUoT/gzZnACkjQ/phwlK5UfrwlEnzDlWyWkaFSDPBgCc5BSEZuMK+IJrkT7oMeTfysHxqW/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883577; c=relaxed/simple;
	bh=DVlspCvxuZKZN7sDi6C13Fa0sXjsUMSeTdMdoR/Qvy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJpEFbKco4RdRMPoxCIVBolV4/aSuBY7ggj/IzzuOTfRZHnIV2/5csQl7dFkBiu7+NbAeNSGGUcnnprIX/VNeKl7iAs4KpRnCISYyfT54LWL4xYkOfB66tU4u0VoiSlcpO9vaf/7oQ0nhxaKOrOLRp8jI/evZ/DZKliDt7bbAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=a4hg0xmo; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI7tXu018280;
	Thu, 16 May 2024 18:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=11zpQI9xr19rfXGIBfzj6RLCrXVfSzpcD3mn995Pgkw=;
 b=a4hg0xmoyFzVwHFx95sPA/Yam2Dp9xhhS7oDEF1HE1bE6fFrXICcCjU5UqOz71ssU/CM
 PnmBHmA6pwpPE2+ALv28WxCI7WqQtcSA29aORS4S9dJhlXmXxJ/KrQhXoIMUR6Q/iKXe
 QRAlwkbe/jUydh5ePewjS7bpYPmjgRAqxLbxLPxh+TFMSS0Uz3tfOUgNyojSf4x+7aOq
 D/YuqJcrNfzxM0TmK549gDdzkbSHXaA+PRxxaZrO0xHfFjdnxtlzx8/qfXEoUV9WzlRm
 N5VEYKPRrfhCErzNKnlCLxGQl7o2uIjqYpVtKNN9EoTuyUF8P2fktvisy6Rgljdr8U+b qQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q5980n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHOpDg020460;
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd0bmcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJFso6488764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBD915806B;
	Thu, 16 May 2024 18:19:13 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 949305806C;
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
Subject: [PATCH v3 21/40] fsi: aspeed: Disable relative addressing and IPOLL for cfam reset
Date: Thu, 16 May 2024 13:18:48 -0500
Message-Id: <20240516181907.3468796-22-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: a0IpH0r8sFKR0FQONajJF4wBJ4GOZgkk
X-Proofpoint-ORIG-GUID: a0IpH0r8sFKR0FQONajJF4wBJ4GOZgkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=725 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Need to disable these for the master reset after cfam reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 176e596b4391b..c9f6d84e1a372 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -402,11 +402,18 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 
 	trace_fsi_master_aspeed_cfam_reset(true);
 	spin_lock_irqsave(&aspeed->lock, flags);
+
+	regmap_write(aspeed->master.map, FSI_MMODE,
+		     aspeed->master.mmode & ~(FSI_MMODE_EIP | FSI_MMODE_RELA));
+
 	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
 	udelay(900);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
 	udelay(900);
+
 	regmap_write(aspeed->master.map, FSI_MRESP0, FSI_MRESP_RST_ALL_MASTER);
+	regmap_write(aspeed->master.map, FSI_MMODE, aspeed->master.mmode);
+
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	trace_fsi_master_aspeed_cfam_reset(false);
 
-- 
2.39.3


