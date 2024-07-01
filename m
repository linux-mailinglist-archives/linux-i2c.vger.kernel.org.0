Return-Path: <linux-i2c+bounces-4543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA291E39B
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525012831A5
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C449716D9C4;
	Mon,  1 Jul 2024 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X6VmPBZ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5C16D9B2;
	Mon,  1 Jul 2024 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846808; cv=fail; b=SHqmI4m+sAxTbmExUQ9zZ2R6n8fspK4aIY83qR9YxQ2MDGdO+ELctvRSBBD+a5/BwyVJMr8ECEQdrLgMIWiOj3qt2+ZIAA+DVeWs0AUsREoZDVTN590+njsKiSuMDQlrEk5OVAFsswu/nFz4UazDmChkoeLT2FzS4N0S70HpFVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846808; c=relaxed/simple;
	bh=wnMFOqXtNuFqkDZpClG5MpN/ckKDRfertwJ3F0IY1l4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GlAoBSPi8jN/npbs/upuVqo9W6wqUl0g6DysSaHSR7EKRWxoqwXJ8B/ifykmKGRrpZX2PIKpc22sSNaf7P6BBoUky9rAITyYQ5+bLEi+UpcWc/QXXDGs6vwasIjhh+2N60NBxH2TZWRg8Fffj9Nx6w6jqYq9OsoKn8ZrxLOaW+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X6VmPBZ6; arc=fail smtp.client-ip=40.107.236.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L604O5ItwoAdfxkZK3x1i5+bWwm+xEfUkb2sFY7i+E49MJ7tHSn13sEX/fOmk523vlkhit+Tg72v0ZZ49Dly2dXjRyGRfQxGvV7AhojqnPqwG6PoRxISDUQ1Gzun9xADiT+M4LXBAZTTdnBwRPDCraKkIBd329s0kzFda0y939qE4pPttvlKZogsPulbdYVvjq4U5h+4B8mEDi2/UEH8ib8gF5cAfgPKrAxSUvdqfM3Puagj7+0jI4zSPPck05NjoCKXbDxDfLmgC9QPb/4mnhZvzxLTe0FxmOSvilKUdtGJ7hPmKHRPOPhUxrQkWGBuDJe/a42S8qK0ZjfpF2GZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of4Aqm9lqHrzVFJZ1YNHf1b3uJXRTKcawqwHrZYIqmk=;
 b=iMBw2QxXved5kF5piPD+oBU3Ws58YiKQw2FVuvoSF7yCHJCmN8EmWLeMj+pp9KChzW/2156ek43LZGy05Hv/njM8VpLhRXjzBGjIO44nffiesZqZnl0Edb5hBoXJ3wsB9kQrcYIKZGIUW8F+1NSgSVCpEf7WwH3fYr7jDzP9cRAwnI7ZMPM0SlWxDyMhtyZ1KXz/qR30o8vBRspNF81IGY9HhHF9Ml+dUo9WzML2hJAVvfBqeMx6bCJfT4SdBRN54PR8sFbk/V1jbFZnKT8GKlfeAmiJR1yVU0norlfqOYsmylMz8ZYpgibrtxUHO2cHGopl8tAYGYBonGZknxtYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of4Aqm9lqHrzVFJZ1YNHf1b3uJXRTKcawqwHrZYIqmk=;
 b=X6VmPBZ6m/9TncDyC2UYguF0C40o/EvLCTU4k9QF5PPW0aqig8nabs74p9IqSWbWHGJKj4qWx4hjW3bT3zwJdrSS2hl2o8uemFahi0RMIN9V/Zra//XOOYgyfetgcuyj+QvL+2l8IURbmsxdarHG/Kb1BoOhg0TloCt6/Mr6YbJMP39Fd8BSK2KMWX9PsZRpnKefBeC0c2c4WhTJbpU5QA4DWe1IpN3++aOCEYqEI6hED4kjvIpHbA0cvBputmiFRZ3rjguYDW9ZA5V4N3hhOWAVEGqXMHftdlAZuNZNReWD6fPaq2eVbkxKXLZVSdQRGnsNoB/rXlejvXUShl8qaA==
