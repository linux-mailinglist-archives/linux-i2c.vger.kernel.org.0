Return-Path: <linux-i2c+bounces-13012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF4B7DE7C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31C016AF8D
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 08:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B853030FC11;
	Wed, 17 Sep 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jfBLUV2v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE210F1;
	Wed, 17 Sep 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099441; cv=fail; b=sZnckyd+Vwd7rIm6l9rpTnYUvDlr20uvcop+0YJrnu4kouTKItxTGMAKIcwK/eX3WmUdZI1bgt8QVxZwfhyhCsWaLo6IXZTHOjnIpP1kO+6H4O9IVZofQYhjQMl94uqyFUrEz3TyC2oyqhX0B5uomIC9CWlGGfLOPceNWb+IPLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099441; c=relaxed/simple;
	bh=jUeZ3fY8py7aax0r06HmFI469u9quWXmXLV+13XNxFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKi43Jku2KqyQMzisq9QVW7qYlGwXiohHXmqKe33I4Oyc+zArIB79fmAO4m1z1Mf/I/mSbhwCXl3yUIqY88S1QFvZgTI+Fp8v+Womte520Edx8bRMjcdjYOP+VLo3c56cBjRg/FucgRgUU1LsQ5stEKxUsCyRlnU/eRy7zqfaGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jfBLUV2v; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8SdMQvAjmtkIfTzWKNsVTUKaeGUAxY+DTR2c/BNUu2Oy80EqRwDt9Qv3s78rChTWawx7Iv65Qq8TS3gkN3M9cMF4+A7Vl4TG7wHxyPWF0DqTeMst3LmpzKlPhIyJvntKutqGNDbLHcA9hzfCChB5t0UTV3YLiuJLm3sJnwwcAcekCdaUqGdqQZe2k08gN1AwcyGYiRHgB1d9IGym8ARMsfLVNMSkIhSXi1qi7r3uNRSmgOOLBqqeddncS8uapVsalwjNatDOjleZ9dw1hnZK9OB6aIEFRnKfj8ocwfdADQXfOUnaSiDdU+wGihpH6I+hXXcGFcSguHWKKs42iWqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW40/Qs4rmdq02lO8N6EQPhFFO8N65jgWUR8bJrW8LU=;
 b=w5kxRBc+VEU16Q04va8bRrtxXZ5ZKfeWPNeX6nP+e7wVjXvLvki/BZ7pfYxuilNL32KTi3jxQW4LJxYP31YDC7HRYCBn0TVXYaZJ43JXQQqcttGCN0Sx6NWi7UWgt+2ksHmZpXwYCznq4J3h1jzxQYzjHmTpXksBTTBQsyF7F4aSt9MfPv9Jep2AI9Nom+UcJX76i0/XyXblySL+7klJkRBnrGQYVICLROr2CLiwPkLDfHCO6twW8/pgdiYSKReY3tvcYbc6fV3Xt0ZlIb7GfDnldS82AOTYEFQpD5xmWLaMpE5NNpzDBFNcI+v6cQI757FKeO/YuzzwiZQpEdzCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW40/Qs4rmdq02lO8N6EQPhFFO8N65jgWUR8bJrW8LU=;
 b=jfBLUV2vgwgpcDj6m9gOEVzmISZ0EP0dFT/V8rqpuLrYDRWj8YIrQfm3gsJz7PXnmRDsPr2xnedxaT7cB/tSw2A2UGV4hK2dOXrym7yy3Qk3L6mftIqT6q1LZi/az5S435MNPBwZN9TgjZYfLS2Cyic2gCU9HKxxxZaYE41uBekKUOtBiaQEZwpvj3lbYBNfx+eI83kCZ2nZMvfnzrnhEPWz6wsj5HkPOmrR2ICwDxqM14NwT6eY7Ukrh/JcmudKHxXn3faToDEJP/fc030UAPOtG36CcAubNHaDjxC1TAY/VV0ncm1vNF2sDUaGouJ/amT+OcttrTbcLiMZNe3Oow==
