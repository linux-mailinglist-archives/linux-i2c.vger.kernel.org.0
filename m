Return-Path: <linux-i2c+bounces-8963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E92A05927
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 12:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B3F01608FB
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 11:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B891F8AE3;
	Wed,  8 Jan 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bCPx0Rxb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A6D1F6667;
	Wed,  8 Jan 2025 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334410; cv=fail; b=QLqme9DBYCCEti+db9VAA739NgHBXye94VFI3e05swWI/C9zHYit6nHjSkNrt1MkrlitOPVk9TfvzKf5O4C00yRC3rzO9Xs2oHMnRD7A7qSdqlq4Zsnbeks6ioMT3JMgV8IUp9T9y10q0llYEXuWAenOE2pw3b7F2i0HRZr/wEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334410; c=relaxed/simple;
	bh=eT6Fq1QooaUYE0vwTFSWOZThPV3AC+ZgZKB8BXFYYa4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBolLNK8IvEgs3EL7Q6rzqxVcEcS1zEIHLb+UMModoRpgEwyU9p0GsAvbTlv/JIqsCk5dC3oUJS377s+55OyX2SB9i6ijYqVjG1PhofTGOfii9Fvdk2CI3LFFyHmA8jm0qAo8UEDFAXCcTm0v3K20fsz+8gk9+g3vHJ7jZxvCu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bCPx0Rxb; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHaMfNAsK2P2XtXemPY0GD5KvFfKp5hCDff2NWgQyjjAv+1UYvB0V8+teSMyb8+ewd8yNE5BC9ANxwP/Z7bsdPbZZjV9Ck7N0MGItMc75afpOjg6uMjtu9DcweuX7ys5y0QF+xaQmo3VHLueRDJnYHcz+drm0iMQUojz0BLl2kIhjB1ffWxx/85O9sxKWEVHr1Aw4+w7lGuJ/s5P+cxRaG3L1Vwywfgf+cyw1ulAGbkiqcuuR2riQW89Ulb7xyd2bdN2ya31sR1wdR1hMVkcq/o81aMbNYPL/5qx1JXLi9L6M//29s0/WLsv3MZuIjUvc4s24q9PhN7VXOU6w47JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTNa0/Boraw+jWFz/x9JhyMejnmsHmu+053N/Vp/vd4=;
 b=q3jUW646j5qVNzlxgT7xHMcoGDiUcwnsmeBi1de2k4Cr1uDwBVuGWfrKVboj9H5vn4Gs5jWHPb5V5/fv/xWUHCiN9C/U3B+zK6WvMCi24OliHYjDq1dw79RhYNz9UfRHLCOeTgV0CcLEmJYiSRY2RCB6875hDnt54L6HDlqWrPz5tZb6KiKclhNJel2P5rq1o90Tl7abpiafh/ausUe2ddpdEokQxULV5A58Er8+ktSIgn/OtRHrW/RvLN/ys/5quKDS3YK3EjRsihitsMwiumAv3F8hHyH10g2jddo1utBp4X7M1psRzQkGGtRGXGJQoaU9QfUM+vXqm0cUFZ9CMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTNa0/Boraw+jWFz/x9JhyMejnmsHmu+053N/Vp/vd4=;
 b=bCPx0Rxb3QZcuPqKN7hbwvP4+VAlBMySPS8nnnyk6l9k/kK6Xee9mImDl9ZG4t2Fh63FTQ4TTS7mJjWlkwQbH8n/CgTuDbY6eUIrYuOYwocYKPRJVVe+hUUHs07rFLbVOr8fusSdMATQnJnz7viklCnrPk3+lv/eMFE17NxRFJC0oB+sMRGab+czgOhW73xhDYESEYGmdKZx9pNP8Mp0LOovB0JvkaymRO7V1oGzJpj6PaMI1Te7bdK5OafvMfDEpNvafr4bJkwTFyaoOBrA/vES0QUzrb5/1ZtoudEJL5EnwK1ywbb0QqrYgzON9xV4c5wsX4jLy9TyqVdjTiQZwA==
