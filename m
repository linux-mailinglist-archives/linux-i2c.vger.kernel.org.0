Return-Path: <linux-i2c+bounces-5913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07D96401C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CFB1F21F3B
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9822218FDDA;
	Thu, 29 Aug 2024 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W4Jzuh1o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1E18FDA6;
	Thu, 29 Aug 2024 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923728; cv=fail; b=NCjsmX3rNyhfpHBmuce4w/1c7FlekZH3gRfYERcjSAqgeb1AhS4mCtk5J+NxB+GjDjzFpjXWoh0C7f+P9TiPZATcJokAzc1oZeIFz1aMsH6eIlxR1BBWkJMlBVL/BuKlZz+v5FMJnw7Tj9qGicHCfdzy5Pg3rgnDXdwQKLXooN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923728; c=relaxed/simple;
	bh=k1QqtE24uZOJyPWcfFnA1FVkrloawdKgeMGB3WDNXLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eTfS0tqXqrsXLPqXuOB4Z/lLR+G6nOYZ0c5R3bQyQ9D2eXhHlAmyTZqIbG0E668RMF1BY5enwyunBIxZUYVjhSGyl2pw6Msq3P/Ii3nkl7knwxibuM22LHoLlbfaBxxdAgGFDNvwSL+D4oD2so1yfhEP4yx9apk7kzpYe7Dr+Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W4Jzuh1o; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX78+gwBXu5DF/p1QKBUIz4aMFoemJPxUjLjgvjD912Q39FYnkoxw7SnZWgEWGqGaoIwwCdE0IlRKTGIPkQNF0IKjYTaKGiPmqlCLrnQVzP90bddLqVnn+y+KLdzGNi/3NQv+tYdGPtqfXPpfE0wrnLMo6XL817wdgnG46NM+pFMkIzZm0bLgncCFNAJ3y/+uST80+suo5fXbIoTBmXgw4fapqTE/f6IfwGSNg2PQnTjE/gPa+Y/lu8x1O/laizfAUo8A4TvAqEoifWQPgs9TrKVmIp/enxIFf3POc5wXlHGutJQrMsEd1cX/ZBLgPnKy+3IeT60rfp3nLa6+B2Fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pOKWFsLShoUkFNjIDJxlro2YyKFvBdbovV7Gwq3uZY=;
 b=H6qJHKnWSR78EzNBgg6e997vGnvl1FQSndcrR7Q/4DLEcMz/Q8GAJ59j/QiBLemBIQ8iHC+EA8JOiA8+tvp2VA3Pf3euTiFanfZEjOkTUY/AQavUfJ26VLpQDDJoOxLpnP0uBFNTbdTPi4X2qjfFhB7EX8jLm2ZWtD61m+dUcLFARLYwykErUPn8ncwWyTG2geKEgIHGtSQxu3RFeFXonJTw87jhZQ7SyHn2ITLF2xHVDgABLALhpLhvXFc3CqUyrQS5veHtrDYGfbFUFHZhp6FO5QwcCdngamNo6DXN1afZFAAbhqtYr2l2K4y6STTxZV1fvghMkv4BuA2iWnq1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pOKWFsLShoUkFNjIDJxlro2YyKFvBdbovV7Gwq3uZY=;
 b=W4Jzuh1oOvnAuItagQbuCbZZe/RV0mWYGRrOVWFcJPgCIHgTX0W+r72DpEudHR2tpOCPpCagHCz6iVBqpvyn900TzWkjL5Fx2U+oDjE7QqkTqaYNv62jJrjc7Wrr0mvwTH6TPnxzJqvZZHJNRkpQFTPhCkET4o4Qfocp6ht5yQ4KaVO6tumIwMuUCYFCK1OfDByCVPHOEhFg8RxfvW25/ws2C2c5jVgGGauMJlwv7V9kjEkWmoOmViKv+896g2gm7tBUQyFaQq+LLCWina2M3G+wbcqOIQCp6t36cbF5DwhIYxuLQELxNSK3y6uiz/8AYVYYp9tPO0vzJVheJsvQww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:28:44 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 09:28:44 +0000
