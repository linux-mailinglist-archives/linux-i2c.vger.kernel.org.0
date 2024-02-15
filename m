Return-Path: <linux-i2c+bounces-1793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A9785702C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EB22818D4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B823514D441;
	Thu, 15 Feb 2024 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GBYXcLlH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8B14900D;
	Thu, 15 Feb 2024 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034914; cv=none; b=ZwuTCeGPeeSC+w7C7d27OU1MqRA1ei5VqTjV6aQVdNXrasyRBFkQzSfUhyiaHv7KnstTgZWIC2x5mLJ/sUaPllkNFbkcqbq0QLn7e0agIlOMPASCO658jMdQrm32PATWoEqDvcSQghsuYrOpXRkvVJ01VM/JsStz0F5EY7TcUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034914; c=relaxed/simple;
	bh=dy7BHjNi3sCnkRYeOejehYWb5ftkNMI+oDiVGphW4jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ilDHqA9izr4WrBA1YE2BRg9NNChZuldeukyJ0dCYUZF1yyybktAcNXGmoJZ/fjbCwfCL2p0qKkEpHI8mqOeWeXl9tEmxBh/q2D0yUY/QtCpsjwKWe6KGOZ2k3HQ5gmoM7xkahIUWz/uhYkhqgEl0zo2ggYCXAj4RAlKMv5tlt+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GBYXcLlH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0XuT017921;
	Thu, 15 Feb 2024 22:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WfBD8Asm+mV0Bam4k6IBKyEciz8onft06t3pHx4oKg8=;
 b=GBYXcLlH++7izMTzCUxzHnG5EXcHfMRsT7hPJWI3ZgP90JRjUTz1Lb7ZwmULYkKJK4Dq
 9oCVfsGnOsw8FFhgr5rBQeXoOs/5jiX5Y7H6VlPxzh8lYywc04p4mnOMRaNrzNtpsej0
 vDLzxjY8VnpzlDeAZLdbo9ClM9MQ+tCvzfWeycxEhVquZfyDtiF2Z+TZwDltyNgMK3N8
 jZlyDcl8/GKLNlaUh2zw1vqoztgiGKhsBCVqvVjGD9my4HPN4N0jjmbpGcdSQypRlC+r
 Ik4pu9tAr1vypNAN7U6/R7P2SGp27jRkXB+6VYtEogrnxYl9ESs8qs4O16WjqErKKgTX sg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg6cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:16 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLD0R2009728;
	Thu, 15 Feb 2024 22:08:14 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6p6374r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8CmY5898898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:14 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 388785806C;
	Thu, 15 Feb 2024 22:08:12 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E304858078;
	Thu, 15 Feb 2024 22:08:11 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:11 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 29/33] i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
Date: Thu, 15 Feb 2024 16:07:55 -0600
Message-Id: <20240215220759.976998-30-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: ZftRL5j_SYl94jZTISGKJGeSUEBf9mwN
X-Proofpoint-ORIG-GUID: ZftRL5j_SYl94jZTISGKJGeSUEBf9mwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

There's no use passing a pointer here.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 47 +++++++++++++++---------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index bc44cad49ef2..f237e76d29e6 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -177,9 +177,9 @@ static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 }
 
 static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
-			     u32 *data)
+			     u32 data)
 {
-	__be32 data_be = cpu_to_be32p(data);
+	__be32 data_be = cpu_to_be32(data);
 
 	return fsi_device_write(fsi, reg, &data_be, sizeof(data_be));
 }
@@ -188,17 +188,16 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 {
 	u32 mode = I2C_MODE_ENHANCED;
 	u32 extended_status;
-	u32 interrupt = 0;
 	u32 watermark;
 	int rc;
 
 	/* since we use polling, disable interrupts */
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, &interrupt);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_INT_MASK, 0);
 	if (rc)
 		return rc;
 
 	mode |= FIELD_PREP(I2C_MODE_CLKDIV, i2c->clock_div);
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, mode);
 	if (rc)
 		return rc;
 
@@ -211,13 +210,12 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 			       i2c->fifo_size - I2C_FIFO_HI_LVL);
 	watermark |= FIELD_PREP(I2C_WATERMARK_LO, I2C_FIFO_LO_LVL);
 
