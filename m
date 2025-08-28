Return-Path: <linux-i2c+bounces-12454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C9B39384
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 08:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1543AF2A2
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 06:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173CE27B354;
	Thu, 28 Aug 2025 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ugpa7kEd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AB271476;
	Thu, 28 Aug 2025 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756360804; cv=fail; b=RRe8mACA9LNoZYtiv3owHJCxk2m/ze8f4Sogq4RHJiUb6AysoUf5+Bw0o94hkotN4NV45H/XYZQyhxlhx+k8Ff589IJI0mewwtEcaMeFBRpvVKYYaIXQHf23x7VIHeiXmxldDqeFmMrFEiYGvlW9q4rxRtHJ/sgCYTDcNpKkKmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756360804; c=relaxed/simple;
	bh=dFdpBy806e1fxNZfUxnACskBXaStls6gX1eNuojym2I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZuuacT+fl86BaCuI2ptZWHZV6Hjy4wu9lSaHb1y02UqQvOK558qq10hfqGukbrtIzrnqcWHlnTEIhpRSReg2PLb5j07WxptM3gsG/Ym9wURkVVej3fnZw0R0z1mFZZ9TkO4i2kKyaO8+7xTXAhAiS55SSzKgr68TV8k4gek3j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ugpa7kEd; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpPW4Ai0bdLuScNSRrKDLxdncF1JZDnQwB0XdqrjusbAWMYplVCkkXS+6YSpZZyHZnl/O35IadYkZwF32pd6LgW1XAnvl558cmCurWB8bs/fYuhIsnyg4AcICwQLgY7r9/ML4YMZPR2j96urFUyvXhKbV6UlwpV6cRCFPyXXIPyvfRfVmhiWr+iidD8pF3Gd/nqnFmEiiWOp5GSTzWBjdqbvUrFN2Vd6btyGaV3YdTxvrDEv+xioLH9fom66zIYxMzaDgQl8mWZWKxRosN9+tk7xX8vzcYcSwU5NpAuxX2mdJ39ZLVTQr6IsSGeMFVa8jKKTs81vwRYDC2ReISYizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCYKPCmOmQZ9rtDoq3Ggw9KJvwWQ2OcmrBUpWS9O0VA=;
 b=DGKcbZax/YPpdOIOPJ8OcD0Kdb8+Xjt9WrTRf1TXJPiocOMp7ipvHD77XXqT+8wym7G9+Qs5tvusMZ680dcTbVSdhOwkbZ0AzxFFPqLhBNhpGLdj39nSGiOHEKqjxIf1bjjfjX2q/NatYN+Wp+ZhLHZU6N874YYUOTFmXqbXPt7HqR/D/uv/2tJyVFw/HsJQPvxP3NRMBbkEg/6ZHLor0NbFDJuEtMQlvsvzuVHAm2aW16R9nERRu4V6XaTO6COhdwmfYJnNrvhpszpIawnhIDupXuzU+RzBB3vT98opQlDW3vqrWNjeU4MfiSjiwSgm3pIKtMpHoMKfWNUFDhmkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCYKPCmOmQZ9rtDoq3Ggw9KJvwWQ2OcmrBUpWS9O0VA=;
 b=Ugpa7kEdgdcFStCSgBPV6+gZdvDROjcfJcCnTEmzyrWcf6TS3PXcOf9XQi2zPIySfp5tgNKFHJSO1kSZVyEQYJ7piMnk6EwtUMKySRLXpSTlGDPqho2wLF3dasAqM/jPUHDnaE23V3yfEHw4Kj7QNi8ezb0ZOMpFLQ1F5PUxhlrOYieX8s2ZQxsOh9vgekYbykEF//oD7sSPOdkIRdKGLPydfoem+BKyd7s6Qdgv2EyEfA+BK0l679e1OTorapxDZ4oEp/U2m/dH514kiFENJX8CjYmL/sGU39SX7BEUJ/ez8vpsuysAmbz4NtG/jzTbjt2RdecCfIQzQ2pCmPkNIg==
Received: from BN9P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::12)
 by SN7PR12MB7812.namprd12.prod.outlook.com (2603:10b6:806:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 06:00:00 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::1) by BN9P222CA0007.outlook.office365.com
 (2603:10b6:408:10c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 05:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 05:59:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 27 Aug
 2025 22:59:50 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 27 Aug 2025 22:59:49 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 27 Aug 2025 22:59:45 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v6 2/5] i2c: tegra: Do not configure DMA if not supported