Received: from CH2PR05CA0059.namprd05.prod.outlook.com (2603:10b6:610:38::36)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 11:06:40 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::57) by CH2PR05CA0059.outlook.office365.com
 (2603:10b6:610:38::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Wed,
 8 Jan 2025 11:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:06:39 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 03:06:33 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 Jan 2025 03:06:33 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 Jan 2025 03:06:29 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] i2c: tegra: Add HS mode support
Date: Wed, 8 Jan 2025 16:36:16 +0530
Message-ID: <20250108110620.86900-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108110620.86900-1-kkartik@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c73ae70-71f6-4abc-e761-08dd2fd486ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b0DB0LWKrvNvihoEv/G2OYzfe9+2MFVpVeyTpk1z853PNQOMwIZOonYeUBS9?=
 =?us-ascii?Q?fsyKihWWv0uCEl9JBEFErXpbU0Yv/luHhAOkQJoQhgB+RvOgBhuKBGBi+dBB?=
 =?us-ascii?Q?T32yQa0OXzbAtdoapdpXAZc8ffvwHlSw9iWdpqEnBg015p5OjyvJ0TrT084y?=
 =?us-ascii?Q?BIUrmy3w6WcBpM15bepYKrb62HnAluKYWx2vU2GntFk6GO+5kJqvFCvXd0pZ?=
 =?us-ascii?Q?yf2QjkOVkBWyF8izpANNvpegU9Pu7u5gVafni1VjKaP7mr4fbkTgNBq88pNA?=
 =?us-ascii?Q?Y5JGbPf7r5KT1yK8Om6MV3FML8dWNlyBbASfy0Rr8hNJIR56S/ttY7Kq7XhI?=
 =?us-ascii?Q?OCMp62BPRx2xPxc37sAfDBC2kJO9n2iCIKpLWv4xVninNez+pPIWF8yc50UZ?=
 =?us-ascii?Q?TJD/epIf1MA5jUc/5mwWZHoCCpavkCql6VL2EDR6ocFN4pIjo7a7tAnLMQ73?=
 =?us-ascii?Q?O2ipN3/CwXjWJkc4uBl3pi+q9SbbGinWJ6RKk1+SdauAmvUQuuuZ4LuVi9Yu?=
 =?us-ascii?Q?598DAJ5LH/UeTQYrWkiAw7GxqVdHTEWZU7sBfnGMjIHBtXBlqORCFQz3R9r8?=
 =?us-ascii?Q?5+0Y7blBtTnliAN+RSmppvn8eGHGusjglMdNvc56MeXF8VZZWnKB/bCTKpZ1?=
 =?us-ascii?Q?a/8UCHvT94zJjOHuwM/V5R6pe/XrdO+K8d01hJN/rkDWcBUI+w6O3Bsz0hBM?=
 =?us-ascii?Q?9Jc+bmu0InFaMWZ7rFr6LM2O0WM14P4+vf0dNYZBwRuElNE8N/F9hygoHf8Z?=
 =?us-ascii?Q?UtHY7RM09dkOQJQ4AjhPSjivywQIoHXDKPFeFNhkmLZ6fowGiJoX1n1tFZFb?=
 =?us-ascii?Q?Pa3wJUYv3sn5jCzUR4E8jGLoVGUTlz77XyaalK8/LbgEAsa595uYqso+ILNQ?=
 =?us-ascii?Q?SjuhagRhBhgAMU3UHa48YsA0d4OIPTqzwCDY/QMg4K6Uagi9j4sTd6Km/ykX?=
 =?us-ascii?Q?m7OJjNW2InVNlcosGx4k+SxIF8rf/NjtQBzTJJyKwZCJbrBEN7cNp5LKYUgw?=
 =?us-ascii?Q?oZu4L+R/jGm1O/KB2C6/xwSANk1vLX/bv8SYAU8DqbnisR6xkQ6uO8lo+xRJ?=
 =?us-ascii?Q?1k0Eva8sH5onio/LELIr/+2BGWV63OqZ/rKfMLmOIpv6xqD2MAGu4jiziu/h?=
 =?us-ascii?Q?SH9ToBrzLX7Z8f3+wWRe/JVlu4VDuj5frpCDazjtGIf+w39pPy2m+u2RjC0w?=
 =?us-ascii?Q?2rpcMor00F6+hVYAdDwrHwA04BDaWwiFlEOLHyf4F8KlX6FgNNC3QrRlSsgt?=
 =?us-ascii?Q?IIRl/0LwSYgC5xLchO52A9RyN8YrRH5w45uiwaE5ERPmrwo7/GKxZI15aeXA?=
 =?us-ascii?Q?8J+kJCDnfC7ugZjNlzfBHiX2qITrdrNRMVD6CvDjwdwwW2tN4weObVFoBy9E?=
 =?us-ascii?Q?4cDLb8wpQs1XTLw8GJ2OkMKwdMZGCviBNrfdXsMQ69Za/JwuD4CC7O6q7Vxo?=
 =?us-ascii?Q?c9RAwFoJnu6FkElxwBN6hb49OPjPyJt9qe8u/ieOnnoXiVoJWZG5DP2cOST4?=
 =?us-ascii?Q?OpDo2Q2uBzZ21NGK/oGGpcrJjFxVM4kZbbra?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:06:39.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c73ae70-71f6-4abc-e761-08dd2fd486ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626

