Return-Path: <linux-i2c+bounces-11282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB8AAD1AAB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87FC23A9108
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1226165F1A;
	Mon,  9 Jun 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LrjbWn9F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244631DB356;
	Mon,  9 Jun 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461686; cv=fail; b=pcPx9wkaza6umCLDfgPCMMs/YQqdEHDEeNX2gj3sLXnQKg2A1NZDyHdZrTcHnr0ExPtt8aiHY1/N3LJw0aGw8uDqll61CcwyvrbOPRdzj/eFm32/puS/9mTX9h/WBbJ/U+Jb12LtMz5qlq2b+TGU+ubtNVHzBJ5QrjHmfoOYg+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461686; c=relaxed/simple;
	bh=d4F2inXTZ8tlo131ZCJLvLErM+ydJwaMuMEr9NDkbA4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUC8rXPEKVT2ZfPnW9AC9q8UOCY51PwoLi2Ho1bF3rxB4UfmrJjgT3/KySW83W8ySrXnic2CUQE/EwYtlzg+5G9DqK9O2Vj9q60EYh4wrg2CjBpqty8qEQIc6kOR/OfSAlsUQBFBh++U1cHRrVmlHVnbsaItBUUvKDDP49z/oKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LrjbWn9F; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLRxdPNxeSSDmiipD/sghLYrMlROQlP3EGCOv6bRxDxsfsSNGe1jiVy9kDOuq8AyG4NpM6AB85fGdMlfVMKefJLu/Pd/XFR9EJAXslCWnr1CKAnU51P6lSYj9gJ/c6P80iRmU0asOt60S/2KQRonU4XMyrHA5CgyHx5UwyK21LnxMC3hwd3m9zvb48pHPHDJ4BjUzkn1fgxGxDT8FMNNdA5IWMF4F24q1q/nx5ERqHrp1Kd4o07iA8p7F2rr9MfuayXh/Q4Aid9/aWqOIKYEVorNfl2bWoJOE/2FVqesNbayGUULzZOhcTl1S84JZ2ugsR1+Yn6etHS2mQPTHbqMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxvdnE1S7Fahqp2/np/3jFAlAfvW7eQ/ZGnK24Ax8hk=;
 b=VSmFuSoSqdwtyW4qtD70sPpHyp39vk6iT/elNaRuCbd5uDf73yvgKwn4N8OXWtsyb/No3Uxj0R+34rrcNDup2cd9Kf8sriFYLgCrNWrMoVi0f2w7I01vgwaN2LfNtvngA5aCOoR2l7/84ddoDEU3EdWv3C+d9aBGrDK03k37+lMIL6UQRzeacavY/Tv8hQsuCF1wggmxub1E8MGWNQSzgHoJw+tt2EQ8j22osNSCIofRq1tes6IsyL56LPABYe0fyHHK325OHx/L/j3PRJs6O1hyvtN+7eK2F8m56w3lIbD069KGshrpFWF4KXDW9KlIyHDG8KnJ1c2qMk4NuQC/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxvdnE1S7Fahqp2/np/3jFAlAfvW7eQ/ZGnK24Ax8hk=;
 b=LrjbWn9FpJVLRoq0/pb5g4tiol5leNHXIVbD9skYwUEADfl/XfaQHPDxttGzEmuicITASprLd5aC4PKryvZpTW4hTl0pud6gnV/cq7MgFYRjktv0UW22UGHl4oSPWKCo/5Pl7OjEaX/cEQX/GsbCsYHp1HbY6Nhgz3JUUnP76z379hTbx/f8ZnnxyaUFHTjiSJEruxlHgvqUleiVGFHxKiztYh6RKPJvbmpGehLDnbUJqvH4SYR6uKZXmw+hHtDUzJXc2RV+7NM6gd7vlf/4NgErx9bkAu2Auq1ApOBbjGodhiXfbG5z68ZDXTdDibJO0SiS64oXEiO0qxLjpYnY3Q==
