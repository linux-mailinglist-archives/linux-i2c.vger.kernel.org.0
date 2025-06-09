Return-Path: <linux-i2c+bounces-11283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91398AD1AB0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DB13A92CB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD79253922;
	Mon,  9 Jun 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QBvCXDb+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D5B24676B;
	Mon,  9 Jun 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461695; cv=fail; b=TZ7KvigdHDY8Azm2/KNCSm4GHpJKFZPdPygj9XnZ8mOiXKKIgL7WSrd1yl45AOV4yjkbT/I6C9yjoWj6uHg5/m3z4AxFcWxi3gFlnY7ReWWL+JHrCevlYGSvzVVIuLA5eMrZIcND29Nv5yLapBx0M+9IIKD9NOBwvZgAr/JD5Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461695; c=relaxed/simple;
	bh=cbK2iSNJ+wlUrHlDaCHc4tvMZcUyZY9yzwK161mwUQM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhwWNH1G/Lqk3PXie2uoLaF8GnqhLdGDh/yg0ZJkKmXks983NCtEc+XG5s1AG/3pLRVzfks4MWPn/T5ceJ9Z+OjMq9E1+7Mz/C79r8MDc6fW/wkZsyqIbXCY8nxiWWFA/f9QYb2iY4jjBWiMgj6UyJZnTz9oYaPAkU2dhf1wDfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QBvCXDb+; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4+01r+4mhZohZ8EN0recFs77APyeHXNzWdMneK/BFLwiYL7lc1FZ9/Mp0mu87hGmz/v8GXoo+yqmEp4/eYmMGG8jMu2Bdl+NjtCFvSwcaN64x2hjupLdYCDoR8VkutPjGTxQGe7p+o9RMuMeI0xqPpcVHm+BnzOH59CB8GLz6VeiNvsxaxkW9YLpzE5ZWMJquzA/7u1MY8ZmVixVCHnhj3NnyX1Wuy9/hZxpkHeJMZB/uQWx2L2RcOULdKRXJ3ZQ45fdnZBmndci2WR2nJ2UMhbw+LbcjsZN87UBIP1D5pu2/1z9WNZBaqUVO3yIVvRM1WqbB00ljEeBOHANZsAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOCEagThP33zpFxAZ9iZKYAzUtHXgaygT2GKikRCFxM=;
 b=UJ86QeSFNXPiikpDtUUHfGtwOYyRAvmdTztFLBAu1JGn+bpdeUf7gi0jIY+2MLbBCsD9ixn8Zu1U0TrEYZ5JhkRikpBUkehSiQYm5hkxhu7n7JZrZ8ZjYyLRy5QhmbH4QzmC1FkqxK0oflWnxhiP+4ZNa2s1gMRW9Yt1jIvD93MV1zuVq122iOkwQGxMWoOlCyo/LxrzzxX2h7mPvpWwpiTmxq0WFlxNEz5PbNv+uGK5m7N7LvND5X2F/OmAEY5Vui5Zv3MJ/V6TDUt0kKx+7u1aCMJzowvBZmAcHOKqCUvVlg+6FUElKWKFDvmyTCvOK80B1/h/QJJo0Wdaa83IOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOCEagThP33zpFxAZ9iZKYAzUtHXgaygT2GKikRCFxM=;
 b=QBvCXDb+ZIo45bkbP4KCz0OI+TGZ5uWKafcR4YPdkcEzF6ys3zgPaPcDpe9tBFGFXUPq+2fLf+xl3y4uKNt1WiSNq2zNE38NBdhUyqKIJ7x9ZgFHyARc+x3z4LBfnsSxfeDKEwB/vlBeQ5aG4XMsgD3bW/XsGaAS8V0t+3Qt1Wyk45TQPzJ/Uhp7SJg+l7JRjlCYjf0Iu5Ag2mzlJh3lLx84asCp7ePcNYBW7L0vCpkpxWriO5Tj9shZUsxaoiydiNXoqA1e7LyBEejzjSMf9a3lpzUVreWajjcmKomm5cYLmdkUb8P6N/ijPPslvjyZF2KtaPqqfSdeGWPIIBpLIw==
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 09:34:49 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::8b) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Mon,
 9 Jun 2025 09:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.2 via Frontend Transport; Mon, 9 Jun 2025 09:34:49 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:34:34 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:34:33 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:34:30 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
