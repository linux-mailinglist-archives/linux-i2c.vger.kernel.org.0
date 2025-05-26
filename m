Return-Path: <linux-i2c+bounces-11138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA84AC391B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 07:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A03917266B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 05:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79D1C5F35;
	Mon, 26 May 2025 05:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kUoQnPFL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378DF1BD9D0;
	Mon, 26 May 2025 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237217; cv=fail; b=JGUKw+WgUmo214HHRHdIOPaBF2RAjb7lYobt60tl2Yy9WEzEJKlfsgbGXB9o1OA8UQlJbhcYUgtULauicW9kEyUHLf8DYMHHATE83rKBZpyVDtav0/oKbCrYiV7mP/hsRTS/OKybBcBVELs2XWTxOnAJe18RyeyaAX1VwipKGbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237217; c=relaxed/simple;
	bh=tV2RVZAwY8i1E5kJgxB3khakK01zFMaYfx5b0aWtPho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GvnY3YaO05qVgafoCbB2XM9P5G1VnV6/xk1qV8zRSftf70MKUqZmQ68FxQbqwqYKPV0kszuqTAO4nKlE9lZEJuxfg69iummHgZXNWMrmjzffNWZIEXuzhNDnW/9arrmoQOd33+0F6rWGpWaWN71SXSnCS3608KCE0EeRrGyNL5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kUoQnPFL; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8BjTM76zrkn0SRlixLWXuImfSBvvlOukZBsE5vwc/8k7CulYPU14vsbU5Rz4OUXK3EGVjOa+3gFh98GfgvaHMtL8FYvtf6d707QleGFvr/emwAcYBneQ9uCMoPu8LPtao2rs4IeH1xHvqZgdNMIIWxMIoC3hWPg0KDTzZYEN1JgTe9h6s+visKSWX3DOXXFjdnM12Eww7tZa1PiRs08mi85ZV3ef2YNooQ0AXKB/egkVtOiXqvcu1NpQdJo3p6pURmv4ZetdNB1WBcPuy/auf9+4ujgFmeBe1OQmiJIe0ZtZsZW3Sxm+LJzJ8HCj/b8eD0Pb7+b1ztOx02ZgDWR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13DO5UXDVBpS3CpfOPDd4mgkC3tPH2z/Ri531CW4U0w=;
 b=SH3Buf/+ZUUULDY7PEpc/kRvxWjLNJidJFOanJKzXQlSxm5mSrJ8E+MWkdhOCpveEvQq7akYY5Qfz74sbRANrK9jLEfk3yArQnQKa6qcY2sSO989jipDki7k6WzIsUgAI6vhgQadzhdelKtTXIEhtRTGm3YXhGKgSgli4u3fp+l/+3gQsic1RyrC8VbENXnvwf5M7Y4WnBHNh7AvmrVibIhtnyJOHYvmtXvfPxFjmMPLFkCq9YPdUsIzc8d4hYyN+6HSsCTfEE11OAA0t6qtpgdOSRHepJUluMPNBkUDJnndwKD4rjVjtQzo9Hb/SQ+Fn2sWq6Yu+rRKp9R7ZymGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13DO5UXDVBpS3CpfOPDd4mgkC3tPH2z/Ri531CW4U0w=;
 b=kUoQnPFLh3EHztglKf130v3Pp3J9mSTzZTtVFMO+KU2oZVnFo+T8hcDMgjatLEw26fhN7vPB2R96af0dqtyZ6eEKdTmfqZ0w92XVLOi55egOn/W66fiDuxQaa5Zd7hgFIcqnUuiWxti8oIdxfD8wwPvhgFyTsAnqxvCz1yiD2zP3y9fGTIXaQX+4fxBRZfoXPhlqjzDmlOH0woGAVcTgPfSjNBHO/TLD738xV/5v0RuDRPf2oXukYtPV9MB7LxMDJUp8G0yWoG98n3jd4Wa2iluEa8SfMFAxswpf35r6thHabn1j7mWUyZpcr/GXuxQW215AJFkVFwQXZD15NHDMLw==
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 26 May
 2025 05:26:51 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::c8) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Mon,
 26 May 2025 05:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 05:26:51 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 25 May
 2025 22:26:36 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 25 May 2025 22:26:35 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 25 May 2025 22:26:31 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 3/3] i2c: tegra: Remove dma_sync_*() calls
