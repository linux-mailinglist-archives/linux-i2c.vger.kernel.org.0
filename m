Return-Path: <linux-i2c+bounces-12428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B06B356FE
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 10:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B2742A0244
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 08:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACFD2FD1A5;
	Tue, 26 Aug 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rOHi/AiH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAB2FC01F;
	Tue, 26 Aug 2025 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197195; cv=fail; b=FBEHTuEs0pBR5wkRcv2s03Pii0u0R2S2HR1hWhBkxt8AHTeIj8GFTC4H2DMEx/P5bgXZ0hWga+YYpy8O50vOf0JLzgJ6NqRlSXFDKoPESUZnQMyK3XtMuSQGM554Cj7Dna3gPs0zBJ4BNx1HGfzEytcAOH6NHyOaIWuFSFMHFM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197195; c=relaxed/simple;
	bh=AKHZUl9sirmivCeMeD42IsCP9VXkiPMBTSJhdolaETI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSATQS93y8gbPysUl8Upam4RaQQkJ6S5BrLT8aPSBahHAIdyQ30wz7na4kUQnrKA5IsJWDLTBjGdDU4dYSNvdRkRHvp5EYs3LzZa1kd7cUKaHI8a0CDsHDH8FsSg3YcCPvBxcJFWKMuZd8mRi6AWltO+6uor6DCkLANnUy09u7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rOHi/AiH; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoXUKq3nYX9L/EQj9FAF7eDF1NwbizsLulX2hBOcJe29DKikOqP+IpyogCCOqn2sJ2wzgC1Hhijln7YgMkyfAYU3y0QCXuN0JLNopLlmVIXS8XV6uowt08jxFdOQxUeRFXaJsyQstSbGsYf6Pxh2SQLdllM3awW4UKv0CLXoEIzDbUStZpoz71Gf599Zfzw/yYATp3CWrF0G5nmH+PJXOc0rYybktUDsq6gMETaLI3OetBGsSTSHYgezO8ooXCLVDc7JAq8mLBqFSYSJvMxTmSeUqsNNmZVueOu6YJ3z8oXCv5ExUWMom36rseMvhfl9b0C/BCsZq1TNgVbqaWDb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTZs20+4R+gm/l7JPhnmf43JXxQ28ckK+YHlpU2QDyI=;
 b=oj9qaLA/3546lMpEyNh5S5CtHh7oDpumIrF3YvrgOeNKMpzZZXPKj4V8+7MjcS8XvdIXreogTQdr2qJOxo/sIYdRToooX/PQuqQFcfXmR4pVVpjMKU8zi9mpwuvCED2suJuTwTh2uNJwI4NTb0n64GtM9ymSfkldnmahJd3ehYtJRCVSqABYL8db+lnYKEEwy1z3Q8GWE+NMSKbwZxyqs4ida4pVFRHyN/UCGkG5bfRvIyn6ACe4xbcFQBUhi8sIFXS2EAdV0bfkANXDeZo6fSQD3jGOaqiDytXlnCNDTZLU31wH9CTuTNZYny8/xLzMPY99gy+8xfIXGvU7ZZhuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTZs20+4R+gm/l7JPhnmf43JXxQ28ckK+YHlpU2QDyI=;
 b=rOHi/AiHaQolFnr3BdgxqIgpx4N2iaI05jqbiflna0S/BhGtGGa73pmNLCOEWMVWpik+0IbYsxqgViYPqCcOx4DRmoNu3IdxI/EE3FOyPswjxp8lzqCAWIdAMZ2FfG+OpdLTeF3S08SBAGmh0SK/soyZTgmQjQk33EPRKJ0G7KiqsgdM1CAolkMAH7I0puyzSeJ8rdN5/GOb8YU098y5wC7NHytlRUhJEylBMZG4XI+HMr6KWVAQ6v4cMEAMcd3u0w0jh1J9l/Vdb+HawSx7m5D+H6z4zrBD0Q0uh8bQpWGGZL50exaPQwlTRL7YKVc4cmq2zwJ56+J/3mfV0KL1xA==
