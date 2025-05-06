Return-Path: <linux-i2c+bounces-10815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC8EAAC0AD
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 12:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08C21C25A76
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 10:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD3C279327;
	Tue,  6 May 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Urr4Sppn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91327817A;
	Tue,  6 May 2025 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525648; cv=fail; b=YIA4wH3OqjbvgoR+DMizM5aVDx6dEx2f4cpdROcxllO3WWkX0Yu4HvamNwPyzZNJ9m8MSYaxYzHMUQTHqOf7KIGQICtWcYihoc3VpfGmoen3i2r/TjifpSgP5YotwklLtWI3+y74t6R5BKv/kRg6Msl4B+LVCGvSZSDwiN/9IZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525648; c=relaxed/simple;
	bh=sM4xSB97dt+f0bLqUaZtegCB/9t7j5F/Y5+8EgCjM5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHWfnEj2pKZB4xnY+cyGo5qaIfmXGrRjFbLfsUetqvEm29nihsreKvaR7y4pXrGUv4s/Ofl8fNrbum1giv/0BAXokyY/TFHa3TReDZ3gfpfez2iyf/7j+5AKwhxqs9BxlcqskP9sbrirtbERmoMTUQIlXweuIvmoDk1Aw3Wn6wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Urr4Sppn; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVsM+pcsVprkGZ8zELfOe+lh2hA2273qdCn9LSNP4IGCZeaT9R+74QprA1QtPxokqxnNum3OcIb/28DpqcWmKkAv4l1EQyER+pvbx15ZZ5ObOXbjT4ziJMVU0hApMDdo/tBrVrPNghxYtCn0RHoJ2UbwLRizu2PSTGZnDOxA7sacEJlMyRRKeAN/iwyBfMs0LmHTlcYP6bO54Vw9vN8YpB1XnHkYbPPuJs7Pi/SW+4sf3gMB+hupADExK3yD8TjYBmowmvfHT+UR0p4ZddmvvI5kN4UExz7bs7hb5gV0E/8SpI12VfcEroVScPTdQuGxNA3F4R9w1h6XdWoO58TgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VYHKvUNL8uRX22sMlZtOrCGeZrj1hZch/Q7DHshbmQ=;
 b=m4CnRcMaaStO2Mwr4++R1+ANcbL+om0Mcnx+s9dVVo9IfJko5LVYsl/OE5HHDGAVC6KoGTrWNjL7JOCjnsROYdcCluaxsq04LblHNokPYEISUZPxZjUbKnF2hWCoVEIxGzPXDISjOXlL5qrrXdEjsXtCd4OshzkNcEp4FnMKrvENy+43RDIHZE/NIZWpHfsGfGraKKEVlHJxAqdlG4EwGSKqOS3WJB4OVgnKDQryttoUnvUohDcD+aPbFpRZa8KsomFHNj4MJMTL29gON74bMbv2VQUcJvXt0z3gQF6ZBi3U9bQVClX1xoGN+Gi52nYSxJLN9K69RAVGk/lLTiPMgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VYHKvUNL8uRX22sMlZtOrCGeZrj1hZch/Q7DHshbmQ=;
 b=Urr4Sppn6f+92hcgcidqeAuDisnz0Oe0XVgjsQYKP5oNUF9hEmMVc9zqsAtWq5m6fLgqTvcyGxeonKOJsOseVq/uEhiFIybj9l744zStpe3yrjh0PjpwpFpCM6T9ctSsaLNMKfSN5jGNiDVPvujQ6pwP+wSNGjJpnd/a0YWmN7FIuZ0OcTISag/YkZ1g37yE5XwmyWHGufTWZ9KKSDhrrIx5D3DrIsh50B2njSW2vr5HxIkMj2gHMeR844o+YWDj21u3R7e56CvV3KPuX4BtayUeifhvZ53gdmHfTbHnq4Hm2gY368lzV0ZkdujLzKlJHkAEt/klSUK+CX31a9cHaQ==
Received: from DS7P220CA0063.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::10) by
 PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Tue, 6 May 2025 10:00:34 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::cc) by DS7P220CA0063.outlook.office365.com
 (2603:10b6:8:224::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 10:00:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:00:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 03:00:23 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 6 May
 2025 03:00:15 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 03:00:11 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 3/4] i2c: tegra: Remove dma_sync_*() calls
