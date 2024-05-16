Return-Path: <linux-i2c+bounces-3516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2C8C7BF1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 021281F21924
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D271581EE;
	Thu, 16 May 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Tu6i9VdJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68936157488;
	Thu, 16 May 2024 18:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883574; cv=none; b=D06XNKHEctug7xfBjhocgWer64nlU/lac06vrMbeRfqE5AoYdGcqjt65iO/EsDKSfHsXdqe/rfNM1ZjAxCzHnizqcPMWxeqHjdriIecQWbNd9RXOBRcodcnacJj5+k1zIpUtTCzahEpdTpAKeVdwpoaFbrTa2Iv3aLu+g77ZXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883574; c=relaxed/simple;
	bh=X1ZPTS2YGQm53cxlgKYe1PLkwaNISkZBsXhdru69tw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T46nnzTZJKGmgtvHy3ZtnEIEtSfuL96737YHaUScef4uIbII8NCqTMlZrK46pEkoA/JqqMfd5cY9xgtA+Nk9xI3GRhDHIqGr4wPEdGNwNsSCvy6RF2PPyIeKRq+oA4EDCxK9Y0ZyqU9x54lFjW3uRTO+8CrsiV0YAW+XzkiakT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Tu6i9VdJ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGkw93021245;
	Thu, 16 May 2024 18:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tzPFGbo6X3zcNdVJFT3Zq8NM38ZKt/TD8N6qjoX5nmY=;
 b=Tu6i9VdJy9SqOE8YPfw7wKNhmxqklFXeVtDHH08z4aciF5vj2Dewv/DF5iYdHIsVf6BD
 oWiIIxBqgiSw0cmJ0/M1b3SD02JSKK+x6XrslHBALqLmraTVYAnHewXSfp8FxtLIqLUh
 80G+E/XQTLBH0wJHiEfRwZcDqYXH64YjKnYAQB5M7yWBLJGRZG6Qn5Rnzgcw8eE5aT75
 lBCiQeVK1nvFGXHYXmpIIwWVcGaV8Ez8+6LPonpnyby57oYEpkaKe3LN10LZTT9CwuNt
 dNnt+ZvuykIJ1D2UY+VmBrVoCbuypaFUTP3pdo2lDXXTn6ljeWKNElrzYpE5iRgTMEWR OQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5nycr8dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHmnXO006183;
	Thu, 16 May 2024 18:19:19 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmud39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:19 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJGA542140022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C90C858078;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AD6858080;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 31/40] i2c: fsi: Add boolean for skip stop command on abort
Date: Thu, 16 May 2024 13:18:58 -0500
Message-Id: <20240516181907.3468796-32-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: HC54uwD7Go1XxXnYpXpr9t0lMi06jJCP
X-Proofpoint-ORIG-GUID: HC54uwD7Go1XxXnYpXpr9t0lMi06jJCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

In preparation for interrupt support, store whether to skip the
final stop command during the abort procedure instead of checking
the previously read status register in the abort function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 022f1287aa0e3..614d830419bb8 100644
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


