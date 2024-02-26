Return-Path: <linux-i2c+bounces-2005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F26867D3E
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E695C2920E8
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBF4136659;
	Mon, 26 Feb 2024 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bNogvbta"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15F135A43;
	Mon, 26 Feb 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966442; cv=none; b=RpPsoo1lpPJKgoJ9RsAOxfDeY0nKzi6MzMnu4uQhYyM3mEanDN1yFrYIAZuNgoO+Q4nvvh3ftyQy1OMKPX2pQlYpOb24kXcQa95bxcduXbBzOxBfL2UfvxPBip2afqd2KXmEty8mdf65m5xqpQYypSABuXB0L7BirMEYL/axl+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966442; c=relaxed/simple;
	bh=6ORCo3+k9OdhTzhZOX/OvaI7dLnhbXmu+cXgKL7siCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rH8rSJr4QezWnrffgaKaJ9xD7KGs59WnnW2iCNMv6d/fEBp/pW89WvSTXJaCHy8K0M15K232LvBd4bhxifCYVWxqlC6D+BJ98ltUrGsFwQGDeqB5jzTNAQ53uMOJIrFI+iFfkVtmVgt4oe3lUCBMkMpBgrhuPYRqGdMUP4usISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bNogvbta; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QG12KX018630;
	Mon, 26 Feb 2024 16:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jHq/vBDBbZBSuhSZdVDjxpYwsAaHsSkR8YTxz+PKabo=;
 b=bNogvbtaSA5C+ilSm/CEZHEW6K4gJdQQcdVBLJuP1jYpYCU6gsh17yWs7cXC8vw8Rkk1
 pRv8EW0IwA8VWfYC/zQgshUNkwUx2sX43OUiDv+mnm5qDwawY7DBjPu1AYfSKlvK+TIO
 5TxqtP6gWrlNHpRc4pvQLZxFoqmKnIfs5yVk9HsHU5i7M5Dc88dtDhfkm55tOU/DJ6eq
 MUOfbC1rAWqfUB0na+0DmolXPxp7dHZ00HljXjEKR17ijRyXv/K7FvP33USJA6yT7vlG
 YTsPNA3zGfLQ5JfpNbbkASN7XdQAR2iT9+85HnKk8pLHOPLRHCpugp0SLoUaRuum8hJN wQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgw0k35dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:50 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGgnTt021728;
	Mon, 26 Feb 2024 16:53:49 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfu5ytksd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:49 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrkUl21103192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:49 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA5BE58059;
	Mon, 26 Feb 2024 16:53:46 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E2025805D;
	Mon, 26 Feb 2024 16:53:46 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 30/31] i2c: fsi: Add boolean for skip stop command on abort
Date: Mon, 26 Feb 2024 10:53:20 -0600
Message-Id: <20240226165321.91976-31-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XYAcP_qZUe-CGT6_iSEUR-llXo9h3YtH
X-Proofpoint-ORIG-GUID: XYAcP_qZUe-CGT6_iSEUR-llXo9h3YtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

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