Date: Mon, 9 Jun 2025 15:04:17 +0530
Message-ID: <20250609093420.3050641-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609093420.3050641-1-kkartik@nvidia.com>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 505a65a5-fa0d-41e8-3b33-08dda738e141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3uWMfsQzuq0gbEEmDHHHp3dLWzH9SsRfZWVGnTR6sCI3vKFPhdiIp/jLFLAR?=
 =?us-ascii?Q?Ay5RsgpWEC2hSidMqCQeOdDcXMvIRd/pnGO1aMkwElD2I6XkZjaveGLbUW1z?=
 =?us-ascii?Q?fJVjzegtL+ACr1ne4QB/tFZaigRQ9MSwwm5BueFFvmLFgo8w+gkViZxd07Bk?=
 =?us-ascii?Q?uIHdp5OQx50u+oRStb7bkjqrczf+lv58p5q/5Tzgkj1/QMMJe60R6Kv0MW95?=
 =?us-ascii?Q?x9Mvq310dylwVU3hhT3TttJZ36HnnD7Xc6ToHfyTZ2XLKFCyevIburwdJWPs?=
 =?us-ascii?Q?YDJDQojQVs+4TtgasyidUnUVqvl0uVDyAOaRbZNBwu7wkfU1oJ6pOE1T3SN+?=
 =?us-ascii?Q?yf/MxdXIXOuehYOQQtsdRrpE205A7mbsu5fp8IPMGgqVAiWnP2qdTcrxMOtt?=
 =?us-ascii?Q?8000SePjWHzY5GWdtxOVTZNc5PF75VblMp2EcAn1nrX2LLy3xD43vG4HKAsS?=
 =?us-ascii?Q?CJBNbUj+bIgVeYHCqivkD/ef7YYY/wA2n0efX03ocy3bisXJr8N361ZiRi7n?=
 =?us-ascii?Q?HcI7uvZXXIvy6Dnv5mS2MU7T6TDximuCl9tX2FY6amYdlMI7snt7h8vY9ng6?=
 =?us-ascii?Q?f+kM3z7q2gIT10jhFhDD2XnKOg0Qzit4TxajdFQ4llHccGoS7KrGxLXKWRbE?=
 =?us-ascii?Q?9CGi9xumgIhMD4OkzC9SjnOWxPaIzFfaorghiaypAyKUQD7YqgGcTW0bVN4L?=
 =?us-ascii?Q?c7em3we8rTK7EAP4e7UIhDJ/wh/etTGjIOI13xdW1ke9zqRVnb+b2K0oMKZZ?=
 =?us-ascii?Q?GReL9xBu2Z18E4kD8qh0oow20Yhoy+jFWKd6FatEDYLSZpW+zVkIMcQzX5nY?=
 =?us-ascii?Q?W9Q4gqGW6+skgke2EHJqKkQ8cbuas6gX9W7BY9TAKBqJ7oH0chNabfLmlIyd?=
 =?us-ascii?Q?/hoeEJ6LvybzKejDXy2ItnvdP5VnvJ6MdSADKKZr89PXyGMvTml49HdTYE0o?=
 =?us-ascii?Q?zHdyeDGeIcJ6Lk4c6mUqizwP+rOz978is3RXJLxpYYiXN6BDK4G5Bxl+15Wk?=
 =?us-ascii?Q?RZ4m8e9ENHVxFJ4+4pnVwh1eEkoD7NKy8GIm/rIgOi+/ulwm+rodsh5osEKP?=
 =?us-ascii?Q?hFqHkoYCKDwX4JBz45CXCCJgGl8S3QAq+VL3B7G6xNmYggX/uc8wy3cs6nG0?=
 =?us-ascii?Q?cqQnAbiyOOJLfZ1uQwYPl1HVhNazo7zBJmJRg0/9u2k3GO8u6ruJRnwgaz/W?=
 =?us-ascii?Q?ubci9hCwxgfayfQy+UQHHMeQnKB1m1l76rX/7rNMt8v4vcyi4nCoDwruD5Em?=
 =?us-ascii?Q?yFFgm9ChzveUlylEz6ZMGAdnZeQnoSZtIN1F8dh8M2+bpAZMgeIaXONebwhH?=
 =?us-ascii?Q?mZg/0ojuO5wHjdVtS5XAmAnYlclPOHcime7Ba3h6tDLBuZwKWKEk/dxwEMrv?=
 =?us-ascii?Q?5stebmDyEy5c0Avke+pwi4n9ePS5hbi99mIbQhdieA52MkkKas5kW2AyZHLO?=
 =?us-ascii?Q?OY+S9loF5lYEAwv1ocBSFZN7hCtCcVxNp5K9oicFODnf0Ru9wt+1mkegPlNK?=
 =?us-ascii?Q?bV5gkaHPPxfsI6RbzYu7v7v7jY2Gtk0wZs+X6i9VAbBg9gfMyPBa91Tplw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:34:49.3650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 505a65a5-fa0d-41e8-3b33-08dda738e141
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
	* Update commit message to clarify that some I2C controllers may
	  not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index ebd51165c46b..c7237d26b813 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -448,6 +448,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!device_property_present(i2c_dev->dev, "dmas"))
+		return 0;
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.43.0


