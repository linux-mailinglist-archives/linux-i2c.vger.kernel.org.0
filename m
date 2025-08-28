Return-Path: <linux-i2c+bounces-12453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED7B3937D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 08:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30223A5432
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 06:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465FE26A1A8;
	Thu, 28 Aug 2025 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FMRBPvVg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77639278161;
	Thu, 28 Aug 2025 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360802; cv=fail; b=uHNcYsVPKnyvSGpAXFyDEgL9VU/w8depX8ODDpfQEySeP+xc9HXdoFMi5nlRVDk4c37SQBnjUz1BOHtH7Br0/cg8PxRhJE2A6W3ZLv6ne3xK7V32WBpCAfqkqP222NMUc+8wqqEeaeonLKFxKMRXD38vjsrrbRPOqsq4pqUDn2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360802; c=relaxed/simple;
	bh=AKHZUl9sirmivCeMeD42IsCP9VXkiPMBTSJhdolaETI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGSnTqj/sNsEotvcvbJoYqw7SmvIHRBUn+y9WI/M2c1OA/sVErVNqzxfLaoTHq1zRo1X3nKiHhV9FK2s5UqwIlfgR7azEMk+QypMZ+pqntt8HtRDolB8Z7EyXzL7UqYImdAPbu+732Y1XX/s5DZR789ued9SCgWj9fHv6WwhCj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FMRBPvVg; arc=fail smtp.client-ip=40.107.100.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpwLlZ9p/fitOyzLvchz6uKLs3JoeDrzHoyAuVLbmsTmMfUjXzhMHqjHbJntSuk5RSNB8wH/QmzOX5nimOJrz2zhjGGqQlUs7l8nbtnEF4sie3X7Nk1Rt6dBq7r8xi1pmZjc4ke9pDZbOYbGsEOV28E+deJC8mzuhq6hquZDCtyRUpLg8Dgmb07vMasHqbmFhDgNDk18ywjfmU+frF6IKQYbVluZ2Pi9WINNgmBPnTvlg3LuevxbKCfdRQ3huNUtFcEkjpBZBIiweOH3txWLRfzdVRkPwcrascbD1hVcjyTfgxfLwclnJ/GG6PbvjaoI4yxXp6BEYr8VvhuKUYi12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTZs20+4R+gm/l7JPhnmf43JXxQ28ckK+YHlpU2QDyI=;
 b=kLrE27RX5nLvUNevWdtNu//VAT9RbSqEqql6ex2bPjnVapTc1QwzD7MF3Lwyoxy/w1X8FWk2Th7BkOKGxd7NWNqhb3w8rqD6hqT7o0H7C7rOa6AFMdIqnqVFlOdKSF6fGACnbfMT0VffsS1TeSCoYkRc5gu2EkqeWLmZ1UM+bvuSBLZUe2apMO3PTPcT4n/jXdeksL2WL57naOAevhscqrFl8VYD/ik4/lpEzE3aU4EKDMBzv3UGKPIA1TZH/JmuZg8pTF5LtT3p3HT/ti/8kF6BKhBdKr0OSnoi453NjLOD+nZZkPSpETJeXTtfNa09rFjCpPnRHnt+FnfOnPGn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTZs20+4R+gm/l7JPhnmf43JXxQ28ckK+YHlpU2QDyI=;
 b=FMRBPvVgdD2Ck5f08B/Nu7vKzJAc3QkBg5JCPkZP143b8cF6RWUg5XSaQ/8gNe3LfqLO1xugBehQP2qLeLgfrUOxO3NSv7joTTKXFLaWez+FovGxpmGlpHMpgxjoJWRE2cLWAnXElZxzj/VdZrtFXXxe4CmBL3QGvP/nOxxhTINammOYO4siXdS0w9JfENEZqCpZciTWemC7utOKLAQVoKIZ8m318HXxKeBlwZ09VKLxwqyf9meAGSrnpuzNu6ihLCkO1YiLEQS2ITHFz4E/uDZ9ApC1nMEfZpieMd4pCtrs8NAInZWth4FdRtv6Gf0MEBlZcDE79z2z45Bp6+/HvA==
