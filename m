Return-Path: <linux-i2c+bounces-3317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCABE8B6432
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6651C21064
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9AC18132E;
	Mon, 29 Apr 2024 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i2wP4CF9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6064E18130B;
	Mon, 29 Apr 2024 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424522; cv=none; b=aTCJS8537Dd/WAe0/iK7PxKCZV8CWaPtSJ4jl55p8/zoDhS0382vlUmUa/6ltU8bPDcTKUz+S4hfres3RqZX8GlIi+8GKFK0XKxXbxIOS30UICVpv5ocTTyXjT6tCHmrGXYvbAvhVMGaD17YpIIafl52f/4mNDgg+6kxEjxA1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424522; c=relaxed/simple;
	bh=of1Dij3+j9k3xvXT8A7Xb/AaiDrd1HEvh/VHm4CwrZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E0LzZnwVtC8oJlcWf5lMksFTXMHLGEQJaNgpQTjzgGM/ZLGbDCFpkORZBsihZ1KDpsw4Rnk6Xlq5Y5qmNFxLzlto86jvt/1C3DSbMrbfOnTa+MC5aR27/XgSpy3XxZIIR4wf5e9MVgqOD/ZYSlJoh599eLojpxzyM5VgJwzewGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i2wP4CF9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKmxv1017139;
	Mon, 29 Apr 2024 21:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1gAEgtVC01rUBK9rzK9y84u+EoF7UresFf2yhNVvcfY=;
 b=i2wP4CF9C3R2pobJqFb1lkzW/YMev10ak9GkqE98pMXBtN75eHe5Tzh13bONobgAU6cw
 gF2njZTboJF7B0hCMq7gA64xe01wJquhwKJ2NX75Gv05BrlCKMM3OQvLESZFtFkQE503
 1z9vxX1v0Dj5MHHkj5NF1bONjEO72ryEkAMMib+j78MoULwtsW2h906arKRqBs0QMbA0
 4hm5xQ+5Yt38NTpXa3+WSjqvUkAhNt22qtfQr2Tl4njJPgijEqaw+dmgwJGXD0nYh/Z0
 MWuIJErkjRlTnh4tnbCWAHdCBTjQiuEVYjPYUBSOd0nyO2IqsOm4H+QXIpmj3sfnnRly fw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjw101ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:52 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43THheLx027584;
	Mon, 29 Apr 2024 21:01:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsc309nqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1mLc44564806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:50 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E090858063;
	Mon, 29 Apr 2024 21:01:47 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 209625804B;
	Mon, 29 Apr 2024 21:01:47 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:47 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 17/17] fsi: scom: Update compatible string to match documentation
Date: Mon, 29 Apr 2024 16:01:31 -0500
Message-Id: <20240429210131.373487-18-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QBJO7x9uAUkPeR4E79XKqbxs5R1fjFU9
X-Proofpoint-GUID: QBJO7x9uAUkPeR4E79XKqbxs5R1fjFU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Use p9-scom instead of fsi2pib.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-scom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 61dbda9dbe2b..18ca213fdc7e 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -589,7 +589,7 @@ static int scom_remove(struct device *dev)
 }
 
 static const struct of_device_id scom_of_ids[] = {
-	{ .compatible = "ibm,fsi2pib" },
+	{ .compatible = "ibm,p9-scom" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, scom_of_ids);
-- 
2.39.3