Date: Mon, 26 May 2025 10:55:53 +0530
Message-ID: <20250526052553.42766-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250526052553.42766-1-akhilrajeev@nvidia.com>
References: <20250526052553.42766-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 70010a11-b2b2-4317-6ef0-08dd9c15eb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PrOHhErzvTBn6v2D5aVG8b7I1GjNGXoFrjUahyR14M1OEgnFi6o9JtcJW2pH?=
 =?us-ascii?Q?+ZbPVMj9JZpzip3RmYBKn35OL6RtbUUnq5VjK4n4BTOOQS0shfH02ODEzy8O?=
 =?us-ascii?Q?byZ1YQx0hT6EOGoJKV/1szfCOJoqYStcHKDEuNTllfdVbDb2xlqBFJWXysP9?=
 =?us-ascii?Q?hXoKfw/nXpucfFkRuXT4T2Z4h4b+SFBEIstEkyNe5KDeVyoVfPcggg3ChtIN?=
 =?us-ascii?Q?jL+XISn11s8p+nsKcYHwPN898hS5N7wnOc4qjymBTyL+kahd1DJW9fSFO6kH?=
 =?us-ascii?Q?mzVz46ZoN62y83s4XT99esOyv4Y6udfFzybMkS/CyGGBZcclHElBUOZK9YCH?=
 =?us-ascii?Q?twU0LmdZy29ZkRUSkroSYuhWbFL0X4FZp4EWr7eJ9yDyxnBdRc7bS52crFW7?=
 =?us-ascii?Q?ZlfosGY8688d2Df8RLeB50mm8lXD2WRBQAhT33lIpuymHvaJSR2FYgNDVXea?=
 =?us-ascii?Q?eymyNPFekXbHTIBuw4lmdV5MwEzQBvXsqAqLcxM+MjwkoraBM4m0hTafceQ1?=
 =?us-ascii?Q?pw5hEnnRcgKI6R3Bl08pyejERavoeePsFpkZizGvzccQbADOiNA1ewsMMNGw?=
 =?us-ascii?Q?aGJs0t4l7LBWbeSz/qMZsND4XDSbxU2Pp5l7GHd0ESggOUqPQcVN/w/6q1mm?=
 =?us-ascii?Q?8VskYEeI4QHsXkN8430T9zPXhVQznDQGPeH+lI70IhrtzZctU/83F2tEGnzV?=
 =?us-ascii?Q?l/LwTHtqzDj7zQDa85gsp7tLMkCpszJJ8A6yslJ2xjZMp5Fnr12P7Csa2H8e?=
 =?us-ascii?Q?UNV0vV4lb2Q83WORn53rPBwXzSuq8ISLbQL3Zu2oBYQ1v1lWMRgxz4LpJBMA?=
 =?us-ascii?Q?VmYgL1c6tf+UZU9RhLXc0zrxnP+S9llLy0bUV4QBirFo8moMUvjMGD5vpIg/?=
 =?us-ascii?Q?DhQQ3LrlyZhVjQ6YDWqDWAPDS29qfLilRebGGVP5Nb7BHIkBxNQJx6S8MNEx?=
 =?us-ascii?Q?Q749mZtzqahq04TGBYJuumbW/J0X8IBFeJ87MzWycMYBswOi3B5a0vREbkJ7?=
 =?us-ascii?Q?Q5Q855cayQ99xmGC9R9WoEyXfr4n4pVeISiRr5mJSnIRLBthRjKWsKR+p8Iw?=
 =?us-ascii?Q?XPR189rlqRnxGjSy32JQx+miB2wkP8QPKUg/Lr0/IjTzUIl01pUAf2SpSjJ4?=
 =?us-ascii?Q?t/jPstigwXZIatmnQk39ETi5q7OfyWkJ3o5takJlcDURC7OGwTMI43oKzWlU?=
 =?us-ascii?Q?sCPoSWHnpw6JrQRs3j3NUiIpbn0UeUIq14EOLFT3TkyV8vdjKmDZ4td0Aehj?=
 =?us-ascii?Q?pUbVHhJhmDeeFNBX5fv0fZks6XlgR0J/LrPfaWnQRHF6qfvOFJCBt8l/Y5nG?=
 =?us-ascii?Q?vPX84KnC68zbLBP+DRFiVtpzy1FsIs7/GDFCmbuxToY4nAFXU1sQINniAVwr?=
 =?us-ascii?Q?6EUJ9O/uyyPJdcp3DZgosRsVWwFWUVDjVHM/LiH9FakyhwksOTN0+wJJtWEo?=
 =?us-ascii?Q?wAoOvzXsHSUENjeIan0d55Rhwn/c39eyE3bwB1oV/Iqp9mQyJxHUEPXprX0r?=
 =?us-ascii?Q?krcUBpTBMVLTb7zIX0cfQO0p8W7YNxqBrSQV9Ur84n9XzHP9NCipR0wzfw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 05:26:51.4827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70010a11-b2b2-4317-6ef0-08dd9c15eb7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
The driver should not be doing its own bounce-buffering if the buffer is
allocated through dma_alloc_coherent()

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 22ddbae9d847..b10a4bc9cb34 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1292,17 +1292,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
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
 
@@ -1312,11 +1304,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1357,13 +1344,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
2.43.2


