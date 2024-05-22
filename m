Return-Path: <linux-i2c+bounces-3637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B208CC711
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 21:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FD54B21984
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 19:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4809914A0B1;
	Wed, 22 May 2024 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iFLq4met"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24296148855;
	Wed, 22 May 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406009; cv=none; b=DJr3P617PhGyn44qpgiIlHSX7+PBXbGn8BKGfYsYF1HCHeQ69W2pFRKH9Fr20cJZiicVomf76bFY7KsbemXCfXbcxpM9DfPImvvH3+cAeJIhSCTFWFA00ROcNWy3XoH0Q25+SrzGpDgtjNfwQwDSVE7BWEYSW3Qy7JlUNlxILUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406009; c=relaxed/simple;
	bh=dKKGEyMUk0UwgESO6nJ+5EuDLzkHGZXIp4njWAeuzdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJiQLHPrNvefJ1CLrtf8AV8FYao7Cs9bra9M5S/I6SVRVFmZJ67jpPytKyaxs5lEhs1P9tIybXgxqjS6OcJzHqs+DXM+dNNoQS9GDa44Zhx8t51Wuukn9TCpQAz/f9phB+63SsUqt7225vK5m3tdPxXxagGb2+o/J/Rc5aXpNr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iFLq4met; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJL7Tj009082;
	Wed, 22 May 2024 19:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b4yNQBAtpva9pbdQ3MKrwTcabBpfveNT3SZdpdEVr0c=;
 b=iFLq4met8zFy+YtmiiCSmcfrw61QqoWcV/5AMrtdk3ZaET3BU6s07oWDmWNkrXc+698p
 wESa62W34gENtY3z5UgIh1T/4MuQswWVccah6z9CilBkaLyGNTqB1tQHpyi/qd8Ar8LS
 XR5HqlrjKSQVK8/CUbknr7Drj5zhXtmfuZJUxPLySP66qiCnlNzg8Cd7znvLp7juMVxI
 5eah6bD7VbY6MXaUTWihUC1NJl+QpgVQEKiFAqFefRoqEbfxjRmKJQl5njU6V+wZ2R3p
 TNXiQGkh7+RhdYW83DjY9Ub6ATK7Vr5YF35TqKr/EGveYlGcbyUSKyZ31BKMqgGr7jh3 SQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9mrx09ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:37 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44MJ8Zna008226;
	Wed, 22 May 2024 19:25:36 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y78vm5a63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 19:25:36 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44MJPW1j51052808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 19:25:34 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ECF258058;
	Wed, 22 May 2024 19:25:32 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36F9558067;
	Wed, 22 May 2024 19:25:32 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.104.209])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 19:25:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
Subject: [PATCH v6 20/20] fsi: scom: Update compatible string to match documentation
Date: Wed, 22 May 2024 14:25:24 -0500
Message-Id: <20240522192524.3286237-21-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OV8UgjSZUWLVCrjVRLIJYkH9sGb0Y6vO
X-Proofpoint-ORIG-GUID: OV8UgjSZUWLVCrjVRLIJYkH9sGb0Y6vO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220134

Use p9-scom instead of fsi2pib.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-scom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 61dbda9dbe2b0..4558b96474e09 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -590,6 +590,7 @@ static int scom_remove(struct device *dev)
 
 static const struct of_device_id scom_of_ids[] = {
 	{ .compatible = "ibm,fsi2pib" },
+	{ .compatible = "ibm,p9-scom" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, scom_of_ids);
-- 
2.39.3


