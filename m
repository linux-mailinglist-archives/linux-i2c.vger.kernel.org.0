Return-Path: <linux-i2c+bounces-12323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995EB29DA6
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 11:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041743A783B
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FD930DEC5;
	Mon, 18 Aug 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SddFMSEE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5B430DEAD;
	Mon, 18 Aug 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509092; cv=fail; b=eLEP+Wxs5uZRhw2vRx5ipaYU5pRj2xJqAF2n0ysZAEL/QXcBbo4oQaYEcgVqdT8S1uHK53onYqL4lAmwSbF6AS9TLyDeNzX2QlrlzGNiSKoOz2AfRqxEoGPXXYj+5btA4yU8K9D6h/xSEEzNE5E4btYWoaeGUYpWDQRn8mlLvXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509092; c=relaxed/simple;
	bh=AKHZUl9sirmivCeMeD42IsCP9VXkiPMBTSJhdolaETI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrJZ4Xf0aJ7Xsu1jwOkxVFMoSaDcXt6J2TJp3sn3XPdt0xSso7IjpokTdF9Gm1Y380FOShFQ3vGfipDrUejpKgXZ9fyvgGECUGDHrTi/ipDnXzktmrbKijqn8QkPoTihfUpOzBSkoPMxxAv8rA7gJpm31iIvLex/7DQWFHXtyKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SddFMSEE; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWMph0yy4NK/3+Q3YaKO4nI9Byp99tm4HYBjnLCU1D1HYGBAzLzzkHYMDFbjevNtXA3xcg5Ct4aGvsdurVHoMXdTl5u108K3pwKJfWs/eZ51Qqf2EoSdYAlEDeYKAxPpyatDvfgwImd3myHbxH2zfIIXGI5z/EqHbq3xD3OPGlwCB4oIFhdzUeyTquNhinLkLCyiNVUYsMN/pVa2eRtAK5nSyGbr3g2z5ryQXEHL2guXtAkiKadQrWz7iFXZHSsCqzKlDQ9zkyobnE3SNxkOhWclyDW3ppMtywbcwRm9KK2I/UKTqvaZBKhE2mlXR5Hai3mth+Numx2q6M1lYkg7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTZs20+4R+gm/l7JPhnmf43JXxQ28ckK+YHlpU2QDyI=;
 b=t8RvZtc1lwdf9gzsb7sYjIjuOqRzlQ+cNzLvjMLB848yFsIzbiRaz2MTKKwS6B7QNLTkhEaEZaHgoQvX/uxHYY+X8q7qU/n88ElSE4qhT6d01iN13UWrsRvLxbdyFytyHuVRBJDiu6mxyhSc74s4VKw/wPJTrUlB7qV7mS2DB3S/t4vLIss4VEq5sWTAmauAwWAj3fOZ0pGysdUUyGbqdLDf21eKDeKDGpBoSscf54WwQMifDhfJrLCOxmsY1R7N4TZ+DahB3aVzENDOUs/8XgY57pUo1EjHBk94ZxhoYQqI1+EYFT5p8Y8U5ujy0lFGkNTRCSppKFXTK4h3VBsMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTZs20+4R+gm/l7JPhnmf43JXxQ28ckK+YHlpU2QDyI=;
 b=SddFMSEER53kdgZb1mImug6Nk+v3QsdYwb0Ai6MBuFXsIN98k6DStYYCCgT1NXWO1EmO8KeMirgS3ohjRIAi1QP6wiV+6p0z01w6nl62kqtrmn0YW677Z2PGvcWy/+FwJdC1zAmhkEjxrM5AnXmYNHTBfo/ZGFT7Wd/J0clcs/t9z4eL7EoRFlxh0IAKa+aaCc88GvXdWa7DuDEG4KI4BK5L8SKOg058/H+t3kwqSW760FdN8NVcKd9NhqW1Q8yS53k43jXKBGUKSw8h5tbw6nfczlvUHeL2KtO+wD1oDFt4sjR7NA13aEdMYgabpJfXqx5l43OjRQwij6aDGLB78Q==
