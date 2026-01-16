Return-Path: <linux-i2c+bounces-15214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF90D2EA28
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B121130CD39C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B083451AF;
	Fri, 16 Jan 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="UrpBxp3h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891A34321B;
	Fri, 16 Jan 2026 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555035; cv=fail; b=IMFugG+dnHv7HDV+BkRdxGEyKXfdbL8BDhgjeVEtKc6EsK6Aiu8cByv30WUCyuQjJ8iK0ft3QvQdYprb6UlIRgxzWD3C8mpTvMUAaePSRYb2LleyAwQD31GmfYoKhy6gDT98t8G/5DR2kXAhTM/R5TZJjq3/sqDtZwIuNoc6o/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555035; c=relaxed/simple;
	bh=OaoxgJjSLRqgJNkEF4ebw1iRQI7uXBg45B1D3VW5r6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHPWRq7sPVgFdY8ygMVO0gHrojBpyiTNJgkuRJnPkpMj8ofS3JcvvtbFvxogkZyCe73KZuesmdDN8MieDC+5EgSwL9DuFIxDwJ1d739pu33mjN6l9q1695w6BWukLjtb8RuIn/rLsF/MADv/qfJFnFpvM2LFvWBqyoLu2RAo9aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=UrpBxp3h; arc=fail smtp.client-ip=52.101.72.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtdDNojOIIuz78u41d78KSV5rcKd3/JA0Q5q/FKJMeqNZjUMCJN2O4vC+C+pmQlosR2rC57ZtCGzYy7+HCltWjOfFRgA9PqCUprqytbJ8ueTZdV36k+CxeSxRknicVG+tVS/pOXWwxNvh+EMHh9Undp1TXgRu0B0IIyt+fS0SQDQ3HhiKjt4Lb5IfxvDuFtl1bciAMMuSUpiHUhPdUkOUGMXEGlKV8Y8e+q9XP8MsEQTzvxf6s3OqR0ArZOpKKavJGWgHD142iu8GEUMcM8HWWcdyjqRlYxr3wEOqd6s0ko2/YPqcX5i9CmsXcYQ9lNAPuXR5W3OHAzGPQRN0DBH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=;
 b=GI+sgiBhZD4AnnElRr2N5fHgfZfNtaHwKLxh2rIaVa8pUuCbFYNnAkHkm7TE8dE87zpRHOv5opjPZsNVi+Dj965gBEcEhFGqawgxJHLaVm/FcAzgfsI8WH+qrKCCaoaFD+YJ2Q9lqy/32cLyXog/ni2i4jzpobqIJkkfCHsqsHcAA/lal8gQ/NsUP68VlLvRnzTx+CIcdSj/KYIHcGAw/oAcx7n7zgr9HOqOAmc7ueNEcO8ie1lOW9mUqzBH1LzNvPsUaGWLxchRueYFDB7cvopG53AeNRjNSBPbR1hucexhQLSUFOavHntV/tT78EEWpaDdxI6emuKAJyt/QFbT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPT97ZO92JF5iijb60KQS1ccCmcahHfYT0GR4HzkkRc=;
 b=UrpBxp3hbsnrK6DxeOjW0KEhUPV+HBI/ewWUW0vqepuf6cCLXGjLNqOEgFGLouZBTTqtU2XO7rUwZz1hYOmlNP4jHYTtSZcAp1qvKYgTkziwPr6U/pJw+KtzasKCwgc/LwMMrGliMJXr+RQddlUp0VnWsOCfrkH34/vGzcuAHXk=