Received: from SJ0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:33a::10)
 by PH7PR12MB6740.namprd12.prod.outlook.com (2603:10b6:510:1ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 05:59:55 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::98) by SJ0PR03CA0005.outlook.office365.com
 (2603:10b6:a03:33a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 05:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 05:59:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 22:59:45 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 27 Aug 2025 22:59:45 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 22:59:41 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Thu, 28 Aug 2025 11:29:29 +0530
Message-ID: <20250828055933.496548-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828055933.496548-1-kkartik@nvidia.com>
References: <20250828055933.496548-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH7PR12MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 61207d84-112f-463c-0b0b-08dde5f81ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l6ZoL8ssSxMNO5O8MIPxb2WExH4n3nXGJpxrmJZ2E6rMTaw7OVmrS8JzbfPs?=
 =?us-ascii?Q?lfHE41AEOZWvMqkT042W6MRZXd3EL3JoAnzJ3cEdqrZha7RSSjZoxgRoBLk3?=
 =?us-ascii?Q?QCPD8MwboNX9un07JFXjuM9O0W/icl8GFzsQlVrhxYtM8menM7OY1DaIADJc?=
 =?us-ascii?Q?IUbRnxAoOI1WxfhVm4uLrU5XuKfsyBwbd0VAnjC4DUIMFqplafEwMyyymdzm?=
 =?us-ascii?Q?86xJTwXhk14sq8/pobecgEweKo2nrhZa1HUCg/8wVbQYXJUxruPClBnwbTwM?=
 =?us-ascii?Q?jyOrDKHLmtPaoE6jhLCgANrzJbt5HtJplpyz8nZ1cIpl/Pb7GX7DU//DAQ9r?=
 =?us-ascii?Q?IbvNA9xlBzj85SfeDySao4nDESE/ceOmOIsf5vILo/GO9vUk4TQdPFzlHrgU?=
 =?us-ascii?Q?piC2xpaPQL4Gmk7l7/ueyhjWqFtCq+Ablt1qAaHrxVVvN9hpfGgHoBW+92d8?=
 =?us-ascii?Q?jTOFx5/S/8xXhbpt2jm0ivvi0gSSTa3w5k9qHepcSmYmpaV+VK7MhEheHaB+?=
 =?us-ascii?Q?uOqLnJFalRLRW1AlDPgvZWF19P6Bw5F/xZc6uxCQN1ykpWL9n0hTOOr2Hh4z?=
 =?us-ascii?Q?hmu3TWW+qvVWxJmEKDCtkpA2cWifsbrDjEOXOpfn7dsOCK8PEne1StpjObMr?=
 =?us-ascii?Q?pLuRpuV3xeVFU6yBYytxa8eMQ2+DegCaC6HpUmsOhlzuicPmefPfGuUcTzg4?=
 =?us-ascii?Q?2XEbzwaJ0H4gGmUYV1l0K83bf5oTGvK744Pmdny1LsADCuliJqw3jJXw28x+?=
 =?us-ascii?Q?ICBKrE8W8NcLdIpza193qySPZ23PVbDvai2AOL7HFh30nE5SBS3uMtwdpXqD?=
 =?us-ascii?Q?jfCDX4R2OP+xd/Qh95jaKnk2OtOvmumJSb+Q1houUBtZ06q4UoQMqsYGCIt4?=
 =?us-ascii?Q?HrdNOgQezj8Co0D/m5KJkO38hcQWqbyyyd4TjBqNueIpsKFU6IazOinBuw3w?=
 =?us-ascii?Q?Veemua+zyHMuX522+zIP6cI9RbV3sESWzJdrRvTDdF6y+7AoYtmTwIfx7nM9?=
 =?us-ascii?Q?Ex0FcZWKifICG+c4VmwKGar33a7xiITVROMZMCXhtOn2x09tGsXURxPwxzo/?=
 =?us-ascii?Q?v1jlAbuXoWAYQdxyHI4cAOSuFUInPuMpmjokL3pAix76/f6ku5DRfS6Owrx1?=
 =?us-ascii?Q?hJXZlgpUBOyPiKoL2o3z+BNH30Pfyu6M1baCjVSAcubJROZ61i0QkNCsblI5?=
 =?us-ascii?Q?alxioPlXlnJuiS+/PbYoP4AIaZKKDQvVcsWVmiarj4uBRCvWDf0+h6kG72nY?=
 =?us-ascii?Q?/VMjnLS+j2gTHM0KLMVa9NgGUGsD1B7lR66PkSy2uOYWaeHQ0A4aKPSNZ46n?=
 =?us-ascii?Q?WgY7wS5fzDGAn0CQi1SMnLjn+/846duq27PpUdc78b/qPoN3zx8PyJpi5dar?=
 =?us-ascii?Q?Em1d87c8hjLmUOOpYYOtzAzKFkZna25W7ocn5soMdUvrnWUjPhDDzGkKtOOo?=
 =?us-ascii?Q?TdWH3O0Mob9oVNqoc+abwofC8AypE6thdooC1nNPCNPUwXVz1+cHiWfNHzdO?=
 =?us-ascii?Q?Emrf4SOV56bwSaB6HOTN7fCShIYR3z2eZZASBUO1IL7bLHOOZDeTCCRgkg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 05:59:55.2893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61207d84-112f-463c-0b0b-08dde5f81ce9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6740

Tegra264 has 17 generic I2C controllers, two of which are in always-on
partition of the SoC. In addition to the features supported by Tegra194
it also supports a SW mutex register to allow sharing the same I2C
instance across multiple firmware.

Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


