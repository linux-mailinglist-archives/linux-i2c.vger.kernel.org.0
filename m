Return-Path: <linux-i2c+bounces-11896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F59B0031C
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 224C84A05DC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 13:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A791328DB5D;
	Thu, 10 Jul 2025 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RpyKZLP/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF553273818;
	Thu, 10 Jul 2025 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153190; cv=fail; b=lT7FLfmBHJzcq+qlpcrcW+BF8vV1sd01mzJ2BKklYoGnwPUumIcZIjJtk6x43FD2a14kqXpci7UsfZ2ak1VuMABN9vliSqPXS0IUmWJHBn++StySorrOiJAojdoSLpGh+ZFYRDZ+2JcRArK5ed8CQ8h5TxsXbJjzAeeKfmeVqHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153190; c=relaxed/simple;
	bh=ATCt1lWsUlY+LIlGSHWpCBMLUCzuHyUkO1M60lD1Wuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5nX4N74S2NTf22ytbz+gR91tqSCc89yX+iqi5YKEv8nEKehf0oOKuc79TEOJWNnpx5GJM6loBQy6sLnpt6aialteOZuNp73dkaOB6RsFHAiHZGcqOEO5EwRi5s12KZ8+A4sRcSSpad+TJn5iQYFi2MtBFTcJbSveaVWn7jAfqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RpyKZLP/; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVJHE5QLt4ysNWJd+9USysDz7t2fADsA/6Tp3tjSBXvzI0w99KcJNKuoXRDAdbmliEha72+QTDd/vc2n5pWXmEFln99OrG3G10Ctbg+PlN6qFDqfL+F7XxoSDV684Ko4C/QAfDHI16yaiZbmvEeGU9nELW9jkTKdufPK1aw9ROPAsk1sVLOPgenowFQBHd8PYI3b/k5xkqo+zZDlb6Ltn53ATWY6Aa8sQHa6U7lx9Zw5ugwcRavPZflQ+APsnI1NcVF1aWu+d6ush+mPLQAmkQMw0LoXQNhpoXL7wBwflYczKDPjkmS5jHdvdfBmayI8+F/eTuN32KWbD/5JiYNvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNJKOj656ePdzV0JO18wdTsouN5EjAyo4C+JgPgGY+U=;
 b=XEIXuJdvBnoaYM+EIzYLZxMTSo7SghUekTCvdmwikG8ZkLPg6IWgLn8BYac5QbWZn/dXJ5Hhw8hND/5Sxc93JI90mNB4Ot6aRsH5kuBVo8Q+psFC5MvyupIQ5JYi+FdpCW/KVtSTQUfwC6LMqn+LmwgSVA+VslXK575nEQKdsZv9h6zLbksyQgydJ0mLsWZfMjVtxycZXy9S5DqAQBesbphCAQ6+RwJWAHGQjoNtT9OKz53r/wTvtlkgqFfCLjZr8DlNuUtEQk630U3Cqhf/+L+rsbV8i/ZhYf3mhlC213HWiX60Wnexft8wILiulkQ/7IIZnqbJA8moUzKPdR8bvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNJKOj656ePdzV0JO18wdTsouN5EjAyo4C+JgPgGY+U=;
 b=RpyKZLP/+OCWnUT+h7fK2FMHh9AAefkWqDJ6J/PL6ewO+XsDpsD5u4Eqp8uKYCIPxetSL8hg8tK3OhzK6f5yOoGl4FZcsfAyGbWVF8OhfIJ1nCmgDEVjpJqOKaMJfh0hMkib0JeOg6ebzcF8tn0y/G3kYmkVEhLyi1TsMX7CJWlLUG6Jxl2SCcL6bEYPc2Wot8hnFvfJnESQOdzcx6uBsvmnHEj9nOPExiXaerJ00qEtWYy2mMTboku59pPZHMoBKjmAj/AgvWZcE/tsoD0lK4PpHP3KNPQgPONfsu1vJrxgAMhYBbSedRRdopKHBWPzBnGcq30/HgAXC29re+IRyw==
