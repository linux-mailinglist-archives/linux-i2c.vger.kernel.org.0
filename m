Return-Path: <linux-i2c+bounces-2004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0436867D36
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 18:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A81128F1FA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B87E136640;
	Mon, 26 Feb 2024 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OGL/k54Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E51353E8;
	Mon, 26 Feb 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966442; cv=none; b=U9QyCcGsG78eJqUskvlCs7daadkMqwqRhXSwAMu8ODMKvxlyaDtGxMYiMeZiTU3BGzhupft+Ss0RHRMtxeOci2foqLzovEA2wdOp5kwuFFoCMJSw7vofO0Hn/KdkyQBNf12jWzjidnu1/mPO2ChRhRDL9FHTJf5I7DoZfY6Evm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966442; c=relaxed/simple;
	bh=T+M2Nn1CbVzGiWWZ25GQh8RxyvzQFAsyFI0vKdVAGuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kc4OIru2uCSzOMkS3qV4XL8pVID6wLT/cSYSSejCG2gmLzteggIGReYUIUYKv2rEZqCN+l/RVtgVDhUjdqp9Y8/46cFHaCyXyU2g+F/ap6Zbvp3wbG73frKth8FV3TiWir0BGYZJjuxbtmvjmsqHLg1xHw17oBRCgLX4yw5Wd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OGL/k54Z; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGSDtg014784;
	Mon, 26 Feb 2024 16:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0qbOHG7gDL7BluVHG6aIFuWkCkqtnciMO6tHFzvcS9c=;
 b=OGL/k54Za+Oi+Ik9UMAZN1dYIHrAG7YQzCySyQaf5UnXUZCWg6LF40yFVtQm1hZ1JfR3
 IuxVtXlXADkOVq2JgkLNnoRf9yg18DKi5x1vuoTWSDOcT0b3qZUxlPAbqxkD4OZU2pE8
 GESoxCq5XaCI9PuJj2asZVsYwfwSBttiEh0K+LTbI4YlD8K7cjoEDd3jIuI2JgoV8+f3
 fGMp1UZWnn4AnE7cPOnI+F4kbbGG8vvK+JD6gz2YIH8cxuS0yNkuZ+xh/n0REgNEnkLg
 4yXL1Vt/eMezBraH0xiqrf88LLaU/hNOcBIVsDeir80fDiDqSfaTB2UUKkL3Pg0RRhrm Lg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgx6g8nv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:46 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFvbid012371;
	Mon, 26 Feb 2024 16:53:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfwg21xx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:45 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrgQt18481720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:45 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFE8B58061;
	Mon, 26 Feb 2024 16:53:42 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 336E558053;
	Mon, 26 Feb 2024 16:53:42 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 25/31] i2c: fsi: Calculate clock divider from local bus frequency
Date: Mon, 26 Feb 2024 10:53:15 -0600
Message-Id: <20240226165321.91976-26-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: Qx9NO90-TIrXxkEaxq-0tWytwCPDqHVy
X-Proofpoint-ORIG-GUID: Qx9NO90-TIrXxkEaxq-0tWytwCPDqHVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=987
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Use the new FSI device local bus clock to calculate the proper
i2c clock divder and look up an optional clock-frequency property
from device tree. Change the default clock divider to 7 now that
the default local bus clock divider has been reduced as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 10332693edf0..eaecf156ac31 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -27,7 +27,8 @@
 
 #define FSI_ENGID_I2C		0x7
 
-#define I2C_DEFAULT_CLK_DIV	6
+#define I2C_DEFAULT_CLK_DIV	7
+#define I2C_DEFAULT_CLK_RATE	400000
 
 /* i2c registers */
 #define I2C_FSI_FIFO		0x00
@@ -150,6 +151,7 @@ struct fsi_i2c_master {
 	u8			fifo_size;
 	struct list_head	ports;
 	struct mutex		lock;
+	u32			clock_div;
 };
 
 struct fsi_i2c_port {
@@ -194,7 +196,7 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	if (rc)
 		return rc;
 
-	mode |= FIELD_PREP(I2C_MODE_CLKDIV, I2C_DEFAULT_CLK_DIV);
+	mode |= FIELD_PREP(I2C_MODE_CLKDIV, i2c->clock_div);
 	rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_MODE, &mode);
 	if (rc)
 		return rc;
@@ -680,6 +682,7 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_port *port;
 	struct device_node *np;
 	u32 port_no, ports, stat;
+	u32 lbus;
 	int rc;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -689,6 +692,20 @@ static int fsi_i2c_probe(struct device *dev)
 	mutex_init(&i2c->lock);
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
+	i2c->clock_div = I2C_DEFAULT_CLK_DIV;
+
+	lbus = fsi_device_local_bus_frequency(i2c->fsi);
+	if (lbus) {
+		u32 clock = I2C_DEFAULT_CLK_RATE;
+
+		if (!device_property_read_u32(dev, "clock-frequency", &clock)) {
+			if (!clock)
+				clock = I2C_DEFAULT_CLK_RATE;
+		}
+
+		// i2c clock rate = local bus clock / (4 * (i2c clock div + 1))
+		i2c->clock_div = (((lbus + (clock - 1)) / clock) / 4) - 1;
+	}
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
-- 
2.39.3


