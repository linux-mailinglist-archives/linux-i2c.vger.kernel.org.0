Return-Path: <linux-i2c+bounces-1788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCC585701B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC0B281685
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F40E145325;
	Thu, 15 Feb 2024 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="cMyaeVCJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD601487D8;
	Thu, 15 Feb 2024 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034911; cv=none; b=KqeWcnZRZaqMjaTKkZuh6PiPHbQaVtiGLC4rtYbTI7mar7QQKW9eIykfPO7oLOlhIdegmGqnU1hTQJcQEavFExiffw6FyrupeHA35C2Ra0JmbCmnCla9sNWHN/H3C31HP/k6nAxc1UeJ+KeT5/82aU+qR1uL/Omj+F/RL7poeCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034911; c=relaxed/simple;
	bh=6ORCo3+k9OdhTzhZOX/OvaI7dLnhbXmu+cXgKL7siCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LvLK2dAi5/maOXg27i4U2mlioa7Yn6cDjCxTcxz1f9dfv+H2+qdpLCXh4MrKKJZhSm0Ol3ow29gUzGstcS695du2GODvg6k2q3lQFiOSY+AJhPZTOiA2ZiuKO5O6N87UQKM6bjkicMrUNh6g4dqYzE0fTSHM1zt0Nm9hUUGjr78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=cMyaeVCJ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0qdo018830;
	Thu, 15 Feb 2024 22:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jHq/vBDBbZBSuhSZdVDjxpYwsAaHsSkR8YTxz+PKabo=;
 b=cMyaeVCJwpQZBlLfy462KAuRrC5YUbqTicoHy7GXpCoF2xOSwcj5EoMvEh9+S7MhdMb1
 OEg45hr8Z6GPEAtHJfxTG27l2lFufZpGAsmhmtwv/Y3258+EMeZjeFxaU5994HxB8JHV
 Xi3wOgFFD39+P8z1n8D9kAsl+ViLouz6hwJT29m0F8cMTpLP5efsjjkWtssuxOn86aPB
 JR3bKRilYQXoPV1ZW3ETwiEuLH1aV2jQvoJzHANTjkzrT/vs7JR5oAXzrTNxh1Rn7xJO
 4VQP3jf5FyVqnkr+I47RExSfvzPlyAJyjYLCu8u8B7ShSBf8PtdBdly5TDiYo1zH/7CI MQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg6dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:16 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLuP2h004258;
	Thu, 15 Feb 2024 22:08:15 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv0qtnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:15 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8Dqn12714606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BEF358079;
	Thu, 15 Feb 2024 22:08:13 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E661B5806A;
	Thu, 15 Feb 2024 22:08:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 32/33] i2c: fsi: Add boolean for skip stop command on abort
Date: Thu, 15 Feb 2024 16:07:58 -0600
Message-Id: <20240215220759.976998-33-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p7PIRIlbszKwDr-GX9bH6oc5Dg4E_sKy
X-Proofpoint-ORIG-GUID: p7PIRIlbszKwDr-GX9bH6oc5Dg4E_sKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

In preparation for interrupt support, store whether to skip the
final stop command during the abort procedure instead of checking
the previously read status register in the abort function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 5f524fb6f0f8..33f4e64cb60b 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -116,6 +116,9 @@
 #define I2C_STAT_ANY_RESP	(I2C_STAT_ERR |				\
 				 I2C_STAT_DAT_REQ |			\
 				 I2C_STAT_CMD_COMP)
+#define I2C_STAT_SKIP_STOP	(I2C_STAT_PARITY |			\
+				 I2C_STAT_LOST_ARB |			\
+				 I2C_STAT_STOP_ERR)
 
 /* extended status register */
 #define I2C_ESTAT_FIFO_SZ	GENMASK(31, 24)
@@ -150,6 +153,7 @@ struct fsi_i2c_master {
 	struct mutex		lock;
 	u32			clock_div;
 	u8			fifo_size;
+	bool			skip_stop;
 };
 
 struct fsi_i2c_port {
@@ -459,31 +463,30 @@ static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 	return 0;
 }
 
-static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
+static int fsi_i2c_abort(struct fsi_i2c_port *port)
 {
 	struct fsi_i2c_master *i2c = port->master;
 	u32 cmd = I2C_CMD_WITH_STOP;
 	unsigned long start;
-	u32 stat;
+	u32 status;
 	int rc;
 
 	rc = fsi_i2c_reset_engine(i2c, port->port);
 	if (rc)
 		return rc;
 
-	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &status);
 	if (rc)
 		return rc;
 
 	/* if sda is low, peform full bus reset */
-	if (!(stat & I2C_STAT_SDA_IN)) {
+	if (!(status & I2C_STAT_SDA_IN)) {
 		rc = fsi_i2c_reset_bus(i2c, port);
 		if (rc)
 			return rc;
 	}
 
-	/* skip final stop command for these errors */
-	if (status & (I2C_STAT_PARITY | I2C_STAT_LOST_ARB | I2C_STAT_STOP_ERR))
+	if (i2c->skip_stop)
 		return 0;
 
 	/* write stop command */
@@ -534,7 +537,8 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 	int rc;
 
 	if (status & I2C_STAT_ERR) {
-		rc = fsi_i2c_abort(port, status);
+		port->master->skip_stop = status & I2C_STAT_SKIP_STOP;
+		rc = fsi_i2c_abort(port);
 		if (rc)
 			return rc;
 
-- 
2.39.3


