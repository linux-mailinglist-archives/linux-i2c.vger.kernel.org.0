Return-Path: <linux-i2c+bounces-3529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8EE8C7C33
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0238DB228F0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1518C15A4B5;
	Thu, 16 May 2024 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="StbiDGmK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A2158A0A;
	Thu, 16 May 2024 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883578; cv=none; b=TRImn2xZnOXz3iekZBKST/dt939PGd6yezYsn9DkMrFbl0DqotWFHq/rR2HNmoIeDykqQHGHOoSRwuaOsAVIpb1mjH+8Bb2p2ifrA1dHkCIuBcF/LTX2n8qxb9Y3pxRcfVCRw0St4QxD+kB6iPPtwwsvqLRzMjbv+i/M77UgJz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883578; c=relaxed/simple;
	bh=taayyPbBzq9s4gsXkzK7pwa6dRU73kwY4qlC+hFgKzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oRLR8rYdxw+aLim/eYYg/gkLjum5IEWlpRJiUeuFH+peHP02IVbtXjKFfMzi4zOwgV99Aa9+iZvwfGw++bietrslvFobuHg1mZ9NP16uW9tB447M8i+KWYWVNGgv0pNnFChhDgsujN2GwkBOmyQRMX5/vQMR0suOjUf08iboyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=StbiDGmK; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGl3JN022073;
	Thu, 16 May 2024 18:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/RkWhEH9F+VLK6oub9BZ8DLGrII8B8mgaOhr5sMt70k=;
 b=StbiDGmKe+dF285YW2BXbGFh3IsKhOKYm+eW0hlJToG3Z3qR+omZRC1wxbVroooDdp9A
 8/LbqadTz5tJ4PWEAxVIF7ZtC9JQka0HQiYZNBCp1C5mUI6BgZJ1WW1xVYbgs2dhOpVf
 J3nrMI3KboaN+wYYa0YfmNVkcnzm5uwuXrp0wu+lG5eqN1Bf+ELmjRCuEziLbS7kQ8Vh
 LOthBkNjNSNKxVoJVZevEifFSoh5vKHo4T9bS37gMXS4Ae1cbBrJER/92gI6UiWCbglb
 5qmPN5JQDPbetAk6gZ5YoqYKhh55xrDXgLUJ2NQWkmEAwOAosx1U5JgPUIAAr4XE8PWE 6A== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5nycr8db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:20 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHDDSY020388;
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd0bmcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJGpc30671258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:18 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB3D658068;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD84758077;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 28/40] i2c: fsi: Change fsi_i2c_write_reg to accept data instead of a pointer
Date: Thu, 16 May 2024 13:18:55 -0500
Message-Id: <20240516181907.3468796-29-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: mVqAi05pgxiMUe3FvWuCenV37qoi83Lj
X-Proofpoint-ORIG-GUID: mVqAi05pgxiMUe3FvWuCenV37qoi83Lj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 mlxlogscore=971 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

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


