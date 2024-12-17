Return-Path: <linux-i2c+bounces-8575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFE9F54B5
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 18:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBEC81890B19
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 17:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DABF1FA829;
	Tue, 17 Dec 2024 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="e2AhTXhB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9E71F76BB;
	Tue, 17 Dec 2024 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456987; cv=none; b=YbMPVSYUTeqLC054+GGgSRcz9Khx77YNUzQpuHHRFfgmAc3JqyZiVm/3wzovaKZ2RW8qwEADvGy9hIFYpa+bGdl2NMSYzk1x2pdXyaaJA2t/6UJ/zE5EZkEc3RpvKeVUm8ray2qhmiSbvtBPuvdY5OaXaiufg9WBI5h1ZpdE53I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456987; c=relaxed/simple;
	bh=u2UOHJSHr66xoPKDC3Lf0TWe6yPspuuHr0QQ24/UwF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJQOLrLgGZTeUMPiynUpNldwrFVQW4W3AgKw95BIQ5OBVIewFtR9H2Lrqlixm7DfpPmsytLR0V1K6/GhamNZ7N8b110psOImIQsgQ4yTwESu53OXyyx28vDn5fWwfQfH9nN+LgpTYBP09EW+4fF2NYhW/T3J8ps+n72OtuN82PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=e2AhTXhB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHBcDKu022754;
	Tue, 17 Dec 2024 17:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AsDAqIMu5OeVPY661
	bWbJiymnpLSWD2TsLjT9CDADno=; b=e2AhTXhBhLwCnRi+xRjkHA1TaIhoqksvg
	pSd7FLPJAcP2K9VuQQkJ1sTXIE/UlQcwm6dgjvu38gAwMZhG9K6ywSUtvYVLqcIi
	yEdyq+RbObVPrjMFT5RTaHi8b26cMMKe50lDd6KcYsE9GV+AmZM4tQhXJIxxVl8B
	k6po3jBr5j4afJMM98YHWJ4F0cJSpzk9xwik0KKM6NbeQi261h3jcinzhfvTlqUz
	qXsEQJTfBoA9x1gPZ+Mv5VtyFpby3sbrjp/r+hkb/e8H9vitcpSt8mkLi8tr/+DX
	HocCc12wmKc8ZA+zBT3fe5c1lInFF4PuGuFJxKRH4LJ18vRdTr/zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1aca38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:45 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BHHRkiJ018330;
	Tue, 17 Dec 2024 17:35:45 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1aca34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:44 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHGYQ8i011249;
	Tue, 17 Dec 2024 17:35:44 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjk3mgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:35:44 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BHHZg1v23069280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 17:35:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 899875805B;
	Tue, 17 Dec 2024 17:35:42 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31FD258059;
	Tue, 17 Dec 2024 17:35:41 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 17:35:41 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH v4 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Date: Tue, 17 Dec 2024 11:35:32 -0600
Message-ID: <20241217173537.192331-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217173537.192331-1-ninad@linux.ibm.com>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dAVpGb43ClkFPkFzSqn7Amn5bG_ncalO
X-Proofpoint-ORIG-GUID: 4ejMuqT-KTwgGAZbM4ALmY5Fw4xza5Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170134

Add debugfs file for the PMBUS_REVISION command. This command provides
information about PMBus protocol revision number.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index a7000314e5ad..787683e83db6 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3534,11 +3534,11 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 
 	/*
 	 * Allocate the max possible entries we need.
-	 * 6 entries device-specific
+	 * 7 entries device-specific
 	 * 10 entries page-specific
 	 */
 	entries = devm_kcalloc(data->dev,
-			       6 + data->info->pages * 10, sizeof(*entries),
+			       7 + data->info->pages * 10, sizeof(*entries),
 			       GFP_KERNEL);
 	if (!entries)
 		return -ENOMEM;
@@ -3551,6 +3551,15 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * assume that values of the following registers are the same for all
 	 * pages and report values only for page 0.
 	 */
+	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
+		entries[idx].client = client;
+		entries[idx].page = 0;
+		entries[idx].reg = PMBUS_REVISION;
+		debugfs_create_file("revision", 0444, data->debugfs,
+				    &entries[idx++],
+				    &pmbus_debugfs_ops);
+	}
+
 	if (pmbus_check_block_register(client, 0, PMBUS_MFR_ID)) {
 		entries[idx].client = client;
 		entries[idx].page = 0;
-- 
2.43.0


