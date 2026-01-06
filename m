Return-Path: <linux-i2c+bounces-14906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E35CF6E42
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 07:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68582301D604
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 06:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84A8302779;
	Tue,  6 Jan 2026 06:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P0R3PoXx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83FB2AD2C;
	Tue,  6 Jan 2026 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767680913; cv=fail; b=NbLQjksvgoyBBzFmda0rkHSpo10BmoYX/qdGB3rgWI5aLH3FMPLTQKimajcEsRhnUECbq+7T2zvlNSXj9spLErfeHddPa+vcbKf81dHz1CwYmc13bNx6HGsb1OqgDjyGpO6Yyxht/IJf4LOXp3U5UCaD4O8sMEGO7+xYxeXiK2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767680913; c=relaxed/simple;
	bh=a6V14ykcukKTeKqCmafJL19oXxQ2RS9olbkWOW9ikkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5s455vZb5HNCxkiH9MAV5fsiLQ4V+vpypd2fTAdf2MkOv2rPKQux481YZ3X0q7gvbgOpQD9P07Pzt0DkYdonNMnNrImjh4jnuJMTwM5S1E8i7+eyairjdIxdNE4ySWVPn6Xk791+Lm0JDKyx3aOQvaX4lMY/Bru57pQ+vOmVck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P0R3PoXx; arc=fail smtp.client-ip=52.101.56.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljmfxMp1Kuj/HSW46IIob7MWFe86/gZo761IC95p6Qx48GatqUXCoubbB+yVLqT78CHSttq4LYwA5Kx2JNvDkrTQWyPxgQxTUm6UX2z/jIBb3hETTEPj3tt00fdDI6dRjAQmfwRwMwM0ggkqnLgXU6z7WEQIg2DjOVgDF3i5f5Bf7kvonw6o86jSNoZQ3MV28ynGNsdK2yTS0hUbB8ZZMjhyFtjwRE/VIP2G2z5HafCrylxqjUzdPmaymx4QsXQFF1OqSwufpw6v4cYGcTO7HicNhw6BolEUcnSY27I/fU4nTLydaJLCh94M8rJZ2d0NsL3qLV0SpgcaWSO5NqMoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5xuXOxVWRtrHTYIB8gg3njYUnzRe5yhKdaxNtRhHMw=;
 b=Az6ivqsy3aYBxJNZiiaOuPGCZoJKdFzCPTO3g7mwQFPhtLCT70qeJQLsWdA1P6l/zr9s+SLaOccuSnL2DiX1zJiKbnthsvrd57aRYyYbQZy41SfY0KcIZQA8ttfY3Frug5Jcv++RXHnPqD/ccde3OSzfliKNzha+ru/zhDYR1/q7WGlvayrDDT/o+4P5IADyHXajfhUkB12Tg1ywMsHhvhVe+TjK5onjTAa1yz1JBBlKWokwgAse2ZT5S/LxeXEoFAwCJLPkYDAVCTtBVDqgicT0wgle/lqpPl4oU2D4TpiCG2C6flcTIP0zE+6MnSjO6rhXyw1pkdjkqob8a1/9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5xuXOxVWRtrHTYIB8gg3njYUnzRe5yhKdaxNtRhHMw=;
 b=P0R3PoXxzJ7pV7u8kA06FLKlIA7OMWk9seIY3pELXdhIjP7i4MlSrvKpA3UVQ1GswYdxPhGk/DiRwRsRSfulDDB6UJoWupAEkfj76MbBvbASs1xDogkwzoCJd/RPibOtELVAKIJVp1vJhKt0mog8GQcDh7ghCRArHiBVxvHtVBzHpPnNtg7rm8QVnyRn/+hu3MejfO5Xn5UCHDszD5Navih/CgHWCVi6i47RGHzgMxIJ+tgCZ7ToTEdREWpTQqCWHZ1mOjHm+DdPT+vjOYonx5LU8xvUUlqlyUG3DXf1kLawzwEuGEaMgfrgoNH+R5HozTklk/NCgV8usTyBZX6dzg==
