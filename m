Return-Path: <linux-i2c+bounces-15227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62100D30466
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 12:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4AC30194EA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9D636C0CB;
	Fri, 16 Jan 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="1iiW07/L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041FA363C4B;
	Fri, 16 Jan 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768562359; cv=fail; b=PUVllaeXk69YV8SeJi8PZGQlvgaLstXlZdl+JBTonFGAA9ZVFOQMLfnK+edW694Il3RpuEFsrN32xzpkCt1MHlNCTMeezVX9wUzeUGJWyDBBEQP3KcRgOmvMyd2Ic02sE+KxG+IvCYXJJNH+NZ4LaTn4aeekqZKJdlnS+HIa4iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768562359; c=relaxed/simple;
	bh=TAIvC/WflG1OcoYL7QyCpXyWtKuMUyFFBTuZsx2ZcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IAg32DTANwkXd5X8x/v54smV1kqRFMXnaNZRP7736qwEPYIrINLH58caqXvL52xylkpPFuPpLVU4GRLbf2FhhVagtoVZmECUe/JHwimdjf5p0uULEBF9NJKmEdoK4JKhRL4hXWp3PKK5ej7Ze2ok0imFBq2w9ZYGcVzuwXfisfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=1iiW07/L; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXo30NNYMHt3Ku+ObA4ZalcRz4cz7i0MAy66qQ8+aDpBsstGARx8jFXNrwfCcaZUD/HH0tvbqt99GudhZGvm+w7Orq+zzlkec2OLEYDpFuoBoiRo/0H6EhVexMWJK5TdpXtvR9YLLlwrJzMTa4uxV6zaMwPtoaS8N0y+CjXMMGhiT9Tf3kDL9jcgSKqXRef1frNAvCZxDsjd7Z6mtn6mP/iGLrJJ61gFSCQiv62TC724ZfIM2wLdYDpT8VmO6hlMOj1U26JHWEkdId9g91ol/wy18Sr/z2sHqIFOHMLSk6WtDgHtmMX2rt//Omc/WArSqxZMwWNSYCZ8/zzHmxWhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=;
 b=fxeaqrnO0WSW5RdOl9DIzVM910mSraXmdwQn0aGN9GXnc0f0/nzCOFAP+6/vzdMMbQKtcEEY/IY8HSK3BqMOXruLayuf3TGiN8AIM9K/B5GSRxy5cHP455GeY+XWflIoTtjPYJ2nrDhYbEE8pmII61QxNJ5uXl/XFTkdJan/chYhYzE4TSH+m/f2lyRD8ffD0JAuUQcoGuicm9fVrlIknG3csE4DmBp00vRDka+KPA/+eBDw+KwC89xacgAv7yFvnoEFCI+wIE8k3c1tJkq/9/IaZ/LUMdSpdcc7+W4APXuQWCrct5eg3+i8AStcIYz7zIkOvwNGcN9x1/AhKHwmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glJXnym83efT86ah5wXNGNLQmzqfk5MnqExx5kngV+0=;
 b=1iiW07/Lrf7aUwRJwAHxnQRH1zKq5nzJGxfvou8z6p1YBY8pXZNnGh0+uzJpLN5LfiR2+WDaW9FfgVjpF30uaXx+vIIlJA1Ijdv18GI/VyWS22o9BWE0dqUsd0deDYy6UqbE3VCjcuGSUlXoj/NbkH0YaV0ytfdq7j8bUiPZ+BI=
