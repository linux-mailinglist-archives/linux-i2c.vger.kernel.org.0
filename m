Return-Path: <linux-i2c+bounces-14829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F6CE63A6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 09:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B541F3008FA6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 08:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2CB23EAB4;
	Mon, 29 Dec 2025 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="jOtQuIh1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C92221FCF;
	Mon, 29 Dec 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766996286; cv=fail; b=d2r5pRewLgBU9HE4D6skoVvFn2Kq5tTyOcEHlCe6kU5YLU6oaqCLQP69jBGOlxavZivQtRkduq+A6Q1vvKy6wil+qma4HrA/BYde9XvnxLlPD5VCCYB/51nP0Kk6bHSzoyjbBbDP1DaEcQe9E2O6kH9peHAZwVOk/0OHlqUZkjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766996286; c=relaxed/simple;
	bh=owDlthlgpBQmDi70KMRR4YLl3yBiJXJJRI3dalSrVbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wsz6hxGQ3ioK0i1XolQvkW5dgQIZMtZ/jnDFX2Gk1MsNN46VV6v/GYFHSJqi5Y++CUvhdT8KvGq5V6jsU5gvgCSMZ1W9WikMGvaNPYpznY4XzqVwTr6u+9EhsUctsmT0IoA6nET0d/fZFg669MGLf0SK5vcGNmCUvJKcjOLh22Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=jOtQuIh1; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUCHgWlBeJKBeW009rkFVPGh/MEj1B8RMEFry7/s65P6ibIUeEeAQHuTJBwFbBdfKcPS/TFL8YPJ+B4ydz/vze6Q1bmYW/pu5qKUuBuLe4v012YapUYCSVXkHc3H3ZlAmzGw3UcE2SAfvzbRS4kLxSesawSA0Xi7BJgpx4jHuCRHj5OkKrLJq0oqBzULl5Khdb8eUX3hsruhymPdjIziN0C9z70M9sr2wgu/CPI74Ay2PR7LOHkW7F1um64mAW5WkfH04VN1BvLHPKDUifbcDjkrcfHYvDMqESHrNvoliYDMXPleeqGA23D3gHRYsTjJgLaMFzTdDqhzs75LVP/7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=;
 b=mHo/AoDJvCDAa7R635tlh0f5IKOeJIcsQ7+aEr5ItYPEkSudsO+hNdRSZRXz+wrdBzs15X7KtuxxYO4V62k8VvZioEkCEGrLHTAzM7cCIuh8J4Z9ZJMU7XlowBaEd/hQ6CNAPEOZd/7o26yB81xg1FDKW9CvjdMahD6iHLTcA/z9bpeB+1kz6y0KtgyFt6sGpNMdYwgt9B+kVxgNrPrKCUUPCaSHitVaCjdu1XiLaAXPdI11tVTMBr/kWX35ZWeaSjYrmfg9al1f6/9rG4FgiyyKbn8j8rWE3smqSA7Mo2KW+viD0iiIEFQWumV1LGvXD/i7EFsAJu4xyKeCVZguJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/I6RRUjm9il6mjPH1XUvwoEPmNbJiY+iUUsgWRezhY=;
 b=jOtQuIh1hwMTHQoz3MsQXjV/1Wwt8s/6D6ZdDIun2Chc9w/5X6BhPr3aAlkHPL1e1hV048enZglc2zysmdUfOinDrKeAW/IfUKZwxzdNsQUa9+bEWP4yu3t3rRBBmEltWvtQQ5R+KgmpQXa1/BgnIRvWNRHR1m1MD6ckTxf1r7I=
