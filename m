Return-Path: <linux-i2c+bounces-3874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB018FD8E0
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764711F24764
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B879217F4F2;
	Wed,  5 Jun 2024 21:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h2RoRc5h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6474D16DECE;
	Wed,  5 Jun 2024 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622627; cv=none; b=D58MBvBMNhDv1/XIsBZdkY5oWU2+tQjHIpFFPqs4JJkCV9QRr7TqxWpsPNOzlIcUyzQuDKmPrPFf00bjGcChssvAz+AjyszhXZ6phAXCGhxDGn2urEd7rehieLltgjSj+0X+eX4m80ghn9QXpvB2R2RSJ+IJy1Txv+NiXg59nmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622627; c=relaxed/simple;
	bh=zMJ+8CKS5IsMYaQmugxKikdp5cTIBgraD/MHYZfjCLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZYPxJS8wbgPMppKQ2lwlBAJLoHqzJeGwOzYQCYsdDsTqCKoHxVn5EqcbJvD+t+Ox866oWAd/5ijUpjvJ+Bs16RfUieyeLoJ4ikaMRM4UyJoyhWxG94hDv6R9eZ3grDaNymfJyRQoE3zY3OK2u6Sv1xAU23k915EGGqgjp+03Udw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=h2RoRc5h; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KKjwf025645;
	Wed, 5 Jun 2024 21:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=HSXJ9y93L2w7WCAUvMAiyKwD8OoKP9OCmQlQEBeTKjo=;
 b=h2RoRc5hkNiq33dYGtaDUsQNjDVbRXf/FYGirO4oFwkZ/aZMMUJZI9B6c4gJACYclT0G
 Ydefg8POZqrT0aNB2wCaOXBoQzA9V14TmLiyLec8vJOHNLhbkKEHBdDw67GiKS3RdDfO
 FQGOvfhYQsgC9fpFt+CVYlQckIGPM24n2bF1al5Y337SPaGZCkD20JKNmqXsBJDLfm9B
 pJ+5aFXN0McAYK8tpL2ly/XiiQf7i9db9tzRtrz137ECvlfcaRINKnSl62Vcy0DUL4th
 KY2Iy53h7v5sL/k2w5l/OE7/UM6Oe4J2DKsPgi8snqMdw+XRYOX0yAB1oEtBqofEf7Xl 5g== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjuwr0qc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:29 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455IKan1000800;
	Wed, 5 Jun 2024 21:23:28 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ygdyu6wt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:28 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNOR459900160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:27 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEB8158055;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8134658069;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 38/40] spi: fsi: Calculate clock divider from local bus frequency
Date: Wed,  5 Jun 2024 16:23:10 -0500
Message-Id: <20240605212312.349188-39-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: pXJf5SWkcjqXjY5lUhHcF8kD5LZGfCph
X-Proofpoint-GUID: pXJf5SWkcjqXjY5lUhHcF8kD5LZGfCph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=856
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

Use the new FSI device local bus clock to calculate the proper SPI
clock divider.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-fsi.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index fc9e33be1e0e7..e762690f1a390 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -40,6 +40,7 @@
 #define  SPI_FSI_CLOCK_CFG_SCK_RECV_DEL	 GENMASK_ULL(51, 44)
 #define   SPI_FSI_CLOCK_CFG_SCK_NO_DEL	  BIT_ULL(51)
 #define  SPI_FSI_CLOCK_CFG_SCK_DIV	 GENMASK_ULL(63, 52)
+#define  SPI_FSI_CLOCK_CFG_SCK_DIV_MIN	  0x4
 #define SPI_FSI_MMAP			0x4
 #define SPI_FSI_DATA_TX			0x5
 #define SPI_FSI_DATA_RX			0x6
@@ -70,6 +71,7 @@
 struct fsi2spi {
 	struct fsi_device *fsi; /* FSI2SPI CFAM engine device */
 	struct mutex lock; /* lock access to the device */
+	u32 lbus_freq;
 };
 
 struct fsi_spi {
@@ -359,7 +361,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 	return 0;
 }
 
-static int fsi_spi_transfer_init(struct fsi_spi *ctx)
+static int fsi_spi_transfer_init(struct fsi_spi *ctx, u32 clock_div)
 {
 	int loops = 0;
 	int rc;
@@ -370,7 +372,7 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 	u64 status = 0ULL;
 	u64 wanted_clock_cfg = SPI_FSI_CLOCK_CFG_ECC_DISABLE |
 		SPI_FSI_CLOCK_CFG_SCK_NO_DEL |
-		FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, 19);
+		FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, clock_div);
 
 	end = jiffies + msecs_to_jiffies(SPI_FSI_TIMEOUT_MS);
 	do {
@@ -421,6 +423,24 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
 	return rc;
 }
 
+static u32 fsi_spi_calculate_clock_div(struct fsi2spi *bridge, struct spi_device *dev,
+				       struct spi_transfer *transfer)
+{
+	u32 div = 19;
+
+	if (bridge->lbus_freq) {
+		u32 desired_speed_hz = transfer->speed_hz ?: dev->max_speed_hz;
+
+		div = DIV_ROUND_UP(bridge->lbus_freq, desired_speed_hz);
+		if (div < SPI_FSI_CLOCK_CFG_SCK_DIV_MIN)
+			div = SPI_FSI_CLOCK_CFG_SCK_DIV_MIN;
+
+		transfer->effective_speed_hz = bridge->lbus_freq / div;
+	}
+
+	return div;
+}
+
 static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 					struct spi_message *mesg)
 {
@@ -429,6 +449,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 	unsigned int len;
 	struct spi_transfer *transfer;
 	struct fsi_spi *ctx = spi_controller_get_devdata(ctlr);
+	u32 div;
 
 	rc = fsi_spi_check_mux(ctx->bridge->fsi, ctx->dev);
 	if (rc)
@@ -446,7 +467,8 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
 
 		dev_dbg(ctx->dev, "Start tx of %d bytes.\n", transfer->len);
 
-		rc = fsi_spi_transfer_init(ctx);
+		div = fsi_spi_calculate_clock_div(ctx->bridge, mesg->spi, transfer);
+		rc = fsi_spi_transfer_init(ctx, div);
 		if (rc < 0)
 			goto error;
 
@@ -533,6 +555,7 @@ static int fsi_spi_probe(struct device *dev)
 
 	bridge->fsi = fsi;
 	mutex_init(&bridge->lock);
+	bridge->lbus_freq = fsi_device_local_bus_frequency(fsi);
 
 	for_each_available_child_of_node(dev->of_node, np) {
 		u32 base;
@@ -550,6 +573,10 @@ static int fsi_spi_probe(struct device *dev)
 
 		ctlr->dev.of_node = np;
 		ctlr->num_chipselect = of_get_available_child_count(np) ?: 1;
+		if (bridge->lbus_freq) {
+			ctlr->min_speed_hz = DIV_ROUND_UP(bridge->lbus_freq, 0xfff);
+			ctlr->max_speed_hz = bridge->lbus_freq / SPI_FSI_CLOCK_CFG_SCK_DIV_MIN;
+		}
 		ctlr->flags = SPI_CONTROLLER_HALF_DUPLEX;
 		ctlr->max_transfer_size = fsi_spi_max_transfer_size;
 		ctlr->transfer_one_message = fsi_spi_transfer_one_message;
-- 
2.39.3


