Return-Path: <linux-i2c+bounces-12317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A9B2982D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 06:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 294C6201737
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 04:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AD925C818;
	Mon, 18 Aug 2025 04:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XNO5cbWw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3201990C7;
	Mon, 18 Aug 2025 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491655; cv=fail; b=rC1i8+YWtCZjdhLuUmpUty96G3c7gsS5wxQGItlwgtEgHMllc/46EcKwilsJcWPyO2sLQSsP7AGft9zPhkcHw1lYdnU9qZL+EvG3TzurNqH3P+tgYe8KXyC+lLCc/NZOyW8vpS5K2bOY1oqA6brpNtRN1fmW1zSoJ7m/HuF/i0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491655; c=relaxed/simple;
	bh=9F59vh9OLtYBtox5fDOjKRp3fPkcb5WR7g03y/Cc88o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNLGG6kt09NXQt0nEC/gLuV25DCifJaFrGXWvGx/cTgwGBtnI7//+2PaVCCQZmGuzF9VVUjqkT+9tE+zN+BM93zEw0o2NVVTOsXPl613WMU7v7ow60o5FFGEbhBUZ8wqScS3CYA8e0qQTC8Lq3XsXBBUiysbAIA20Yx90EU9uT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XNO5cbWw; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL4WWj8xOvrPZoB1Dk1P6e5LHTLxqUEV+/lq6iT2Pr99iYe5Gv66SY1R/Pws5mxUxMgtQ3PDvvDTmEU5mzxnqTu3gbBitHVZhh2sWqUNneJFOBjVEbXW7SSHy5N7xyTtisYghEzMnXA09TwhEKN4lFd1gG6iyzYUWx+AvvijOAv0gT5XP3jvpoWHC0IjDVp8K0MDcic0cVt/jHIbl5Bnemffo7BQdxsoUXnNdTOAIAcR+mvn7wHlLiMwTH+RfSyVyWdWKQWsFZ9bjV2BJoLU7s0zt4KEigj4zZ4DpTkVpuPmpQCX9zT58l4TFNjefxoFMOQD6gMq8K5mTEjFfMmgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p00vz/Hp5FIhtw1BA5FKl3+WLVBZOJgauSW13qyfkY=;
 b=n7UdB4PZ+M+xTPbuvxiKhAAlC8C7JohWf7NFOE7LffCv7xDELY6blBFbgoaSKGYMyjPG1eRCNbXJRtOFbOrZdWTK66F2SL3z+4YdciNBl3xjSnA3WJ5/v6M9bA3919xCGCxl4FIyunR43w6R1ahDWW1btme+9zX16UgTlfybVpFbV10laTz+Jo/YHXeaS9+JmlcpjMXmHybGR6g7Oj7RxMvFFIZMxAIb5f404qyxhYD9FP5A+MlJ6w2vAtc/vSPAd4VyWNbmCfe/QoqQw1uGi/bqQ0z6ez/7EqerzOlVYh2legUVYOxg4E/KRjJMRPNZqlq5KQ+hBp9N08kwpns6LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p00vz/Hp5FIhtw1BA5FKl3+WLVBZOJgauSW13qyfkY=;
 b=XNO5cbWwEJH0f1zXwHWxUH2ylgqchM8Hyb3p6XHLqy08R9ws2voKK32F8bTn0tHOPwZzdQgWmRw1d1AausAZimhyOw3Z/NyPP8B3PL0wbz9AFy1Eo5p7i0rQrm07vjqDTfphr85a+gJXODFi+fUW6Uzv3TZFVceA5FrZhEmIhMmRJ9eXcvUgia/AV2ofHwuIL2h/uoPn1ebkdxgI1d/FXwA1ra2R1hd/iNp6Ott3AMSlGzltWd5F6vdwIOaLuIasbQdEvKCOk6h0JmMYBE4ssFCScsAAD91eTXycYhpun8cvhjBGJBcaiDT2dW+pf3+ICmfH7Y6YXkJW0eHZZkrG3Q==
