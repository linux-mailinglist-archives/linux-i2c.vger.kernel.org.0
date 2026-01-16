Return-Path: <linux-i2c+bounces-15216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A21D2E9BD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97E7D300D821
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD1E346AE6;
	Fri, 16 Jan 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="OpoJsVaf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446134214A;
	Fri, 16 Jan 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555035; cv=fail; b=tceUCzt8Tql2MAdtvZQP+mULuNvxxxGPMKgEPHqUSjqBnk2XkjNkqe5TiljVv5fuYJWjjmykiD578OK3b4/rTQOGvuoxoofC2dEUoPJNBEjqw6EX7mAuCj6jTV88fFne0UiGhb9c2fCeRyTZmQRchIfe96gwrnhJnyOQDOE6IN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555035; c=relaxed/simple;
	bh=nEUWuJfz8h+XuKHimyqpmW9aC8sbMb4pZObqVC6n11k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YTXnai83hyHvsPtFWhgCJpWzxSej27CK716MlvQoIMZpkAfFTZ3du4s6DkWfyYFVN9Snzd3FfAEb9VogdUAoi6nlw5lzY5Gej3btf/qxsCFrx2s9MbVEsRy5xIs1yKwjV8nIqY288QolC5PzZ9EO0b5BRUGH37aOIkRFIW2ivQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=OpoJsVaf; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqKtUwgU1brI1xh/e+Yq9DbJlzBrtCySk9Bwjywmt0i1Jojfj3k0ogf0yjgRo0AzAtkdyKycVIqHc6wjo+4K1B+CUfvx6L+iqq8lnCCiYc8W5giSYgtS/Vd19JzI0GprMGGrOry2FEHyl6iDt9I5gv7Gy6eQGm25oGJUxYXdj3ocENmtvw+wOw2ha/IzJZ54bVIIG28+TXpO3tVTm2tOgPYeF0TNaGq17KYnkbdQJLM8pJbQXv6dJPv5bR4duL7N4mChE1zwjWPnPdAmS/aXCiZtNqXcmInJQMzM37WQFOMajvY4JAw0z8Xg3TnF19CNTdPQr34+UWC77N6QQX+JIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=;
 b=NQuCM1KdFHivXH3tVaRTxMFZTfW9obO1HBTWS7vuzJFN92U6+iN8lF0jd95IVb6zcRgq2UATA4XPemXrIa/SizEYbFlTaJfwIm1vz57w6UKgHHrzNef6vDEtzyGBIsQQJoozC680vEz92JCqyDtpoc1lPfIOUFQnWslM+tJr1D9480TCfYaVnOwsxTFQ4qn2l9j8o23M34kfg11yhI1BxgYSPk2u1Yqi+q07a0yHPyKuP/2LovvK7F1f+vPDU0xy1yid8GOLkVHvJF+QjoXsPqjY23eEJiZZjSsdrP/ojg9CFJuE7/oAGLH3RU0zAxzu0tsUzRgVKsNTlBHQ2M55hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDABDkSwpunIdkRyqxG4Q7jtF8dAxzQIhAzsw4Vcg+Q=;
 b=OpoJsVafkVO3niIKvIL6ZX+29WHS2bD5ChOJMUNm0xThjZc+iuAgGK9cw6RD/OrsIFAtB/8BfNjTa44AyuVZQAGsC5WBYRHXai6MXDgbOVR40742ao2n88JJ4Jv4sEPtIhvsA9661DISg8bjuTZjSXyjdHrlu3ihKwdyTHaZO9Q=
