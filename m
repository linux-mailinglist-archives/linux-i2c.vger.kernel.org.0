Return-Path: <linux-i2c+bounces-3526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63A8C7C1C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758B528367F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155EA158A33;
	Thu, 16 May 2024 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AQjOSSQu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DF315821A;
	Thu, 16 May 2024 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883576; cv=none; b=l6EBNfOeiORHzQNJtelS7rFF0SKX3l/xuOH5m06Y2qt0BlpyB+FujGf4YXGv4eHl9uOnrqnYBZCdncqOs/+IaQ5OnmalVdf/pqap2q6Zc0L+YhdI9yyUQe4z4JEaeiFYrKBxKqEhs/9mNH1qqXbWTS7oYGhvxudN6x9S3/lUKbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883576; c=relaxed/simple;
	bh=slfeP7jv04KD+77W9YVhi2nQ0zgozUuqQLxJaCyXoLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gwsRvqE/Vhq0XPSCEiZ1eN9+B0znTsE6JSKUtTuTWCaU7KJdIIaBQQhbXjoEimmytudpEqM0mgw8AfRw1RoILQ8gL/ot6oWn5H0HC8yAUKAXF0FKXB3++mYi0Doq4Vk72ZYxCx6EN+8NpiLVo5UL2VnFV1G/kp6kECqFJWDPVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AQjOSSQu; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GIAesx020807;
	Thu, 16 May 2024 18:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7rdXwcif5odw8BMvyEIyfx63iGwhjk1j2vHqrFPW0j8=;
 b=AQjOSSQuej4TMs/S1GS8nlBVYJX748XHLdqJS8iKj5mrgojAU+D3HHHiQVlVdMOB/gtB
 W/w7DL++7l6c/pTAXy87qcDxjzHAzO4LjGAOcIexOkSIVgbBKKPFm2yPcPoMYoGXJ3B2
 b1RAu+KNZWaYXq1ZgnV0ynySK7LfTks3cbWSprM2HyAm3nSX4nt/V0mKtOxHaFHG34kC
 sx6yQ3Fm/nk7c7jHF+JQuGDbq/y+MasofCpFYxalCDgj40yc+2YWEtOgV9JndJy1Xbis
 bbDt88qiJOVjEzhHtPfpAgriv7Dpbvecs1JHws31RR5Jz3AvuHDB5xjOik3qU2dfWzk6 ng== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5p6gg5n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:22 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHFiN3018766;
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0tuqeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:21 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJJw717892018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E65DB58069;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7A3158070;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 38/40] spi: fsi: Calculate clock divider from local bus frequency
Date: Thu, 16 May 2024 13:19:05 -0500
Message-Id: <20240516181907.3468796-39-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: t6GYCQt_X6uhjL6KkshgjWQhVkW4aZkY
X-Proofpoint-ORIG-GUID: t6GYCQt_X6uhjL6KkshgjWQhVkW4aZkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=844 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Use the new FSI device local bus clock to calculate the proper SPI
clock divider.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
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


