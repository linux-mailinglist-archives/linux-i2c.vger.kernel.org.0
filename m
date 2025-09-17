Return-Path: <linux-i2c+bounces-13007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC30B7D085
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9A43206C2
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C5C30B52B;
	Wed, 17 Sep 2025 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WxIiLE9P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8930B513;
	Wed, 17 Sep 2025 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758098181; cv=fail; b=hWboDTN+EI+MOkNWJZBcbB4Wi/sBgqvbzaxPrmzxJvgwANBGqaPrkZqkPOb+dXYlSZQDu4+UWxXsD8wDj27wF17BzZDErdJa3CLyZCeEEBjZElKdH3z9QjWTWRKsGW/MQDjo746O3fygGNQst0kywwZJyw+7bmJR2E9QbYaG04g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758098181; c=relaxed/simple;
	bh=jUeZ3fY8py7aax0r06HmFI469u9quWXmXLV+13XNxFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwXVyWkC3k5ckPqlOJ99LC28CrI9IEVPKz5ujgDG/71RUxUoTJZE2ON6lq6/Tp5KxlOPV0wyuvnpCNsdDm5jfO9fzu861EmZyf03cX2yS1REjIEQv3+11NNVpYx6Zjc6QYIMsae50rKhsOlZN532bwdD7wwo5Q0DiXiosntuVXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WxIiLE9P; arc=fail smtp.client-ip=52.101.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3V40/SvVCjB97KfWj4LMasYdiAk1TVD2sEbC1seyEO7W9MnDnFPM0RyTaBM0oeNiJqg3XnPtvpkqEeHjNJ7N9d2Zy18jWsEYKih9v2JPo4Cr8Q7ju/IBRj+mVkFSfWu/h62naHOrdrctOuO+mwLA2wk2HCWV7VWtTujI0ncztoWAxD9mrH+eri4oamAX0+NLLFVAK19U+SPPzGUiHN8D9bCXa0+R5nwr/UxDJjB+jROwlpMS7ACjFE3eZqIuQFeDyezm5saNrin6p2ryRDLca209yjrzU4oimmbcGbMULD92sBfqoTch0QgPC0Q0Px1DMJGIjYRnB/jw70CbO1EMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW40/Qs4rmdq02lO8N6EQPhFFO8N65jgWUR8bJrW8LU=;
 b=FbNeyD6X3T3QVxvKIG7sBHHmLKvkJPp25klAX3MpQSkQqnwXObepo0ZVAtqCYJElBtndJgluunLjmf+M57Hx3/Jcf/V5B9a53NHCENr2L/ImsNjzy07YJF7HZGxZfQP9vtGNnr4L1Tv2JJ5dhuWHmsk0eNF8RTSS+xRTQdzg/HiCBmcarTe4vS2m6bOrr2E7gCMUwbh6jbfuZ9KbPC8yQTsC7n2L2GcEGLF83Kx+2ghtL3TyCFlOi16jQyqLbtCK3TtBu/QQKEEm0YRaHSPF/F4itiYmJv4zc8JjFK7Wr9VGagm64adXRRlTN3STBHHc3X9TRPXWp/yxHnH5ruqh+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW40/Qs4rmdq02lO8N6EQPhFFO8N65jgWUR8bJrW8LU=;
 b=WxIiLE9PXtaVSU1W4smIrXFBWLWFbY1hiDZUVLTvlAZEvalzPhd1hKr7qEGOnmaSgCdNsScZFb9OO4zUrzHN3K67ww+/hJEyiuwW8MsLkov8YR+dNScwvGV3CcJrrD1isybxyD/6b1G+1Fy4WH3nx1V1CkDvUFdrYOZh/kyK5P6GGZafaNFTne5yacH2c/9m2ZXuSpF9y7eVpBjqz4B+P5UJ66EDg8zD5ieqJbPpIuo2+O2p/pYRnJC6W+eGlkyYNSJVjZ7+0KTGUNL+aaDOdPrnUkOssN0IG0uZAyrJrM2MFh9viH6xBiBnSexhKT+Bq+7G/YqhT8iBiwfP+mFn3w==