Received: from DU2PR04CA0260.eurprd04.prod.outlook.com (2603:10a6:10:28e::25)
 by VI2PR06MB9427.eurprd06.prod.outlook.com (2603:10a6:800:21f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 08:17:57 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::cd) by DU2PR04CA0260.outlook.office365.com
 (2603:10a6:10:28e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 08:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 08:17:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 29 Dec 2025 09:17:56 +0100
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
Subject: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Date: Mon, 29 Dec 2025 08:16:29 +0000
Message-ID: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Dec 2025 08:17:56.0436 (UTC) FILETIME=[A3021940:01DC789B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|VI2PR06MB9427:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4087c894-df46-496b-e8c7-08de46b2c5c7
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uEznyyOAlOhFrHOYn3OqWafG71AR9MiMmUU4R6bFD/5kMNfo8+zmT6RnMzmS?=
 =?us-ascii?Q?qczDh3Xtgnb+7Ruq5MgynJUhO8mfMVrpDsoXLeJkjHBuMuUeNjY+EA67LGmr?=
 =?us-ascii?Q?21MGwStZTLKpWdvfo/PoIUAWf6sA8ZIcb9+HOXpwnCHINR4Ho1LC5N/+gfL4?=
 =?us-ascii?Q?Kcp7OiYWq6BiYTWN2QdoUkTyDLowQsM8p8trZFA+dBWSDIaA/lLKfqmY9ijM?=
 =?us-ascii?Q?it0c/X/4SEvc1NJlrGwOEQi7Lk/r3mcA33gnVLV9CJHR5YBZ9/0JVVy1Facf?=
 =?us-ascii?Q?xsL9y3LjwesjgNK+9W7j661Kv8Qw91fWDMyepqy6wyJCXsqi5zlqHuVkuWZi?=
 =?us-ascii?Q?7L/2kpWiur9bxKBeZrs/Wmd1tIClruYndnbScSvFGaQSzE+XCzcwh/9OTje4?=
 =?us-ascii?Q?cCEuChhTloTPHyTVg8exVdz0F8AN8Crv87IZlTobDzjrGfMVpoS2H48PL07w?=
 =?us-ascii?Q?h2YNTe80L6ysdi6gT0eM74NSipu8WJacrTn7lHpiD4vUiuCWcLJAvyJ8J9zj?=
 =?us-ascii?Q?TbbPLSltqt88oxOnVvSQBv/LDFf9mNVzFDSZWqoVsRXD5SoZtp6bDPDZEdXz?=
 =?us-ascii?Q?zLhKaDziY6f86PgUUwvxILY9eZug/AueLhHbOmkBiyja/V65EToktSVbqhgb?=
 =?us-ascii?Q?wgFuM4ICXMJ53BC7Mi5WTkb1WcFklq9zfYiSpKspyBZWfV/B1zidKgG2slSS?=
 =?us-ascii?Q?Rshd8qg+7PsGzXfzQsgWRPaL1sHkv2RVhuKYqI7YjfshJuQYjUrNOpOeQ3SC?=
 =?us-ascii?Q?8WTFd8djRrF9+zXd5OXUtmuov/9O51IF/2pmwnA2xujByo61KjeeAImU6wxk?=
 =?us-ascii?Q?jONtYN7nV0PEmhXbMxt2cZP5EPS+k6FfJCYx+uziJ77JrZHGEV2OZQeQrCsC?=
 =?us-ascii?Q?axO4eiE/fcnWw/QEtrepXmTBJz6MKe5gKSJiuLJduv5ppm2N0cy/Vr7eQOGz?=
 =?us-ascii?Q?KX7DO/gXWVGY6T4IuBuLI6YT339bLiodrzXf5t2v/rz8r58MceGbFGvHUCaz?=
 =?us-ascii?Q?51AyCFgU2Tiqxmnz9YojNCSWJ3q2BwnneljsnRdlllBqKrHfsBDlwm4jWDRR?=
 =?us-ascii?Q?rZHWZ9z7nHcoVbXoyCzqLkFpnQNwV5sEOrla6VHlKbqwdmnBgDB6Y+Aao0KX?=
 =?us-ascii?Q?Y6y4GRsu+qha4oY2jI8LAT0XNjdw9FrU3uvY9CEMyDcGnSCkAaNEl5zDzcR4?=
 =?us-ascii?Q?15jGFZkEU6hQsvwZEr01iBM9ABLU3no/ETNgFtUyJjfhhJqMwgW4r4hHvO6z?=
 =?us-ascii?Q?hCMyFh8Tz3+PH5WxW7O6D+TEht2zodTH2MCxdFU2N1FUMwox5o6Wc1Jo2DlW?=
 =?us-ascii?Q?wQFRAv36K9LEGZblE5XIljdydo4UnrTFqCHxs23S6oyAmBBRqqhh241IPNdv?=
 =?us-ascii?Q?WbCaxCDtXjE/fYzEMDlJ17cuLCgp/EDrNXCGUqvWv01+gfl6uWBvbl22rO35?=
 =?us-ascii?Q?vxdMAS3n73qIlFIPMCCh/IXKU3TsuDUoukB99bRnTIajn7Jqk7FRJ+4C2Ken?=
 =?us-ascii?Q?ea4LKzkK929wAMyBhRp+V2x16TjsdWh40NE4MVT9Am7m+7G9iK21Nyq3BPOG?=
 =?us-ascii?Q?FfdjAz8UkAHpu5B4DPelJvAwn8+B+6ELtw5JG4xY?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 08:17:56.8127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4087c894-df46-496b-e8c7-08de46b2c5c7
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9427

SMBus block read transfers encode the payload length in the first data
byte. When this first byte is zero, there is no payload and the
transaction should terminate immediately.

On i.MX, if the first byte of an SMBus block read is zero, the driver
unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
This causes the state machine to enter an endless read loop, eventually
overrunning internal buffers and leading to a crash.

At the same time, the controller remains in master receive mode and
never generates a proper STOP condition, leaving the I2C bus permanently
busy and preventing any further transfers on the bus.

Fix this by handling the zero-length case explicitly: when the first
byte is zero, ensure that a clean STOP is generated. In this situation
the controller is in master receive mode, so it must be switched to
master transmit mode before stopping. This is done by draining the
pending received byte from I2DR, setting I2CR_MTX to enter transmit
mode, waiting briefly for the mode change, and then proceeding with the
normal STOP sequence.

This change has been tested on i.MX 8M Plus platform.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dcce882f3eba..f40deecf0f66 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		if (!(temp & I2CR_MSTA))
 			i2c_imx->stopped = 1;
+		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
+			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+			temp |= I2CR_MTX;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+			if (atomic)
+				udelay(25);
+			else
+				usleep_range(25, 50);
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		}
 		temp &= ~(I2CR_MSTA | I2CR_MTX);
 		if (i2c_imx->dma)
 			temp &= ~I2CR_DMAEN;
@@ -1103,7 +1113,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0


