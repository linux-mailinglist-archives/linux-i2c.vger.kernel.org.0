Return-Path: <linux-i2c+bounces-14088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A062C5FFD9
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 05:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 595294E6D17
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Nov 2025 04:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B6221DB6;
	Sat, 15 Nov 2025 04:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L7QfRli3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D3911CBA;
	Sat, 15 Nov 2025 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180867; cv=fail; b=sJNyf++3EVp5xRJ1n9EpLsovlZ786ePBzXCOfu7EzAGr5jPKQ9mHReu7/ZinFJot6fIW0FzWV3WIx2K2X2CsKLopGRkTvKNr8GumUxsszDqF+GdLg3PZdHVVJaSHqKleGfSvMPO95/ecjdENZIMHCAPk6PoLChEN2Q8oWXV/ABs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180867; c=relaxed/simple;
	bh=5KviH5TX5TXDrOh1xK54HGlfQmnwlsXiGvaREQfTr4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vGAbhU2cF/f96yzMT54nlDnuLCK8nsMKr6D6m0SEwUqsVejrRkjo4KrbSoCKxEDRTfFAu4Lxg6asTnG/5S4qcbMzhs2kUTYQPOuZdk+lWrLeguZhIMG7K85u0JhqBPZg9dFpIhCO9Lhiy4JS3+vM/G24Wu8kdbaWj22Aom99YR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L7QfRli3; arc=fail smtp.client-ip=52.101.48.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxUWZjtbode5kPi8SVN3irwZryM4AOxBzVViF3z67V/uYYcS3ltpCD0lstz25l7X9yZrswrC4GjRKijI09c99wRgaXbRN0G19LMcXhmeT/zZR5azUyjMfmJozTocVZ0MgqnYdyanlPdyN69EpxJ3UTg6viRJMfP78SjT6XJrZsTpBqaeEbAegcXeBOWfBXX6WXiuH1ei947c/PcL+E140Pg/9ac0vSDt1Y5hsvfUuNbmqRomHzFsBzX/DBiOPoUtfVAjcGdib92hDVpGM8D+pQbPhP25oc5KSXTAZ9YdrVuyQBvb0AFW/DNUr76gEbjsJ0qEBPuSH17Ofg2poyepeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrkGSN8CDfa1ksEgZ4dSdggsOVy1ZCo8TYmGwqMg7w0=;
 b=XoCuW1WKjJIWatafiQMzuzRFkOG9JK9hod4A8guaJ4gcnBFqSsygVSrCYtfvF7Fy5wCXOsSRLc6ZMn19zo+UKc4V7P7qnaIEQmPb5kzX5WE8NxDxGNcOzG08USSL0hEt/ZzyNxP+/gUNCJAYaUBV1yghI7BIOX6Xfd2zk0Cq8NxBVAV/oN1gld4GXBnzfjveZhOPNXeYnMB4Of1BWk7aEOwPzK0APSfs2fQ7PTKRWpXAjYLtu4okByTx5mei2qH6c9hO8kIHkWj7lPZRwBciIjMCMDmiLPvR1YlCyIpq/igwOCAfFez9wGBPITvJCZ380rMkvQc3ZCS/CUrxFWarEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrkGSN8CDfa1ksEgZ4dSdggsOVy1ZCo8TYmGwqMg7w0=;
 b=L7QfRli32dpIFOaFFC7Yro9MbNMI+NfYl2e75wZJOk2Fg46NpDmgzqhD3aRKu9GWjE2QR4lvAzTg5eYi8cImWI63BibhmIVlwPDVX/sEwOHLPoZL86/ZOkZQnRGUIgglh3sBp6qv6IB7hsNhIcp9FfnHRdF8bGwj9U/Luzjw16JXKfNY6omQBn7YeTfJd1zMQ5oPDtCvsIWi5+f0cxWsjcAn+sThwiCL+f1qIEpB5sDzKJz2JRo0Jz4fg6JNWRoqUu5lchh0wNP77IeUs+ptqavg5/Qp0wKRdXsXrjGuRX0pkN9/ytDCIbfYoH9VYk96xfW8J71biTlVZDhoxmaXFA==
Received: from SA9PR13CA0081.namprd13.prod.outlook.com (2603:10b6:806:23::26)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 04:27:42 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::f1) by SA9PR13CA0081.outlook.office365.com
 (2603:10b6:806:23::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Sat,
 15 Nov 2025 04:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 04:27:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:31 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 20:27:30 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 20:27:27 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v12 1/6] i2c: tegra: Do not configure DMA if not supported
