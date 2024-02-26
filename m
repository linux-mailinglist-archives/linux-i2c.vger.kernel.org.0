Return-Path: <linux-i2c+bounces-1991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00572867D03
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DBCAB26FD2
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF57E131E36;
	Mon, 26 Feb 2024 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LPNqYiu8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD6130E3E;
	Mon, 26 Feb 2024 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966430; cv=none; b=Q0H3xSJJ8wevd5z7zLijLW8+TcgvsqxL7wFta4NdKVRs1MaLetYzSRNbBwm7hufztCjQqgfN+Le+g6DAOOrOH6UYHeIdT0hOpJqr+Fl2fNvYxyMCZRwj3wQ1FZYhzKlE0hRz1GfkmUYKzKkJBNsvC7Zag46/lbRuoYJdTz82WgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966430; c=relaxed/simple;
	bh=8Ct3J2NJkURDInEhDXz003U01AuCHf4/0dNy3zQDeEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VYT+oprFzQdvSQ1n3QsN1kF8bW7A5uCdfU4NgAZOghXiKd8eDuwNQRUcsnbXdsFFDh9hViT7jn8QdY9z7CsbGFsi310qatkgeiKsCGjcyAebPLOEDiYb2XTpuwGZfHel2Z8pEixFXXYPP5UxJS1W7fNlRl4IEU2QMscZgKwNSug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LPNqYiu8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFvHZi020191;
	Mon, 26 Feb 2024 16:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BoYmg2I4Q0k+a3TaU4ABCYR9yHgcAHY+742VsQ7xQZc=;
 b=LPNqYiu8v4vuui8NJwg1Oiq+gOvhZSQmjXBgkNalfpldQtFPs7hYoSQeHSbFMS/NdQJ3
 GawrqV5KkWj+7bipTPTHHLM+7WuiHgSopQjT7xuQ6nc67OF1NYYvfAeHdMP3Pig6wRNA
 pbA23mOkszsG2YRf9T3wWe5pTPmBizWzfDdF93668wdtPYOafp0T6hD9JWAaV8QMiK0R
 MXwAMBX5a4PXAcRzPlZBrk5d9nTXLRkan8SZ2I4W0UHEC6Msv8aa0LvQosTLeOysTue9
 Td3gzG3rxUO7tm5OJTomxrTwJur7uelxEzZi2uYa/CYOqE8wQx9sR2W7JFyaPAUeol21 aA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgwr21p72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:38 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGf4Dh021363;
	Mon, 26 Feb 2024 16:53:37 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfusnteds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:37 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrYmo12321382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:37 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB04158063;
	Mon, 26 Feb 2024 16:53:34 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 244FA58053;
	Mon, 26 Feb 2024 16:53:34 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 15/31] fsi: aspeed: Remove cfam reset sysfs file in error path and remove
Date: Mon, 26 Feb 2024 10:53:05 -0600
Message-Id: <20240226165321.91976-16-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: pHmNCRKo91aVONu_gTw0RVuVuL7Q233i
X-Proofpoint-GUID: pHmNCRKo91aVONu_gTw0RVuVuL7Q233i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=968 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

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