Date: Tue, 6 May 2025 15:29:35 +0530
Message-ID: <20250506095936.10687-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250506095936.10687-1-akhilrajeev@nvidia.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0fafb4-6924-4963-c620-08dd8c84d792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aZs+8dpPKXalqi/KLuQW6Crz8fxWBGbTr300HbuTA1BAPZOa9OyncgU8AAEZ?=
 =?us-ascii?Q?/su0Tc6FrZ1COL+MUY3NHRr2nKaecmPtCWJdXd8zQiN5L99RxzBWRLsQko7V?=
 =?us-ascii?Q?Zp33A//VKmdT3W3H2n46SYcMCX1mVpaGpI9YY+BZT/81lSC6coZanmwFbl3U?=
 =?us-ascii?Q?zHMYIVyGWi1UbGTT5XEmMNdNCMdgQ0otc1UeeyoXJ1TwAu0qYSfzQUIDj5Sl?=
 =?us-ascii?Q?Q6qvNg92hcKhbIbfLv6PXXSpdx2YJRBu1LutKyqGOvMYKfMyjFyeiJVg6YUD?=
 =?us-ascii?Q?EA43M19MCckxOg/gL1qGw59ekhB6UrSol3rwiPz62/T5mYDMidac2fIbruDT?=
 =?us-ascii?Q?le2lG8lG0U9XL2AB/7E+aJxekLsfEUqesJZxa7NR3WhrkA73ghYqCIRr6z9l?=
 =?us-ascii?Q?Io4TZ2DKGudJi1viHbjaaaklrKGxQmmduOkODQ5ZReD4177101Q+fgrOAQso?=
 =?us-ascii?Q?oJ873cOwqPUO1O+W4m8PtOeEOwGW7QL22s/X1mzuLqx8rKLlg6pwXFItWFuE?=
 =?us-ascii?Q?37i44DL++ChGqqbwGla5OZl3NI4esiCmgvs3f5xe3HjcVp8FaY6k8ik1Uy/o?=
 =?us-ascii?Q?ujBbkVSFN9OngDRyU0zzE8g2rWQ+eVsvdN75CdYko3r5HaB3jYCwbPpVXIx/?=
 =?us-ascii?Q?3WYhDh1PhuJDWz8GF/lDUlSoc2UTjZBBdvarqTPKHNJAkJAdTSRvmT5OwqXp?=
 =?us-ascii?Q?PrhxsIyzir7JFfxAStcGFFe0mctpJabr4zhlB9HSpaOVKG2dn+y1mE3kqcpd?=
 =?us-ascii?Q?TwG7PZZhuZxzqWDmS8OmAAcN+PhlaQ8hMw2gRgFwr+LiNjVja3P//xafQQvx?=
 =?us-ascii?Q?YXl8FTXhvvYWSvkWJoxnYGfyRrcKk33fvkCPWJdHv+mtWk9u0A13RixST8Lk?=
 =?us-ascii?Q?dxO77O4T+72+LtTibHmcZsyY8EpHZiy4/EUDYBqliLePaZG/4dddEys0SPdL?=
 =?us-ascii?Q?zxnYBoRwTTS64IdTDUHZYMiU6EkV53CTp4cSg07bxWG3h1QhkOxD1LvCvXIG?=
 =?us-ascii?Q?L6eNGH/BOtQfiBJG5VIvw1mbhwh+eHeb2kbbp6i7U+2uOqEiMdW9jGT5qzlo?=
 =?us-ascii?Q?FmHbacmyacwpLpSu3vKjbp9zaaJ8odlfRGBmLaJ2KuaJ/xdbqAFKaCCp9thV?=
 =?us-ascii?Q?vXengU66l1GtRzaE/fvrM+pWqXiGHTfpMcr8bY7Rlw/PHQ88n8uKH4Dr6EXD?=
 =?us-ascii?Q?DYU83om2qOQACmkfwuXiU8VbOQMAKSkTY8S9bZOW26q8hQfL2cxCmCcN250G?=
 =?us-ascii?Q?nXrVeh44aXqLJT1x/290ZNqLdxJrHAByTTo045knbku5ARiTylzm/3hZIVMM?=
 =?us-ascii?Q?p+pqcmM+RrP5GLOr3gvs/WevNaiw46WSSFvX2nGX7tu6wG6a5HhlnVuYlTEU?=
 =?us-ascii?Q?mhsCh1VpWL7JbOPIC3PUbQ8s0OXQm1ASwubnzAxeP19t1GirvY5nCUIIM/7E?=
 =?us-ascii?Q?fJRCd1GONbO6RHqkMEA0vh8598gmnKV4EGm73/I25B4Gxio5LynPo2ZvrtX1?=
 =?us-ascii?Q?7AR9HlSUL2z6HLHUR7jULVBt7TpiFgPW5zD1tXEArIVCGhXZmMTb3bQV5w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:00:33.5245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0fafb4-6924-4963-c620-08dd8c84d792
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902

Calling dma_sync_*() on a buffer from dma_alloc_coherent() is pointless.
The driver should not be doing its own bounce-buffering if the buffer is
allocated through dma_alloc_coherent()

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 49b77dcef184..35057e977688 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1290,17 +1290,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
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
 
@@ -1310,11 +1302,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -1355,13 +1342,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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


