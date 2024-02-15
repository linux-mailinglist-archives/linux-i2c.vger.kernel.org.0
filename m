Return-Path: <linux-i2c+bounces-1785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9785700D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E6611F23B02
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29473148FF3;
	Thu, 15 Feb 2024 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nPxhchfI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A32D146916;
	Thu, 15 Feb 2024 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034909; cv=none; b=JNK9L7nzEw6XLpDPXAZezhyHhU3+b9aL86vV8zr+xjBUNxP8gQL6onWPel1od3UFz5Bl/egAAyx+3CEqlyiX8a1X2yN4y5/hhbINY8HCT9pwxRmDxaj0VKfZCwC2nRbDnM179wM9GZ2aLE7mabGa6qMsT1plLAmYxz0K8NQTFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034909; c=relaxed/simple;
	bh=8Ct3J2NJkURDInEhDXz003U01AuCHf4/0dNy3zQDeEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTG8Qdics8WvlvDRSIdzMtTgtEXj+Jz3kgGZ31uo3jfLnd5ri6nagIyud63j7Q2FAmMEADt76T7L8sA0ebiXjimSwosIizt7AYdymphyP27EfP3H4QESsQx4rgwQ92wt1KL0nMZfDFWOSSTSzyFU1m0QsM4SO/3l8Pvu1sXcWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nPxhchfI; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0XVx017942;
	Thu, 15 Feb 2024 22:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BoYmg2I4Q0k+a3TaU4ABCYR9yHgcAHY+742VsQ7xQZc=;
 b=nPxhchfIkH2wViv3C6u2zH7XROEw2xoNVuvA1hfEIUgA6YNhtxmyn2aPdaWwz0y/p+6/
 exuQw+XJIfY5FTTsqclVIPSsqc2LlcV83hijqHh0OWcf0OY2SQem6X3vOM0eVA4JQb6E
 UtFU5860C3jCIHl9MquvZcAzOj5T+Q99m69mKygTDdl74XoScKjKsJ835LBR9WJsq59U
 rHr9qyq54eAnQVkIlK2XTzzq0aG4uv+zaae1dn3JK8zxlQZ6N6nfZZl9l8TSSS+V8PpC
 g3IumJvERLjqTyWbY2OUzWUD0TbVhqjySimU1mV4V7YmOGlv9B8NS3MI27kAyn9XfN9T 5Q== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg6ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:12 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJfrBX016479;
	Thu, 15 Feb 2024 22:08:12 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mymyhcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM89ED64815402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD99F58073;
	Thu, 15 Feb 2024 22:08:07 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5941C58078;
	Thu, 15 Feb 2024 22:08:07 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:07 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 16/33] fsi: aspeed: Remove cfam reset sysfs file in error path and remove
Date: Thu, 15 Feb 2024 16:07:42 -0600
Message-Id: <20240215220759.976998-17-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: lWmY2azHfseoGHZSM51FysPjP0lIPbJt
X-Proofpoint-ORIG-GUID: lWmY2azHfseoGHZSM51FysPjP0lIPbJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=931 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

This fixes a duplicate sysfs warning on device re-probe.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 2258980e4c47..c36e7e49e965 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -410,6 +410,7 @@ static int setup_cfam_reset(struct fsi_master_aspeed *aspeed)
 
 	rc = device_create_file(dev, &dev_attr_cfam_reset);
 	if (rc) {
+		aspeed->cfam_reset_gpio = NULL;
 		devm_gpiod_put(dev, gpio);
 		return rc;
 	}
@@ -575,6 +576,9 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 err_regmap:
 	regmap_exit(aspeed->master.map);
 err_release:
+	if (aspeed->cfam_reset_gpio)
+		device_remove_file(aspeed->dev, &dev_attr_cfam_reset);
+
 	clk_disable_unprepare(aspeed->clk);
 err_free_aspeed:
 	kfree(aspeed);
@@ -585,6 +589,9 @@ static int fsi_master_aspeed_remove(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed = platform_get_drvdata(pdev);
 
+	if (aspeed->cfam_reset_gpio)
+		device_remove_file(aspeed->dev, &dev_attr_cfam_reset);
+
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
 
-- 
2.39.3


