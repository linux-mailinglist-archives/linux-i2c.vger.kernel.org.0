Return-Path: <linux-i2c+bounces-9246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC57A24548
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 23:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30BF9188967F
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2025 22:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946CB1F426A;
	Fri, 31 Jan 2025 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UaDE9W/1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37CC1F0E5E
	for <linux-i2c@vger.kernel.org>; Fri, 31 Jan 2025 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362613; cv=none; b=Mk9sdxH4wAFtnAOinU4T+ppdX/qpt6NGL6prdZwS6IIzI4GWQKtBSriCj3mpX8U3peaHGjaZcGTrLNc0z/KdEswYDQTI8jxOmvUJ9eQacbnzdktuegsaKw+/0wSAWar4MUhkX9WWtDOGNvfu0GJ9VoXwkEWf3fVFYQFd2mBRcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362613; c=relaxed/simple;
	bh=WalikdTBwq9p6/tMaQp7lJHKVnrqMozciQ++2o2PsBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d8J118q0mwc7d1YkQq45NRk3zxceL6HKXOXZ/Oom7AfASop1M4eFOgkTOJIMPMs45aAeP9iezgpwTOIWmrasHX7l0J6pRmMZAKLIdov7C+XdXlgob1LaJuDapHOaqHEGEnFJqgULZnqSA6GbWMgFTUzGQzgd5W93WxyTW0Ov/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UaDE9W/1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFdOH3018692;
	Fri, 31 Jan 2025 22:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DgI7GlxH7+Sz5jA0ziTbEE95oSEknuwMDw3S+7gHi
	Ig=; b=UaDE9W/1lCjr4JCphmBi0zOvSYtCPgursHuKmTf4fR8jMsQrria4Hy4dU
	yCv8eM7vgEpU6nNonECkfMMSfH7Xg9+SJLlwI/HrFB8Sx3P3bqkYJvB2Yu/hHGeB
	HFr+KhnFnFuw3LTuxMGDOHRZZFOb61eTW1rA5doDbYW6pfbSpm2XkYXciPAyPmmb
	q+gepJdop9qWk+Q7vjdgyuLdLP1NfGBkmTOWtzhqg9eew2sk+OyTj2Y4moYQxcmL
	vwiBPBnKzKDq8hpOoRbwv95XeRtQeeT66uHS8UNB0BChGx4GfOLy0CAQCbx22/gJ
	IFJnLBFdwbQE0FbFV4AajzaJ10VNg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44h1bt1q6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 22:29:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50VK9XfM017212;
	Fri, 31 Jan 2025 22:29:46 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gfaydtug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 22:29:46 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VMTj005374482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 22:29:46 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E399C58053;
	Fri, 31 Jan 2025 22:29:45 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B90A58043;
	Fri, 31 Jan 2025 22:29:45 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.92.209])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 22:29:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, ryan_chen@aspeedtech.com,
        benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
        andrew@codeconstruct.com.au, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] i2c: aspeed: Nullify bus messages after timeout
Date: Fri, 31 Jan 2025 16:29:41 -0600
Message-ID: <20250131222941.798065-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8k4kg-yy7iDnFfAV3vEbhkiM_5xjyyaa
X-Proofpoint-GUID: 8k4kg-yy7iDnFfAV3vEbhkiM_5xjyyaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_08,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=749 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310172

For multimaster case, it's conceivable that an interrupt comes
in after the transfer times out and attempts to use bus messages
that have already been freed by the i2c core.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 1550d3d552aed..e344dcc2233fe 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		 * master command.
 		 */
 		spin_lock_irqsave(&bus->lock, flags);
+		bus->msgs = NULL;
 		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
 		spin_unlock_irqrestore(&bus->lock, flags);
-- 
2.43.5


