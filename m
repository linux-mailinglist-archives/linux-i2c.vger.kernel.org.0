Return-Path: <linux-i2c+bounces-9948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36136A6A708
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 14:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD489981F93
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 13:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45961E5B6A;
	Thu, 20 Mar 2025 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eH5ON7ZP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F01ADC9B;
	Thu, 20 Mar 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742476925; cv=fail; b=CaP2ECyc6zaRq6vskIIQQd2rXcYJh8mX3AZGTZUmoN+k8CyZqP3LgSk3cygmJcQkBr8LYYi6bT2RdOQs81dpjkvVUHVMr2kaqjAJPg3aRCfoi84lYNCbOTd1XdEDaSEfqKUOtIs2KN7gsU1M9D4NzTK/ICAiFQW2rm0v3q+4GBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742476925; c=relaxed/simple;
	bh=kgWh2xd+8h8Aw9+01nm/fZ7npl6qdku4UTRdGnWdMz4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qYOdb56yqigyHY8g8HPFa/WkEbpWDMsnS3jk+GQ4CDSXxcM0PvonIN3SGzbycixUSsKhgwYGNg/CqxvqogjUZ8jZTaeOeDBcKOX/iAgCywM0yOAY+Hym78+N278k7DQ9Q/jtqKKwHgW4KYW1QrcZYrj2tWjkH+P8Eenapjix8rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eH5ON7ZP; arc=fail smtp.client-ip=40.107.223.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCCavZlafSeXEYomXiZdYSmDHu7Xlfk+9ekI/aM2vGbA1RZGziRJ6HwW8BUcfG1EEB4JS/PZeFp5x5mGLxAchcS9hA1nLgqaFYpRHLHkuvxpw5wrMz7tGYRzm5h2GyvW8Ggt0kTNGkCyk/BQCSbiYeF7eS5rHzaOk1Ewnq3yTxNB8v926Wcamlx0ZJ2Q0VvSDQvWpaVi/QV6EuYdUI9NAodLgWTkIfk+pxFv0J9grRXJeQeQUk3/C/2ZSaiPAPCWK2fmCML1N5au4UP54Bzvkub4gzywjJ9/2CivQNPtBtngjKSo/Hr5cflmPP5AD5sNcoTp4ndNK82wgHKCzrek1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKg2RNSSWtIhpAfk/H43xdemqOWXAjbD7bDofGugy9M=;
 b=L3f+X/bOIyr011X/0safPzm8dpJoH6ZzDVXZyG7GO3tSxC9hNHnYxw8lBP58/ugULxfud/XaLsxJJ8arSDK+9Mj7Idca8zLdKhKAPGIhHUi+SOLXJ+fTAr5V4EfvfuXx+FZwV6/6z5NjrArAbCA6xcwykB2ixl/nNWUoMgssanvlUlg91iUm9jylXVm46NQxlvpm9HcPcwdoAGBAZ73+dowiOm0biAUyfOaOkRTEIC4yOipfVDaxvR4cus6qrtQQ2TZZJ5Xodp3CWY/9zUMtP/vmRkjm8Blurj1Bcjii/XT3a5Qb7I7K/LnvWgcOZdfPhZuSz2t5yuew3/GzVGXr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKg2RNSSWtIhpAfk/H43xdemqOWXAjbD7bDofGugy9M=;
 b=eH5ON7ZP5qC8SFMhLxIXXHGlyt4rs2l7r76qSC3wnk330j6llEQC8NhjoSQhQBNwVrBmuF6AbbiB2BYeNxjkPktsRE24+nmC2Dp8DOPw7xxDVp2vOlNEB5BWl9jl2Riw9GT9cxtAUJdvsFk10iJgWQWHDPz8mQAy4cduST5mB+u75lTMCWFRmrkzsbgpew3J04bdRi2J4VSJ7cVCTWJE48kapIcZoutyt8Edr/gwiO01F0HB9GtxrB5MpN7sxKag5YgNmCF317GuuBWo2cn35GIvhfMgj0tNYJPeGS9HDGJjCLxqQj9efrU0DdtQ+AOJ/bUrTIswq2cOIfEEXt5Uhw==
Received: from CH0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:610:11a::32)
 by SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 13:22:00 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::c3) by CH0PR03CA0346.outlook.office365.com
 (2603:10b6:610:11a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 13:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 13:21:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 20 Mar
 2025 06:21:58 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 06:21:58 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 20 Mar 2025 06:21:55 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2] i2c: tegra: check msg length in SMBUS block read
