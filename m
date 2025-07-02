Return-Path: <linux-i2c+bounces-11764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 912ACAF5989
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CF1A1C44E03
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 13:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F0C28727F;
	Wed,  2 Jul 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rOub6g79"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992F285418;
	Wed,  2 Jul 2025 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463382; cv=fail; b=S+MyeHSVGZ1AKe0XuiRwL4LU1Ov3pAkanOgd6rUtWjUxy1pv7DwFLXPBzaIyiPkRlcqj6jt15/r9U2/0OkuCSj5HE9tr5OgYVsAbVFonGZLtdU5bQLC3Hm/hSIioeQn/1liVRbJK2/+c2flzAfZH2FAXlxwbD+LVN82jHVxd/3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463382; c=relaxed/simple;
	bh=NawXKb0z91pJNDytjdTOwAuv9bq62Cky8OzMBp3T4Es=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbXfIrdQc8/HXv5FRt5c+jknwEbbE4pHwVtMi0XEb1Miu8mrlAOBb8ubvCK8pksIg6sDhnmo+dNLzMWoLsq8bkzxHU7tF1Ff7CP8BWbSmVApZtK1d1BadhPY9BXkq1fnqznYSZcs0lIVi9SQIEZdCXJjpQxc3X6M3VmnZVAK/bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rOub6g79; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgEgg+pMwny0VdpiXID6A6vFXi1kcU3dYFDSQV7txTp2RTyyLcUTJ/Tf6wUw515/VJ4eNO0mfwrNts9mEjCs5+VM8hRjwT99RlsUNqppcYtLGGHeuDPGdKY1qr2rmg9o6aLR8znFlTE8y7NkXhNd9OZ1/MZhC4AE1xirYGJMgqfdfSTdaVspNPTQxvfNvQ/RNJmY95AV1qDSwYzc9ZD/o1CVQ/YCZGmqMHgScSiOOibSgOXDoXCn64ErgZbRP0hQ7IrlLt5VCP3Ck6xh5fzKfbzKCWuqf5/CFteukk2700ITkBE4WQsYYq3NPjlbRdw8+QWogb31kK4vU4l9ODWgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7d0N9FJ5y5J0n+uIertvXYpbB5ebk9qrSl5VQI6EaE=;
 b=i3jHHQZmT9JDiCORQEdGSu2lI51lIaDdbqZj3XvRbvAr2v1l8FT+uFgiSnwOc4DkBzfa34+PAlOcLSXHNK4ftV4PzWUVFQ0QB+x5KAPetnwOrxGtlwhzwz4WmyfB9gyRBqozE860/st0m9Z6sgyWO0oTn9lu+iq2w6AQZTX94mYivXrfe46ANVjOD/SDNqjYSXvoyTjaJslq36U6dHWJ8j+wcgzZogh3o/XNkcV36MPpy5teSGOpNpx95LETgaJcXUZKXGFwQ/ec6qAmGKbVNz1WNrwx1vgjr5ZWipZUmWbcNXO7uor90vzOCsKdbLw7cVj9gBVb62WkzuYqeszVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7d0N9FJ5y5J0n+uIertvXYpbB5ebk9qrSl5VQI6EaE=;
 b=rOub6g79srKHADTQl/4Rwg/lZa+KfMr11rEOQhZgP6t6tR3UlcET6LMZjZFtVQbveE2CinjRuN2jHp2Ghn2HyG2mWHD+ORT2ZJZ2VeaOwHpXvLDpC1ys4/tfLIwQdl2VykrJSOQAtpsV7tUbb3eopGCNcScHID8zlQr9g01wZZMVFmnfIyD+GTVbM4sAYTspZq7vhwfhFPlw7az7vzFpu4IlNdYmpP0zMUpA5gAwaWe/6w70PPlwUTxRigMhIonXZDMuAgoNcry3F9WInVpTevMeV3SmgjN5btN2b1w8rwEDKLlq62E4qRAslwkyvoaBJK83wzy9oAVNFqsP0VfgAw==
