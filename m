Return-Path: <linux-i2c+bounces-4544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E591E39F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5CDE283B60
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4F616DC17;
	Mon,  1 Jul 2024 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dimA/Oa+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614B16DC0B;
	Mon,  1 Jul 2024 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846817; cv=fail; b=ROVg9vHW05Jt85dziBHvBYHof7ZfLU0bVoE626cpnXjNe38ASvHyQFnq2jZXnT89lvDiPSlwi7A4j6/vWRublv6mSfgYIbFcmxmr/8a3JGK1/plcJdVZvHyVNwErk9lR6S8o2Dyq78twJ4zba/cO3Ml+br5noa1vWcWBe//hxo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846817; c=relaxed/simple;
	bh=XW8mdH21wzlU6H2Xg0pzxbzlnFyEK38ok+9uPeTTYXs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbCsdjeUu+jAkg2td0nxxsNz04RTDZjFoSuzadC/cA8A0RRkEWKMoqw23uJfgxtaPITI+nNBCd0iRsv1COIe2duIlWiV1SpcNjkKSVY81dtOagP1WImDQ9Zv+GGAVF2U/9x3nH3+KTxIJL86c9rpmzTMOu4ywTuN0vtz2MPaV9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dimA/Oa+; arc=fail smtp.client-ip=40.107.100.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbweC/IatyCQk2xuS8daLAcVEss5ugmq9xXOD/Az2Dl8Zs9ZlJxbjH/JDxni2fuVfXuMsnI3LIlF1OXSfbT3GcO2RTK/SVshhiLaybI0qp3oGUX95iYX/ml17rPFSiBcSb2fZdNDnaXkWS+L6ZD1CmmqPHrDTcQT4eN/Gxafb7hvOILDeclstgESwUYZYTNKn2JacYhlSaqxOE/Hh0H1fflkDIj8sBmbU7jQV8FeSmKoYYFlVm9s3VhvScVzkq8aKmiVFoQoi5/7u1/7G07xeKwkMDwjiJqMcsY7U5NRXtTKNemXEm+wwV3j7MyrrfL8KXS1VKQwMynxvE08n6IytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3vge8b88HXiAUwzvg8+z/EYxU3BCZe+8cSXzzbmD9s=;
 b=CEImA1gvPqYg4jx3w47CKF9ZSiq34IE7ajQ74GfRPvuGynkvckVpYJFn4Srq75gomap0rxuS40Fp7TjTxdbZudz+n1WRjyGJOXlPDXBj4kSiH4bCDJJYa3O/oNQPDwkT7ZlsHeUEMEVkNfQALxq/mOiP8PwfmsyyD/ZnbcSnFOOocAXA68GCS8qli9G1ad1sHTAxlS/ui+cl7OevI/DGsA/61iUGImGTJKaJgoL6rvFEAuZGqL40wcGPMgEPtMk+YvkvKFw8EN/DNiWBh17k2STaSx6KPqOpfwbpdmIt3zmDvPfo7PPZJdchR/VHPHEwFVWk2EcltB/UZSmcQTxyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3vge8b88HXiAUwzvg8+z/EYxU3BCZe+8cSXzzbmD9s=;
 b=dimA/Oa+iZjyOaPHfHE0T3DGXrBim7fRikTUQ4E9B/7xc8CSAEqA1EC/DinE+qrU94DiJ41Qfxeo7JjNBDkgsEzP3eVa7fl3sfPvKXHdpeszaAvBhp0+1IkHWxW55mtWJa+nVT03qb7G4md9h6I8Qr/07nFf6/+h6ETTnbKSU9MCfIzMfxYyVyMKHdykEBLKInI+gM7zTmVl0gFmzk1FTMw3CyqZiv+0IWfz8FPNXdhYoFXQ3oHMO0XYQsM8kKkWp8BbigmNba+7OyzDA7JWgkyQY/sFZBgVurDwMwnbjkqGqDoSr4SGaKG6/L9jyUxO85kQHI4BEyk5paiADWRBCw==
Received: from MN2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:208:a8::14)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 15:13:30 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::f0) by MN2PR12CA0001.outlook.office365.com
 (2603:10b6:208:a8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:29 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:10 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:06 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 05/12] dt-bindings: i2c: tegra-i2c: reference to config
