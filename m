Return-Path: <linux-i2c+bounces-3445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D14338BD7D8
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5615B24AB7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E997915E5BA;
	Mon,  6 May 2024 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cUoNwgS3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC515E209;
	Mon,  6 May 2024 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035983; cv=fail; b=WMnAWlEphG60V/3U13BY/6PFVn8E8jx/uXCNQH639pRaAjhhVOOi03N8QXR1ZJv6I/6GM9kQR0JZod+nTbypBNlx8VBr/5K7qiRKgdXBJEa1YlkOoflgQluHHFloef1un7RcrxkY87g9CR/9ehSSDJnqOs+nVBW9UUAM0M23vOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035983; c=relaxed/simple;
	bh=lEYDOGYNjXvbZ3EQQDHJV6B3QBcqKvBfJkyN2qZGftU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0mX0D72fTDpzV3Mpfq6+T+xG2ZWck82qCoziZ+WT32HIZchtIBVa7nPie7MJOaCUmMnuo7qyepALI6gS+6fXaZXUGdIpyhGh+B0680vHA0wgotMaqv+jot900lgXEwh44O5Kmnip6beC4TtE6PDnpLXdrjdb6611lo8ifsybtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cUoNwgS3; arc=fail smtp.client-ip=40.107.220.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5Jpw7/MhsZT/zBILFuJ8Ro3HIcxgvpF8uNz2E8WpHf2ai6Lfkefu9jBzcXLaMjpnvLcJOvjR1jnM/x1G4GE2EZIXmA4mykO8hTDyeAtq76bEipdk/OtHTsJcyGqo8PDFceqw5IqzIyLaJSwXDYuhcny1JapT8Hz6zIWODRoqPejvgEBv31o0naw0GFX6Rwngdi5ogoTMyqr4T0umPgDaupsvuGOypEwEVaGnu1bEWsGCOGbYPpJN1jKVseDEGCq+Oc2Cfn2MifAJRrsvUWRDk1HDcS2rMGS6CY704kn65cApz8ZI6NeOvn8U1VzLIHoJbCNnE7HeRua4Nuvs097+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oCefoMf/V0IxwGJzTPu7nLcqoNai3U2jyEtJPW7SFY=;
 b=TjQjiug572cSlJD7x419mSIwgIOTzt9k4c5AEXOX6YhEzBy/KdEb3IjIRjBzA0UQA3nJPgVyuT86Akvb3Qv4dFRxEdFWCSg00o3+16GtnqFxMNp8CLwrqg/1CDd8UtTlF4/Y0/M4YVOmgI1024AIsSVI4+3vaZg5vea1krF0dUdQE8wkFB8lrLP3CWJDcKgLLayKhjFrk18qMblWPnecbcrzQRgASud00BZqTD/HRtGxututJ8HRqG7oYMSe80rqs7mD/Ww3tJOz0SF0nHgIzAWLnb8uGi7kbyoRR7WKsSxYxDuDSoUHxF6ixNiGVwxEPry9Cnm8sygp1dGR62KDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oCefoMf/V0IxwGJzTPu7nLcqoNai3U2jyEtJPW7SFY=;
 b=cUoNwgS37wUSGlaoUgDJuw4iNq5YHN/oe6we6NBk0G1OTuBq2OUdXkikHt2G/HABKz0AQkSP+htRA5HsdfKZBoyUdXzX7WAaFp7z2iPFjc1QZfE5N4LuYvQ2IdeId9u99fRqjnf0eJiNCQ9S76snsVJFoZMU+7vJpQc0XJANI5vtlL0uW6R+jGodCAvMmDVxEIXdfqfLRUlG2WflDYs2+2PnlH9WT0ujFciazei2XdNxHXqym243aFAPrjkQPvQBNl9Sb8Nc9YfJ3hdG2sPJr5yqUVJpmtiDYuMJ/mKhx2KOaFZfzxtDjhNzo9ULgBtI2ZtSO1Zzd1eK/VHzWx7lZg==
Received: from SA1P222CA0153.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::17)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:52:49 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::27) by SA1P222CA0153.outlook.office365.com
 (2603:10b6:806:3c3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:52:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:52:48 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:31 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:31 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:26 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 04/11] i2c: dt-bindings: configuration settings
