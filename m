Return-Path: <linux-i2c+bounces-12427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9AB356FF
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 10:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4A1D5E3D70
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 08:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DEC2FAC06;
	Tue, 26 Aug 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TgrZaktl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D0F2F99BD;
	Tue, 26 Aug 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197195; cv=fail; b=XwSf/y3FCnZqi1kVzKvyAnYSReLH15z6KRQcx9WUkCXBmi96TxDCV9eoGFL2DlBAteM9EgdR1lJNTGPX5cu/RDQV69fUVS9klb3w0cxL+um05un2Q86n22TPuMt98TdbPqR8tUFGMe1mhbULX8i8MMAc93oWNME8Er93m1yQIg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197195; c=relaxed/simple;
	bh=EQowz/92XFkIjS7oT19ju8pjhnGZVPLgX0a8MesJyJ4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gxBuCMi/9dqtnqPv6x7uVEHdUAL0JzsOf9MRDjAkt6LZ8cWlbNSsjw0NQuONuK4//elEiyE/bjLybNWOthBJbYQWH6khFGCvHk1INTBroSXdgCREntSxfiQf+LOTLBVfqG9tggAJWUg47hlx8+wiqhx5vZdj4O5ajpt3pCTzjoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TgrZaktl; arc=fail smtp.client-ip=40.107.94.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2w8lmFBuM8Cr++GtvfdBiDvz0UdrMXKZq5n7MFaNEOLZYjkNkERaIavNLarMtCOnNeBkMQQG0HoUL6AtXh4KF1Vn2vTg1MgELD0ex/uI3lRk6HsF7SVvuSUGcO734UJQ1xYWEqsCyS8WzaoRgO9pfKeObaM5u97+bJtOlIYSxLKnSue87CBLWiTBGTifglf+jCEBP3ihK3lLsEAt+TMakLuM6cS2MZ9JupAAQBHSm0dnDf4IKlPM5HFAeUutsyu3METfblZieVy/49KCLooumoS8pXfndivgIy7ZEJ3FDiuwn2OymbvI4fjErtGMLLHzPZ+73R8HLGahHiVmoj/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOUZch0q2p2PNpvNVhVZo8oAAg/0eczluADqgABezao=;
 b=q2soXhuBrCT9hRmbUtAQZENSi3WC3K382DcECl4MLqMWwaOWDT/2+CmKWhju/GUoNTPhZNfm2CAON7tbC+NSnFJgsA6iSWMskszZIcvn9wKVpQIEBbcrcLfhjpZ3g30QnierCmZrTUCtwLiELw8J+PgFjqBQ8rzjgkECkjrs4KZv7EDsFaqq3V6AlX2MhnyCgf1aCYNtuTD48Doryj8ZcWI3Woq+nSpWUNNYURjnHz4rsY71c52H7BRdDv9O9FNGBt631xMTJc/sm95cxhyyddAMLp/NIfimSd2BzgE8zgFuNT5ArilVlrM6BK71Q00wGaPRVX1XMFVGvLz6Cw9ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOUZch0q2p2PNpvNVhVZo8oAAg/0eczluADqgABezao=;
 b=TgrZaktlEHoiVIv1YK1856SCdkpHXchsMdnsfDL8hCBVtKuy1omrH9cyBLxloJCU2FsuqyhLMzolzMJIJFulPdVxRA+RRZwZ77qdz8wI89VJK4zBImmYEkPSMs6MJnoMg/Lh+pGfYhdkIKvJ3u8fEt/rP1cXnBV0WJU/UFswS287GzoZhg2yhw8/XddT49YAmfgYkMHK7Nsa5kK+snWPyu5xJR4LFDiS4WR77GkLCo1QWtXA+50Lo5tOKDXvF3YKsagKD9wMydAL5vSxSNC4Pr79lcK+RfvSHPimuxLYh0pSiM1AOgaFkN0VyI7h+8giUWMxNlUH8ksa8GsNGBeFsw==
Received: from SJ0PR13CA0148.namprd13.prod.outlook.com (2603:10b6:a03:2c6::33)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Tue, 26 Aug
 2025 08:33:06 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::7f) by SJ0PR13CA0148.outlook.office365.com
 (2603:10b6:a03:2c6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 08:33:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 08:33:05 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 01:32:52 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 26 Aug 2025 01:32:52 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 01:32:48 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v5 0/5] Add I2C support for Tegra264