Received: from PH0PR07CA0098.namprd07.prod.outlook.com (2603:10b6:510:4::13)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 09:34:43 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:510:4:cafe::27) by PH0PR07CA0098.outlook.office365.com
 (2603:10b6:510:4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 9 Jun 2025 09:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 09:34:42 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:34:30 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:34:29 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:34:26 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Mon, 9 Jun 2025 15:04:16 +0530
Message-ID: <20250609093420.3050641-2-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c4596d-863a-4c13-4abb-08dda738dcee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tzD9yZ4Rj0T3l/hxEjdBadzMxo0i8qRyuqe4dNNeJgunq3IuO3cT8ocpQVGk?=
 =?us-ascii?Q?F6mIULTLDCd/JAWYSByi8s0oMBOzBZrWkpF9ZDAiWNmSSaXtLfCJsf0WVaOI?=
 =?us-ascii?Q?gkOU3btb3s/3xAG5C9EUsy0PxWnnCVuYXqXPRUvPSqPOMQhMlwJr61vTmbi0?=
 =?us-ascii?Q?q0LgF7uctKd1g+bxqjKlMwUDt4fyVJm9KV2BePl8HbMlMhEf3+XHnGqeam4Z?=
 =?us-ascii?Q?oAcQlMJhvAkKWopretseXnoJBKOK9uSbdRvaD92JbbwfJKUdEHbHtU90YLwM?=
 =?us-ascii?Q?M55O3sDVTd7eXFDbbMSst9N6rM6WQQQ6Dyrr+u95qlzK0chP1rLYlv/IWMoD?=
 =?us-ascii?Q?xE0d8bW1mMf56ul+yxsys7LXf8hpv3PS/809MFJDB3DM+avy7duUWdvlFKIl?=
 =?us-ascii?Q?4fTIefSpEt7JPicXF3Sd2YZq34KSSeUNS+Xn5uE6uwH1KTc/t20eDjFE32NT?=
 =?us-ascii?Q?dIBJK4K73qv9Ze/iY4XtwoeL2JpvBmEJj21YcwYTvxs8baJTiNqCZBz3uXS8?=
 =?us-ascii?Q?1kFUwF9IjHyzuovR6TlhoGXiTaKISgEVHFMMqbja9D80PA0p6bDsaVwd0zDI?=
 =?us-ascii?Q?rl7KHadO7iKIk2zKvmU4elt1Qsf57KfXp+5/flN1T/hk0Qjjnt50WE/WtqgM?=
 =?us-ascii?Q?31ihhDgdNOGtbZnwd5z0NY7txA/WFmvNZYvui+qHe3M4zqlebNWij2Ge5JA6?=
 =?us-ascii?Q?NB3fOt22LpLSCHL2xoiQD13iiJ87Plocmnt25uhYuWGUiixuRa0LjI/TXhTc?=
 =?us-ascii?Q?1xk9RusX/HNoiFxo0orTZXj860BsCzptjtBLEKoD32JnQVAF4WJWDybKip5v?=
 =?us-ascii?Q?iETMy+E2R+fyG18UMYjhB0SzSwvYIgsfJ0XhQ2besznuaR5coZMqDfUXJWzU?=
 =?us-ascii?Q?I0rDBH8pVqtzo++XR9rOu8T7wNU4muUytw1OELSGzSlVo6+zitnxEO0JHKZ/?=
 =?us-ascii?Q?T4IAKyuUHHVBU2K5oua6QoQnFrLKteEjxZwqtXLXs9tcO9Hm1eGO0Ke7k0op?=
 =?us-ascii?Q?ir6s4CzbFc+z8xw6YiRIA0XzG2qt7GcNx4BiANw2l72a+FSmo+FrkPotj38r?=
 =?us-ascii?Q?cNOiGCTXm2zXQAMYJc96w3zVG3+aqVt9Ug5IekwLlMC3xdnfEpmOhkt7TAK4?=
 =?us-ascii?Q?kJLXPi6KkFCFJilrHwhCGUfFy9BoC0JHNk3X3VM6Y9z4lneOtGIezZqeK5/z?=
 =?us-ascii?Q?bOR6YPsMdiwb5wBhfi+HeU/pgwnJUX/rqemAeJR7oNtkNJ/RhbJcqbOp/aD6?=
 =?us-ascii?Q?PrD26svDphr3IeCn5i9F3pOZ34UmScIn/SNgqUGscr4lSy89n0YCsLUqdIAv?=
 =?us-ascii?Q?UBFAQoqhx8Ni4z08ZoMtytQ2GeRk/eDG1V8DcgaDI7zU10k5fUU6acPcSduq?=
 =?us-ascii?Q?sE2s+sgIUNAvaA8t10GolRS9aQGoGfFuFPwq6onzRjOPe/sAJPUQLqw4uUtb?=
 =?us-ascii?Q?R+GouPKy7ulT0LDhGEx+ZaveNSNP+cfFuipnT55Fxbo8zJiJ+r7UoqeN2T63?=
 =?us-ascii?Q?AlUsetJcI4v4GoOywoQ81G491MS3NxXKlAz4flyVgsuoVOftp7L77MC0jA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:34:42.2745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c4596d-863a-4c13-4abb-08dda738dcee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

iTegra264 has 17 generic I2C controllers, two of which are in always-on
partition of the SoC. In addition to the features supported by Tegra194
it also supports a SW mutex register to allow sharing the same I2C
instance across multiple firmware.

Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v3:
	* Add constraints for "nvidia,tegra264-i2c".
v1 -> v2:
	* Fixed typos.
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 6b6f6762d122..f0693b872cb6 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -80,6 +80,12 @@ properties:
           support for 64 KiB transactions whereas earlier chips supported no
           more than 4 KiB per transactions.
         const: nvidia,tegra194-i2c
+      - description:
+          Tegra264 has 17 generic I2C controllers, two of which are in the AON
+          (always-on) partition of the SoC. In addition to the features from
+          Tegra194, a SW mutex register is added to support use of the same I2C
+          instance across multiple firmwares.
+        const: nvidia,tegra264-i2c
 
   reg:
     maxItems: 1
@@ -186,6 +192,7 @@ allOf:
             contains:
               enum:
                 - nvidia,tegra194-i2c
+                - nvidia,tegra264-i2c
     then:
       required:
         - resets
-- 
2.43.0


