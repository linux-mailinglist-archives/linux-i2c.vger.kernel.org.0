Return-Path: <linux-i2c+bounces-3849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8D8FD882
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34192872E1
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9583B1649A7;
	Wed,  5 Jun 2024 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qXx91+W4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26A160781;
	Wed,  5 Jun 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622620; cv=none; b=gWRSCOZF97eJdfnQAwrCaKRlqX3UlHPWk5rfOpY++vatMLWWO9UdPSlYmCc2xlPTh49qoomG6wFy48lXfJ0r5OdZ7YOlRLkXOOGR9AStiY1XpXKjTqF3L1E/+pBHFVUO1p21t/4jY0U3aw4Pwuz3EOtxBNSvX7Y8Y5CuqkjZqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622620; c=relaxed/simple;
	bh=Kk1vf7vDZQFiMZVz0TxazBsIlWzRpEvr/ZTsMqk20vw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XiTI67HiupdFB40QkMDEKbcVci6auC4F8l1EIqzC7JCHHlJzJiK7eODR96oAfU2J/zPmrjCTBPuEhPp+kVVGjBLSHfrFZqqFNWGJsUsEu0LJtTjxhk8tzQ/a5adRsIHj6A/A9C7meXBmxwDSIoM8V+A9T2l+xuxoXAX6GbKdCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qXx91+W4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LBnB6014237;
	Wed, 5 Jun 2024 21:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=EXGcZynFVVUbk26l2/hfQQpZCKfn9AC1kWN4XMBRoBg=;
 b=qXx91+W4/Ke0dRAquRVBMsPjy8RP6asSGCQxjt2Mk98xRpKP5IfTnVdQ+o6uncMYdaov
 nIebfy5qd3bI6KyDnYMRbWMXuDs6VVxQGyxJpxEgX+fn+SjRWobP03zvGYX4JrVZcOYt
 13J1uiBymonSNFB/q7KoorkjPjOAp30iLPrZiSdcX0DCUF8MdNDPcrXZE8ML4evkmQkd
 0HSWuP3PxzPhqk154MkaeDk6ZvLnUpJ/0cE49fdZrSK9MpDZfHVBXb9x6EYaVWcWr1zD
 LzYEFa/Y2MRYk+3G0uDlciuI3Xi9P17TmxDQCdGjocTcXNeL4hmKwlI1IJvmLH4N10ZP Xw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjy57r2y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:20 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455I6vQ6000795;
	Wed, 5 Jun 2024 21:23:20 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu6wrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNHPN61079970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:19 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49DBA58060;
	Wed,  5 Jun 2024 21:23:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DBC55805F;
	Wed,  5 Jun 2024 21:23:17 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 13/40] fsi: core: Disable relative addressing during scan
Date: Wed,  5 Jun 2024 16:22:45 -0500
Message-Id: <20240605212312.349188-14-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 6oMHMTQCwYpeabzPdTHqOe14r_iQpm8r
X-Proofpoint-ORIG-GUID: 6oMHMTQCwYpeabzPdTHqOe14r_iQpm8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=813
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

Relative addressing is not allowed during slave ID initialization, so
turn it off during the FSI scan procedure.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index bfb147de90efc..8b402149acbe9 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1223,8 +1223,20 @@ static int fsi_master_break(struct fsi_master *master, int link)
 
 static int fsi_master_scan(struct fsi_master *master)
 {
+	bool set_mmode = false;
 	int link, rc;
 
+	/* relative addressing is not allowed during slave ID initialization */
+	if (master->map && (master->flags & FSI_MASTER_FLAG_RELA)) {
+		u32 mmode = master->mmode & ~FSI_MMODE_RELA;
+
+		rc = regmap_write(master->map, FSI_MMODE, mmode);
+		if (rc)
+			return rc;
+
+		set_mmode = true;
+	}
+
 	trace_fsi_master_scan(master, true);
 	for (link = 0; link < master->n_links; link++) {
 		rc = _fsi_master_link_enable(master, link);
@@ -1246,6 +1258,12 @@ static int fsi_master_scan(struct fsi_master *master)
 			fsi_master_link_disable(master, link);
 	}
 
+	if (set_mmode) {
+		rc = regmap_write(master->map, FSI_MMODE, master->mmode);
+		if (rc)
+			return rc;
+	}
+
 	return 0;
 }
 
-- 
2.39.3