Received: from CH0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:610:cd::22)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 09:24:44 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::61) by CH0PR03CA0107.outlook.office365.com
 (2603:10b6:610:cd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Mon,
 18 Aug 2025 09:24:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 09:24:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:33 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 18 Aug
 2025 02:24:32 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 18 Aug 2025 02:24:28 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Mon, 18 Aug 2025 14:54:07 +0530
Message-ID: <20250818092412.444755-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818092412.444755-1-kkartik@nvidia.com>
References: <20250818092412.444755-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 901016de-1815-4983-44d3-08ddde39119e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jLNsQojY24oUSrLQpkxTe8f3yzIDKSv+nhICCNJQEUAdzU14VMMSKzQ0Jlu/?=
 =?us-ascii?Q?ibb6LPCMBd5IEFvKV6vIsgrIQiHTuVnwAB6whXvUUmtA6zPvIK8pfNtJ9z1c?=
 =?us-ascii?Q?D+vXaY1lnOy7pPwu4rhIrxu4oBDZF+UT0mwOguzaehhHj3PTeO9kSsiAoIlK?=
 =?us-ascii?Q?N3YrtmF96skm5AkogsNqgQRP4D1WJaIHn+kDCKn9niOIedA5MQuHjW6VwZkm?=
 =?us-ascii?Q?W70WVdaED+0mB4BXj+QxS0K2UN1JcD0UuZiOXy4CM+M1hUS8muIJ444am8AH?=
 =?us-ascii?Q?W99fLL3C2TsGEbTe6MYUPOKQDtM9DgZJ8/Af8JghGQdrCufIsFWBU/NoYA0e?=
 =?us-ascii?Q?62nq23Nzfr/8EkvU3uuKXwpnk4x+5ASL/2gM2xyeaWSOQSmblmcHqZldjswt?=
 =?us-ascii?Q?3VP/depHsDhxFOcAbQ26yX/QLZcKk5WndJYESXCJaAR0hTnsnnIK4uP5S0WX?=
 =?us-ascii?Q?ZV70TdLW7Dfz2lEwursvDwwyxfcI5uARjLnKvQAbmClWsqUiIXCPGuWNsoxc?=
 =?us-ascii?Q?NTnsHhg95vn/fqBawC2ACXmSOJnZDW9owH+y6YxG/eYRy8E83QGllzcZyASM?=
 =?us-ascii?Q?mV9SuRZ5+a02wDgX2Uzl6R61d5EgsLWLauWGFuZtE0sOCCepjIth+Zu00KXc?=
 =?us-ascii?Q?eICNdKnwKWj/jMKkMWSUBG3Gltf920hrjBioRy4iH/pPgWntgalgicF7RW8w?=
 =?us-ascii?Q?hAL14ftIV27UduyQvSHgVfCsgZjm0vyY0mrGTBYQpmx9tu+7zAbkYALG5IQz?=
 =?us-ascii?Q?BGpmOeY+wy+jzp6MkX5KR/922nUffLwo2LTVOWjmQM3oz+rHxGptpjs87ko0?=
 =?us-ascii?Q?7OE6XSmRcJoii9GQ+0AeUeKYbrjVfnRtAxPs3fOEAHxMd4kIzXLkra6dDJ69?=
 =?us-ascii?Q?vlcz+6x+Ca1BMDEvy1eJmZC8g5wVvfyxFMdMn+CZxq6b6QQn0ALI4lELWrC1?=
 =?us-ascii?Q?dvxTOgas3d1C8cjlEKkp0PlsV56YCKxFu7LFgGzdUxGs/qKi3XRXnNN4t0iE?=
 =?us-ascii?Q?2RFQqGbE6HgQ8HZa/YVoXD5rGUcUMk6VVLRiJOyKY/WzxW0MqRLUPZqlM2Pp?=
 =?us-ascii?Q?OG03GqDhmg4dFTOyZ129osdiSevUvIVlFW0vMFSQBSXMJTorX1dTqCnS/yjq?=
 =?us-ascii?Q?Fpc8WzlKyvgRomIYUhxaGD2hlL8o2/j+mQfAjykHMDMXXCYJ5mRjb1xrT7Y+?=
 =?us-ascii?Q?v69SueGpodHl9PTVe89xu9kl3Ue3sbT5UJlQXw7gdNhh1Otc4Yj5KHMQVKu2?=
 =?us-ascii?Q?WgsYYlBiR7C+OcA3D7ONsPuHFVqCGPUbu4PVWBCoKAAQtmNEDdXQwVwA8YS3?=
 =?us-ascii?Q?TpApLeo+uzFZKa9Q6zkRjZIE7SHpN5XiLizTXyNHusfxKn/QLMiF2Eqs40of?=
 =?us-ascii?Q?ULfOijAtuinw9wH/dnfb3NjseVT1/EHqNFPjQe0ms6DGlrGbp4k8VNeBYSWM?=
 =?us-ascii?Q?2qNNq86WiBDIWd53b/I0a+PVcf5Jp74TPAl9bopg4ZmKepoUnYXtQ8s3VX7K?=
 =?us-ascii?Q?z9L+ZWE61MeJaOdKF/2bQy1lL0/7wSNVvf3EGn8Vk/4Vkyi9bI8N3Be4sQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 09:24:44.4809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 901016de-1815-4983-44d3-08ddde39119e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033

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


