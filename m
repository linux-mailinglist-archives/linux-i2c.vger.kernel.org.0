Return-Path: <linux-i2c+bounces-3847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA98FD87E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12FFAB240E3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6B2161900;
	Wed,  5 Jun 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PW3C6R6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1115FA9D;
	Wed,  5 Jun 2024 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622619; cv=none; b=tKRX05HtX9tY+HDo/OJVsCEY/2mHcLiQCsYLclvZ0AYARn+OiQ7gDKNMYhaWaDnEc8KhFM3GTazeNIXz8Af3Or5tIVBsaXQmGIip4MHdrRzIQQucI8yTuFgVnAS6hs5+1z1qfUKJOUsXh5QXhRTx9JUwu1WYjyh0zNIFIcGaCKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622619; c=relaxed/simple;
	bh=Swf2Z4ryMSe76Fjjb/WLkycWDTYlW+M1urBDzu+MZ0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kQwlfySYE9paujfV9JEDNhImd+ACN80H+TVv2/jP30P0QZgCnNyGoWIZRbg8wgPlSUMIFdhJJwUU8JS/KWBNaR1JIj+SHFHa5yiBUWYmQleKFXQSV1xcz9o+FY2kOjeQpQ6OhcJON3wQyXbWnhAzdnrmUiqKX4DP3ZZXVbyYclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PW3C6R6z; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KGrYe025968;
	Wed, 5 Jun 2024 21:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=oRnjoXt2wGckRRsoBzamYSAQD+OnLvBQnzT8NTydriU=;
 b=PW3C6R6zgrYjyuDqRF22k/Rtf7i1l8x9FrRr8eivRVv8yeYP6+TaiIYxhqYW8J0fgvv9
 zKxffSOp3JGCiZnpNRXeO6dIQ8ISVaBJvFIAmtulYOz8ZHFD/hM8BSNL5AZc4mbIxIS4
 956x+IW3Y0jLFJRk2sPIM2oa4OKde3kCiyM3azpm0z6Mqnu6IY6c8S2AJ5D/Q/7nmze0
 VE323Bybb7ALCOVLJPhVdvyJsFcwKjK5fP6rX+p6JKyBSr6mXg8TFjmvl6fVtdvkI6aV
 1VyEhgkIcJfw54vCYACX+nRYL7jw6dwyWrdGirGKcC82/hGJ6DD8MAvppQDchvDX7T1w gQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxbg09vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:22 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IHPPd008474;
	Wed, 5 Jun 2024 21:23:21 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:21 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNIO631719802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:20 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67AAD58068;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 205A95806B;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 16/40] fsi: aspeed: Remove cfam reset sysfs file in error path and remove
Date: Wed,  5 Jun 2024 16:22:48 -0500
Message-Id: <20240605212312.349188-17-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: fNwpJIwHES13TfJJgCozSElpqmyvA-E1
X-Proofpoint-ORIG-GUID: fNwpJIwHES13TfJJgCozSElpqmyvA-E1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=930 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

This fixes a duplicate sysfs warning on device re-probe.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index a67f185bb8814..29932037c9866 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -437,6 +437,7 @@ static int setup_cfam_reset(struct fsi_master_aspeed *aspeed)
 
 	rc = device_create_file(dev, &dev_attr_cfam_reset);
 	if (rc) {
+		aspeed->cfam_reset_gpio = NULL;
 		devm_gpiod_put(dev, gpio);
 		return rc;
 	}
@@ -615,6 +616,9 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 err_regmap:
 	regmap_exit(aspeed->master.map);
 err_release:
+	if (aspeed->cfam_reset_gpio)
+		device_remove_file(aspeed->dev, &dev_attr_cfam_reset);
+
 	clk_disable_unprepare(aspeed->clk);
 err_free_aspeed:
 	kfree(aspeed);
@@ -625,6 +629,9 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed = platform_get_drvdata(pdev);
 
+	if (aspeed->cfam_reset_gpio)
+		device_remove_file(aspeed->dev, &dev_attr_cfam_reset);
+
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
 
-- 
2.39.3