Received: from AS4P192CA0049.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::22)
 by DU4PR06MB9790.eurprd06.prod.outlook.com (2603:10a6:10:56d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 11:19:10 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::8d) by AS4P192CA0049.outlook.office365.com
 (2603:10a6:20b:658::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Fri,
 16 Jan 2026 11:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:19:10 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 16 Jan 2026 12:19:09 +0100
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
Subject: [PATCH V3 1/2] i2c: imx: preserve error state in block data length handler
Date: Fri, 16 Jan 2026 11:19:05 +0000
Message-ID: <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jan 2026 11:19:09.0572 (UTC) FILETIME=[EF567C40:01DC86D9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|DU4PR06MB9790:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5861aa0-b8d9-4ec6-4842-08de54f11254
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a368DYcC1jI/scBuBWpEZp72suCo1S/mrqcX64u6sGm9TPQHHXkNO+Ob0YPp?=
 =?us-ascii?Q?y3lh8SY0HmArBYxLcqjij9VpcM7p7CR5SdHweDns8otlxbAeqMJqydJ/Kta7?=
 =?us-ascii?Q?zRhlfyetYz/Eg/NYkW+Ez4X/0w6u2BxkgSyFlOdy0PvrRfljSdMPhEy2uEnC?=
 =?us-ascii?Q?TsGUCkaPDCpAt6tSxz+9J0EIIPJcAHEMY4LCWRFTiPZ1tNIyv8ZA82m6/C6U?=
 =?us-ascii?Q?kB9WcCz/buBthPH/PTBGD8hC14x0B874fYWIVzj7wbS1SgRAfngEthsO1V1a?=
 =?us-ascii?Q?BiPqHU6eESRM1HfUWjl2b/7vVREN+xsmCcmQqbVyqa8NRSuYS5DO+MioDEf4?=
 =?us-ascii?Q?Lft4N8ff4bshCubYwiaMGf5hKueLpNj8ei+kcXgWgfIAXipFFTWMDLIl/ECk?=
 =?us-ascii?Q?F6I1H0yp6dVqdH3bnIXpX+K7OfYHj1uCkj6AxC2Vaie1I+bys/qerJK3BVSd?=
 =?us-ascii?Q?25gSkh6fRidHz8Njjr11N1OMP6GUFCbzH3e0KO2OJDVTLWp0PeX8MOxxM4Id?=
 =?us-ascii?Q?3GW0M+UU3ACPyXPeLKJZMaZTK6E6fv7ptChqExWwFbZYa5KKz6PzcwaEVO2o?=
 =?us-ascii?Q?YJEvnASidcu9eO3KN3dahitqsoev7dq89tCx1lEE5g3PZrA9k1y1uZrP3MmK?=
 =?us-ascii?Q?DzRNPD3bYWzeXdsSb0RS7aNacyHigrKJENf3n3Dv6YtqU+9eVhb3ySDtRiat?=
 =?us-ascii?Q?nYOjlPt6AXjEvVqNkpkyhS1RoGfqyApDhD/k4iKqJi9Yc4weg++0UBv8ng0T?=
 =?us-ascii?Q?ZnQVUqgST8/W2kz0LGVWpW6xLmcFNaWuGzIukYunaFDht0FNzGKg2jRG3sO1?=
 =?us-ascii?Q?fZ4EQA7MGYPHxjwPMOGWimI/igUk28eB0fEtq6tLEF5cZtsDo68Cdpi//hDp?=
 =?us-ascii?Q?MVfjt3h/SOI7JYnge5zKiAEG1uLWBuL7AT9280IhyknXTHfQgMbtXb+W7Qtp?=
 =?us-ascii?Q?qiClhD1fTTOBg1UQXNP/qGFbFddmk8JhZ+kRFtMK0BnG9OepMco1CaQnBWpz?=
 =?us-ascii?Q?vUxWKs2zSytXP0Tn+qPerPOIgGLfTd0T2hltKYH13FwmfYJDON2IQ3xns1Bi?=
 =?us-ascii?Q?WUahuoMGT9FsCN3ap7K2hXJpeLu30d6fqYVmLCI2POKwOzPaK2gfuOF0NU+O?=
 =?us-ascii?Q?iZgAua8xarMxX6nON7IoTeBpHPAh1L57z4Zr//3J9+L6uBps9b0K9Eg1vFye?=
 =?us-ascii?Q?NCTIBDLaejqQtTubv2DaNTZ3aDUUtVA9U7iXOaX/kNysd5clQBnVixuQr8cG?=
 =?us-ascii?Q?szrN3Cek+3XEvu2Aqt6WHosHyH5k3lPd7u8KIVAcXW+YRP8ZQ9uXiY2wv8+/?=
 =?us-ascii?Q?V51H1YwIRrSdmzIS6ge8XklUZEOOy3Z+jKvpkREdvwR+DSkXravPDCY52Est?=
 =?us-ascii?Q?ejITyW3Q0Mkimy1s0nyan5o07SEEUFmNLFk7b1oliKhfIkFcwPZo8DlYobKv?=
 =?us-ascii?Q?zcSZDf5+UGU6FeqbBJB5yB7o0sO1JyjyHc51Y0DTCYsLxhxMTV8MOfUNSJkP?=
 =?us-ascii?Q?/MZWCscb4vor0zycMRl7ww/HRG3MTnLPuGONJ+K20yBYFH2IrMaleca1E0AQ?=
 =?us-ascii?Q?Shrd4ynO1cpPZGrxpPrGVI17cBYm9jXoiQPhXUw2V5KqFpuCrvIDoONWUBdF?=
 =?us-ascii?Q?pSQ+7t5n93QgwtOlz2lWmCDY3aNhUqM+IswI9Wbxt5diSscjoNAsr2IK+MyO?=
 =?us-ascii?Q?M0rfO7L4S0qljv+N8F24d6Y2gnQ=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:19:10.3625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5861aa0-b8d9-4ec6-4842-08de54f11254
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB9790

When a block read returns an invalid length, zero or >I2C_SMBUS_BLOCK_MAX,
the length handler sets the state to IMX_I2C_STATE_FAILED. However,
i2c_imx_master_isr() unconditionally overwrites this with
IMX_I2C_STATE_READ_CONTINUE, causing an endless read loop that overruns
buffers and crashes the system.

Guard the state transition to preserve error states set by the length
handler.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 205cc132fdec..05ba41144648 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1102,7 +1102,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0


