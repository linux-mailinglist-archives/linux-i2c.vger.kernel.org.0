Return-Path: <linux-i2c+bounces-3513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D08C7BE7
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3CD3283BA8
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AC5157A6C;
	Thu, 16 May 2024 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SZpkEg5F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080B156F24;
	Thu, 16 May 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883573; cv=none; b=EIiSATl8XqAy/106/erWZhB+GC6Z90SkxH6qJFoWOilbU44PgMG+x6Q1UO34sJta9Ez3NmEryWARL+THrthQjgqXAqX8ugDbWnl3khIxl2ucstPa9mYjijAXTFsuvkH+2YKnJDw4glX/46l4GIBJOBRxyQCDNuYDdVL/Vqs5YGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883573; c=relaxed/simple;
	bh=rE0Jun7ASocTkER4Zz1WN9mSwEGnbpw9qhfd63n2Xfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/q4EuKYi8vpGj9psW+La1EYQIXO9KOSp6GJywv+oU3dZHnOKd1xCq5TkPG0wWunDR4n1Hi4WQhPrNSlKDjPYRHlvFL7AGFRunOlvuBAVOZ6untIrlu76dzg74xRLUWgW9phXcPY/wmnlEe9YQlXDxBXgTOrTS3GBKWN9/mPhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SZpkEg5F; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI85pZ018610;
	Thu, 16 May 2024 18:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IeMzCBPMm0HGqKUzTLcpPoxCLl91x2nvDiQoiHU7cEQ=;
 b=SZpkEg5FehErUbiUTI3Ka7q3Cmk72+C/t7keiGwEKoLH2AtNjMbCu4B6PWYAUVlypYQB
 JoKmBGzQm3/8PSuWs32A/XB7MOdZoUer8hhJcK/LTFd6fXnNuUxojaP9kkkVmMN+aiQL
 ikM13fYnvlALNAZPVTX2qggzs0jKMinOuFIy8S3PVYA9uDu8zAv+11/LaWFgsuH5Fg0r
 4olQDji9jTmXsXjtO0Ml0j8Cnksk4SUsWGzhhCbYN1Q0pc9BdiUsobtwQz4ijgTH0y+c
 HNOMI9U+51BJw3rLnqO/RYjeYQX05X9TZ0EynSF2M6wJP+BU+gwq9hvFwZ3v7X5dls04 AQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5q5980mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:12 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGV9SC018764;
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJ9QZ11797132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1B5A58073;
	Thu, 16 May 2024 18:19:07 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9757B58071;
	Thu, 16 May 2024 18:19:07 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:07 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 01/40] fsi: hub: Set master index to link number plus one
Date: Thu, 16 May 2024 13:18:28 -0500
Message-Id: <20240516181907.3468796-2-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: kPq-N_qyyQ62DIb_CuONEQycbMwQD47R
X-Proofpoint-ORIG-GUID: kPq-N_qyyQ62DIb_CuONEQycbMwQD47R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Hub master indexing is problematic if a hub is rescanned while the root
master is being rescanned. Therefore, request a specific index in the hub
driver.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 6d8b6e8854e56..36da643b32018 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 
 #include "fsi-master.h"
+#include "fsi-slave.h"
 
 #define FSI_ENGID_HUB_MASTER		0x1c
 
@@ -229,6 +230,7 @@ static int hub_master_probe(struct device *dev)
 	hub->master.dev.release = hub_master_release;
 	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
 
+	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
-- 
2.39.3