Date: Sat, 15 Nov 2025 09:56:27 +0530
Message-ID: <20251115042632.69708-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251115042632.69708-1-akhilrajeev@nvidia.com>
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1f3f10-05d6-452c-d274-08de23ff5131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uSbn0TIEjAnDeJJuWUKOwxvMQiNh+bD7LN+jFAvNZ4nWUITrIr15cQ03dSRy?=
 =?us-ascii?Q?jRc42IieEO9xeAYcEUJph3xxwh65/w9qY/Zi3qRPAXNxcBllVeAMZSX6edi+?=
 =?us-ascii?Q?mSrh+SpN5RWfDpLu61Hd5h8GpFUprkIMtO3sedQblPTmas8PvHXFsbbb+gdK?=
 =?us-ascii?Q?ZjK4k3ROrO1UakW2Hcy9YAKrhPHO+ayypyw8zRJWnJ+5rkKNZZDt3RHEMMlC?=
 =?us-ascii?Q?WtHNobpluQny8BHpPLdEY5lJ+1C1rcKIfGjayDQet7KsNVi/XskvbQMOMZot?=
 =?us-ascii?Q?g92Ngg5DVR8HfP4fADd3C4+hb7QIkYBMQDAF9lbaKkyx4ElDeVFhNpUpL5Gk?=
 =?us-ascii?Q?obwPJaWRapOl23c/TiQ7q42JUy7iNLGs+BdgR39OeUNLjxNOzEb254vxSF9U?=
 =?us-ascii?Q?KSP7GjuyujKw4wRZ1V9nD45hniWn5A9DQCcmOmPRpJsLO31e+jvqEtEydp9D?=
 =?us-ascii?Q?7M04fibJTFZmv8YEQlERH14Ole+TrD6ZY2hy7aCzY8/nDgwt9rgHkCVVLe1G?=
 =?us-ascii?Q?L1mnnhSoOsYSdZr4MIlVwHMmhseaO2/1xITBNshfL99Xc+KG6IocJmY2Wxnh?=
 =?us-ascii?Q?tmo2ATzPsSmrzmFu84lpKRs4twIuyVdwlD/LoTR5ggDAd56aYL2merVynxFg?=
 =?us-ascii?Q?5lahVHOIJ6xzKu8Wo4JPZWH21w2CNLtOHXkB/yE3nyiIdaGEKJZire6ZDtKx?=
 =?us-ascii?Q?Q4yT0ZVNdEX45XsaQCtHPn7r8jQdD8efMLkGVB4MbpXR9F+UqBfKC8g5huLT?=
 =?us-ascii?Q?Icoy0Yff9sKbtxP+Q7OUhwp6ORs/iK0DAQZfaztDGqMkz7CbUswIRuN6GTfW?=
 =?us-ascii?Q?P0YuobleA/EWMcNVMzzmj8ZdanAUNtH3ZHn7gpWauYIPjP7teEKRjcODwZ5U?=
 =?us-ascii?Q?Gwd+FbZabEyhrHB7/5O+k0HLbN80jLeP+axlRHeHp7yqgDNAzNzwXb5zH9LR?=
 =?us-ascii?Q?YSyu/FzzGt/M4WqR6M83O3S/DlkW48Yks2HP1ZOPMjlX/prUBaXvp/Oaac+A?=
 =?us-ascii?Q?q8+T6+YAn/8c2nLY3PH+CHBSmPyh9KhSdAuMI0aq3IJlzrSiIcWqD6Ha84lZ?=
 =?us-ascii?Q?5DvrBWIQXbWTj5YfioVdOQWTmvsobm0m0TKf3vTHBcHJkKBNgMItbmBXmTeK?=
 =?us-ascii?Q?jxCU7wsvD+z5shfZZUsisXZ0t7FSFDanYzbnL68QQOt/14jj0fkpPG+pU2eX?=
 =?us-ascii?Q?TY9DUVSazg3nj7axLEaP5bVln+vJkG3u7EHyYqhBFiY7uTtzFhgqMNHWEnfE?=
 =?us-ascii?Q?anngb2bj6K/zoEDhJXD/F3vHbLz8fkA8Scd/ScoIxhD+4MyhSt7Xoh2zxE26?=
 =?us-ascii?Q?ooJ1j0fiw6jXjQ+A+aKYAuklm2svYciHKwOmMcWMJulY37Hn4ya5LeuLkk7e?=
 =?us-ascii?Q?LyIQyHWJDWCQSosdfhH/ILYz7voDWC9qwWPinzhYdOnE7DyYCahvkWMNCQB7?=
 =?us-ascii?Q?YeluGsl1RXB5jPJSjpBAMbYJmmypuwsYfOCWOycMwFnmyP0bbgV6QvKTsYe3?=
 =?us-ascii?Q?HFTMcr/CccTxAqUZXC7fT3/g4sx/CFt3sYCnRE8c7Ku3Ij1b+nT72RuLDxa7?=
 =?us-ascii?Q?V4+R1J9AFmzIzShHWY8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 04:27:41.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1f3f10-05d6-452c-d274-08de23ff5131
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229

From: Kartik Rajput <kkartik@nvidia.com>

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v4 -> v9:
        * Moved the condition down to have all dma checks together.
v2 -> v4:
        * Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
        * Update commit message to clarify that some I2C controllers may
          not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..bd26b232ffb3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.50.1