From: carlos.song@nxp.com
To: aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] i2c: imx-lpi2c: increase PM timeout to avoid operate clk frequently
Date: Thu, 29 Aug 2024 17:37:22 +0800
Message-Id: <20240829093722.2714921-5-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829093722.2714921-1-carlos.song@nxp.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::15) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: b01af4f0-34a4-49fc-559a-08dcc80cf9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Snr6dm1xVekDOO/ux7Q+U+TvaI/n24zpPVl+Pyvppw3ri13XoNiIRLF/SmaT?=
 =?us-ascii?Q?zXtUZUS6gw0E1K4kFXRk6oiuBUgGqK6meyktqCeHvQ5tjjpXahsA2r0X5zKJ?=
 =?us-ascii?Q?mAAJ95oiTvXGzMDm9oPsLKVek8S+eAEkHrH6aGRxX9yT4S4nGhQtF6bMFzC+?=
 =?us-ascii?Q?VPb7YITYNOX+568p6TfIUp+6vVwc48zWiSt0FWuvzWkJbfUu9wssJwVKmjcr?=
 =?us-ascii?Q?50Zh7NB9VBhYkrw5XALyWA9mbuQzRb1flN263fXx+YP9bbVIoWE8NDf4IQxk?=
 =?us-ascii?Q?Zz5LgG48zSIhB8oe/UmKjGjzfiisufGIdx3Byel7Sty9JxOMMienRepcZ9an?=
 =?us-ascii?Q?6fpntY1jZRIBKsdK7esntfvPxPS/QozPXgSecd9o9cyPyg/JjPDGt3wg0Ec+?=
 =?us-ascii?Q?52CfBQDrIBABDtgnFjf0QWQP2BvtD98e/IwJi1Ry+raLM6E+AuOYo4G/Womx?=
 =?us-ascii?Q?TykZSaE1aXLhazVmZud1zk1c6fbeAtvT1JpzmV5ynVPf9cW6FHoCfj6b7yeG?=
 =?us-ascii?Q?ic0r1kRF9XcctHOqDYU9zp1Ae8R6/Jg1YEhisZVMQ0LQRBrcCBSVBf3G/KVN?=
 =?us-ascii?Q?ETP4/iAeYh2lI/rgCZfSYkgkXdl2tfNcCvt/qmlB0qOKhUPQaFgvYAMZmSdI?=
 =?us-ascii?Q?5G6coHewrpq/HIXg6RPoRoqwFR5Yl/SXPMlJhHFDMPScG+NKrgWEw43CpMnW?=
 =?us-ascii?Q?qoFWhoUyeiT4Oz6QQseEZGZwRiUN4trssLliItmaXzMfsCMV0oqYoxspio6H?=
 =?us-ascii?Q?a+8itwzzvCjEH+umN5psVhQXcTRhCOqCSfv9EygFyLVUNnuK99+tEvmAvbEc?=
 =?us-ascii?Q?0PKCc3Ent8fdouraNmppKhqMLeFBOjNYsOEW60AArJnTZn8PL61tgRDBqxx7?=
 =?us-ascii?Q?/DexppN8E1GKLRn6UcT7go+/pTWWHvlthh4VypF7nhQFnQfJRLxDwfZwttAF?=
 =?us-ascii?Q?99YdwEoIGncXhYdEUM8sKv+0SrBsdfSxtbiHRpSa7dovsjToTIaKh5qaKd//?=
 =?us-ascii?Q?u6sBzNyFkjcpV70gAKnBglMIDjeE6I3wmMolpGjWXomfSJnIfjsz0a3XWoVz?=
 =?us-ascii?Q?xBiJ+AhwU5pEeHLCx8LCLn1Soacf6T3QxDj1XnMsKbAqVXjbnNNkOHsEdonP?=
 =?us-ascii?Q?SfdZjDsyE66Lf0z0KCSnIukorpgHj8T8Tqb/3clHAuB/bzONBKEpptxw6Bt+?=
 =?us-ascii?Q?nbNlk6PD/PUuBUmPiuALR757YejWEdHrnF+7X3gKyPKSbZgBeG3Lde8rMgPR?=
 =?us-ascii?Q?I8Z2RiHr2ogKIOPQ/r8glauQVGAPFIOrdcS4hsquV13mCejSdX+oWByyRfFf?=
 =?us-ascii?Q?rRBQ18GD8Kv4zz+8vh0SxzLFxNs1Loji6Ui1DfZbjGQni3sOjVVn/E7JVULH?=
 =?us-ascii?Q?U+apd8fpaAcmL73DgBhUoMg90HdV8XCLefufqbbHRSllWWMJ8A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y7ceSi4WujvjGB1gOdd4qc34CcB0ePh4+vIK6ISw7Mh5o1t2ecgiMvlDIHHq?=
 =?us-ascii?Q?XIOtkK1ue36Sur2ad5hndblehW8oOtcfyoartRA6cegqNI/uGEmkDTKJ4eB7?=
 =?us-ascii?Q?WYvc1mDeHN/DcZXDXXQNxJjAa3RYT3ySlfAsnwZACuug6H4jekVA/2cv+mwT?=
 =?us-ascii?Q?XNGs1U2q4YVpx9JlBav/FOyKQa3W4arVlsfVk4z4oPOjQMzk2cHGR1Y3bgX6?=
 =?us-ascii?Q?aNfjMeo5gHnlvIYHaJ9Yka9ga9w2XMDMmB6D8WN1sPdM2a4NwmB5fEMPGLgq?=
 =?us-ascii?Q?hxVu34I2XsVHBgFUomApoHz37hYa2+9yHSfootVb0LtmKUnegai8qscUw3OO?=
 =?us-ascii?Q?XsdbVGlordBS6/xw6lUVaRTHebWEW2WgH8VEJ64ghn/gDivJsBOorx/KNtqK?=
 =?us-ascii?Q?ULPziXKXyvR06dt23EiOhbR7wN8iAMfepr1Nqxtk2PDN1TxPpZegcUUmtBzW?=
 =?us-ascii?Q?UpGlDJoJARqrxB8taizY8HjWC6MoRgzuLlQzkBd/rT8RO1t0jG2RArcIf0WA?=
 =?us-ascii?Q?osfGu7Kaine+TRurZYkvpbGVJy192mqb+++BvdtdWLrqJ6Vn03Zs+0xmlyxJ?=
 =?us-ascii?Q?aguM6pwjaA0Ts9Y9mTQpcNPGagOxiVtmDLH8x3dvvq16n8+lvb0bVIa1fkjK?=
 =?us-ascii?Q?2kJJAQoPaKkrmL7w5KvfIUGGNQb1sjS4Tt9zV9/v2i2bNiHpmQl1dMsleB3V?=
 =?us-ascii?Q?qbpUwi3pkaePcwmfdcDoC95mmnnVI65I9NJMjNgGSsnWbqsg9qmkYo/tcnkU?=
 =?us-ascii?Q?wXSSse4+zzUTtVY9MX6GAiTNBh8baPfiNgpxIcKypfEN7FfK6firr+7ir2Zg?=
 =?us-ascii?Q?KsU3PZAgnZ1xZO+kDs4JYWWJmQggMWxVwEtJF5gltNLwbL95SbdXsanmSvJ4?=
 =?us-ascii?Q?nKwpgw/M/HbnJHJkS51qcJn6pDq/o6TZySWVKTJgRTO5OspDjXt4n8yVk+sE?=
 =?us-ascii?Q?l/5+lzDa3lk1P/GPv3G1aw4CfQkdTV3Z8CQZoL2IvVaC8kYBlpjkL5xsjXPf?=
 =?us-ascii?Q?JdLUk5/8v1KwECln3OVeDg/HxTlJpP6aDj/S4sBrGiUPvvaUgwlqSvK0wGjA?=
 =?us-ascii?Q?wKFUEVQrRRvvEOaz5nvG0bjEBxil+pVJwF0msmIbn4e2upfr3/2sXRA3fGb2?=
 =?us-ascii?Q?uGmpTLhnVm/R8ccHCK+gTbBhFnJ1/UUzO8GUbwyCObwsqAEcuSvAhgHluMm9?=
 =?us-ascii?Q?lBjUkBlKcXx8QHTgCMlLmAuEmKJoiQvzYYXzcHYALqA4J/8d17Atk3j6mbPj?=
 =?us-ascii?Q?lk2x0OjlwLrxvaqO+9b8eQGvWhXFpU+dCLLHVceV+ZM+JeJnu67H16sqBptd?=
 =?us-ascii?Q?kAF5Kr1ec6A8SEEPVuOVv9gVt+EUHkwCbC/gFjgoV+bQV5gSabd4btWCJ/wl?=
 =?us-ascii?Q?5NB8nI5NzheqOpf7BriKWtxsTMHbE3DPzSlmr8xrw91ae/ffXQN6+T3KFcsX?=
 =?us-ascii?Q?MJyXiuLlilfpnalsRHQ+Mcx6o25tpRvkVvfQafgJM0yTlvwikh8B3UAA6pht?=
 =?us-ascii?Q?jHuiSHghRKd2n5fRjYMjlwG+A/Crqd0AwCfAo/AJiIwhCSpte4gXCoahkLEt?=
 =?us-ascii?Q?OZ3Mds0pM8okrtlPRaZzI8PruvdlLBWfEUTqTf4R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01af4f0-34a4-49fc-559a-08dcc80cf9a3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:28:44.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTPojjFw0XwkJUNmgdTZcRqMwEzrRdAO+T6VzUma/vRaG+PM2kIh64e7smY2nXIfF+G6vsqGfeapLUavrAQd4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

From: Clark Wang <xiaoning.wang@nxp.com>

Switching the clock frequently will affect the data transmission
efficiency, and prolong the timeout to reduce autosuspend times for
lpi2c.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 210d505db76d..cc5e5d96aacd 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -129,7 +129,7 @@
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
-#define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_PM_TIMEOUT		1000 /* ms */
 #define I2C_DMA_THRESHOLD	8 /* bytes */
 
 enum lpi2c_imx_mode {
-- 
2.34.1