From: Akhil R <akhilrajeev@nvidia.com>

Add support for HS (High Speed) mode tranfers, which is supported by
Tegra194 onwards.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..7b97c6d347ee 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -91,6 +91,7 @@
 #define I2C_HEADER_IE_ENABLE			BIT(17)
 #define I2C_HEADER_REPEAT_START			BIT(16)
 #define I2C_HEADER_CONTINUE_XFER		BIT(15)
+#define I2C_HEADER_HS_MODE			BIT(22)
 #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
 
 #define I2C_BUS_CLEAR_CNFG			0x084
@@ -220,10 +221,13 @@ struct tegra_i2c_hw_feature {
 	u32 thigh_std_mode;
 	u32 tlow_fast_fastplus_mode;
 	u32 thigh_fast_fastplus_mode;
+	u32 tlow_hs_mode;
+	u32 thigh_hs_mode;
 	u32 setup_hold_time_std_mode;
 	u32 setup_hold_time_fast_fast_plus_mode;
 	u32 setup_hold_time_hs_mode;
 	bool has_interface_timing_reg;
+	bool has_hs_mode_support;
 };
 
 /**
@@ -681,6 +685,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
 		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
 
+	/* Write HS mode registers. These will get used only for HS mode*/
+	if (i2c_dev->hw->has_hs_mode_support) {
+		tlow = i2c_dev->hw->tlow_hs_mode;
+		thigh = i2c_dev->hw->thigh_hs_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
+
+		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
+			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
+		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
+		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
+	}
+
 	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
 
 	err = clk_set_rate(i2c_dev->div_clk,
@@ -1178,6 +1194,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
 	if (msg->flags & I2C_M_RD)
 		packet_header |= I2C_HEADER_READ;
 
+	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		packet_header |= I2C_HEADER_HS_MODE;
+
 	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
 		*dma_buf++ = packet_header;
 	else
@@ -1618,10 +1637,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.thigh_std_mode = 0x7,
 	.tlow_fast_fastplus_mode = 0x2,
 	.thigh_fast_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x3,
 	.setup_hold_time_std_mode = 0x08080808,
 	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
 	.setup_hold_time_hs_mode = 0x090909,
 	.has_interface_timing_reg = true,
+	.has_hs_mode_support = true,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
-- 
2.43.0


