Return-Path: <linux-i2c+bounces-3842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7514C8FD869
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D2F81F21C4E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6520915FCF9;
	Wed,  5 Jun 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P7QybuMl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A715F40C;
	Wed,  5 Jun 2024 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622618; cv=none; b=Hj4qljILZKKtmHRnbbbWuianHT9iCc4043orRYT2m8/WOjYf5eV7f5OBogVD496nbmOPtiwzn7ljPABcQxkiUEXOGX8h+JYsZsF212XSlgMxh2626QxeWytDZn1LtWjcJoPJweAXBLjGkM9GA7hi1qsuPbstQLH1qdDXxqw4bGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622618; c=relaxed/simple;
	bh=rE0Jun7ASocTkER4Zz1WN9mSwEGnbpw9qhfd63n2Xfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d+CKCLo3Qz5HQWjU7exYB/YCWk7KWNcEK8LMny5kBZFAONJb9F3342I1vbR/kjZcdftPZni89VN1grUHmhyrJG0FKridktHGIJPmoFm4H2LSYSLRZO2g2zEBcJ6Gr7qPasHsvDQGoRrJWdKk8R/fEGOn/SpKEPvBMHiqZ3XOO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P7QybuMl; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455L22cw000948;
	Wed, 5 Jun 2024 21:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=IeMzCBPMm0HGqKUzTLcpPoxCLl91x2nvDiQoiHU7cEQ=;
 b=P7QybuMljh6UMPtriSQazoo4PclHKzxyNCG99ygrUtfKp0QN6D0iARS+EJjphGQD0YLP
 7oGzFqBedubL8G+pNnfLBqX8FWGuTAuqGxrK/H9qPB4Pb93xNA//yW0v8qiOnl0RzS2x
 2GDPeKdwBJWrCtv4dxe8cVibX9V9F7Lt1+zafKa+jpSefH0NpdX/6n0oVL2O9kwc7krK
 VVhdmTmmvT5q8d2Rp0p2c3qkgw+o5DlrXsHf6zBKnFOSBdBunVm68F/7rOosiX+sTsdy
 4+6+45Pb1elhQdOFf3rjjNFPWsf8CTPAmsn+UO0q7q3Vh3qVSkdSAyiuww5n3hpd3JHr EA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjxbg09vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455LBWHh000815;
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu6wr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:17 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNDeh24052398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:15 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 714F658055;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 292A65806A;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 01/40] fsi: hub: Set master index to link number plus one
Date: Wed,  5 Jun 2024 16:22:33 -0500
Message-Id: <20240605212312.349188-2-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: wjCEZMeO7OCYMh8f-tgIBCBMY2ATHwui
X-Proofpoint-ORIG-GUID: wjCEZMeO7OCYMh8f-tgIBCBMY2ATHwui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

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


