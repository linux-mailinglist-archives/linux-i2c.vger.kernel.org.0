Return-Path: <linux-i2c+bounces-8962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D44BA05923
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 12:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E563A389A
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBBB1F8AD1;
	Wed,  8 Jan 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cFK0R0kW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89519D06A;
	Wed,  8 Jan 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334409; cv=fail; b=TTxzb64OeRzVElY3N+shk9T7hRmpMuYWk3kfK0RdWc9vRyBy7hrpi542zCPDYPYHshNBsqwkzvh3kpDfmh1UYZQcloidr6Hxc40gvf3vMTLS+1fLC0Nl2KmB/swhfwNEGSexgx9Bsol7LABuSIqRxq6jKNTsqzcpUPcpzofHGLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334409; c=relaxed/simple;
	bh=MM+T/3hex72ea6atk0qnY7QAJ0sKOy1oglKhvFTPAto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+5MFMyeYwvgIlQI0v9SyjxYDdN+MAa1ZqMQucoQBQXZrerdSrt3Jem8kZwsav+ex0S8PLXxIQht4OtGB/ozRlgjty4eubvzxxl0/xfHZCsVEPuyMg8El9/kmEXp2Cm0P6QWd4UEZ/lDqNZ8OMaanTfu/JJy+7ujICziarrXRME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cFK0R0kW; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbsxZvYGKh8K6Cz8MNt66d0elRKNTS8IqRE1S1j7UALao3bXcfovw7c2OCXcja6aB1N+l9ehvZFeTFKDPDk/mIajb5Dq7Ba3KgOphZvLAZsy9c8GKhw9MgFEL23vaXwyN4L72qigOJVC/dvohTXwklGTmYkWFx29M2YWOsHBLNpA8OxDyAJmWW8BXJQngzbm/jHpaLUkf9zB2ciJkJQGF4leg81O+fWwuvz2Hy1cL15zL0iSyl5zPzC0p1zHOk6hNLxBVO8Pig7yt9OM4K0VErf1uoDBtVR3+tsgqRmP1fJ7eDYplYr6FjqDC2BSJh/bJ4vXM5EpYrXsRzg9w4KKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlckygoVWafd2zUxFXekSU4lr6dffXZa2FWLlWeWul0=;
 b=EISK0Pc4IqS19wavPr+SlSHawdZQjo0qS4HZvCzo0PNPc4Jo49IDZgL1CRXR8v2SHSW5td6K13QFmrYNvGCHpMS2xbEfTHCn2DNSsPPkHEIREqGH1tVc6GUFXHRsKtM5yi1BhPo76kW1isrZCPYN5Tb0jwlhTnOjukmsGlR0myyjxKl+yKRhfuuMOUA1MCwuBFnDdjLzvvsHcObNiJvE7bahIIAfEqjIGtiN7aJudAs7NCSxzzNbcYZyWsGWxM+8VNn3km9/8eeeh9MV9pVZziaKaJpXEYKV/0pYyrkDaYSFTvGAG4of+oiLAhhVIKp24vZS8xhjCU1idi9w3+Yvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlckygoVWafd2zUxFXekSU4lr6dffXZa2FWLlWeWul0=;
 b=cFK0R0kWyoB+NpzK8sSkdKj015veRKaSspo7dfT5A5ZRWgXNMiEJBsth7ZYeSTIoa/tg5bf5mydM93nUtQz/oJYvW9P+Yra+xCR6g0mEYyMOqYTsVRmax6R8EDbsf69h1aXhXjJ8+NlFfLNDGWO/8vSJdLB5/NO/Wo0mT36Vj4q1Am1zl82Homc7oSk9cG/iPFzpnZWjJPTjRlCsHLxlipXsM/xGUMHL1vQIQNZhzsX7TQcVygpZpD00H4257XMwOxnTfcSDcctyiencJd86Dkdn46qXQ6+pfWzVUEPlLJrZSxYiDxvsyIWvbW552nghMe2OVR9brQKHXQ4cGdySIA==