Received: from BYAPR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:74::17)
 by BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 04:34:08 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:74:cafe::84) by BYAPR05CA0040.outlook.office365.com
 (2603:10b6:a03:74::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.12 via Frontend Transport; Mon,
 18 Aug 2025 04:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 04:34:07 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 17 Aug
 2025 21:33:57 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 17 Aug
 2025 21:33:56 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 17 Aug 2025 21:33:52 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>, <robh@kernel.org>,
	<thierry.reding@gmail.com>
Subject: [PATCH RESEND 0/2] i2c: tegra: Add Tegra256 I2C controller support
Date: Mon, 18 Aug 2025 10:03:43 +0530
Message-ID: <20250818043345.65899-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cf1285-1297-446e-c36d-08ddde10783a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tm+4qWcILaUjbLJAE0dl5X4AAmET3ExQUWO5mAm7Z7z7g0umod1xb5Ij/iH+?=
 =?us-ascii?Q?tTaSW818lS+a1FtnKo6Hln89YlI3VFqXszp9bjz40TYpxllkG4EOwJrJZuf4?=
 =?us-ascii?Q?7WKc4VdmBO2lD86QM7wPeH3pueV0XgL85U81tJH6GX9i3JDFnDavdt1bJ7Ke?=
 =?us-ascii?Q?Ei9pONdqUkN/CZwGAEaVYf1Vs2+1mEsCjqO+Nd8dTZWbsk1eYgN2V5a//2h2?=
 =?us-ascii?Q?A3RdUQa+y34pVngrwI+E6tadPbM1laVIl1IVPWl9VbiTKuOG2h9sYIXk2t2J?=
 =?us-ascii?Q?R47GPRub+KUghZ9QIqb3Eu1NDoOXc7EIqZlVPOkEVz7b8W6SsttpExawN5yu?=
 =?us-ascii?Q?UCoNSaZo62ms+fshaGtEhvRKl18pCn8VpNcwAq5iXZpj6ZYnYJEqqiN2fmKl?=
 =?us-ascii?Q?9UJw4qWivEsNWbfd0MYjGEdPVOJCUG/z/ywcd+I9VcjnRjYxUZXsAkyXW/JE?=
 =?us-ascii?Q?hMSy/Q/uyH/aBlsrfQ4crE52p7g+phVkdtn/l+uRR99AMJf6KozHtClObl3L?=
 =?us-ascii?Q?fY2jW9fgN5kkD2YXd8r22mB2eMEzR5xaZjeI4HDS6zXuy7oLK1IVRo0HaDEM?=
 =?us-ascii?Q?0NHhdgEqqVv3s3Rkq9z0/GXclJ61NzN0Cq23kjNIYckYA5cnm6YhbOOHgzyU?=
 =?us-ascii?Q?nWRmPAr7SmuXVKkgZvFpEgLpmjPxwjskJTCTNRd34GWvfWJieudl5hjuhhe/?=
 =?us-ascii?Q?tIY7T6XgECxdIlcQeZzLzj+YB26jNDT1Cs1W8pZtMlWveRDXQM+9jZpmvxLD?=
 =?us-ascii?Q?FMRuzWxXrm9nlEMiDt2RZ3j9wHIN2XQdhxL9D4iNao4fjDCIlezn5+lq4+VA?=
 =?us-ascii?Q?uX8p5Wect8/mmeU4gmxeajf4BbCnWI/0y3DPeM6yQdlcq/UAF9WYAkYby2U/?=
 =?us-ascii?Q?jSQw/X40MNnMV1x469yB+uSFXYqvsRK8/ZRABC0dQCzgyd0LQRag0eAYbYPw?=
 =?us-ascii?Q?Mz7B4nk8XcIHdNepJ1lWnkfpEgWGggZ9i8h21pcuoBBaS/7i5tLmCuziiXlU?=
 =?us-ascii?Q?wARDsrZGz8FLZApUKvmZr8UteX4mYkyKDXNAH7iUms01xnj/1bZ3cH3P/2f3?=
 =?us-ascii?Q?h2Hpq4O50Cr+JfFn0laLBeyteOXBFyRdEPpAvvYDPFFfvd+IFr7Cop9Ytb5f?=
 =?us-ascii?Q?EoaxjyCW5o1gIhIZkofan1iC0WgdG8FdRfMmrKsYVjATOqopgt9UKz0GQgcT?=
 =?us-ascii?Q?gCzZwa4d9i1G0LDMunFhSq2/dwkBYg8yACNZCAMKDip3EFb7L0NqLe1CB1nX?=
 =?us-ascii?Q?Rq+d4dhjKqazEzynff62g6YsFG0QDym2CDzhIw9JgvWgxend1IlEL8LBRqFl?=
 =?us-ascii?Q?9yBscikW55yYWRQCudFkdVvTuOeeR0SQYbhsrux6pzJAHMqxGheMXzfahLyy?=
 =?us-ascii?Q?3+gmCFKEdM8N1/9TXcU57uKVb2xehvAgcqRTwCpPEyhBma/xCQMmgChmnaHU?=
 =?us-ascii?Q?CXeAsPw3e8lVfB4AR4isCJCfoLgjTHUCQSIFiJiol4ey3XYFxrpfdhz5pQw9?=
 =?us-ascii?Q?bkvtJ4kCvnkReNcjaMmAuYdR94CmgqIob1B8?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 04:34:07.3822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cf1285-1297-446e-c36d-08ddde10783a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27

This series adds support for Tegra256 I2C controllers to the Tegra I2C driver.

Tegra256 consists of 8 generic I2C controllers similar to previous Tegra generations,
but with a different parent clock frequency requiring adjusted timing parameters.

The changes add the "nvidia,tegra256-i2c" compatible string to device tree bindings
and implement the corresponding hardware feature structure with appropriate timing
parameters and clock divisors.

Akhil R (2):
  dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C
  i2c: tegra: Add Tegra256 support

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |  6 +++++
 drivers/i2c/busses/i2c-tegra.c                | 26 +++++++++++++++++++
 2 files changed, 32 insertions(+)

-- 
2.50.1


