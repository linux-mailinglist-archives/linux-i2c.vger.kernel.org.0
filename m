Return-Path: <linux-i2c+bounces-12031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE1EB117EE
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 07:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2079DAA7C79
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 05:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4199241696;
	Fri, 25 Jul 2025 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hIZ/9qUM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0C74A08;
	Fri, 25 Jul 2025 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753421019; cv=fail; b=jy7KuxnmHVgmJ1gQ/Pd0EboUZDmcH6EQNFRNNjGJHoRHr48FXGo2rP1u3nMS3HDfNfz91fEYu1sl/T3U55kJHI631tnIi0oNUssEq5H+XOs7Hx549nfLEvSfodwP0Yq1TIU37rmOB5TmmTUOfjggsIySrENrqSFnB7bzP6hhOAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753421019; c=relaxed/simple;
	bh=F82Qfdv4mEsu0jP9Ei1ORQlnY1pMpT0x2sVNcBvamlY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8RIzWO4THgiRZvtXerMDD7zWF68m6i3Lpve5BaGoTAPzbErciQGAk00R0thOZlRzJM/5lXCTY3OVuebTY0UEVBWuXS7zXZkYVn6edVYfqNVSMaHtJePan4w48+Fdq/1XaSx+47z3LogJKYOSh5QjxJhsUO7DD3RgL7GGnF8HGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hIZ/9qUM; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nszd6xODeUsD+12cyNzco82dE0YlZoFZUVU0p1Cj5hD6twsgfk76MtMDaR+yUG1+telIDndAOeH1OaN8knfBhIHg4XxjEnXekooPeEqHCbsWfCyIZgCSIAHOzDnJpXwlo5IXwGPQtX2zeLYSPjc+9T7M1zJHYBLNdpS50zf8zmeyIquNjK2V2DOUmxoHS5u2M6U1z/5jW/jon+lnyWJlLS4ZAjC603Cn7Lr/9LxhGBimNaRbLzellbDoHyUgWx6xpzOdbttnmn1fOWnxwsVFgnT/1vGtBEGM2TBWoQPgClurOARrIbt/8fk0LPOKk4mlCZaaXz/ig3Vei+mzaG3W1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9E7T6PClm6aTUyaQvoBD70Hi9oOF/F6fenm7YCpTus=;
 b=YwVaqVZuwrncRKqJFJgQEJ7Uwkb3Ti4GcICP9IGOiuJT9Sp15WdHgXcIIcpUGn4hA3YfrIVDgrmPQ55TjXJY139DVp3g6+gCcaH6IrXfGop8h5bOVP9bv8NVN5xdCSo5Hs8NScGYgdFUPPdduSYj7eMOeoThUhK6CMKErmSFz17+bBeUmixIDXiqb6NkRpUGS1myf359A6Vxh+GbP4OxNObPipWwtFydg3s3bUliljMuE2NkkLsmyq+N9sMx/ZYXFIbhaX3axCL7H/FhqbfnTUSyF8aXkwct2WIYvM+lmrye+nj6pc6kAYBcmEuO8TDxFLjksCSXAZ//cnYIsKRAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9E7T6PClm6aTUyaQvoBD70Hi9oOF/F6fenm7YCpTus=;
 b=hIZ/9qUMKk/55V/eQjI2B/WTTPKYBMvc3iHBJtMjAFTPNE1sQHSpZxfWMaH9XzmU4hQYrDjaCxUjU7CcFz4pkmQQhUMGMIkld/Yq8V0mEDxAhk53bR9PytvrSO1+qspV5rnXa2d3rKI/1VWoGIZfWha1BWrD7pE0flY5RuoZ7w0oHwpMGEBbkK8B7M/c227pHCAz/IPtxXoERcuiErfNSRAz8ia/67QU/a5tmgyjXxCVesX+lUFNp4x6Pvkg5RIHCtZMjOekUJ7jsYW6O8N1FQywLioH1LxmudCLc5h9AM2X0gWSzDWppA8Wk0vQs1EjxTzRNZYEpanITkGt+LAJPQ==