Received: from BL1PR13CA0366.namprd13.prod.outlook.com (2603:10b6:208:2c0::11)
 by DM4PR12MB5795.namprd12.prod.outlook.com (2603:10b6:8:62::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Mon, 1 Jul 2024 15:13:23 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::c1) by BL1PR13CA0366.outlook.office365.com
 (2603:10b6:208:2c0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:05 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:00 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 04/12] dt-bindings: misc: tegra-i2c: config settings
Date: Mon, 1 Jul 2024 20:42:22 +0530
Message-ID: <20240701151231.29425-5-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DM4PR12MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: b02740cb-f360-46a7-0c5a-08dc99e0595f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3S8l4Jz6lSlREr3p9le9hnDip10TRpljxDuD7NiK7mgiuzt6N6P2c0lyazSS?=
 =?us-ascii?Q?tZs3z3aetJOjK5GOmkj8ypijNFU0hqe/HJhFkeJ51UvjoWNhExIAHI4U9+np?=
 =?us-ascii?Q?3qVtuFdAvmQduGZUyjuPpZXZ1O6a3RF/VlzQ6uQY/k2kw9SuJ/P+GWqTLUiC?=
 =?us-ascii?Q?M85NYkTl911cQfE3V0Txdo1ABE6DNZz9NAxb1tVEcvb0ijAqhiCBn+k011Uk?=
 =?us-ascii?Q?DCfUB10g3CO7XU3Y4VK5E9m4fPuXpq2DEWTNW2RqbBV2EnkfM2jtMFnpSsDr?=
 =?us-ascii?Q?2Tlujg0kw3zCq7IlvOyqZUjqwmD+lG921s1u/0JEgyPublC6mlYftPzgA3Zj?=
 =?us-ascii?Q?Vq3gFfD1t2J4lCotSfRtFbOZP2ZmsqTl0vc6Lq3gVaUjzLWFVhxdSVEeArQw?=
 =?us-ascii?Q?xuii5qgAGqr8Q0wvMw6J1nVPpPj+bIKmvg1vMqDkA116qDNkiTSUL5AVYUbM?=
 =?us-ascii?Q?qbUK96g0VAHFHyhEzoQCamkT2CGlnvLDiSOaRLWBBXoE09PttDZMyKB//OaS?=
 =?us-ascii?Q?tU26TgffiPXUAHTlsbodJq7diV3SAQKue6iupZKMzV51MBxaxfRA18r2Ar0V?=
 =?us-ascii?Q?t6ssVvz0Xj0+q0CDgSx5UGraVvenb9Cv0u3PIRAyyFza6RC+YJwuTq8eHKoB?=
 =?us-ascii?Q?XYX9FRMqvIcZTkWkj+p5nZfpyKYmYDvZAk/UhCQvBenH1jxU95J0nv/6hXgh?=
 =?us-ascii?Q?LEzfkKz2Spxrr6mG6J81anBzTgOvPVHDf6gvt8AUfyXZJ3m4u6MD4xzPwJSJ?=
 =?us-ascii?Q?Cw01UFYHtH/bOAV515jLaSuHBTkG+veU6bEsDfXtWcPdDqDldWGnINf1ZgNI?=
 =?us-ascii?Q?eNN9f6csy5bI2pLGZX3g9cA/JD/OLKGUbvSijTocD/kaPWgY7DAiXAavXwXL?=
 =?us-ascii?Q?Zd76j3xriU02rwKUbDERVXoVbuXvD2e8c1cXfNGGwolcT3xOafPsbtDQnvH+?=
 =?us-ascii?Q?AhGa7c5dVvwvd94jAl4Z55E/4s2JwHWyYk3FMfNBZqc3FoYLSAYT+7fA/x3B?=
 =?us-ascii?Q?uRPkS23qXkEEAi83XTh+2KGCUgBxeJGaHqhT9WLxwE1naGkKBfRVE5Ss5wHS?=
 =?us-ascii?Q?FHS5PfD1mqQMJ1QA0FRBkgqdH/KW9zYKuWy1SuWaRGBDpJk25IPtz/uZTrJB?=
 =?us-ascii?Q?fee5oN+U3Tjdp0xGZEaUwmRKZk86pgMnwwZh/D8aY9MFLYpCx1gG8owkyx1l?=
 =?us-ascii?Q?Lz8cqrxzM3+Bcpk8YzXAdRZpeXuvcGXBVHSgJzOo5r+S20uRxpJ9C4T/GY2E?=
 =?us-ascii?Q?mOBUAFyCXHA2mFkbJc5GkTXlv3zuXg0tK7AxkdyinYkU5j+9ZmrK5DDPB2ul?=
 =?us-ascii?Q?0mSUu9qhu8djo8oyp5PfGmUKqw5DKV8QcZRz6qRBVgrNlP1zihh0KRWR131q?=
 =?us-ascii?Q?CahdHPTwbwhIHljwkzIuiWA8TIkyr4kGwEklOMoFLEKtIkdaiLSTcqwgxsS8?=
 =?us-ascii?Q?ybPusFJKUGo+gYiah9d/WE1DJt21bc72?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:22.9174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02740cb-f360-46a7-0c5a-08dc99e0595f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5795