Date: Mon, 1 Jul 2024 20:42:23 +0530
Message-ID: <20240701151231.29425-6-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240701151231.29425-1-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 653e2289-c98d-4d0e-b0f4-08dc99e05d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HseA7DJQMAPDVcvr47G3Nu+3QJB97jvweeyYWwLl7NHuzulbhLYTQnc2SrmR?=
 =?us-ascii?Q?JHB1ZZOIJkoRjD+jKXV1+2HuOIYRhlC4X06RuFCxZ730p9XwRXGGRedqNO4h?=
 =?us-ascii?Q?d43+B/NsdPbYQRz1dAkNqPgA+8m3itN9+FwieeWv800X/CihTKX7PwnqgKr0?=
 =?us-ascii?Q?IfDQPUNJRchrzQNLa3dWiqPxYDJDCegCcTAOtmHX8w97dkzpSTlOqaCP+KZ5?=
 =?us-ascii?Q?A4Wkg0VoJv6lrSRU4xQsfuUqlgBTED5SEjef098RL3usAQsjfWsLfHFqFfbf?=
 =?us-ascii?Q?XYgO8Yr7qIoQOFejrHG5DVXcaggGt15R7EsmHh2a0VMH9/lQiKFnN6fMBEr1?=
 =?us-ascii?Q?mJgSZpSrjiMF9bSqGL9y/wdbzNle6+lEZsoNxMOL6n03bH/h+O/Wcez8Bx43?=
 =?us-ascii?Q?vHMUiYBBaJ+n6M5xm79J1ue/xEjCo2+mzCEu92C1PhdyLF+iO6/qnx6VwSuS?=
 =?us-ascii?Q?5OdjKYkZHuEuqSELN6uYfjE0G0HyOR0umBryefdc2UV/POrZ353PhUySFVXE?=
 =?us-ascii?Q?1xSrqhJE3Kwn3lIy3HOopupa8A9zTI6IruUDOJ+e7F7On/ce5pzOR7+rs6VF?=
 =?us-ascii?Q?2pdV523OdHOgEqB2o+4b0emwrXJSF+pksg/L1qAel/x2wA6cXOqm1kFG+2ok?=
 =?us-ascii?Q?ZBNHwPbJK+Cl5CWbxwlb+UiLAc+N0bxjEMQEtmKSNggTyucMJdHaia0Fyswf?=
 =?us-ascii?Q?caYCatOaTfWL5NM4B4BQlvJiDO9tfc0f2RXOUWgbGOPt+0oCqBpXMh4mU0S2?=
 =?us-ascii?Q?/2dhHU/UrnVmJtFb9qb2oxrgF2C04eDkDlDd/LYHVpxiYfgzbVX9zCdOVG5/?=
 =?us-ascii?Q?ZxaedrbvI4upnKN5lfDgMqxaqRoCWgIg056QXP21peZaW5UM8evU9aUhvBt8?=
 =?us-ascii?Q?9+iJbWWRVE/HockMseB/2pbdfxW+7rS74fA+pJ/zev0tegfUURBDa7xTJNJa?=
 =?us-ascii?Q?csNoEPfDb+huCLhKy1dJ6n/eyhbQNdEablATSibd35myeGpWMdyB/9Ed9ZfA?=
 =?us-ascii?Q?szBNcMZ8ARsVP7CtQIdbrINjQsOqGAcxasgtoexhFReqgK/naTAqDP4UBPzm?=
 =?us-ascii?Q?IfvfQSzJTH3UdnCLvn8FnDdfbIpoZgLNSWNX4nmZbQNqxUAkHW4Gmwb1mm8X?=
 =?us-ascii?Q?3HiR//OC2KV7fBHJyQmlNfqLN70U8Nq1zY+l9HXSsb/YsKt8BS3vYZbjdF06?=
 =?us-ascii?Q?+kjGj7l+0wshHwgSmx4jPNj3WCL66GCmni7Xd6IId1S3pv8ez164a+5iahsj?=
 =?us-ascii?Q?afnK4qXsR+bR6bp3rvITycieV6kaFp+2g5kJWvWdHqug/yaJRJh2TXb6VnVP?=
 =?us-ascii?Q?vLoSeakmnDpLhZrPEdUD8u6xC1fQJ3R43Hx11/e3ALxg6gAODRgFuZnlDs4Z?=
 =?us-ascii?Q?eIyd78mbeucC2K9dqBT0lHXq5DVh437qBp+ef6ASJd5ONn0J+KtelZR/yguz?=
 =?us-ascii?Q?lm3wJuhANKc1y5XYFB7+nOgAoInqH6Ru?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:29.7287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 653e2289-c98d-4d0e-b0f4-08dc99e05d7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098

I2C interface timing registers are configured using config setting
framework. Add reference to I2C config settings.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 424a4fc218b6..2f6f12149876 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -119,6 +119,11 @@ properties:
       - const: rx
       - const: tx
 
+  config-settings:
+    items:
+      - description: phandle to the i2c configuration settings
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml
   - if:
-- 
2.43.2


