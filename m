Return-Path: <linux-i2c+bounces-3867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C18FD8CA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B5C1F22A46
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3011217BB23;
	Wed,  5 Jun 2024 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BE1Xhe3L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4016D328;
	Wed,  5 Jun 2024 21:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622625; cv=none; b=nsN5O4XeSNL2MWH1rOvj6LVzbykohmMKmwCyYF7foe2IFPZ7lG3RmK+9XTuqIWSpne5b1Y1SSrxx837JDwi9Cox6y8Qo7IbZuR6fOTzooGOB6X6rW/gTArqIkk5cTGN9tUqEAEIO3IlluJyTRSuahhsj9+OzqU7gLDtiNjnaktY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622625; c=relaxed/simple;
	bh=taayyPbBzq9s4gsXkzK7pwa6dRU73kwY4qlC+hFgKzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9ttbUEzl5fLirsLtA8aUJJt4T8dmaGemnxwYRjuZiuEDx+QhPHquBGotFdAjknVn1H53CbcsLRDXvrYepOWW4mJlWA4jkJ5pRO3aERszRKJMxwaYW5LS5I/cGTSMJfmAgk10MEM4N9Ef4qzsD11XDWlul2LcBJ/54w0as2WqCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BE1Xhe3L; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KKjgj025691;
	Wed, 5 Jun 2024 21:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=/RkWhEH9F+VLK6oub9BZ8DLGrII8B8mgaOhr5sMt70k=;
 b=BE1Xhe3L5HtD3whcjoxJF0Z3ist4hD3UqE1GIXy3b4rkFQmbOwXzbP243pYGGLAWMCbW
 Dm/cFY82+DP5eLockcahREZGOhin1p+RTppFexXTx2SpR4R62NzuWA2R8pct8bDuQtrp
 j7iOaGX3xCrnbqTF6ScAMsmXaIh7CLMvkicZvJidbhceNgFfyY9rEQZgzn2BjAMVWkuf
 rnyUKuN+JLzc6S8JhBv/hhnUgbTVvGvngB7EjbU6BV4s031oqzrVuBZv+Qyog+R7URF+
 jgcvOLOQn9xfHHJQrSeSCNprB4mDCfx21AkxO3/qZZ0BPHE13E3+65fD7NoNSc0gaFgA 4Q== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjuwr0qbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:25 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IH3fe000820;
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu6wsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNL1d14418620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D57A458043;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98E265806A;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 28/40] i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
Date: Wed,  5 Jun 2024 16:23:00 -0500
Message-Id: <20240605212312.349188-29-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: RQ8-P0mjnnq9GGWzEBj8agSSXFEo1q-Y
X-Proofpoint-GUID: RQ8-P0mjnnq9GGWzEBj8agSSXFEo1q-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=970
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

There's no use passing a pointer here.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 47 +++++++++++++++---------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 8fb5b51b74a4d..44aa750278100 100644
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