Received: from SJ0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:a03:2c2::34)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 08:36:18 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::52) by SJ0PR13CA0059.outlook.office365.com
 (2603:10b6:a03:2c2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.11 via Frontend Transport; Wed,
 17 Sep 2025 08:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.0 via Frontend Transport; Wed, 17 Sep 2025 08:36:17 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:35:57 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:35:57 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:35:53 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v7 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Wed, 17 Sep 2025 14:05:42 +0530
Message-ID: <20250917083545.594081-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917083545.594081-1-kkartik@nvidia.com>
References: <20250917083545.594081-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ee1c25-ba25-49aa-ba07-08ddf5c54569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YdLLaOFCiAGQ8Hwad2JLOCKXlCg9xeWEA3qQi6A5SabvnJewcC6nFe+QsZ//?=
 =?us-ascii?Q?4QIp5ozWVh/QsESjLsJbQkcu484gdLp8cJjQudN3EGpTBT9R+Y/wpd71fPW/?=
 =?us-ascii?Q?h24w3MYmRIfpfHeh+rrtGDit/GPAc8ZLwn4E5iJHdp7JYEQw2y9SESXfyLaX?=
 =?us-ascii?Q?XMuOuYG2hjLCShmG0bni4qPLd1qrN8+TUd74qNaQcbXIdNHJGaOKmFhXqnFC?=
 =?us-ascii?Q?j5JTYoG/bxK0Ff/nmR5xjSwJtXqjiUuLYn6E0tdn3E0hM8Xirt3VOaxWJHxZ?=
 =?us-ascii?Q?ESIcpp+7bkJ3P/6HYW3KskuP0Sv9KJnTHMFs/Q+FZHyUCaZBFYVCn3k3CXef?=
 =?us-ascii?Q?1DoIr1vZreBgxSlQDvVMX6PHIVtyC1S7xd7w7iNMnze/ja+BrlkR0En5cp8b?=
 =?us-ascii?Q?U2brrp8X+6JcSy5aMmwUQXDlLys/3Z6NGinNvQnMi0oGtRoiwsOkX7jv2za4?=
 =?us-ascii?Q?QM50YEAPvj1CNGi7V9oXw9EfJiigkPDWLBdwu/xTf3ykOC5IVMQ3/XSCjKbT?=
 =?us-ascii?Q?B5EOPfYAw+oeQvBrOS7ijcHK9XRa08MIdxZ8jB8P15LmvnL1n7ZNXNv3SHXW?=
 =?us-ascii?Q?+AgAcW1bqe+thkGUxPnsUOiEr2+R4ayZG8/xjjDHH0+CHnI33SpWTnZOu0SR?=
 =?us-ascii?Q?flZLWn0AkNt8elf8uOeSld2qbQ48f4RUqNgjFG7sk2NBbbzUkaDUpLaUssQM?=
 =?us-ascii?Q?k7W9g5vfmZGA9YlS5mxQ0eooT974ZWBencDPOK2pJ/YD0I9091yZDD/Q0pxF?=
 =?us-ascii?Q?5o+8brZjRkQ+WRFHL1X5FTZzhIuauC0DKjtczBov+Vp0v4HrHDf5RizxUP6T?=
 =?us-ascii?Q?D1BNhCPmeRt8/eQ3Uj1AzZ58zvbVM7vWlKK3LBj1NLBBCfco9ntkOTdY7Lxu?=
 =?us-ascii?Q?GwHYJElFNPdT/1fhsCXw/ZOvDTRDFXQ/9E76wW0FJarm2NuiMHHry8rSSA/s?=
 =?us-ascii?Q?NI99N+mEq9mNyF2P1Gw5kvRVfQhsNnMe3Y2d7jtpcXvHVWSfWoIQj8uz87G5?=
 =?us-ascii?Q?n+uOF2Cr4gTahoxQKobchm7fB7y5h9EA4Djyyb6Csh6+v/oGt8EV01m9+mzQ?=
 =?us-ascii?Q?XtqGcfdlFQ4bn1oph+0vkj54YGPGZG9uryfR0xJK77BO7d8isfKzERIOObKT?=
 =?us-ascii?Q?BHbWBGt9aX1cmB4BZVYW/iDsJ9wER/SyGh9hfqy4hwtYerW0+bPlhaLHi4jk?=
 =?us-ascii?Q?x/tJ7epcEMgDUWmJACXNF1lU2VTGDY2JDLO2Wm2CwpSYbdEHtTtccshW/lhu?=
 =?us-ascii?Q?k22dbE6p8Bnr3II599R9gz5taU9zBxqCY2MO2krp2T16AHCddEAnfBsAkpt0?=
 =?us-ascii?Q?anyO1ZP9KYSOuIePiP/9inZ3bFKVoPOiunyo3Sni3gQzyepGR/W2zZ4jT4hK?=
 =?us-ascii?Q?YKX6yHrkx2oNkizsyKJzLTdGod/rKV0X9cMj6/dog1v0EtHMI6dSdT6t/o4J?=
 =?us-ascii?Q?c1moumjyAbdgpHSjOU16DdzCD4I5019X9U7OsetzRehDE+/kVOvoFzZrG7H7?=
 =?us-ascii?Q?VIOPtq3uX7LZT/KjP4dTZvKOzxIDsUuf9hCyXyHoQPnE7kndFGipalUlcw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:36:17.6929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ee1c25-ba25-49aa-ba07-08ddf5c54569
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v4:
	* Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
	* Update commit message to clarify that some I2C controllers may
	  not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..d908e5e3f0af 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -446,6 +446,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (IS_VI(i2c_dev))
 		return 0;
 
-- 
2.43.0