Date: Thu, 28 Aug 2025 11:29:30 +0530
Message-ID: <20250828055933.496548-3-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SN7PR12MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 13522899-233e-4abf-3f4d-08dde5f81f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?23rGS2XrpnvjvDLpSZEWwvxbQqhYUVseBdYegjHwlO7P3x7F++qOLb08J0NB?=
 =?us-ascii?Q?dOYe9CIi2yFNIsrwpgzHSCZB/JZO65TdccCWh0oFkWceLokBTZ3A/VzFTZSs?=
 =?us-ascii?Q?ird7HGkSoxguGz8IpshWnNnEiOuhSkQFjzFnc6oxz7Xhatn4Dee0yI7XxVIX?=
 =?us-ascii?Q?okQG0EtWHbdiI6sWxzvOxGiuL+tksIcs1XEbl0edUq/o8bsK4twDufX0hp1u?=
 =?us-ascii?Q?O1lnUH3fOm/kXBmk+xIm17xR8WlrDCV3X2QATZxECz0iq4714BZStWC6QYE5?=
 =?us-ascii?Q?OauRJI4SZY8vKsCMKCaiA2MYWsPbBY7xkou8ESzgXrkVhgSls6DZBskiQK+K?=
 =?us-ascii?Q?erLAAf+3Y9y2d7zpz46k8dH0/egxbCzi9L2IolQ8tOkF1ReAs4EgRnJGPkb7?=
 =?us-ascii?Q?YXiOye01Ad1VphTi8ZWe6qHtkNUEqIAGyb7T0oXsQACUFMh0/XoYFoVbKJp+?=
 =?us-ascii?Q?Ff/I7KG9fF5TNlKz3je5vpGHz3cVR5/rptD7w8jCPC+FWlylqSLS+8f0zldY?=
 =?us-ascii?Q?w+53PIVCOHRWaKOXTFiFIC1qSXWRLImsRBZI4oMDOuRqQE2dKkxCbSi7Tv78?=
 =?us-ascii?Q?Y/kXpXuKekjvNctniVMUhFKuXYFMloBNE+utRrcqoM8fKHkb1tEFyu4PtZFc?=
 =?us-ascii?Q?AcY105Nbl/471hPKrl7lCrXMxqc2hLQTYl/KtKKox6t7ezGmzT8bpRCDoc/6?=
 =?us-ascii?Q?5brgzeb7JMPq0RH41vdsKYb5/zqaDJ6cc7Miy+zYAs2CfJgLJPC1XjMuF91N?=
 =?us-ascii?Q?iN+eGqrxKivyi74hxGn3226b7mYibXFz3Q9oFndr/FwTC14W75GtoulWBnd8?=
 =?us-ascii?Q?JCbWnE2SS4KF5iV7M8eXKESgGFJM2hpJIjcVca6h0wnsHAbw3MpRLAhAtExE?=
 =?us-ascii?Q?RNCz1/9vQpfrLvORjrB8ODXXJJMjpcy6cVdqeul/6qwGMAhkqKwSVUN6Hn12?=
 =?us-ascii?Q?4y6EKGKZjq95dPtLJx8RHP567eLkkwBcbB3MxSekp8zGPXSFnAw9R/YnpnUK?=
 =?us-ascii?Q?mCPgD3im3vOOu4jUe23a/eTnpSp5YnDTRVVXqJDpSukLArqbfixNoSiEcJos?=
 =?us-ascii?Q?xa2V5QwQABFOPiyiIysteuKkk3mHS4V4jITzJ8oijvoKXYURhcpwiuwWRPFA?=
 =?us-ascii?Q?XDgTkSlGMp+2y4fubVWIkiV+HGM7wsCDy6lkwsbPbN9/1JVu2XwwVAleC33M?=
 =?us-ascii?Q?PjjnMv2uIvAvRIV0QEjNcy7YSjYDxkjUOhiNFvWytkLabX5sN/uqHQdZNgWs?=
 =?us-ascii?Q?5nhJabsSU1rWLz1XVSolnq+YlfkvgpmQnrYDFcq3AdT4F3NSKPPuwfCXS8Ne?=
 =?us-ascii?Q?QWQp9Qr0MRD98j+vQO/MexVxgJmbwIEjpeZrRIFeP8C0lftqAoAD0FrWo9vF?=
 =?us-ascii?Q?bejxoDpvTyZQKqpJXl/ZmRKznguLAH2mi1E8MaPup8liL/hL0APjcP7VxCuC?=
 =?us-ascii?Q?K6w1NZL8ZxptC/YP4AKuk0ZRsokBMtkS8hHAKFW3zs1/FV0sD8ytL0s5V629?=
 =?us-ascii?Q?MlGQjyMJtxg+Emn3JJuljkeKnJm0cYWLG5jMvc3kXwqrzVZXIs3JNXrXnw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 05:59:59.5227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13522899-233e-4abf-3f4d-08dde5f81f5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7812

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v4:
	* Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
	* Update commit message to clarify that some I2C controllers may
	  not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4eb31b913c1a..0c428cba4df3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -446,6 +446,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	u32 *dma_buf;
 	int err;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (IS_VI(i2c_dev))
 		return 0;
 
-- 
2.43.0