-	return fsi_i2c_write_reg(i2c->fsi, I2C_FSI_WATER_MARK, &watermark);
+	return fsi_i2c_write_reg(i2c->fsi, I2C_FSI_WATER_MARK, watermark);
 }
 
 static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 {
 	struct fsi_device *fsi = port->master->fsi;
-	u32 dummy = 0;
 	u32 mode;
 	int rc;
 
@@ -229,12 +227,12 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
 		return 0;
 
 	mode = (mode & ~I2C_MODE_PORT) | FIELD_PREP(I2C_MODE_PORT, port->port);
-	rc = fsi_i2c_write_reg(fsi, I2C_FSI_MODE, &mode);
+	rc = fsi_i2c_write_reg(fsi, I2C_FSI_MODE, mode);
 	if (rc)
 		return rc;
 
 	/* reset engine when port is changed */
-	return fsi_i2c_write_reg(fsi, I2C_FSI_RESET_ERR, &dummy);
+	return fsi_i2c_write_reg(fsi, I2C_FSI_RESET_ERR, 0);
 }
 
 static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
@@ -253,7 +251,7 @@ static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
 	cmd |= FIELD_PREP(I2C_CMD_ADDR, msg->addr);
 	cmd |= FIELD_PREP(I2C_CMD_LEN, msg->len);
 
-	return fsi_i2c_write_reg(port->master->fsi, I2C_FSI_CMD, &cmd);
+	return fsi_i2c_write_reg(port->master->fsi, I2C_FSI_CMD, cmd);
 }
 
 static int fsi_i2c_get_op_bytes(int op_bytes)
@@ -340,12 +338,11 @@ static int fsi_i2c_get_scl(struct i2c_adapter *adap)
 static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
 {
 	struct fsi_i2c_port *port = adap->algo_data;
-	u32 dummy = 0;
 
 	if (val)
-		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SCL, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SCL, 0);
 	else
-		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SCL, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SCL, 0);
 }
 
 static int fsi_i2c_get_sda(struct i2c_adapter *adap)
@@ -361,12 +358,11 @@ static int fsi_i2c_get_sda(struct i2c_adapter *adap)
 static void fsi_i2c_set_sda(struct i2c_adapter *adap, int val)
 {
 	struct fsi_i2c_port *port = adap->algo_data;
-	u32 dummy = 0;
 
 	if (val)
-		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SDA, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SDA, 0);
 	else
-		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SDA, &dummy);
+		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SDA, 0);
 }
 
 static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
@@ -380,7 +376,7 @@ static void fsi_i2c_prepare_recovery(struct i2c_adapter *adap)
 		return;
 
 	mode |= I2C_MODE_DIAG;
-	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_MODE, &mode);
+	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_MODE, mode);
 }
 
 static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
@@ -394,13 +390,12 @@ static void fsi_i2c_unprepare_recovery(struct i2c_adapter *adap)
 		return;
 
 	mode &= ~I2C_MODE_DIAG;
-	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_MODE, &mode);
+	fsi_i2c_write_reg(port->master->fsi, I2C_FSI_MODE, mode);
 }
 
 static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 			     struct fsi_i2c_port *port)
 {
-	u32 dummy = 0;
 	u32 stat;
 	int rc;
 
@@ -408,7 +403,7 @@ static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 	i2c_recover_bus(&port->adapter);
 
 	/* reset errors */
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, 0);
 	if (rc)
 		return rc;
 
@@ -423,7 +418,7 @@ static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 		return 0;
 
 	/* failed to get command complete; reset engine again */
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, 0);
 	if (rc)
 		return rc;
 
@@ -433,12 +428,11 @@ static int fsi_i2c_reset_bus(struct fsi_i2c_master *i2c,
 
 static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 {
-	u32 dummy = 0;
 	u32 mode;
 	int rc;
 
 	/* reset engine */
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, &dummy);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_I2C, 0);
 	if (rc)
 		return rc;
 
@@ -455,14 +449,13 @@ static int fsi_i2c_reset_engine(struct fsi_i2c_master *i2c, u16 port)
 	if (port) {
 		mode &= ~I2C_MODE_PORT;
 		mode |= FIELD_PREP(I2C_MODE_PORT, port);
-		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
+		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, mode);
 		if (rc)
 			return rc;
 	}
 
 	/* reset busy register; hw workaround */
-	dummy = I2C_PORT_BUSY_RESET;
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, &dummy);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_PORT_BUSY, I2C_PORT_BUSY_RESET);
 	if (rc)
 		return rc;
 
@@ -497,7 +490,7 @@ static int fsi_i2c_abort(struct fsi_i2c_port *port, u32 status)
 		return 0;
 
 	/* write stop command */
-	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, &cmd);
+	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, cmd);
 	if (rc)
 		return rc;
 
-- 
2.39.3