Received: from AM0PR02CA0191.eurprd02.prod.outlook.com (2603:10a6:20b:28e::28)
 by VI1PR06MB6461.eurprd06.prod.outlook.com (2603:10a6:800:121::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 09:17:08 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::6f) by AM0PR02CA0191.outlook.office365.com
 (2603:10a6:20b:28e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Fri,
 16 Jan 2026 09:17:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:08 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 10:17:06 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bsp-development.geo@leica-geosystems.com,
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Subject: [PATCH V2 2/2] i2c: imx: add abort path for invalid block length
Date: Fri, 16 Jan 2026 09:17:04 +0000
Message-ID: <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 09:17:06.0418 (UTC) FILETIME=[E265DD20:01DC86C8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|VI1PR06MB6461:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6c1d0718-36cc-4354-91da-08de54e005e3
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0gGUfoirM6mERlNEKkREYtzyDd8iQmuvPwxFnYPXgyoBh/EBqxzU1u6l7zZC?=
 =?us-ascii?Q?7VE1BstGi2fjoLjmY4Guer6kDyjgjTKra4NG+cjnqHr2hFbnK/zosgvWYM/4?=
 =?us-ascii?Q?Xm+eczZxzHcAoNq02Tg4ye4ooY9U0/VQ7CdAYqVG7NecwqOD7TSMXr81jHLj?=
 =?us-ascii?Q?iaAIwiPfK+icSR0/tvWRw3Vo7r/mhr7c62JOV9u72Eip+kUN0tVl9QtMqNdQ?=
 =?us-ascii?Q?UkLT1MhigGxs5iR+vvWjcZdEZVTyoSVAGIaeqp+2ufFQcr8Bo63mfvopR7fO?=
 =?us-ascii?Q?dyvlc/2NNNc3+BIPbivyTV0V7SKtHqMLq3j4eq7YytDTow0NmZml6OGxj9WM?=
 =?us-ascii?Q?zCqYqgW5qfEkrIbsd6/0dl0auemk+HXYnkn3/XJ8jD50admrNanEC/RDw7zG?=
 =?us-ascii?Q?7FsUkK9/hpB5k5mfdQ8uYutwjnAvTkj0llQBNplVV7lTmAtzwFAyVIfslCDA?=
 =?us-ascii?Q?1iwk3r5I8kKIbrn9XKLEFH/8o+C4k5eTsHqmK/UW/7Tdinsq7KniRpfhHJED?=
 =?us-ascii?Q?qScaSTUw0D9RBYg5ZSrTCBz3t+qlCEoZiF5bh2iY6X3xYk6+f0wozr3wEus6?=
 =?us-ascii?Q?ilGrKczDb87cVCYvbJ0NNAW5uQ1Ur7uaG861vghL3Dr0mFjl4VxqI1u2nPHc?=
 =?us-ascii?Q?3bAeepFQZByZe97woFw1eN4Ai2Fq1vt/A3povMtWfqNDrRrQ5df1GToayOSY?=
 =?us-ascii?Q?xEPdrjMOFQIokMV3oqWfx9iG+X2u+HdkUUhJYueeyUgZ/8ujcsj4+OPlr6Dz?=
 =?us-ascii?Q?bc3Hixzle6iYkpKzM84m9TFLkTwkDEfK09Xer7w/ANHNmmgc5HEX4brZpIqa?=
 =?us-ascii?Q?wGXKFrdBae+EqNogX4TmeiWcXp7NW+qUHsoTywYo2jM2AdF1mgDikXNAwuaO?=
 =?us-ascii?Q?8m2zQw8OlfKGkD7TU5U16/hgcLBsvruT2YVp6EZAyQWpBdU9eupALqodQZYg?=
 =?us-ascii?Q?rjsaFprwKyoDwLJz1Gtsz+hI3OVmcFyhL3pO8z5RdUbuQpBtzx7pJiqvWvOF?=
 =?us-ascii?Q?L9PgxBCrUPAkxhr+9oKYNSkXmjtIryhgo4vGbJKvs5OoE/XrVbqEwiLwdYMB?=
 =?us-ascii?Q?MI8b8mg3RtuC/0s/AqeSL1sM/kc8fvs8KFeLow37zgv7EEnNvOX8qDG2dQC+?=
 =?us-ascii?Q?132VyY2Hkv6P+xOIwg51wVBVpd1UpPFGLR2T5lsqemPN8Sk+qX2aI10lQdGy?=
 =?us-ascii?Q?LG4FlIH2qhs20UBS3qRkuGH9FdtXyj2VVEDRodkGFMCRH11m2+jMh5w2jUBn?=
 =?us-ascii?Q?xfBTFu2Y2uL9CgQ28F6hdcezb/4aAv7RH+WRxCzx0aB2Ghy9z6xMpANz97Ab?=
 =?us-ascii?Q?F8wgBZKY5RQ1US0f+ylxlykw0PzRucB2F2SU8+B4Izdrxc+XN3OcHcQZdCJV?=
 =?us-ascii?Q?mjZECxiqzwzwXjPRUquWc1TzBfe81Y5KCY3PMRqMoWtQQiHX3yGUawpHSWig?=
 =?us-ascii?Q?Vvry39rQ/HztKr3kpt/pJI1X3WdpZTH9eqduIPAXRV5GBJTo8l1KPWvYnciZ?=
 =?us-ascii?Q?1olVzRW9Xxb1E81jjO4HYvS61KPv2+GBIEhQwUd4iAW3M0f1VnMURfKWRquG?=
 =?us-ascii?Q?0GNJmn3JNyMN7r+Bah0Ag2iTkY8bWxB73/GNydLmNYq6aPlzBhM9/lxcnj+o?=
 =?us-ascii?Q?bS7DncyPVB9ds0FAAZ8PS2yTyk32UZH92nNidhpn937XhJTAJW65c5EcO1vZ?=
 =?us-ascii?Q?F7+3eqg3rTIoYfeuL5DOVB6K3to=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:08.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1d0718-36cc-4354-91da-08de54e005e3
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6461

When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
the current implementation leaves the bus hanging with SDA held low,
blocking all further I2C communication on the bus.

Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
handler to properly terminate the transfer when an invalid block length
is detected:
  - Set TXAK and receive the next byte with NACK
  - On the following interrupt, generate a Stop condition
  - Read and discard the final byte
  - Report -EPROTO to the caller

This ensures the bus is released correctly and allows other devices on
the bus to continue operating normally.

Tested on i.MX 8M Plus with continuous block read operations.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 85f554044cf1..71457dbffb7a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -233,6 +233,7 @@ enum imx_i2c_state {
 	IMX_I2C_STATE_READ_CONTINUE,
 	IMX_I2C_STATE_READ_BLOCK_DATA,
 	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+	IMX_I2C_STATE_READ_BLOCK_DATA_ABORT
 };
 
 struct imx_i2c_struct {
@@ -1054,14 +1055,60 @@ static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 }
 
+static inline void i2c_imx_isr_read_block_data_abort(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
+	if (i2c_imx->is_lastmsg) {
+		/*
+		 * Last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * Before the last byte is read, a Stop signal must be generated.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		if (!(temp & I2CR_MSTA))
+			i2c_imx->stopped = 1;
+		temp &= ~(I2CR_MSTA | I2CR_MTX);
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		wake_up(&i2c_imx->queue);
+	} else {
+		/*
+		 * Next-to-last byte to read.
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Generation of Stop
+		 *
+		 * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.4.4 Figure 17-5.
+		 * Flowchart of typical I2C interrupt routine
+		 *
+		 * For a master receiver to terminate a data transfer, it must
+		 * inform the slave transmitter by not acknowledging the last
+		 * data byte. This is done by setting the transmit acknowledge
+		 * bit (I2C_I2CR[TXAK]) before reading the next-to-last byte.
+		 */
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_imx->is_lastmsg = true;
+	}
+}
+
 static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
 {
 	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
 
 	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
 		i2c_imx->isr_result = -EPROTO;
-		i2c_imx->state = IMX_I2C_STATE_FAILED;
-		wake_up(&i2c_imx->queue);
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_ABORT;
+		i2c_imx->is_lastmsg = false;
+		return;
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
@@ -1107,6 +1154,10 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
+	case IMX_I2C_STATE_READ_BLOCK_DATA_ABORT:
+		i2c_imx_isr_read_block_data_abort(i2c_imx);
+		break;
+
 	case IMX_I2C_STATE_WRITE:
 		if (i2c_imx_isr_write(i2c_imx))
 			break;
-- 
2.43.0