Received: from MN2PR19CA0026.namprd19.prod.outlook.com (2603:10b6:208:178::39)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 05:23:32 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::5d) by MN2PR19CA0026.outlook.office365.com
 (2603:10b6:208:178::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 05:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 05:23:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:16 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:16 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 24 Jul 2025 22:23:12 -0700
From: Rajesh Gumasta <rgumasta@nvidia.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<andersson@kernel.org>, <sjg@chromium.org>, <nm@ti.com>, Rajesh Gumasta
	<rgumasta@nvidia.com>
Subject: [PATCH V3 2/3] dt-binding: i2c: nvidia,tegra20-i2c: Add register-setting support
Date: Fri, 25 Jul 2025 10:52:24 +0530
Message-ID: <20250725052225.23510-3-rgumasta@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725052225.23510-1-rgumasta@nvidia.com>
References: <20250725052225.23510-1-rgumasta@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2b68e1-b1a1-418a-2484-08ddcb3b656c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1ufzpLm1tIzSkYUU8pov6Dqg61icOQhbm51joCmGTeIJSxtzOei2EM3kouGl?=
 =?us-ascii?Q?mRXhMkz8JsvNQC4/F5a0dRmRtwLN0XfO3abftMMbL2V9WWCyZuCYsrzmHTrw?=
 =?us-ascii?Q?aUsALkUiDKV5zNvo9gv5s09PuleSOSPMyz9UCxCf2zrXfrWNtqqx3QCa3BMb?=
 =?us-ascii?Q?3P6+m0Brs5MeBQSE/Qhcg+4+8RTsmJnL2cIy6ecyt9QRxJ53THuiZw7pYCpb?=
 =?us-ascii?Q?6UUgL8lyZB4MOhqjr0F3iYc2jxOePrQUBM9FensMtx+X6p0tdlCB4JIpFTDe?=
 =?us-ascii?Q?z6jepq5IUrARXI77+SXgpw4KO1roP6mVEBUNTLZzfW+UEIZ5bo6Kn13ACTwT?=
 =?us-ascii?Q?Nm4J7MWdu9LaWGyI0on3y8W4kYfvtXwIytS3AB0nq1CqJdIsymLPF3+1hGKg?=
 =?us-ascii?Q?RVm1HHl8VKPv/SiOWJLLy4l8KhuG7PdVnUIgMNgbNzV+cvgxfvnXKxSPPAjx?=
 =?us-ascii?Q?Ee/CvRvHfNqB9ZdmLScwRe3BYxHXadx+LA/52HmuAiqS+weWvw0J3lCvEbY3?=
 =?us-ascii?Q?6UC5RP74fTjojupdjLEOOgotQml/6xWgqwu5v2XLJNf7kdo9VWqk2SNGIy/Y?=
 =?us-ascii?Q?5wk55uXO1mYpNVzAhmPmVi5vWY9v7vKGC3gyA+007NF1l8KBHI+LauooaGZm?=
 =?us-ascii?Q?LhmheLkVT38zCnSs3EVK071SZuAcEw+dlWgiOvMGQxD8VLPMv9iq7+YbK+YX?=
 =?us-ascii?Q?9hknA9pwmkquTZ4kvw754jbYP8q7OZ6ByDUhWpGrKHSgBlUcee2NoeJD6EEC?=
 =?us-ascii?Q?Ae+s8q3WUAF390GgFOZ+1bnGtNIegV+iSZLeW5bZLeDo95Qis22jWzGAAD4v?=
 =?us-ascii?Q?9aBSkP1491QR0kXIz4hHNoArdQPK+ew4MWUXI/kp3JjPr4mAuNfyStHKhDy1?=
 =?us-ascii?Q?wijuhNZQLe/xWj07FVR3P8a667J6HClle3ak0Klf+1AC4eJH0CVagoKntA8a?=
 =?us-ascii?Q?BbE3Mgk3A9jJcwa6fMOrhZLV1spZJaQL4+/vA9Lt8K++5wm7KCPZ1ADuYz7K?=
 =?us-ascii?Q?lYbtCs3bqXI6N5e5ySXXe5GwFmwK2/sEa/CW3C9ySY9y9UebdMHpoD2sjR9h?=
 =?us-ascii?Q?++Wd4Nw9RDl9C+U3hZ3uEA9LiMB4BrtgeDg3tBopH1kmugJa3rnwE8CTJk0a?=
 =?us-ascii?Q?bczUAt529sWvE/2A8uuThKV6o89y3URoiBELIRmomOhSb1WMfTlyc7br33lI?=
 =?us-ascii?Q?RtXKTfSJmkPUIluNJqavAUCck0PBAEBTc3m7aT/8DAvelcNhOHCZXIIdmCsc?=
 =?us-ascii?Q?R6eoe3DHat+yS3GoUSymL2bwlH0ToQc4CqH7feYoiBCKKt309eEYaOmr7vwz?=
 =?us-ascii?Q?kK2h2Ywzgd3cWnWw/KJ2stf/iqIVa3d52BBDNj13oTUsG3aZb5S15jxRvJYC?=
 =?us-ascii?Q?zej4Nhq90TcDF/J9HGQvgQHcF80WrjtmL0ZI1YNwmJHR40ZRDzHTjIU5fdnb?=
 =?us-ascii?Q?O512ZfEF5IK6b3xxTr4iBEdQlj/fjtr1YtudOymfV+sgzluXovimDz64NLFa?=
 =?us-ascii?Q?HGOjc7tHepHDvbAV4CLPLQvGkxHP2s541jHj?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 05:23:31.9770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2b68e1-b1a1-418a-2484-08ddcb3b656c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278

Add register setting support for the NVIDIA Tegra20 I2C controllers. An
i2c-controller-common.yaml binding document has been added a top-level
binding document so that all I2C controllers can use this binding. This
new binding document defines some generic register setting properties
for I2C and some standard I2C operating modes that the register settings
need to be programmed for. This new binding document is used by the
NVIDIA Tegra20 I2C binding to enable the use of the 'reg-settings'
binding for this device.

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
---
 .../bindings/i2c/i2c-controller-common.yaml   | 73 +++++++++++++++++++
 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 64 +++++++++++++++-
 2 files changed, 134 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml b/Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml
new file mode 100644
index 000000000000..3b5b75d4b98a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-controller-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller Common Properties
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Krishna Yarlagadda <kyarlagadda@nvidia.com>
+  - Rajesh Gumasta <rgumasta@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description:
+  These properties are common to multiple I2C controllers.
+
+definitions:
+  reg-settings:
+    properties:
+      scl-low-period-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Low period of the SCL clock in parent clock cycles.
+      scl-high-period-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: High period of the SCL clock in parent clock cycles.
+      bus-free-time-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Bus free time between STOP and START conditions in parent
+          clock cycles.
+      start-setup-time-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Set-up time for START condition in parent clock cycles.
+      stop-setup-time-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Set-up time for STOP condition in parent clock cycles.
+      start-hold-time-cycles:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Hold time for STOP condition in parent clock cycles.
+
+properties:
+  reg-settings:
+    $ref: /schemas/regset/register-settings.yaml
+
+    properties:
+      default-setting:
+        type: object
+        $ref: "#/definitions/reg-settings"
+        description:
+          Default register settings.
+
+      fast:
+        type: object
+        $ref: "#/definitions/reg-settings"
+        description:
+          Register settings for I2C fast operating mode.
+
+      fastplus:
+        type: object
+        $ref: "#/definitions/reg-settings"
+        description:
+          Register settings for I2C fastplus operating mode.
+
+      standard:
+        type: object
+        $ref: "#/definitions/reg-settings"
+        description:
+          Register settings for I2C standard operating mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 6b6f6762d122..695ce5ada7d5 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -119,6 +119,28 @@ properties:
       - const: rx
       - const: tx
 
+  reg-settings:
+    $ref: /schemas/i2c/i2c-controller-common.yaml#/properties/reg-settings
+
+    properties:
+      default-setting:
+        $ref: /schemas/i2c/i2c-controller-common.yaml#/definitions/reg-settings
+        unevaluatedProperties: false
+
+      fast:
+        $ref: /schemas/i2c/i2c-controller-common.yaml#/definitions/reg-settings
+        unevaluatedProperties: false
+
+      fastplus:
+        $ref: /schemas/i2c/i2c-controller-common.yaml#/definitions/reg-settings
+        unevaluatedProperties: false
+
+      standard:
+        $ref: /schemas/i2c/i2c-controller-common.yaml#/definitions/reg-settings
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -127,7 +149,7 @@ required:
   - clock-names
 
 allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml
+  - $ref: /schemas/i2c/i2c-controller-common.yaml
   - if:
       properties:
         compatible:
@@ -206,6 +228,42 @@ examples:
         dmas = <&apbdma 16>, <&apbdma 16>;
         dma-names = "rx", "tx";
 
-        #address-cells = <1>;
-        #size-cells = <0>;
+        i2c-bus {
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        reg-settings {
+            default-setting {
+                scl-high-period-cycles = /bits/ 8 <3>;
+                scl-low-period-cycles = /bits/ 8 <8>;
+            };
+
+            fast {
+                scl-high-period-cycles = /bits/ 8 <2>;
+                scl-low-period-cycles = /bits/ 8 <2>;
+                bus-free-time-cycles = /bits/ 8 <2>;
+                stop-setup-time-cycles = /bits/ 8 <2>;
+                start-hold-time-cycles = /bits/ 8 <2>;
+                start-setup-time-cycles = /bits/ 8 <2>;
+            };
+
+            fastplus {
+                scl-high-period-cycles = /bits/ 8 <2>;
+                scl-low-period-cycles = /bits/ 8 <2>;
+                bus-free-time-cycles = /bits/ 8 <2>;
+                stop-setup-time-cycles = /bits/ 8 <2>;
+                start-hold-time-cycles = /bits/ 8 <2>;
+                start-setup-time-cycles = /bits/ 8 <2>;
+            };
+
+            standard {
+                scl-high-period-cycles = /bits/ 8 <7>;
+                scl-low-period-cycles = /bits/ 8 <8>;
+                bus-free-time-cycles = /bits/ 8 <8>;
+                stop-setup-time-cycles = /bits/ 8 <8>;
+                start-hold-time-cycles = /bits/ 8 <8>;
+                start-setup-time-cycles = /bits/ 8 <8>;
+            };
+        };
     };
-- 
2.50.1


