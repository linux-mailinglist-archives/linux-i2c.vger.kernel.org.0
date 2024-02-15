Return-Path: <linux-i2c+bounces-1797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D057B85703F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B429B254CD
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6214F9F7;
	Thu, 15 Feb 2024 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="e8MRdMO1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886214C592;
	Thu, 15 Feb 2024 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034916; cv=none; b=gUF76IVwjQp1Qf9jrsf/3clcGLrnQG+BDZpLwOffIJ+XRZ8XyGUPa6ZcvCC5dnf6TeOtlq7dOa2vBY+PwUAa2GgTixmvXeyiCaeDhd7gTfOuNBvrFiUhwhOrJ7QPfIkv8OABE1qKL6/bgqWdWYeRqoDTCvYTUTHo1ilaBUze+A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034916; c=relaxed/simple;
	bh=T+M2Nn1CbVzGiWWZ25GQh8RxyvzQFAsyFI0vKdVAGuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qGjt35gI4lb6QEw0zVacBhFik2zpgRxP+Y4Z1QXIWvyDthcCJiXI2/1II3VG5tKrnICr56mMayMCcE9TffO6Eoj5JN3gKw0VnGx3SdmIfBwIgKUhMTbWddTpRVJL9uiPaaVweRDrPmPLpGhd3pCin4848TRhxUVp00yAJ8FdK38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=e8MRdMO1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FK8lQW002054;
	Thu, 15 Feb 2024 22:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0qbOHG7gDL7BluVHG6aIFuWkCkqtnciMO6tHFzvcS9c=;
 b=e8MRdMO1hbaviK8k/hers7rurq0QRJrMnBOOoCLA4AA64rghHbfTqBzZ5PpXXFhAQOvQ
 KX54O/WqsBKKnQzcVxjevUJ7XZEHh5wnGqrI3mjT1SApYpasla4jrJIFwqr/N7Opr2BL
 kGuM5qq340KaZkBpp6m8HvlPdb83nMx4s6tCC3eatDSh3hB3Od4M2i6fcFHOtG2rtpme
 RAYC6iXxAnU5oePkB7nNsAPsm8UjllfEOwn+JJoECvZDCstKiJXdlyK8brK88IFCmzFd
 0OTe1HUqr3mu9o/QoWY3RLRDRiCRip1yjkM2XLa3MC6KqcP3FQL0bJ1zvMzkimZVswt2 cg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q8n59ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:14 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJAQbL032596;
	Thu, 15 Feb 2024 22:08:14 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftyuem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM8BZE19727026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:13 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FA1958070;
	Thu, 15 Feb 2024 22:08:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35DFA5807F;
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
Subject: [PATCH 27/33] i2c: fsi: Calculate clock divider from local bus frequency
Date: Thu, 15 Feb 2024 16:07:53 -0600
Message-Id: <20240215220759.976998-28-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: h1yX6zc4QTXOHVkx21FJWZcSkuntX65z
X-Proofpoint-ORIG-GUID: h1yX6zc4QTXOHVkx21FJWZcSkuntX65z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=956
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

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