Received: from CH2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:610:38::39)
 by CH3PR12MB8728.namprd12.prod.outlook.com (2603:10b6:610:171::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 08:57:14 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::f8) by CH2PR05CA0062.outlook.office365.com
 (2603:10b6:610:38::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 08:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 08:57:13 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 01:57:02 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 17 Sep 2025 01:57:01 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 17 Sep 2025 01:56:57 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v8 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Wed, 17 Sep 2025 14:26:47 +0530
Message-ID: <20250917085650.594279-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917085650.594279-1-kkartik@nvidia.com>
References: <20250917085650.594279-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CH3PR12MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: f23f1fde-8d03-491f-855e-08ddf5c8321f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7yW55j8KJburIoktocFtkcmLsjfGsr6zmVPwJAP4Y8ZGoJbjoySSEtUdzp31?=
 =?us-ascii?Q?0fCPdnN3uLH8fHBUm+Uzo21luh/4kzSZ94h000FBV1GKE8+WaTCXT5/mt5eg?=
 =?us-ascii?Q?x7lHU3SA04DcJk4wTqrqVGgA+Dy5OZodiVA0tbZJSKE47+yFNmIHXfAzYPIl?=
 =?us-ascii?Q?ljrCmU6PO2EZIjPa2Li5uF3qbwcMcvS4iKrCsnY/lWiqL3VvddzJjHP2qAFt?=
 =?us-ascii?Q?p/zdRz3WcZOrYno9g9i1v/oH8lCYhO883FEa0nnEhwIxYNJkm0QPtOMJB1r5?=
 =?us-ascii?Q?XxmANs0BKl5iFpxf7T1cwUkSRV2gfJn8C+UNLp3J/a0AMBQrZihe7VV0oLWe?=
 =?us-ascii?Q?TLPJKyppOCLMPLd4ZhkdNywcSMCe71Iw8iNm1+6AXj4WlV1zej4AbT8FCyHc?=
 =?us-ascii?Q?zKGn29LzRUG4Xe04SRa6AxfwpaBbUaeF6+NMfpMkBgwKh5eom36nXWXbBP04?=
 =?us-ascii?Q?IzkYSZGhxAFJgWgHj9NgvsjTy//bVslq0OeW+MaKDxZRE/2KB6Nn0ovlMrqI?=
 =?us-ascii?Q?fQVnm2c0r45sB2M2LP/O3C6HdpMfl+Ed61FoEAKIzJepqkOICu8v4ACXEsk6?=
 =?us-ascii?Q?8yufeVetNc+LS8lSqFxKMtCbVMQ9K3xRKYWpiQzokKtR97ZWS1jimOdvPJVj?=
 =?us-ascii?Q?7AJStwo7lNwwHXA47AwEwNUQ/+ILrziaUSUDnu4VhppLdHHpS05zySwHz/Zx?=
 =?us-ascii?Q?gHIfXaoEK5aMIeXxb9PNErfWfzxb4Y9TWQqmuRaoSJVFbw5R9ez61bBtxzYR?=
 =?us-ascii?Q?IpjlL7lltaf/nMAI/n2c/dtSC4vGu6OtkDylkRB2A3R/BNCTpaUeRWthTEsJ?=
 =?us-ascii?Q?rgValL5tzXzT9Z8OC37cEQ6l2WU1yrVd+meIQ7CcL0C3pbwb2uvhHnCKH7zj?=
 =?us-ascii?Q?BgW22lUt83ARnMP/xeCeuPhFN6dlnOoqKtiQ2tTLu5aLvGTTmcxPMvQ11nPl?=
 =?us-ascii?Q?BsziIW5U036vOol6iY39kJb+okvWO5X+t77oDOqnMG1h8T8EfbZwkPUoQllr?=
 =?us-ascii?Q?ei8keoQlTiuCKd67BCveP/Kl5/MI+dm01Ru4G0P1h+sx7cjBJ4o21iH8DjYJ?=
 =?us-ascii?Q?zt/gC4g+Nlbd/l4kkhgYfGMRIOrIDlu0lUNowqZDENzzJ7Ar20IMQWZSE/IN?=
 =?us-ascii?Q?gGGw5slOwZYtpVh2Yi9dX2D6r3s3Q9QIbseXstxuE3oI/OEbBHX56CeUNpJG?=
 =?us-ascii?Q?MZA5POaG3x3VB3Q8Km1eAb/2bscLKscj/+WeSwGvMl11WZxbdVytU2B4WXXz?=
 =?us-ascii?Q?i+/G1hR4X8qQqKYDXucNw8Lgujti6EgEglpiPuJHOS7OSmFh/nnCmGlkQ6l5?=
 =?us-ascii?Q?CDdJIvcwARVxdU6Ml2FNvtkosNhMuaQelt7+0bNV95OlG4MZNox81oIA+vHl?=
 =?us-ascii?Q?V9al4UygLGBmXswSRx6sZJQjXuKH1Y4eMvARLE+/vTCMJbfBTWJNSVETtng/?=
 =?us-ascii?Q?XLTe1e66wOxfd/wmTDTvstD9GPNwOAOIeub2rmMuL6WXXKk8ybIR+2VSgmRc?=
 =?us-ascii?Q?V7ekVokIpyMLn4/5nDA7nvxSJoSX+VRnM+4EsK42F/NV49vBX7+TJsA2tA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:57:13.8229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f23f1fde-8d03-491f-855e-08ddf5c8321f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8728

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