I2C interface timing registers are configured using config setting
framework. List available field properties for Tegra I2C controllers.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../misc/nvidia,tegra-config-settings.yaml    | 83 +++++++++++++++++--
 1 file changed, 74 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
index 4e5d52504c01..5f4da633e69b 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
@@ -38,17 +38,74 @@ patternProperties:
     additionalProperties: false
 
     patternProperties:
-      "^[a-z0-9_]+-cfg$":
-        description:
-          Config profiles applied conditionally.
+      "^i2c-[a-z0-9_]+-cfg$":
+        description: Config settings for I2C devices.
         type: object
-        patternProperties:
-	  "nvidia,[a-z0-9_]+$":
-	    description:
-	      Register field configuration.
-	    $ref: /schemas/types.yaml#/definitions/uint32
+        additionalProperties: false
 
-additionalProperties: true
+        properties:
+          nvidia,i2c-clk-divisor-hs-mode:
+            description: I2C clock divisor for HS mode.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-clk-divisor-fs-mode:
+            description: I2C clock divisor for FS mode.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-hs-sclk-high-period:
+            description: I2C high speed sclk high period.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-hs-sclk-low-period:
+            description: I2C high speed sclk low period.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-hs-stop-setup-time:
+            description: I2C high speed stop setup time.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-hs-start-hold-time:
+            description: I2C high speed start hold time.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-hs-start-setup-time:
+            description: I2C high speed start setup time.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-sclk-high-period:
+            description: I2C sclk high period.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-sclk-low-period:
+            description: I2C sclk low period.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-bus-free-time:
+            description: I2C bus free time.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-stop-setup-time:
+            description: I2C stop setup time.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+          nvidia,i2c-start-hold-time:
+            description: I2C start hold time.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+
+additionalProperties: false
 
 examples:
   - |
@@ -58,5 +115,13 @@ examples:
                 nvidia,i2c-hs-sclk-high-period = <0x03>;
                 nvidia,i2c-hs-sclk-low-period = <0x08>;
             };
+            i2c-fast-cfg {
+                nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+                nvidia,i2c-sclk-high-period = <0x02>;
+            };
+            i2c-fastplus-cfg {
+                nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+                nvidia,i2c-sclk-high-period = <0x07>;
+            };
         };
     };
-- 
2.43.2