Received: from CH0PR03CA0336.namprd03.prod.outlook.com (2603:10b6:610:11a::8)
 by BN5PR12MB9463.namprd12.prod.outlook.com (2603:10b6:408:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:36:17 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::89) by CH0PR03CA0336.outlook.office365.com
 (2603:10b6:610:11a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 13:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Wed, 2 Jul 2025 13:36:17 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 06:36:00 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 06:35:59 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 2 Jul 2025 06:35:55 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <ldewangan@nvidia.com>,
	<robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Thierry Reding
	<treding@nvidia.com>
Subject: [PATCH v5 3/3] i2c: tegra: Remove dma_sync_*() calls
Date: Wed, 2 Jul 2025 19:04:49 +0530
Message-ID: <20250702133450.64257-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702133450.64257-1-akhilrajeev@nvidia.com>
References: <20250702133450.64257-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|BN5PR12MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 375de788-1ed2-4c82-a335-08ddb96d6c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76z/D6JumaKVXdz7k0NMijPcYKeeffUfm4uAsrTpxRTCis555EC9jzwSCIdB?=
 =?us-ascii?Q?X3xfzkWhu7RNRngO/CyTboUJbDa8+xC0uGtIQAn0DWd0T7yZ96hFUf5sovIK?=
 =?us-ascii?Q?8uLbJ/5747WnerP0ROeuHqzgNjorHFQ3boCFJZP4P4AgUDcA5AexbcUtMj+B?=
 =?us-ascii?Q?F5GpyTYaV5Q4zJmWs5krkYJvnnoeDzo4I+0GTYL6mvEqrRnIGyMOR0UktSFM?=
 =?us-ascii?Q?dvR5LdARSRPvL6Rp3UGMVmz8mWlh5Jr2viZ8O1+kUD08ZO2qsdziM+yjhOMu?=
 =?us-ascii?Q?7GWWMZ6qRS7AMNW/7J6xirqBVu4diY2gEycjGNJvXxatpRdy1MDw82JcQHF/?=
 =?us-ascii?Q?6H8iLWoolYQcDCmlGl6hmAOypm6b6SuEX3ypOmuFsMA5btqfMbHIcuHT8SCb?=
 =?us-ascii?Q?IMlh1HiBXqmIjxl0j1rv1H3c3oBBcAOUCycdzkUj7xsWosQV3xYXUfn/yi6z?=
 =?us-ascii?Q?NdfIcR8HWVIz9SX/p8dUXU0mxe7xgJ6URJgk2iN+j1ENxnTPGtUfeBxZcYRk?=
 =?us-ascii?Q?mdOY7R2T6wV/5ZVN2Da1ZArd71OvXxEf5MTm2L06CKKZ6pnT3cYQLsZb+7us?=
 =?us-ascii?Q?X1Ymt+z2/8xmJA3pkRfjobfZPsNVGD6zldSQTKI8G7NLGpuUqbgOfwTpWQja?=
 =?us-ascii?Q?WI6AhpkQwffGMYb1Fl15it7VyZTXeRgDJMzVDwJt7wAgJ6Ii0T183n7n+0uk?=
 =?us-ascii?Q?q4wKikZH17HLLirdeZTwFBrum3ixTmGrlELCyXN9iSy1lTWFIqzgWLPFmXM0?=
 =?us-ascii?Q?lwwuvkXH5N1XbuaBZb9dcz59EbOboU+ZmZG+A42aJiO6MO7pK+YFzhjVvIMa?=
 =?us-ascii?Q?icM1h8w4/xz/NSNIScJozkmKfwz6qEO0c0eRSbREB6NHoIC3m4sawFy+5Ftw?=
 =?us-ascii?Q?WdjBW7mqg9o4cE+Z5NshJ8Ib4SS/eWTmBs9PTHX3mPvCmjryrUioDpq8/PLg?=
 =?us-ascii?Q?U+pTkkf5VNaIrj6Bv7WhJZDB2hmacxLXJudmynCzwlPTdlIoikRP/ygmHNqL?=
 =?us-ascii?Q?VdR4U45Rs7cYlRjxAh1lihyzETteYzfibMnVmlVt1Z6STCdspISeh2sQHn3I?=
 =?us-ascii?Q?VIhWvD+Ph1+JsIbIq1HitCwOXAna5x1QQ4W60nEhoDRha7ceCGMXgJkTuZHX?=
 =?us-ascii?Q?3Oc8Ozu7OK2ZuL+watc/rYP6Oc+owZfr2sDX9CY3lyDNtFu1taxmPLjUzWFC?=
 =?us-ascii?Q?Ar9p34lXFdfHKpn5SefKshGOFczTD82XI2+GB8eAU6qzchb42q6PBSH14WBW?=
 =?us-ascii?Q?ppgRSl9diacKT++cPPTXoDal3unl519Pw0KhdpC/F9Bfo+ujLeViQBUGkgJv?=
 =?us-ascii?Q?alk797XZbVp38AooDNnx9KqapLw8GgftTf9jrkJnpWwH5KU6B8yJyM9i9cuo?=
 =?us-ascii?Q?y0dbJurcuDbQICW2N8jtXh+tbT+745cHtAO08bpfXz0a/XSP6GtHnGv2s3LU?=
 =?us-ascii?Q?2F5wBUAy1gUImYYdJ+lA8F6Leaxg35vfNzR9M5wP8i1QbWLqc0W5cJmSFaX1?=
 =?us-ascii?Q?Fn4mhHfz/KfkNVZs6Dm9/KF+3GrPhqEFro84?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:36:17.3353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375de788-1ed2-4c82-a335-08ddb96d6c3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9463

Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
The driver should not be doing its own bounce-buffering if the buffer is
allocated through dma_alloc_coherent()

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
v1->v5: No change.

 drivers/i2c/busses/i2c-tegra.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index b24882b76c6d..4f1925f74655 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1303,17 +1303,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (i2c_dev->dma_mode) {
 		if (i2c_dev->msg_read) {
-			dma_sync_single_for_device(i2c_dev->dma_dev,
-						   i2c_dev->dma_phys,
-						   xfer_size, DMA_FROM_DEVICE);
-
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err)
 				return err;
-		} else {
-			dma_sync_single_for_cpu(i2c_dev->dma_dev,
-						i2c_dev->dma_phys,
-						xfer_size, DMA_TO_DEVICE);
 		}
 	}
 
@@ -1323,11 +1315,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		if (i2c_dev->dma_mode) {
 			memcpy(i2c_dev->dma_buf + I2C_PACKET_HEADER_SIZE,
 			       msg->buf, i2c_dev->msg_len);
-
-			dma_sync_single_for_device(i2c_dev->dma_dev,
-						   i2c_dev->dma_phys,
-						   xfer_size, DMA_TO_DEVICE);
-
 			err = tegra_i2c_dma_submit(i2c_dev, xfer_size);
 			if (err)
 				return err;
@@ -1368,13 +1355,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			return -ETIMEDOUT;
 		}
 
-		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
-			dma_sync_single_for_cpu(i2c_dev->dma_dev,
-						i2c_dev->dma_phys,
-						xfer_size, DMA_FROM_DEVICE);
-
+		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE)
 			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, i2c_dev->msg_len);
-		}
 	}
 
 	time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
-- 
2.49.0