Received: from MN2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:208:1a0::17)
 by CYYPR12MB8890.namprd12.prod.outlook.com (2603:10b6:930:c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 06:28:26 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::8b) by MN2PR07CA0007.outlook.office365.com
 (2603:10b6:208:1a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 06:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 06:28:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 22:28:16 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 5 Jan 2026 22:28:15 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 22:28:12 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <akhilrajeev@nvidia.com>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<kkartik@nvidia.com>, <ldewangan@nvidia.com>, <smangipudi@nvidia.com>,
	<thierry.reding@gmail.com>
Subject: Re: [PATCH v13 0/6] Updates for Tegra264 and Tegra256
Date: Tue, 6 Jan 2026 11:58:11 +0530
Message-ID: <20260106062811.894-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251219090919.14287-1-akhilrajeev@nvidia.com>
References: <20251219090919.14287-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CYYPR12MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ec6cb9-cdac-4f95-4b0d-08de4ceccc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Opz9UZVLizinNTeb4mQlaYgAboOfj/pyPQ55F9bobjokwxL8oRmUlDDwJ2J?=
 =?us-ascii?Q?CDoViSm5OAJfhO7rS/0VWqknTRm0yCzAE90QPi/EpEUO0vOwODwM9NdlqFX1?=
 =?us-ascii?Q?bVjibrZRrC1mlHsQo7lm73vpIjwrQTllgTLA7hInu/SGVsoE3pT644keBXcJ?=
 =?us-ascii?Q?DFqsKrroxzmKRpOzsS4VXE8IMSgEYvI5wL6fIwP3cj64sGz6O7RYT5jB+HY3?=
 =?us-ascii?Q?9u+K68mgludL3TbON1eT3+Bqnjkbv3IGUiBiuhtA21j9AfRkkm2WPSRxsxEF?=
 =?us-ascii?Q?2oBKPUXT9KuWnZmbNDFjzf3gIr1MYMJy9D0/sMp10EDAqiuXi7xvAG4j24YJ?=
 =?us-ascii?Q?SVGcBGm6KhMjLyLo+WAACrU7OTkZhDU8wmRI7VhPh5jXjytDgOuoRDzCyFqF?=
 =?us-ascii?Q?usPz/rLJ6XQuwvndZLl+ArVEbhwHQQ0BxlZr3jV2Hp6jwJ8UqJtwimfZxTSu?=
 =?us-ascii?Q?AG4lGXVGVAeE6ofUGhNJ/SR2IO6w3fm7t1/OlsBh92uFD/KLvZs67gXVl8qO?=
 =?us-ascii?Q?i/8gAfSA2aZHXqKvc+ZrmTlxI1P1509u9qWg7MV0nZe9s64SX3rFIBueDvHo?=
 =?us-ascii?Q?aANp5ARkG7vzqzZXXLHfJfUz+r+iZeJ4nMt7/jeKm3BgRJhGcufWZOHgQ4/i?=
 =?us-ascii?Q?wyM7FC/a70wt2pbRuu7GIJyxFDLrXm/uaK66dXnfXCrWVkt3bGaAgwUdcFxE?=
 =?us-ascii?Q?JMjCsVw0JrZ+yKJvjA7ipeqRC84LeB1DWsud/jvqhsNDD8K5XK2zak17MMNs?=
 =?us-ascii?Q?jemERwp5gG6I5dC/ty9EPA8qfKIYOMYzzdIcJaac7jOhVf/ya3vGjRlVBSdK?=
 =?us-ascii?Q?JFGLTUcOi2tslv7I49nmsA10E++fFmnUi+uY3H70fObt05ZORtF2RaUABt0K?=
 =?us-ascii?Q?3hVeF8L6+PXH08l2wWwVu8WnVvOSKzrDc68xE/EGxH/Pcdp5BeX/PwGb+ubV?=
 =?us-ascii?Q?7zX9Aae2pnjFXwqYhRekwRnMguSx8XUN3ovcsvnTKUVLMwb2YuC+7cgfi7Go?=
 =?us-ascii?Q?FRP6xG9ABwly7TLlO9RHP8/nmeSxLpOe6j7gKwB++IY6ldrfAbeHNVub/YOq?=
 =?us-ascii?Q?cRQEzXe2T8tXRWornDHFidxNiQaT2r/1iN61t1b2gq4fdwTSk7nxPUSNHK7C?=
 =?us-ascii?Q?zmWfYVra+6tIIQfb9nZiw3RRCDDg9jlAd9/aC/0Qj0ROfxbWTwEUK4jFGUU6?=
 =?us-ascii?Q?aDsVNNz6iYDC5Yt26c0HkWH1nsF00diRoDvurNvJVRhu8OOOlJX4+hZIgB8a?=
 =?us-ascii?Q?5zDTzd9kFaPqdG4l3zDTB+H5mcX8yBWdnt9djggpRDP59SYjEkAhprt8tp/y?=
 =?us-ascii?Q?S8WYKPR8+3bR+uDwhiXOmUaVi3rjaILF5344JEfkZjx9tXfBUKC+w88niP9L?=
 =?us-ascii?Q?r40q/rs2i/mtpbMBukMYuv5+hM9lEIWVYqMsHqKazHkn7CiaC4KuiXYAIISf?=
 =?us-ascii?Q?tkDqaEKM2CGlgJxhN+1lXEfeZqqZ0725Ph+oiKZDUZFYPmJWsA2eF4SLEvhY?=
 =?us-ascii?Q?E8iwLxyYLrNjmN7NJCIpKEZzotvPLiiLhMP4WafC9sv7ZDLGXHwtuwoZpmvg?=
 =?us-ascii?Q?dy9f0DugynBuqYHyvfs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 06:28:25.6969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ec6cb9-cdac-4f95-4b0d-08de4ceccc78
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8890

On Fri, 19 Dec 2025 14:39:18 +0530, Akhil R wrote:
> On Thu, 27 Nov 2025 10:37:43 +0100, Thierry Reding wrote:
>> On Tue, Nov 18, 2025 at 07:36:14PM +0530, Akhil R wrote:
>>> Following series of patches consist of updates for Tegra264 and Tegra256
>>> along with adding support for High Speed (HS) Mode in i2c-tegra.c driver.
>>> 
>>> v12->v13: Update has_hs_mode_support to enable_hs_mode_support
>>> v11->v12:
>>>   * Added two more patches to the series which are needed for Tegra256 and
>>>     also cleans up the timing settings configuration.
>>> v1->v11: Changelogs are in respective patches.
>>> v[11] https://lore.kernel.org/linux-tegra/20251111091627.870613-1-kkartik@nvidia.com/T/#t
>>> 
>>> Akhil R (4):
>>>   i2c: tegra: Use separate variables for fast and fastplus
>>>   i2c: tegra: Update Tegra256 timing parameters
>>>   i2c: tegra: Add HS mode support
>>>   i2c: tegra: Add Tegra264 support
>>> 
>>> Kartik Rajput (2):
>>>   i2c: tegra: Do not configure DMA if not supported
>>>   i2c: tegra: Add support for SW mutex register
>>> 
>>>  drivers/i2c/busses/i2c-tegra.c | 304 ++++++++++++++++++++++++++++-----
>>>  1 file changed, 258 insertions(+), 46 deletions(-)
>>
>> I really like how this looks now. Thanks for seeing this through.
>
> Thanks Thierry,
> 
> Hi Andi and Wolfram,
> Do you see any concerns with this patchset?

Ping! Please let me know if there are any concerns.

Regards,
Akhil