Received: from CH0PR07CA0021.namprd07.prod.outlook.com (2603:10b6:610:32::26)
 by BY1PR12MB8448.namprd12.prod.outlook.com (2603:10b6:a03:534::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 11:06:45 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::5) by CH0PR07CA0021.outlook.office365.com
 (2603:10b6:610:32::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Wed,
 8 Jan 2025 11:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 11:06:44 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 03:06:37 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 8 Jan 2025 03:06:37 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 8 Jan 2025 03:06:33 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Wed, 8 Jan 2025 16:36:17 +0530
Message-ID: <20250108110620.86900-3-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108110620.86900-1-kkartik@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|BY1PR12MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 0370c9a8-c8e7-44cc-ddf2-08dd2fd489e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?udCtBZcpvyHS/yVF3VChHDTGA0VHtxVgBJJbuiB+QfP6tcQlaam93epTq1I3?=
 =?us-ascii?Q?w9psP8q9d2aOVsc/qlHOEsojC8NhkPlSiJeZ6qL1mkduANQYANEz54pNiYtf?=
 =?us-ascii?Q?1Z5IHguFxe0veMQFhRE062FXXjCVie20rJIP6Zbg+x9+6VaKfnRLkwd2uw3K?=
 =?us-ascii?Q?ZUA8kNQN0g0z67EW8yfRK9RwT8HPnddbDi1MfX5WOPNqaoIFVvbC0B9Jbdi9?=
 =?us-ascii?Q?cYNQ0kRpEes/HQZn7deAb4ElM+PadPsZCu3qTf4L1OoDLrcY0hBi2SQj9A6j?=
 =?us-ascii?Q?sfmjT/urrvaMTdaksMIqx18zDa9R4AklqCxm/Fwza54zEKlNlg2mk1+ykgVh?=
 =?us-ascii?Q?k+oYMV1PyX9YlsNQzlrGzXiMtAtgo9JHKtQM+/2mYwaf/PtyXjb1mE/qk+by?=
 =?us-ascii?Q?SWSuovDpbcLFUzhJQvOjiqRIVSlQp1lmgRoOFK37gIpT4f97y9bKUl4UI2wn?=
 =?us-ascii?Q?4ZQbGkgxUnIIfar0QeVdgSvTvRyOSeqPJjF4wgm1bLKYGOeYlOI7opGygdO8?=
 =?us-ascii?Q?/avsOGP1U0FfOh2JQqPBSMlIizzgDNFVpctSVVavfBSBtMbI4nmEl6pWbO+E?=
 =?us-ascii?Q?509Wo4zSmsR61vlanuLKc4Az+0U0ou2rWBOwl68MZ7EVQ7UejD3UTqYo+bSw?=
 =?us-ascii?Q?y01xuipm0oy5P4XpKIyWt1LA9cBMszbk/O4VkJV8hSDiZaHT1g12DEj1ecSD?=
 =?us-ascii?Q?RzY73M+b753jOoGODhiubQE3nirlSaerrBEgM5zymwlOl6gNN07b4P5ArMxA?=
 =?us-ascii?Q?pTqRUdm0FixwUJuiqbKbtD+gIKcxHQ8+P9IDuEaSHMOLVhb2ao6aTcrbi7YL?=
 =?us-ascii?Q?HkxZyeiTKgAXl3keu8sd+CIHu5xNQA6NcH59RLWMlhEuuWXBZdXPjl0SbZ1D?=
 =?us-ascii?Q?GNe8LmebvE/EzcMZ9m9vWfCDjNqcYuqrf71v7ibBbk72hObuW4MWfzYd51n5?=
 =?us-ascii?Q?KepQcZNk8TJuR8s1Rod8hWfTNWPAizcRiK6TIsHIclGam71acaI4+1Xrdf39?=
 =?us-ascii?Q?0uAEZgcYjsDZ8uZzR6XAc1DxsSDAfhZyal1pX/70w07mmkA/Ob9hTTHQYqFI?=
 =?us-ascii?Q?6tA8raFrhpzKBEpr7nKK8P0Za0nawFWu+cFMVfdfRiTr99bgANWZOVywYeRw?=
 =?us-ascii?Q?6DgkmZG9rf8iGNT0KS17haWiH2t45sKLlKrTNflZjqHp/nKeMV8194EjhCNZ?=
 =?us-ascii?Q?fqEyzIcXGgnBAUmx02pSmkADSH7myJCRFRrQ/MZHNH7xOw05h5iPpqEi4kOp?=
 =?us-ascii?Q?DY1wW0RBiDoySTfoL7NlTrtcrkdBZfYauJ+O1UtssE9OhD2iITQCbEJdptwA?=
 =?us-ascii?Q?fpty0wZ6HaCxAUAdKle1JVLlDj2Qiz0QXcCd9uoD82biNYhtfjKuRZSyCgDJ?=
 =?us-ascii?Q?oHApVnGLMfWF2d+H1ehAE1bDkBecJ/Dv1R/XcfU+E+v0BlqErUUN87f8xuXj?=
 =?us-ascii?Q?AzjOl7wjO2iB+r05VZrlojhLA5kV5FkQs1W5zYp77tVVEp/k8rlNnUgmmvS5?=
 =?us-ascii?Q?DXDDa4u9uMvGZD6eu2Zhm2aWsrMnqHq0a+0E?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:06:44.7980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0370c9a8-c8e7-44cc-ddf2-08dd2fd489e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8448

Tegra264 has 17 generic I2C controllers, two of which are in always-on
partition of the SoC. In addition to the features supported by Tegra194
it also supports a MUTEX register to allow sharing the same I2C instance
across multiple firmware.

Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index b57ae6963e62..2a016359328e 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -80,6 +80,12 @@ properties:
           support for 64 KiB transactions whereas earlier chips supported no
           more than 4 KiB per transactions.
         const: nvidia,tegra194-i2c
+      - description: |
+          Tegra264 has 17 generic I2C controllers, two of which are in the AON
+          (always-on) partition of the SoC. In addition to the features from
+          T194, a MUTEX register is added to support use of the same I2C
+          instance across multiple firmware.
+        const: nvidia,tegra264-i2c
 
   reg:
     maxItems: 1
-- 
2.43.0


