Return-Path: <linux-i2c+bounces-14115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD37C6391D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 11:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D16CD4EB1B9
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E22327206;
	Mon, 17 Nov 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sgpkmyFn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1AA32721C;
	Mon, 17 Nov 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375160; cv=fail; b=fAlu7JxAPVlRNQaM0W1+vIwTletQOU08E8TDl+LXiAAEDqV3wTYydq6a5XyBmYlmcyAp1jOblV3xegmcfPXjLEaIBeLmknv5pBa9rQU5UAg9JPAtkxbgp7UuMfo1KetwOH1ZFtnezHn2tdNVIwpw3vPKbJ4X56I+jl9DRsbOuYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375160; c=relaxed/simple;
	bh=ufaul6HZX3OFuBnH77kFjIOWj8IuHuGhQNEOlp2Uscg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fXMSHuAV+ziI9oo8XfytwBCJAxV6J3HLbRCEHiXYGjMMhhP9mIgLKDDV3odXXKnswppEH5gRAD4xx2BDJznZ4CQtCHcBTL/HzjlBsKPvlBvL0Gc/Q4whv/wpisGo9Lk37gaG8vEbfdwrdCthhEQKobtTdmEe/CPPKVMCWLLvYas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sgpkmyFn; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uq9qhAvLLqFciVj41cDba+N35FRjQNzIxgCTIFLvSrKxaSVk1O7BCss6j2hCX/IK0AAwkRL6UaP56ygPdLIZ8vb/8LWwc6jrAYDfqHomfuZiSqhE/Hm/CfPnvA264GIA9Oaq75FBxvUmD1qiDtYd7+a/Or6IPSAJNKxr+VzJawILGDDrg2+VnXUiQYctQLanZGMJeCHqPUjRnIfXKCu6lRJfl5CPqTjta8RbCE+65+7kPRPzH8zM7sXF3aVfjjvvrBjblvs1kKB9d745ZxOlfTrMucLIENOUjw26D9/2jNf0KKKHsHJtCDSUaHIHQWWhw1DlJyGNXOVjhV20xhnnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98AmkHCLYZ9zaMFqbZn6cnozWv1ps0rXn7NYCvFFxGc=;
 b=v+UoJREF9vLqxG4Suemb+A4ABDbXf1D4m6FTiqwFb0tIo2f89neAd48DQlBCLdq92k99UrfANVqCssDVsOBOt7+Iq+X/2xz4fu36Rqgna4K/UGr4MlwZ24fvLcE8m+XaBiayNzkHI4+yme40VEgTLPC1LqoHrvpOXWGhheocOQCzurqJzM0ERc9AXFScsKO+i71vltFAou73/+hVRZ7oraCbZf4Qb5IXau9AWRGldGvnOvcW5ddEpcKosu6gkd4Pyb6wv6VF05bmcGlVXlgdZDSfxgvthsXjFl60zmmrqfEb/J7eoFNn3NqWL7L4ON2uAJ5Lz1PELoPZkVDNEk0QkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98AmkHCLYZ9zaMFqbZn6cnozWv1ps0rXn7NYCvFFxGc=;
 b=sgpkmyFn0ujkmy8EPTvIMZWZ2cq6cFlgyPH4V9MDuDN51fNO6KBwFL4IKsbJPJNdnvf/CMQM4hjj1tw558S7f8fqpwkfCEHTNmZ9PYq70b3JIqZ8xji5i7iRZasS91nvMTuSWUBg+d871jOHFNNRNnp2L6VT8hLvq9lcDK0hllaqxM+37+oDiX21QhoSZUgOXNRViDWLdLdvPutz+KOdmVMRoA71C24KqzL43mK1eLoB2WO6w8y0U/jh4GAFOaB/ouBfQja8UTAE+sITMAfIT4qioprYHlzsHNTA3nFQdNrvYbaQ/RmgUL75GWqsTWs1Cs9e13A4KxJphosiAUCr1g==
Received: from SJ0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:a03:333::15)
 by PH7PR12MB6978.namprd12.prod.outlook.com (2603:10b6:510:1b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Mon, 17 Nov
 2025 10:25:55 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::c5) by SJ0PR03CA0100.outlook.office365.com
 (2603:10b6:a03:333::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 10:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 10:25:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:38 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:25:37 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:25:34 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2 0/4] Add I2C support for Tegra410