Received: from BYAPR11CA0076.namprd11.prod.outlook.com (2603:10b6:a03:f4::17)
 by LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 08:33:10 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:f4:cafe::c2) by BYAPR11CA0076.outlook.office365.com
 (2603:10b6:a03:f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Tue,
 26 Aug 2025 08:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 08:33:10 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 26 Aug
 2025 01:32:57 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 26 Aug 2025 01:32:56 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 26 Aug 2025 01:32:52 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Tue, 26 Aug 2025 14:02:40 +0530
Message-ID: <20250826083244.487610-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826083244.487610-1-kkartik@nvidia.com>
References: <20250826083244.487610-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc59e39-5f2c-41af-635b-08dde47b309b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wtby2M7RzUAZVR+imnbn/Kv+fK6vU1KXTsf2U1850vCFHYIAF8VnOQcN2o/d?=
 =?us-ascii?Q?2pOtNMw/Q/IMZ2r+cZ4iSkkqNzbaeE7JhLOpk4da0hJXWvzL3347OTcUcyIz?=
 =?us-ascii?Q?LmwiXHyGeDj6rR+JUX64iMIXSZl5UgtpPYAvrogbM72rACWB9Tet7e5kU5ht?=
 =?us-ascii?Q?VuZNcqCuE1NzMXqvdSKwn5XYb2wWsF1XXrjfIAucIUvQ1JuQu9IX8A5LW73P?=
 =?us-ascii?Q?tNhkpe3GaXQOzwt8LKG7N4zIsc+OlQ/lAZdhq3G4YlaJ5R6IRiJhgJqStQcQ?=
 =?us-ascii?Q?pwomrYjW2PX684895raQgAKrhyiV3qmc8VBVE2pQnf1JHCCpj10T6EUHFQyQ?=
 =?us-ascii?Q?nUMIYauQS36rBhGDJUz5B63ZCLnxRDr1htJAPHaTEnnn4ldhACKVFTCdVIkj?=
 =?us-ascii?Q?H5AwIKjzIJZtd9KspK5tvi1VvOqbPjODZA4ZuxUbuxyBMFG+oqGWZlOtSRiE?=
 =?us-ascii?Q?SoEf3qlLA3JeUDZns/mGHyiKdeHVyKhjFb/79vF8e/XaCg2l5sHeXZbXAZp2?=
 =?us-ascii?Q?IteL/I5gTPLV7EaThcwW+fGeFiveICOW7BX85BuuxC8pedY6Z1j+uws8vBXL?=
 =?us-ascii?Q?g9hbpHKJh30tl7zPuqK0rArmrEH4WzA18fQaKLZubgbFv36e0RbkVL7YuXWV?=
 =?us-ascii?Q?qyMBALhSBNFwbkSkfxZpN+jEPmnAHrIwN8IqN3t1g3Kl9bDPAEzfA3dSRfG/?=
 =?us-ascii?Q?iibb3k7vwwrc27Oh4wSN3fsErAgVLN+1YQYo+sFrS5kDWiXNnMV9l4K+ESRE?=
 =?us-ascii?Q?XEIudhyn3xE9OwS3yMNzb5EjjoqGzDVCEnGpb+oU0LaAsmnHzCMZo3N6QpJF?=
 =?us-ascii?Q?FnQyUugsPWFaoRtmx7WbfBsVjNRjlHIa7jxuqNhxQBQ3JKAzb2DVZj+saxWK?=
 =?us-ascii?Q?PjKL5ANMKCjoRKGEjMs3btdSKMeyA5eHIdvT5Z0nHW/PhZXN/RTpAE3U8abO?=
 =?us-ascii?Q?717vfMpR1JMf5C5T26jJF06xZRqsA1BjkL3iTIhuprjE6i+6Hwwb2V8XXpZq?=
 =?us-ascii?Q?CXWu0gFmQZoTLMIAXpzAU2fKYGnSOrdj2pHfkue0OEk3mJZ/NhTtKg8NAT8a?=
 =?us-ascii?Q?8+s9G08aqyCz1noXD6lNZx3pG8pbjQlV04exWSNJYpXNg49JYa1UWxC4ZCZW?=
 =?us-ascii?Q?HOBJMOD//nKnJ25OlyuRIUecXZP9AeD50KEkypQuZhmYxNsxM+2hkt1sXmVl?=
 =?us-ascii?Q?/14mNhBl0Omlyfgjr8LlA2EQHVHv0rU51xtbHIaADVQEScnmh2iDKgNNRMFg?=
 =?us-ascii?Q?4PUzEi2mMrZM+0yjsNOoF2JnUMLeIZINKEEUEhzAbIfVDcXZPfRNO1cMrBNr?=
 =?us-ascii?Q?GHAMSG/EVwwh21wsE8XOCsy7jkC8Eyg1nlb9Ss1YybIuBBnvtLzGVWCVdlPp?=
 =?us-ascii?Q?sQnnJAe+PgrkrfKPQ8/ZOMojPJdo39aGgavV95lfW3AMEKR1jLzKcUcoj0do?=
 =?us-ascii?Q?TIgsA0Jt5TpKM7DY6HoZVpFKN0shji/dRpKGB66vE7Ohy00hEq6Bg/Q/TCdi?=
 =?us-ascii?Q?Ij7cDdo6LQaWKZGEpRolghoW4jPuTlTMgtOsBfqNdahDWpyIDVJ+fbcp2w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:33:10.3715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc59e39-5f2c-41af-635b-08dde47b309b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797

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


