Return-Path: <linux-i2c+bounces-13286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9DBB1190
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 17:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E42EC178E67
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 15:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8E627B354;
	Wed,  1 Oct 2025 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c5g8802l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B21DA0E1;
	Wed,  1 Oct 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333030; cv=fail; b=rWuoBEazksNIHvfx+prdMmaT1gNqXRPEoKLh5f7oFtwabHxlxYR/++vWQEo/auue3CkvVj3eE6fBxf+UtkXy6j/rIV3PUbrfRVSIzIKg3iBkIBomhnEnWwltkihK8HAkrNgIsBDq6lWb9Jo1XRtWp9KAQjrzyOdMMVqAIwyvh5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333030; c=relaxed/simple;
	bh=ZMl++Ox9sl8OgLLA14a7kuB6BP4y0kba9+p4GxW3gx4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JDM+IGq64bSwzYyMxue39/spxdz7xaDGcwJD7Z5rfF9V7GlFxAEFlJ4VkRU8MArFKrSsrWWATpGny8ns7emL9ReIgk7kvracENjo6CT0Dp4R/B5o2oVGMs7/ROmwz5kZATBrDxPxaPgNhFcTJ1UsDmQw/I5UqC4yD4MGoYT9CW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c5g8802l; arc=fail smtp.client-ip=40.93.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVSw/sIP7sQNUFVIcIy3yBpBDsKw+Ut1xCMmwoATsuFx0aPRUxEuhjz3nKOQpN6OpTmN4iLvk2+4FeAubxLdcNCIYOvybAIlJbjS3eWL4ahb+T0bYGUSqzXU5SuDl/T9/PLw9Qoi/6bnhBnNl0rZ4X31CqZoS8iV3R3UIAfiqztdHftDPOdLc51Te4MzC26Bs598laWm2Wy38I5l4EOIwi1rr6RCubJbNj5nCvyiAaqZhsaHESX5D2EYC2QtRZERQJHxfiwmtpaBSLFxuyoeq7eWV0L829aAen/uW2yenzoJYC9gilf+E9A3PIc+eLF6szIm/YBkRaSRlr4p7BEQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTLbjLuSre+5Q/o9fWpoWSSeRQ4HmWQG9TBnMhAs+wo=;
 b=NJ/1V4cw9OBmGm7EfRrD07GOdHtnmVB04nYwmygMU8XI0zD7WhBXooZYhfHSeAln8OS8XAidYF3swGezQ1r5GALyhq2pv5mV7/oPvJe7j6wz/4Nt9YUk0shrD1v0V1T0HvgNN5L3jgeF6fW7ZElQRepqOL8WhrGNq6PqmgwUXK3TS9A/LhZCLrqHG+muZ01O60Bbn9dDvWhxH/SN1/dN4XL8Ko5qJVjELeFmjhaFcxjKf4sEYzMxTS7Zr5kmgj7xDBklABAVGckGATgWBYM0+E1V6Tr1DYeQinFgR5JNi3ElaLlxr9IfzX8xYNdONmjKLdmiDCgVdk3yJ4JwHC0F+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTLbjLuSre+5Q/o9fWpoWSSeRQ4HmWQG9TBnMhAs+wo=;
 b=c5g8802lPFNKtYAj9YqOPi8xbmIXKaV5ttDD3lgJDvPLqMnZrK0bAiHjHvV3U8NI4wf/QnQr83dNRFCLfwSmq0Lsp1EVtPC9pwaLvHzHeus7xfkrsDLDEvFzQoJpKQxS3hBaeUB4nc3maLLLMjzZ2+XFiMZEsQScu+Ssy1sjbyfvEEKw+fH+gCmaonQCG3ub8oVGEdJScAzlESGlBvVOdQPhsiBSK5ZMUD6TDWa2NT/QsDV9lE0NoaumgY0fRAcwozWX9i8yScp/mRqUd3zT/xym91YjrrcenbRyZTozroZCTIqeeuNTwwItBKPHqKnhBMvHYn083yUAIEFCdpp9LQ==
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 15:37:05 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::32) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 15:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 15:37:05 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 1 Oct
 2025 08:36:55 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 08:36:55 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 08:36:50 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH 0/2] Add I2C support for Tegra410
