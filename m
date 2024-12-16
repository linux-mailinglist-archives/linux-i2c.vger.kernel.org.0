Return-Path: <linux-i2c+bounces-8535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995E9F37ED
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DE3C167642
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38C6207641;
	Mon, 16 Dec 2024 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hIlpDmBo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B73206F17;
	Mon, 16 Dec 2024 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371489; cv=none; b=hPjD6wNQuFWEaHn65m1PzeRvFQMTqBBlrXNY9/zjfC9tBjM0XYakU3NwkZOq57AFbDUrGUl3mDKZqWyFxX9UkkJD8u/ohkZbi/gNVHXONfLTVcmq1jBBmkdkzn9xBxGsv7dZzg6ylCWEjOye27EwRosTKAXhtHQa0nodvkHZ+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371489; c=relaxed/simple;
	bh=u2UOHJSHr66xoPKDC3Lf0TWe6yPspuuHr0QQ24/UwF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0PstoP1b6ZzhQ0Rhj+1xkJj8NdMVhIcJcAz4z8F9mP9+CGp7JoCIH5Lzt3j6hHXR4yNYIC0ul8M1qryGccpBlv0JnJwvH+UNkGuaNlq2TQDaWBmJsmwG23Gnmzt1R335WyhPKDOJdESZiL0mA7m7dbI5IonWbY36f595xyJuM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hIlpDmBo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEVveB022778;
	Mon, 16 Dec 2024 17:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AsDAqIMu5OeVPY661
	bWbJiymnpLSWD2TsLjT9CDADno=; b=hIlpDmBodynyFGK6V9frB/+XjVu6DWEgf
	R52LjDRUXSyJQLFRhq3eM+/bEE7c92OOBqxxa2MX2RChx+32PFfKMBqFvXL7D6Aw
	jZBarbkcvOMIe66+KbBx1QL/woCLoLnsHc2srNQFsmc8v5s4cCIFqHMo26q7eRR9
	cmoFaSjTrS1LnXVM+XUvfVlB6gTauOCbFAwrbRH51TWsYuYTC7nahDVa07w7qC3v
	2GWt4tkRHGm6inGfSAr4Sduk2qL1CVugEdmvWiXIL/N9EXan6d2sb0ezCFea0FlP
	2Bc4NhBGH7UYEsxvfXJXr3s7p86oKYQaD4TT3ZYhzxHbURV5AuXpw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpguwrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGHooWY032297;
	Mon, 16 Dec 2024 17:50:50 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpguwrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGFd2EP014383;
	Mon, 16 Dec 2024 17:50:49 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq21enwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:50:49 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGHolHO13697638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 17:50:47 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5072658061;
	Mon, 16 Dec 2024 17:50:47 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F395D5805A;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 17:50:46 +0000 (GMT)
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
Subject: [PATCH v2 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Date: Mon, 16 Dec 2024 11:50:39 -0600
Message-ID: <20241216175044.4144442-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216175044.4144442-1-ninad@linux.ibm.com>
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: khMEGGYchnDn0ryiujH5xPagk6j092gg
X-Proofpoint-ORIG-GUID: S-Pi4RVXgWybTRV7czs61N0F7xJiPf3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160146

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


