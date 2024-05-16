Return-Path: <linux-i2c+bounces-3542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F918C7C64
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C1C5B23A47
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1FC15FA8B;
	Thu, 16 May 2024 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jazRzuW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3515F41F;
	Thu, 16 May 2024 18:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883593; cv=none; b=gTU2b5Z1iqg0875QzynK4GASL3BoMOKc9RDHmL4Zj50YP+raUamN5JRMPPprLx0oijG/eTUtTPhGcFHizen0qmYojVsrH9wzBEDx5epfetykASrH/8fvoxCvaDpgZzrzQyG81AYWsgcN5fAefTePPyfMWHTuxVQ04e0ELqy1tP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883593; c=relaxed/simple;
	bh=vOYsMk7mrSYUToVE3TW3d0+j9nsQ/udu6UXMoY2sLm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fo5oOw81cAUL4kQ0A0GkxQPUCU8NiRleKUqGuMmOADcDzJtoK7qRwX1lshnjkGTdK4Jw/Uy7emmCyPcYCPZj+HSp78fV+71LYIRWIrd3vIOVi5JpNhYPkRHVUDJT6wYNIbcAJDbQsz9vDp+4ulxoJv9EwcHHOydn4OEMYf+jcgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jazRzuW5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GFtB2d023416;
	Thu, 16 May 2024 18:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OPNP/V+K9oIptQxupTBJOpz2/GhP+4OrRNDg7xLMAPk=;
 b=jazRzuW5qxaEpz+JtUR/AN207x3hJSvKEwXgDGDQn9eMAbWWBJ7G2xMg3U+o9uZsE1sC
 ACQVJ1h2v2/V0s14ZMRVU1aPXjW2v7XJm05ktywyFaLwefX9BmLnSPK6aWFMlmGHJ1u/
 slo4qH7ecdICvtRYvJZ2YYHDeuqaH6aXz4/+Sl8I9FtSB8yAImAygmpcPTO/BNqtQBey
 VuSmyZMP5MGb+v4npLoRgzgFEWEkLkjNs6YoKScHlJ4zEoF3FKQQeIrCaHl1qRtF1mit
 NuXjiceBmMiThwOSbklWsW1MEDOGh1GLO6Jr9OeVGDYKNtHzmPeUqet4vNLhy7ZMsbDU 7w== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5mce8fru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GI2MgB002273;
	Thu, 16 May 2024 18:19:20 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2m0pkfus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJHn539846334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66EB15806F;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28F375806A;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 33/40] fsi: hub master: Reset hub master after errors
Date: Thu, 16 May 2024 13:19:00 -0500
Message-Id: <20240516181907.3468796-34-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 7q38jETbYYQUbopbcmLQUqSA_hw5T1g_
X-Proofpoint-ORIG-GUID: 7q38jETbYYQUbopbcmLQUqSA_hw5T1g_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160132

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


