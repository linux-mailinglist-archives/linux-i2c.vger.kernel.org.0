Return-Path: <linux-i2c+bounces-3878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 470078FD8EB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C903D28A45D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09E3182D01;
	Wed,  5 Jun 2024 21:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RQNwCSNv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17415FA6B;
	Wed,  5 Jun 2024 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622628; cv=none; b=kOIA1cTY26/RpL53QYhyb24NCYvGTBtKsZAgPbpVOaePyQLehlgKUoQjdDp6GaJC1eysSjJnsAWn7qpTiUJFdoFkqiLALmBtzgeyLYlpsThpRzQGelY4Vsrs/4uCEAcCBk8DwcJtYrJKHu61tKgNICmVtUfwwMB4/8FkHrvx/F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622628; c=relaxed/simple;
	bh=vOYsMk7mrSYUToVE3TW3d0+j9nsQ/udu6UXMoY2sLm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PSUlgm7ybzZRYG4cDkMBtTJg4aiDFl2lBV39hTNXqzpKo23emsAH7mDeRz39T7/ApAZe5TqY06znxd2UoO2/+Z4CZ81l64Rz0zexkVPpvD8jtVQvg7Y23Vgg12KTQfAiSxh0IHV4u74o6rBvnkHa3gTQ/h6sOKIADXid9/9G/YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RQNwCSNv; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KuTr9001313;
	Wed, 5 Jun 2024 21:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=OPNP/V+K9oIptQxupTBJOpz2/GhP+4OrRNDg7xLMAPk=;
 b=RQNwCSNvxB1CqwmLDmmNBtg4mUmfnsmENO88KKc62qKBBpKc/7/OwfOEWug0GCC/Ycvg
 x0UmaVrqstg8cbcHQmubMqFeJyC6XRMETPSk5gOKgIb7xkem0fYsqgAMRC/myH5kx0mO
 PePN6Tfb/fXWLWmswGB6XO/XYVjHk1I8LbOXBh+wHw8NUFTY2dXjoKJc57xtC+xXNNQY
 H9pszB0R+L75L7wNUbalVaYxLXNwRfombWPxHpZPOPlTVdFdYHvkNnePXqZc2b7n+aX3
 xZw0AqDwPHA9Fbx2r3Pv+Ld4gRdLLWisgP8igDklOyc3oEW7FN7fLdYnRCNlzWln2MtO 0Q== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjwppgcga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:27 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455J6qWw008517;
	Wed, 5 Jun 2024 21:23:26 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0xv6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:26 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNNI85833456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:25 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AD805805F;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D41858063;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 33/40] fsi: hub master: Reset hub master after errors
Date: Wed,  5 Jun 2024 16:23:05 -0500
Message-Id: <20240605212312.349188-34-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: yoh__hnd5WgQ9Cne_kRz1iAF7PKEl-m4
X-Proofpoint-GUID: yoh__hnd5WgQ9Cne_kRz1iAF7PKEl-m4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

The hub master driver wasn't clearing errors after accessing remote
slaves. Perform the standard master reset procedure to clear errors
to fully recover.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 4dbc542500bbd..1bd53b1e52a91 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -49,24 +49,34 @@ static int hub_master_read(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, void *val, size_t size)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	int rc;
 
 	if (id != 0)
 		return -EINVAL;
 
 	addr += hub->addr + (link * FSI_HUB_LINK_SIZE);
-	return fsi_slave_read(hub->upstream->slave, addr, val, size);
+	rc = fsi_slave_read(hub->upstream->slave, addr, val, size);
+	if (rc)
+		fsi_master_error(master, link);
+
+	return rc;
 }
 
 static int hub_master_write(struct fsi_master *master, int link,
 			uint8_t id, uint32_t addr, const void *val, size_t size)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	int rc;
 
 	if (id != 0)
 		return -EINVAL;
 
 	addr += hub->addr + (link * FSI_HUB_LINK_SIZE);
-	return fsi_slave_write(hub->upstream->slave, addr, val, size);
+	rc = fsi_slave_write(hub->upstream->slave, addr, val, size);
+	if (rc)
+		fsi_master_error(master, link);
+
+	return rc;
 }
 
 static int hub_master_break(struct fsi_master *master, int link)
-- 
2.39.3