Received: from PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::18)
 by SA0PR12MB4368.namprd12.prod.outlook.com (2603:10b6:806:9f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 13:13:04 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::67) by PH7P220CA0118.outlook.office365.com
 (2603:10b6:510:32d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Thu,
 10 Jul 2025 13:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 13:13:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 10 Jul
 2025 06:12:48 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 10 Jul
 2025 06:12:47 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 10 Jul 2025 06:12:43 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <andi.shyti@kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>
Subject: [PATCH v6 1/3] i2c: tegra: Fix reset error handling with ACPI
Date: Thu, 10 Jul 2025 18:42:04 +0530
Message-ID: <20250710131206.2316-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710131206.2316-1-akhilrajeev@nvidia.com>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SA0PR12MB4368:EE_
X-MS-Office365-Filtering-Correlation-Id: ef432b09-2874-4768-5099-08ddbfb380f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2qcWSXJhuAaUMmOIqQKVeu/1kUgKRReGFLyGYmXPYMxCpk/mbtUus8z9bY5o?=
 =?us-ascii?Q?kV6+JK0OOgI0Xdqkqu3PXvw/0SG0LwlvzehPrMv6nVjFJthTUHwIpa/BVPuh?=
 =?us-ascii?Q?QT7l+dyGRp+spq1Aqs5u8LPRoN9Bvr+cxHDYgR+tbbXh8R8y4HTvJy9D4Fi5?=
 =?us-ascii?Q?TFyOYX1D3vFUq0chMzeFb5Vh5V08hjf2MJ6NPsM4bnzKp9ypG5JwTnkBJhm+?=
 =?us-ascii?Q?Twt5Nmt4aWWGFVajY/QPUQxTYRf883Fz3bj/s/WqPSCokfmaz88nw6MhPf/I?=
 =?us-ascii?Q?JZ+44uTM+H+eQLBr4cfTDHMtKKkW5MOAIvHBE+mX3zMJeEtHWKXb4sXNIZ+j?=
 =?us-ascii?Q?LUKwTsuoa7LuaTqRaLbBZJGd0Df97ayjam4AsRPRZz5FD2oPE3hDiTtP/g35?=
 =?us-ascii?Q?w4lmJU2HLT3bw68UD7qxE9drAfnuydUHvTcXQX0Kialkj6hpRsZ69E/B8772?=
 =?us-ascii?Q?zmhF2mr2kMF4GWdTl47F/rSdLFY070geSlTtiXt34lPZavMm94CtTMns+VZY?=
 =?us-ascii?Q?axRAvOj2Nj+SAwogKqVMdaG13UjAJAdIxQk1NuOtqpVBMxTjENJvKCdzSgNS?=
 =?us-ascii?Q?F3YjoOwUWA09WV+ON42xOzSYudCK4Q3fT66h/xi36NAPdnDP/UmGRAJpxUrG?=
 =?us-ascii?Q?msFh/NCbmdVZ/BaXIeh4GA1zK35Hlg2eoSFLHSpvPagmPH93hB7WlYMLD+hP?=
 =?us-ascii?Q?FEuPtZa0Suic9vwTVVU/6UV1FKyihdWBWNRHSyK8s6F03U6GaB4Y917nNEDC?=
 =?us-ascii?Q?8yMGtRCxLYVPBsp7EITf4py04aiZ3rP/alnSlNP0TdP/uaGi/s6pXSz8Ne2P?=
 =?us-ascii?Q?ZyWnmDVUmgC7FmOH08oI3Cct6ezMzpjlX1u/5jkMlLhR7Hyq0fW0sJUtpqK8?=
 =?us-ascii?Q?4ilU2LCtaOu2CaFzsZn51gag6aK0B+cHjwfgf6F+JoX5DApChVTeBSxSEEEh?=
 =?us-ascii?Q?zk9A+4WBFl2tkQ/hSxhoDZX+vJ81LjAWM1rSKl1R/xUWCB9suZ8kJYfH47Gy?=
 =?us-ascii?Q?XDc3md/Kuovtij/T0pMSbPRTHqBUGd1MuMkJeEw9mYeHIU0xV+0yC0+Im/NN?=
 =?us-ascii?Q?78dMhdswImiI2DQp6Tg+FIxuYYE6niJW6EJZXQaK6sQ/D4VguZdUjw5n1qhR?=
 =?us-ascii?Q?CDsx2eY232BDcx4zbwTwxq18YnNUF5TcyliTRgO7iVuOolfLMVGNU2aEs/K5?=
 =?us-ascii?Q?qmLmL/y/RTblP6UOK8ittnI//kApWlPW//7FCVuAhCip6RFIX6GzTWchy3Ao?=
 =?us-ascii?Q?nAMfW7cNEd9ct7vXMPawbEUeeeG00zlS4PGwPSUgks1rlam/96aGykxAYIw8?=
 =?us-ascii?Q?6yXSUyr5W21EbsMRLop8pbNQWIMxp8ulagKzwDlHUo0snKHT4eSGu9znUP+1?=
 =?us-ascii?Q?EWPO1txrb/BbzeBFA1RWuEgBmSGvG20BtJt0rjicgZOymqXYcms8Fj0jRAqi?=
 =?us-ascii?Q?kmnjrdsQT2pPPTL6Hi0MYaLnlYeW+/shCg0a5SpUpc5c4LgahdtvyDYN2MCV?=
 =?us-ascii?Q?H0h/L18UD5Ce84Ds8IoSrZoH28FGQCfWEvetvCZbSE8GjTee1CEi3jRJUA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:13:03.8685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef432b09-2874-4768-5099-08ddbfb380f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4368

The acpi_evaluate_object() returns an ACPI error code and not
Linux one. For the some platforms the err will have positive code
which may be interpreted incorrectly. Use device_reset for reset
control which handles it correctly.

Fixes: bd2fdedbf2ba ("i2c: tegra: Add the ACPI support")
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 049b4d154c23..687d1e608abc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -607,7 +607,6 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
-	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
 	struct i2c_timings *t = &i2c_dev->timings;
 	int err;
 
@@ -619,11 +618,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 * emit a noisy warning on error, which won't stay unnoticed and
 	 * won't hose machine entirely.
 	 */
-	if (handle)
-		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
-	else
-		err = reset_control_reset(i2c_dev->rst);
-
+	err = device_reset(i2c_dev->dev);
 	WARN_ON_ONCE(err);
 
 	if (IS_DVC(i2c_dev))
@@ -1666,19 +1661,6 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 		i2c_dev->is_vi = true;
 }
 
-static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
-{
-	if (ACPI_HANDLE(i2c_dev->dev))
-		return 0;
-
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
-	if (IS_ERR(i2c_dev->rst))
-		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
-				      "failed to get reset control\n");
-
-	return 0;
-}
-
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 {
 	int err;
@@ -1788,10 +1770,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 
 	tegra_i2c_parse_dt(i2c_dev);
 
-	err = tegra_i2c_init_reset(i2c_dev);
-	if (err)
-		return err;
-
 	err = tegra_i2c_init_clocks(i2c_dev);
 	if (err)
 		return err;
-- 
2.50.1


