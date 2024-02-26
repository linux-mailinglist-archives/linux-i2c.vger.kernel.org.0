Return-Path: <linux-i2c+bounces-1998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D831E867D24
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A5641F2A6DB
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B686B13474D;
	Mon, 26 Feb 2024 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lCnn4JOb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CA13342E;
	Mon, 26 Feb 2024 16:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966437; cv=none; b=rTNZjtNg7jT1h80j/TBXb8biwTZWe+Yyl5vHaw7KHYoxoHZjnrevuojuIKMZa5NkEP0udapEv2qV3kzbPRxzpTFfHWlCOU3jUNtuMaoLxXGNhKc8QTu2EvZ+pdmNZsjbRXF0EQx7Yiq5xGX4pWachvQBHl1NZEm9YF3aT3kbBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966437; c=relaxed/simple;
	bh=kx+oOcwZGizk7pnn1u+NW+Z8JFTuM9vEKXNINaOBa4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BwRzmy0sg1UA3q+x3xhNkwnKtXwQ5RppcRk4qa53pQUFxzXPpfFYNdBlVRoHW5hhogTesDjPeGBU2hUw6RUg+JiOFq/y78KZWq8oTb1703/Q3nt6uIigBtd9ygKOSTtO5gSle8eYLXr9OqgwWk9ErdoyIFqNuCbqxGzshVWR+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lCnn4JOb; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGEXD9012349;
	Mon, 26 Feb 2024 16:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5LerAFfyndDwaim6ezZwBkxBwQM30xrAj4RWbdAGWGI=;
 b=lCnn4JObgXudDKMdFhIUwt6ueBTgNxd0zerZTR5wRK08NSaVOx1nYc95RDK9BpHLoEE1
 koz9Vcj+OCfi4ikdlVvo4ORNFWwII049iyQDEax3H1AjHZVWzER33QMUujXqCfzEm3FA
 SIDl3zuIos65WGEQh3ayVPo9BcvdD1bIp53P7HbUtYghgqyTZWrIobDFpb1QeV6eLU+U
 FrunEn89rynW951Mzcb3m9u9LRpd7W1vwAUqgoH+8xX1LU/hfim9saEyfnojzWggrxKX
 1vIWLmXuO4agmt995mMvROlMcidpv1TuGEc48JJ0CfeWCu6ZAvcCwyYKMGhHbykdY/oC 5w== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgvp6bkc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:43 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGFrrA021762;
	Mon, 26 Feb 2024 16:53:41 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu5ytkrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:41 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrd5Z17105472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:41 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E53A75806A;
	Mon, 26 Feb 2024 16:53:38 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DEED58053;
	Mon, 26 Feb 2024 16:53:38 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:38 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 20/31] fsi: aspeed: Disable relative addressing and IPOLL for cfam reset
Date: Mon, 26 Feb 2024 10:53:10 -0600
Message-Id: <20240226165321.91976-21-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: fvJmaLB3_uTR0ayp6d5k-picsIkscZzx
X-Proofpoint-GUID: fvJmaLB3_uTR0ayp6d5k-picsIkscZzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 mlxlogscore=812 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402260128

Need to disable these for the master reset after cfam reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 1cb5bf6c05d2..92b47bc9917a 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -375,11 +375,18 @@ static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *att
 
 	trace_fsi_master_aspeed_cfam_reset(true);
 	spin_lock_irqsave(&aspeed->lock, flags);
+
+	opb_writel(aspeed, ctrl_base + FSI_MMODE,
+		   cpu_to_be32(aspeed->master.mmode & ~(FSI_MMODE_EIP | FSI_MMODE_RELA)));
+
 	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
 	udelay(900);
 	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
 	udelay(900);
+
 	opb_writel(aspeed, ctrl_base + FSI_MRESP0, cpu_to_be32(FSI_MRESP_RST_ALL_MASTER));
+	opb_writel(aspeed, ctrl_base + FSI_MMODE, cpu_to_be32(aspeed->master.mmode));
+
 	spin_unlock_irqrestore(&aspeed->lock, flags);
 	trace_fsi_master_aspeed_cfam_reset(false);
 
-- 
2.39.3