Received: from AM0PR02CA0192.eurprd02.prod.outlook.com (2603:10a6:20b:28e::29)
 by VE1PR06MB7102.eurprd06.prod.outlook.com (2603:10a6:800:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 09:17:07 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::cd) by AM0PR02CA0192.outlook.office365.com
 (2603:10a6:20b:28e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 09:16:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:17:07 +0000
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
Subject: [PATCH V2 1/2] i2c: imx: preserve error state in block data length handler
Date: Fri, 16 Jan 2026 09:17:03 +0000
Message-ID: <20260116091704.3399142-2-Qing-wu.Li@leica-geosystems.com.cn>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|VE1PR06MB7102:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1e42b1e-467c-4f86-788a-08de54e00592
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bDvyE6VZ1Kc2DVe5CN2tXVgfyJkUHB2bTXwTrPesh7kopCJJjV6K8bsLK5kg?=
 =?us-ascii?Q?4tYC1siSAINxW0+582PFVetnfIGLMoDMngUpx6MUDfxC8KyfiBwfBWaSk59X?=
 =?us-ascii?Q?iNZRm+k7DHsXpb+vBn86OVrJMcG2CcqQjrr9+DtedAQaZNfoSd8JxH8Uc5M2?=
 =?us-ascii?Q?Vw+ANVpXOZ6/W2H+cCxntY3PT6lKObDgJ1DSAhZp5KiwV41HaTBZJON+AmEL?=
 =?us-ascii?Q?bxZ7MfVyhWPEogIymviRRF/jtEQ/ezOBb4RmX5ewKGsuNdd/muD4P/j5mP5x?=
 =?us-ascii?Q?A1Aa4vLCw5dNwiPROkWE3V5RkUT+eifrkLYGAGgqbsjCv9D/pCmXLHSh+n1i?=
 =?us-ascii?Q?0Odb3xsOgjlSw7yFIEHkVp1RMiJdOYEGB74OBfCmr+SkNLAdRT98R6TQc2Ys?=
 =?us-ascii?Q?+5gXazVzZ4WUM5L4/pBy3TleK5BEYmxTZ0tv9vJVn/1MtETDqcN2dV8/tC8g?=
 =?us-ascii?Q?jpocGwNBJ/U9QuhQWecSS09NqseKnZpFGyp2CFXktQZ9texCK9A1FRBEQXCw?=
 =?us-ascii?Q?8l6vsZ5dAeMlogt5CXoefSFa2F+tqy2cuK82baXug66mS2ced8/Gw5aC80KP?=
 =?us-ascii?Q?CxCTpwV+aI5LfAF53zHunHRvubmeTiJO4whFLqs1aEnsoKhmF+fXJy0y5I0C?=
 =?us-ascii?Q?oeOD2cZcYoxbJ3kajwTdNNyM8X7yUv8AFD8UHixH74pRNYmKLKbCq4bIbWgF?=
 =?us-ascii?Q?ChLxfnVjCP2k/9MTlx00h+4EyDV9re1P7uVvGrenqTx4/QwmuTLJF+HlKvDV?=
 =?us-ascii?Q?3Tpw4BpPsARj94fYnfgjWTvyOPEkmxfYor1OOGmXioQQSHSBEh6riYWBcOWt?=
 =?us-ascii?Q?LwZ2STL5RUdFeyU4gdILKy9T0DRuOd0mUK9OxUQLcDGOnIbxJY6iu8wtyrwA?=
 =?us-ascii?Q?zjU8tHaSU8LUfuO7JOp1R0OeY6/YGCane3HHkvZ+YKd6seosSJm2DQF4VpMd?=
 =?us-ascii?Q?2G51dqSVg87vd6nb4ysD43XDgv53V7WUQ5MAjnvxQamSP14VUDsytr/wJqT9?=
 =?us-ascii?Q?lLz5ZNdFxTgglf4iNT3iGbD1FOFehofUvnvjyNgdbZ98qIiN/PKOfib1nzVH?=
 =?us-ascii?Q?/uXrRXjPytrji2u4nab0oJRD8nzMt49HM8Pz9lsqgNEuajItQjfzbuvhKKM8?=
 =?us-ascii?Q?qLHZtEUnx6hj1QbsCZXOtUrvuen3Nlwr0cbsz7gQfHq5KGR6ks1NhCwH8CTY?=
 =?us-ascii?Q?bbosJlBZdIxDZPl5UatVd/k4BBW8qd1wNOn062HnvscHKSx2mT8tLI11n8nO?=
 =?us-ascii?Q?ncl97BIgOfCl36cNamnpior5Em8+N/QsaqEFwwKyq1fOAWg1usK5VxCOJVls?=
 =?us-ascii?Q?L/WslEfF4K8tdIpYG9Fd+ykaz22yQ9NeepsjLjP0YET1NZhBzZzDUn9y9qpG?=
 =?us-ascii?Q?3OD2gMz+3yjMMpDdvN+dNkn6vWUJrTk0Gd/owv5Lb1v5iVooVudOMqv/8Z3b?=
 =?us-ascii?Q?JnH8iVpxWeqDoQC+vYPBO63/ZK7tHzcpeli1N6zx4koXumTzJw2uenUYFGqP?=
 =?us-ascii?Q?usHY+4klPqTtkCmhVQOd0K5L6PN1YoO2AnLheD3f//omWSirmx3V7dQ7EvpV?=
 =?us-ascii?Q?rejumTU5U5uXRFTm2Ra8YlN9lI+AnSMK6pmH4hxmKvZ4XKEOIeXzwC/UZ2fX?=
 =?us-ascii?Q?z58JEbJ6bhXIS3V+8QeapsGnDP/37GIzh5t8s9Jep1mqHnY8tlzEduCK1G+Q?=
 =?us-ascii?Q?OLya35IILNzauKzSZmt7j7OLFSY=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:17:07.5137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e42b1e-467c-4f86-788a-08de54e00592
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7102

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
index dcce882f3eba..85f554044cf1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1103,7 +1103,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 
 	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
 		i2c_imx_isr_read_block_data_len(i2c_imx);
-		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
+			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
 		break;
 
 	case IMX_I2C_STATE_WRITE:
-- 
2.43.0


