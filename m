Return-Path: <linux-i2c+bounces-3323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC348B6474
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06A351F225DB
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9767D181D12;
	Mon, 29 Apr 2024 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OL9HWZki"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3F181CF3;
	Mon, 29 Apr 2024 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714425522; cv=none; b=Wmec7BXn+431ZtFFKW481pgFpLFCQ4M1V+LATF1+PuyFnU/YpbGue+3rgdsgNoxGQyjHyBzpUGaMEra3xGmXF0TrqARi5P7/DfGHfYb3+nOLfeWtiVWNVIcnsuRXCy3j0dvrFH+hHHo9AcSB3g1v5bcMyRlWpOmaHF5CKMKERUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714425522; c=relaxed/simple;
	bh=ESIhUM0Me2la+2/P2WPSmXeUM6PKTqZO50yn8kA+1E4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FU8TE1FV5ZkJySLvrsWMp4K3kNQ1i5ymGWiB3osyEg+RhEm7A7XGUkmQx6Grf8zt5AiV7f3Wm6ZvkW3q6BM+TA9g/JF+BTsgpJCyTj4y0+vf+vsBrkvWyGM4KCn8BqIy+01vR7YdReY4CglWyWeXl8iwvyk5aZuSuk1tAG8+UK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OL9HWZki; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TLHuae018385;
	Mon, 29 Apr 2024 21:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nC+cB5yrNkvDyUeFXe6XTNRDlerLmGEW/AtczBfuvmw=;
 b=OL9HWZkiNAqZ+qi79TLo6fpKJq/bEZt07Zkgya/CQWP1xUGZRr7n2R+qAAx80dO4ZGCA
 ayr5Olx/4aAOOkEv5J/Y7ZgSIo0fh5x2OJqlSkACF2Af27U8IwTYvmD6SkcLdzHN6UgC
 udnZ/uv0KBvL5pznPWTMR6x8gCDYhP0PHnJlU853uctZtygBLpVCj2XJbkHAr9Qfrrea
 mYmRylpAathSaoGGFLXgRjCF+tmpoOfV8OW8r4l2ywj9MegkXr9B8csL1tJPI30TNGHU
 5t0FAuhfguy94nz+m9tn/7HrFqVnkZFOqjtyeodcgl2GBkCnpCjCxRmOt52jmkZHrDQe iA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtkb3g01q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:18:31 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TJZqEm015548;
	Mon, 29 Apr 2024 21:01:50 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed2s47v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:50 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1lXe34013472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:49 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A4A458068;
	Mon, 29 Apr 2024 21:01:47 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D0655804B;
	Mon, 29 Apr 2024 21:01:46 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 16/17] fsi: occ: Find next available child rather than node name match
Date: Mon, 29 Apr 2024 16:01:30 -0500
Message-Id: <20240429210131.373487-17-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: Dj8vAuAgfvZSc5GQV3sy0Rps-QY0LOYm
X-Proofpoint-ORIG-GUID: Dj8vAuAgfvZSc5GQV3sy0Rps-QY0LOYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=885 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290140

There's no reason to restrict the creation of the hwmon device to
a matching child node name. Just get the first available one. There
should only be one child node anyway.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 2023355b3980..9a3658d86379 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -669,7 +669,7 @@ static int occ_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	hwmon_node = of_get_child_by_name(dev->of_node, hwmon_dev_info.name);
+	hwmon_node = of_get_next_available_child(dev->of_node, NULL);
 	if (hwmon_node) {
 		snprintf(child_name, sizeof(child_name), "%s.%d", hwmon_dev_info.name, occ->idx);
 		hwmon_dev = of_platform_device_create(hwmon_node, child_name, dev);
-- 
2.39.3