Date: Thu, 20 Mar 2025 18:51:44 +0530
Message-ID: <20250320132144.34764-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SJ2PR12MB9161:EE_
X-MS-Office365-Filtering-Correlation-Id: 36af7b43-f36c-43ef-71f8-08dd67b23227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?umgO9UwW5i3ok+knF+pPP1gqPoFR9PJnxKYk656Zi0+W9/Z9y3YR4EnrMAsQ?=
 =?us-ascii?Q?ZGHfSBeJFhdWOG2K4lYN6Jh1e1ihj//DqXQJuUP0+AnytxYgw8wECNaz5CIJ?=
 =?us-ascii?Q?qwv1TkxL+nGIk9CW1rZGWDsHiV3pOB3ApknGUB2za8hiLKtisGPRqpUQQNuc?=
 =?us-ascii?Q?HsTiEylW3FExblCJHfXGpvTM25bAwAjlZW6sYVDyeE+gUq2kcGKgw5s0Egyk?=
 =?us-ascii?Q?Ohi2kYJqyDXDF7iRuF/PII6VuZpRvOdbDkeZ+bLDgMnXiQhZb6nrx8QFhi9n?=
 =?us-ascii?Q?7Cohzf5H26cgkq5ojswA5WBWjUU8p9e1Bq/cpeOK4MMLaEDB8r43w+KQ1jnt?=
 =?us-ascii?Q?VoLTZb+5ra51QVFpEpL3irTeUYN1x/kdS8uCosptfCeCzkarMQgaX+s+XVKb?=
 =?us-ascii?Q?q0g+gc6J2CxuuYnZ1ZeJDF+9MVprYlQi9W4sNZu/Bdke0AloPEFISfxXYPTt?=
 =?us-ascii?Q?KMx3rkvq52hdRh51iab2LESud/kv8oNwVaTsaUUSaUFA7O0GCfITMC5bb1cJ?=
 =?us-ascii?Q?EOwhM8fE2T8i0xriFa0jnnvXx6rPThk44x0PhXtJlCT4OraL25OROwGSFN0r?=
 =?us-ascii?Q?VM8VyMXmEL2WP55FnyBq4XtOFDHMSxBWuGU+MRjO4p8gFR57bvvyzDPnBsqB?=
 =?us-ascii?Q?EmKcNDc3WRJ+fy3ds61iN0TUiW5sDNkk+leNojHfp/QHB6tWNdWhaGK8SgF2?=
 =?us-ascii?Q?1jGC0y+xI7WbPuk1xuaDawrRqPuD268/34VrcO/7VQAKrEWXMedJzM08/P9Z?=
 =?us-ascii?Q?vDQ7Lw0ypJQSSAXGvUR597TqID5z4/HR8BuXa3tXdQqs4e+czFmPchlRmVZc?=
 =?us-ascii?Q?LjxrV8ZdAPFjDsxBPG0G9A+VRRa7bE7MXiZDg3fXlkgyIcfSlKI8S/y071iK?=
 =?us-ascii?Q?CbVHpO0rUTZs6mnsZQVo879+Ks+vm2sBDqKMFJrMw7RdhuPh8WAQu0Sho0iX?=
 =?us-ascii?Q?aifIB7xVZkdEISpYFG61et5jkvROytuykd37A+J9iL+dm/7J5m8aRYTo9kFy?=
 =?us-ascii?Q?SOisCSHX3UWAAPXiv1M0xjxxyfnDvbpHHkWcY8Dt0Skw02GMIebkZpTHVHAR?=
 =?us-ascii?Q?agqdfpisyoA9Ae13SrjnnXTFdxOsD0C746WY9lfJIWnY82aKOwW+PN0cz4os?=
 =?us-ascii?Q?dwjCgak83olW4aAlYqNLHk3Bo2aiLrkjhPV+AbJMy/czEZP2JnjAn+Xc3v/D?=
 =?us-ascii?Q?wtpp6KiYfNNDL36/1L42nAZdvhAzGqChlcCp67jeOPFk9uXu6HMv3J7iNMa9?=
 =?us-ascii?Q?jorPQokBfXSBqHakeTt9w0CougghWyUPWAaqOVf/O0XHikaltxIA4e265dMx?=
 =?us-ascii?Q?PVhgLJdZEBW0t0uMptQos5OYH9acnZi+rZr3F82YUVAqxUVJBA4aRhlpqUCl?=
 =?us-ascii?Q?Los/y4iM8vCZHglmCLzKReep+fd1JpK2xtVDj1YsoJhcbfmv33eAmiyx/vtY?=
 =?us-ascii?Q?QJ+XkNnuYJlC0Yq4ehThdzN05LqR9ph8ICEfW/CDx62CBLF7+x65RI1/76Qn?=
 =?us-ascii?Q?hGX2ilI2bzS+Xho=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:21:59.8513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36af7b43-f36c-43ef-71f8-08dd67b23227
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9161

For SMBUS block read, do not continue to read if the message length
passed from the device is '0' or greater than the maximum allowed bytes.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v1->v2: Add check for the maximum data as well.

 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..049b4d154c23 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
 			if (ret)
 				break;
+
+			/* Validate message length before proceeding */
+			if (msgs[i].buf[0] == 0 || msgs[i].buf[0] > I2C_SMBUS_BLOCK_MAX)
+				break;
+
 			/* Set the msg length from first byte */
 			msgs[i].len += msgs[i].buf[0];
 			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
-- 
2.43.2