Date: Wed, 1 Oct 2025 21:06:46 +0530
Message-ID: <20251001153648.667036-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: a475cdcc-cc61-4c27-a493-08de01006031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3h3tFZj/xzcKmaXrLW2pJjZdp0YXxsrkhz4bNAkGDgFDYfPxAB1UaFpUF7wM?=
 =?us-ascii?Q?CTQmTN2I/TsEpFX53oKSDk6JbhDEX8db7C2sOahRByV/jaQVgXIfPArtgoA2?=
 =?us-ascii?Q?ICRrEzQQ4R5AFIL4Ub2sB0z0as2PGv+6blzyavgzf6aOenpm7UM35QwZe/Ig?=
 =?us-ascii?Q?MBUwOBruEwY8REKQcX94mwygvW7LlN0zIQkI5UIDlblgYaWM3hjC7Pw5d9sr?=
 =?us-ascii?Q?qoA/pxZPCiq2jdVT4bfIkC/l84Nqyip1aNKpPDeumQNsxxN8CJIliVBzDjqX?=
 =?us-ascii?Q?4k3RQDMiiLAzdOtdGnrV4dwfY+I3QdbO+3DBKtQ4QW4siFCSpoEPRg3+1Q4n?=
 =?us-ascii?Q?Z5AVmGHGnmKksPMnLl6eUKJAboNZE4gV7StTT9w63Aju3xFropKEWM5UebRP?=
 =?us-ascii?Q?zn27iuHQZEXoei0yI+pBTnqH+9rVxIwrQXHiLcqsnHnh9zki59WfcLJ3unk6?=
 =?us-ascii?Q?irJrOfSh5Hzdbp5vzwMaGyW75MBVscIY4n0gv1L7TFdN2rpH4F25kanuQASK?=
 =?us-ascii?Q?O04qO1nN7zg9x4KB9rKqiBAZJXSLaUen6sXoLVgQbvQeg33fP+GygT3qib3n?=
 =?us-ascii?Q?idskJnV9ZIk9N0CEby81t7fmmLfVbfEXJK85YjI0GKo4CAfMU5ePC7XGkIfR?=
 =?us-ascii?Q?0PNhYi9ZNjI0U2OwhguI1UZnWN4CymtAsjd72wQ+OYGsGXpROM/1URbpujcy?=
 =?us-ascii?Q?fVcfB2l/gYKvJuZfmJo9n1uYOVtL0/NJSdkH6q9Cs/dftiBP1KKLaL+7U5TZ?=
 =?us-ascii?Q?IPHghEt5z/J4HHqXE9M4GBSzKwYiDw9EGggEZAmTwxC16FfCZqRJjaRa4o4n?=
 =?us-ascii?Q?3G4QmP5qEy7x6/nsw9Swi6Amf4/zH93G4qSQvYlzdPXd5zOCMDIRuApewI8X?=
 =?us-ascii?Q?vDov7ptjHIaoyESKjkIWH+ve/W+xJRLuPdwKts4wv5UmbKcf1sSn/7Zsa1Wy?=
 =?us-ascii?Q?7XAQ/Qh8FrY9/OFZR7EBe5SDH60wXpm8KR2KmdpIgolBkFyzoNmR2JGTFZXj?=
 =?us-ascii?Q?bKHv9uICk3ojzf7d2c045MF9IWt5qatNk4HYoJGEzAC2bmE5pdAm6wTXM63E?=
 =?us-ascii?Q?McM8X/g8f5y98nNzug+THFZSupZU0+3aZBbglEJMj25mUrXPXcldLLJaZHtm?=
 =?us-ascii?Q?BcpAXMOlXoPxVCuStBYl4vU4WnXwsfpLUKzjRdhcx0BLbPdTgsyG1bIJOrP7?=
 =?us-ascii?Q?47QnJk7yDbpbE4kySoZgTE/SvBNDUm89mQeU8WYPaQjWqHy0cy36oedliqnr?=
 =?us-ascii?Q?OEF1U2L6eTO+8yJx6gH92BbQ8m4vvhFf1gBBlWIVooyajM06gGncHJkH0faM?=
 =?us-ascii?Q?FsC4EYL8S7pzMj19VYq2iQB4TAM8gV0sd1s7warH/YkFGO9UkSfVxE9tg6oG?=
 =?us-ascii?Q?r0SEs6LymhZhTOLT94Z4wh1xZFIPS6PDmS2TZyXUlgmVNZvhs50TNZbFFCCc?=
 =?us-ascii?Q?QkCo8+d5Skd+Crij8Jb19CgbOsxyOpmkDtuLDYn5h7e/E1u1O4Hoidoii8B8?=
 =?us-ascii?Q?VNIr1AmG4ksFPdYdAvDdLooaho764yIjFSu4YFNhVXfrgXZm8/q/N149beQW?=
 =?us-ascii?Q?vQIyrVfqixvlqcI/fFEpKdDDlAZo7chvvcVL+ZTvqBxgM31fCFkX7trMrhJ6?=
 =?us-ascii?Q?CA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:37:05.7395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a475cdcc-cc61-4c27-a493-08de01006031
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Please note that this series is rebased on:
https://lore.kernel.org/linux-tegra/20251001064759.664630-1-kkartik@nvidia.com/T/#t

Kartik Rajput (2):
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 563 +++++++++++++++++++++++----------
 1 file changed, 398 insertions(+), 165 deletions(-)

-- 
2.43.0