Date: Mon, 17 Nov 2025 15:55:26 +0530
Message-ID: <20251117102530.903555-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|PH7PR12MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c434401-c832-4d2e-2533-08de25c3ad17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/OwcITRJjc4IYtuZhabU9AyUzuGtID0q+kLhv86nXbCBDlYH7R5wJ4Hr7dxZ?=
 =?us-ascii?Q?S4n5K/zcUq6BIZf10lTuIbOLfOgKNvItHWs3W6zpH6qpzz5Xa8aoebubXOlC?=
 =?us-ascii?Q?1bbS0QBU+M0hgRSzaHtZ/X/GCbNC24usRcLtk+P4ADIaMiDYSrrk6bA43Ix+?=
 =?us-ascii?Q?HI3QoGSZleEMujY13YtGmDf9NDUYjP16Bcx8oxDGjTQSi4aPXTmJ7/Vo6AYE?=
 =?us-ascii?Q?tbYReOTYdiRnnUSiiyIESMe0/dS3kCQ3a2w2N9l4ReQ0Iv2/LjqChWZhcyZJ?=
 =?us-ascii?Q?OYRT87TiOR6SNggaQj0h75jHdQwUH1ZXH9sYU1Mk5YfuUrZBHJyPtkjJjD3M?=
 =?us-ascii?Q?TwPE0+pM0nD/Bpoasti18iQItbBlb9bvQtawf0hMktb3Ah/KAf/Ti3Ab3zTf?=
 =?us-ascii?Q?jvxQZU+gvpEyDCZOr+hGuRQyZokW+XJY3xfMxjs0tTVgVHwyILT+RlC6wxLp?=
 =?us-ascii?Q?kIgXs3CpL8Oj1h+kACFixm+SVhn+oxnWlhQwG2Lia9E4EA1i2UdzUydNQUL9?=
 =?us-ascii?Q?Jn8OIXoiKjGLeXslUqIbKjX8ercp3ZGoFdWRgr8xh/y6jfPvBAXBBed4w3Oj?=
 =?us-ascii?Q?GeELPQ0c0+e1+0yHdFX6jwHz55YrhNaXXMDto6iqaEeWbE410srRprcH+ELE?=
 =?us-ascii?Q?pf/i5HLkv/wKa8e7oAHwljyc0ehK0PXs/YPDdjiq8bacIP1FH40DVXFgU8CQ?=
 =?us-ascii?Q?kbI5Ko4iAxx1/E4r8uELBiQ+/Fi6Ss9m4LPA3cVZxt88f+IHYo4nJaTTxp1G?=
 =?us-ascii?Q?brXuW8rWtz70bLgOfZfnt665AhJFjtDQvFljvN6nIYIx1LpvkkTR1tv/ILHI?=
 =?us-ascii?Q?53+ptzBZtIEODY8lPxezoOW5bq1jFaSrqrqQrSTQUXsJFe6woyHC8swdQ/Pj?=
 =?us-ascii?Q?6vyRrCySuDKrWEozIUb0NzvJg4XoM0HrkLc3zeLRlNAiuwOyISoaslSc4evl?=
 =?us-ascii?Q?UkAH/QIqFtTt8imxJ8ezw7uz3Go2hdwFFqF9hsqD92WH/aGTl/BqC6R+XGZx?=
 =?us-ascii?Q?GepSgFWyGR5RuTw/z9cHCcC4aPrIWQ2mpxqubJ6a5M+BzAvM0aGAwuvjMpri?=
 =?us-ascii?Q?hoc+Q9Lj4sjhSMERLrB0bmevwRueE71KWFd5ODIpbYTlGTrnMeOR6GJ0t5Fu?=
 =?us-ascii?Q?vtlTjbupAiXYlH7VLKmBplSycNeFZiN5Ewilonpw1EN+p1h5TiVxMBhhafrY?=
 =?us-ascii?Q?PB/UFs2E4zLuOt8suKG31rOViwQ0Zb3thcJ75pQ23QLY8SnCEUYpxxGXZeiH?=
 =?us-ascii?Q?ffiBr/LDAuMJpPWazvjPX7KicOKxBYmR6/UK2OTQKau+pyWw3aB9dBlnQxrQ?=
 =?us-ascii?Q?IgozLczFvm5p3N0SGg+DgZsnbqX1aGBD1gmncK9EN+eSD6+GlxY7Er2Gw3cJ?=
 =?us-ascii?Q?J6zdX68/fpVYQtXd3wx9enqRBcQ337gnxyjzaIy0C6TezXnH5zPaVdNr2Or0?=
 =?us-ascii?Q?Y34YcgcyJ8AxbcYJBgniUW1ZpZ0vR16PfLHvrGb92EOH/oH8Fx52/hU5q+IJ?=
 =?us-ascii?Q?HV1GL30vP3ZHelRb51crybQj+jmhQrhphEnnMd8/uMoGwBsiuhYqD1zUipAv?=
 =?us-ascii?Q?nB0IPRCurs8L+6q4I92gbeD4ScfY4wZVfTarHFFJzYvS5b+oLlGgzq+2fdp8?=
 =?us-ascii?Q?qQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:25:48.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c434401-c832-4d2e-2533-08de25c3ad17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6978

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Please note that this series is rebased on:
https://lore.kernel.org/linux-tegra/20251115042632.69708-1-akhilrajeev@nvidia.com/T/#t

Kartik Rajput (4):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Move variant to tegra_i2c_hw_feature
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 564 +++++++++++++++++++++++----------
 1 file changed, 405 insertions(+), 159 deletions(-)

-- 
2.43.0