Date: Tue, 7 May 2024 04:21:32 +0530
Message-ID: <20240506225139.57647-5-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 113ae663-9164-4d22-ad13-08dc6e1f40c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3GKQlyi5zygDAMfsLwYxjJXWqBhPAoLXyai2o7BuE3Q15MT0JUKrumx7kVQu?=
 =?us-ascii?Q?ts8MEGuGz4FeCaENDoilg++nH/DaNu6hS7kdYUDVcTRCAFGlb6rncRqSn5vu?=
 =?us-ascii?Q?hoAaBy8wmJ5hIZNTQbmW078TjwxWhBijPB9vy28Jc4/ucfj+QRByBAYaZMl0?=
 =?us-ascii?Q?eFErBx+HfhEsqVJMKJb3VsxbscIkeWKK/ssrTa6YQI/K3HOuH9E3DP0qC+bN?=
 =?us-ascii?Q?GYxf41XfsFStAVtLamIP1eB28AWkIrcxRNDLq5UIb9Td2j8SpJJe6Pan6wNI?=
 =?us-ascii?Q?MWmZL1oT/7KfL386GHvSsMCYI9WNkDnzxkEaKzX7VwiEuuabmXjb56Rtzvtw?=
 =?us-ascii?Q?1x4+atKj/mix1OShnXX7mvn4nPO3xAj6KZgUXFQqBA4DdhEOvflBmGR5e1xB?=
 =?us-ascii?Q?IhdlP90sBqCrd4v3KPA9rpku1A1M8VCiL02cRI3z+xnaVyhoMoNjcTDJq4Uc?=
 =?us-ascii?Q?EXoAhdHudQeEfRsDPmpJPjsLwdcmx4+UjzFq/3YDOdM0dDU4au3oTQRVcWLF?=
 =?us-ascii?Q?AlEeHYt51Usf+1ZLfAlI+XlK1TXnOe9Qj7CMlM56XRQvpDk0DtCh1nVby4cr?=
 =?us-ascii?Q?v3iq+0NRMuj0KJI7YlwnhRnEozoMunaYq1LktW8VtuDlLrz6E5p0GSGFudMd?=
 =?us-ascii?Q?7N9o9UcRPbC8YqUPwkSjH0PpLcM0XhTaBmGmNcNgFNvRQeVetVqhNFQ373PL?=
 =?us-ascii?Q?MUQzFmY4RQHjtbGR5YHyltZPmzf6q+Y7tklFxO6bhLnKCAXPzBkiC1A/b3P+?=
 =?us-ascii?Q?3n6+xlMJZSy6vSs0ywmJe4pyc1+nM8BSwswti7Y9z9s2fNOAUdBX8kHmKlrX?=
 =?us-ascii?Q?W4bExPrUrkAZFLecuDfyACJQAzRM9FMZcig5rLdkQJVaUXXEpZ9m70wa8yQy?=
 =?us-ascii?Q?joWUHGHpG8q33W9RDhXMCrgVb6hhkju1Y5J3x43VDJn4MZQ/RcKxNT3Tog5+?=
 =?us-ascii?Q?r5XjxbDkKfpDpDdspQEzvXl0dmJX1A4L3hPCL0aMgpgRdzAFuBjW+y2EM/ce?=
 =?us-ascii?Q?lQbOGkwXc4v6gHwm01BI84cCgGhzpdS6tbgUxGhT4KVOBjLLNePb7BqyW5Ag?=
 =?us-ascii?Q?b1NFZw/LQ38FZgM8JqHoXXhpw8BhD/V2Mve3iAQJjBR1Yg9SRMx8C7/udbSi?=
 =?us-ascii?Q?LD3ijJqp0WA0ohnpi0I/lOpAck9Pp/nCMs7kvd95oLxAipzRG7ZnJ/waO3Pn?=
 =?us-ascii?Q?Uwjs8tH8+v7jqd45yf605YxAFbvRqYEVuiWomi/eB7Daz5kWvbMZf/t9s7rk?=
 =?us-ascii?Q?gIdOVUPKLNmu60W3OlQAQO7fknG5Hlsu1RhSVaPQhqW4siSwXUnY7NtHbgc3?=
 =?us-ascii?Q?vQ7ASihBBhhtmTvYS1hLSJhC+oGrSCoHfRP4T9YjOSXjGfD6cdPw9YqkGsLE?=
 =?us-ascii?Q?4menzbk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:52:48.8296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113ae663-9164-4d22-ad13-08dc6e1f40c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

I2C interface timing registers are configured using config setting
framework. Document available properties for Tegra I2C controllers.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 424a4fc218b6..3b22e75e5aa0 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -119,6 +119,96 @@ properties:
       - const: rx
       - const: tx
 
+  config:
+    description: Config settings for I2C devices enlisted with I2C controller.
+      Config setting is the configuration based on chip/board/system
+      characterization on interface/controller settings. This is needed for
+      - making the controller internal configuration to better perform
+      - making the interface to work proper by setting drive strength, slew
+        rates etc
+      - making the low power leakage.
+      There are two types of recommended configuration settings
+      - Controller register specific for internal operation of controller.
+      - Pad control/Pinmux/pincontrol registers for interfacing.
+      These configurations can further be categorized as static and dynamic.
+      - Static config does not change until a controller is reset.
+      - Dynamic config changes based on mode or condition, controller is
+        operating in.
+      I2C has configuration based on clock speed and has below modes.
+      - common is set on all speeds and can be overridden by speed mode.
+      - high is set when clock mode is high speed.
+      - fastplus is set when clock mode is fast plus.
+      - fast is set when clock mode is fast mode.
+      - standard is set when clock mode is standard mode.
+    $ref: /schemas/misc/nvidia,tegra-config-settings.yaml
+    unevaluatedProperties: false
+    properties:
+      nvidia,i2c-clk-divisor-hs-mode:
+        description: I2C clock divisor for HS mode.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-clk-divisor-fs-mode:
+        description: I2C clock divisor for FS mode.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-hs-sclk-high-period:
+        description: I2C high speed sclk high period.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-hs-sclk-low-period:
+        description: I2C high speed sclk low period.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-hs-stop-setup-time:
+        description: I2C high speed stop setup time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-hs-start-hold-time:
+        description: I2C high speed start hold time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-hs-start-setup-time:
+        description: I2C high speed start setup time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-sclk-high-period:
+        description: I2C sclk high period.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-sclk-low-period:
+        description: I2C sclk low period.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-bus-free-time:
+        description: I2C bus free time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-stop-setup-time:
+        description: I2C stop setup time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-start-hold-time:
+        description: I2C start hold time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+      nvidia,i2c-start-setup-time:
+        description: I2C start setup time.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml
   - if:
@@ -189,4 +279,18 @@ examples:
 
         #address-cells = <1>;
         #size-cells = <0>;
+        config {
+            common {
+                nvidia,i2c-hs-sclk-high-period = <0x03>;
+                nvidia,i2c-hs-sclk-low-period = <0x08>;
+            };
+            fast {
+                nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+                nvidia,i2c-sclk-high-period = <0x02>;
+            };
+            fastplus {
+                nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+                nvidia,i2c-sclk-high-period = <0x07>;
+            };
+        };
     };
-- 
2.43.2