Date: Tue, 26 Aug 2025 14:02:39 +0530
Message-ID: <20250826083244.487610-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DS0PR12MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fbad19-1fe4-408e-e107-08dde47b2ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700013|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oNWf1WZW+/NGCPTI+MNlTkCvkYyTFVXCHg+pQYWd2ODmyBEr2LlURPg0Wp1V?=
 =?us-ascii?Q?wt1ZVsi7XN+J0tZfqNJfxzl1qFi5fXxFw6vDRRdEjANGNpK2A/L4U6dKLQOw?=
 =?us-ascii?Q?TUrGpDizcHzR4sqYo1zNm6yVAQIfUqGYitroJjDp7NUIZkyAs5S9hJzERNF9?=
 =?us-ascii?Q?+xWKW1jYM5N9uU14/zB1KusH9s8tzj9vKC+gsm82MjTocyzmtxRXujR0HNUv?=
 =?us-ascii?Q?Z505GqSYWlJC4OyqGfjI6izAJyLOifhIKmiWY+5DjqxQL/zkJRQuOYU7Kwho?=
 =?us-ascii?Q?ORo2czChVp74KnJsQcKnNN6MC7DwQvn+dI1jHBVdiY8v6mL3i3pnRJ+eKBhd?=
 =?us-ascii?Q?DO6ailnk8LrlGeKeEAWkAZR0HO8cAfji3g8EvTtN3hwXLrWQVOVMghY04khe?=
 =?us-ascii?Q?w328vFp+YLU/voZ6tuCpsWveLPJ0S6rPB7b13k2yfux7mobYBS8oYmgOaEoH?=
 =?us-ascii?Q?gOnoEpOSsDO+pSZJ5v0zZHsrsfgBhX+Ow5d4n53ArL0dNimawF7Lob5yY3la?=
 =?us-ascii?Q?XAWM1RAnYisK3TIyilBo1D9xdEhJ4ljCCxKBxxvfewXfor8CBi7dbrAw1cPm?=
 =?us-ascii?Q?xPRHoOtie7mEf9F/Pqb7ahqeYCNwWNRZasUaPzQ3biSdjEy59ajFpG+Giz1x?=
 =?us-ascii?Q?iKvtn0ZIQcun2cmFAYgbXleEc9ceB4fd8mg+IDaZCGiWt/oh9KDv09rAAX5P?=
 =?us-ascii?Q?3hicKeImfG+ieqoesGWgHNYEeF0ubcbvjIqNdPr0BpYLbdRmReTWHo3ma6DM?=
 =?us-ascii?Q?gufhxb9Gt+EMVwxoZboOBDlqxCltPsqNukrEdWmQlniawpiTNl+9a69AOF2X?=
 =?us-ascii?Q?TfBTKL9zVouUjTGrFE6h//FajwtB/zo7/V/lx/Xl9HR5cwhfiZ3nkif75fIg?=
 =?us-ascii?Q?GtG/Aoym9U9u8KPLlrYv0HpOdE0D7JsEPHm+HhkpVIaqrSZ8rhXlsdrX5Z7c?=
 =?us-ascii?Q?mD8hrbYRz9y0GQX8BY1CWT/gDWIrKwvuej9E3m+C253mKEnLfDO+nJ4gyk1r?=
 =?us-ascii?Q?08oNUwx7e6t1yag/sLxbOYdB88KmInGQcQI1eQRsB5sOmsFZYerrMDCLMej9?=
 =?us-ascii?Q?5q69gxi50yWbPaQaid++xUOZVXQRl1W4w1+eaPwN8thTS+KDgQlGJlGA4cuY?=
 =?us-ascii?Q?OyZTIp4RkgNb1SfDZyO6e/e/wzsZgPl79CFO5Xf5QdJbUe9ln13XcoyBGX7Q?=
 =?us-ascii?Q?df3FjWtKuSYk8wu4VYcac/2BojgPlVXDLC8hNUFUN91NLT95xk/cMCzsgiEN?=
 =?us-ascii?Q?z5rq6JY7qWSAJUdoGXE/aqHA6l/fpr0FSkOFh8MTSQTUxaQV08FQ0mxxbCJd?=
 =?us-ascii?Q?dMZtjkQaOgqpqSUoOma2pY3oZ6wLkful+5hNZvTzXwiMyEVunMHOgG4orQl2?=
 =?us-ascii?Q?wkcwHTLac7mbsdTu2uHOwJytlRvicGv96XH6fbceGvQmVvpTono12Aygy4Zf?=
 =?us-ascii?Q?ZUjTTLslAAuJ6DVev39mbLCwlu7Pv95mTFHYsHd+tzY0c2mUHpc/9Yzgv5/H?=
 =?us-ascii?Q?q/lZrD22yQhg6+9wOW24U776eHQn6CGTT62z6ctflabMuqwG/Eju52EHPA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:33:05.8543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fbad19-1fe4-408e-e107-08dde47b2ded
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318

Following series of patches add support for Tegra264 and High Speed (HS)
Mode in i2c-tegra.c driver.

Akhil R (2):
  i2c: tegra: Add HS mode support
  i2c: tegra: Add Tegra264 support

Kartik Rajput (3):
  dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
  i2c: tegra: Do not configure DMA if not supported
  i2c: tegra: Add support for SW mutex register

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   7 +
 drivers/i2c/busses/i2c-tegra.c                | 159 ++++++++++++++++++
 2 files changed, 166 insertions(+)

-- 
2.43.0


