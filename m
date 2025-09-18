Return-Path: <linux-i2c+bounces-13045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38437B844F5
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 13:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E01EC3B0C1A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 11:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B214C2EBDE3;
	Thu, 18 Sep 2025 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kLDA9qef"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012061.outbound.protection.outlook.com [52.101.43.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43171CD0C;
	Thu, 18 Sep 2025 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194186; cv=fail; b=kErD6Z7BxSqfBvxhMXVdx5Tnn3LSX6D8Ti1+fm4GRTmBgzGV6Spq0u8FTJetKqcbYUMliJ238H660VZ7PqATcyB/yZl1jSdcoCX6BVdBVNyR6uEv2vTx7WDLOqatSE3Kb6faLujc0WAUs5YmW7xI+0LoQYh7Lr10KTf4QSH86ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194186; c=relaxed/simple;
	bh=Wbov4L4R5beMZwVFAHpMZS+KASR0tJDLs4/77mPYtwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLc8I+MoFjouIqpm+gPSuFaFQljrUAtPl14n49ua6jAdTo2xbBccyvw1pyEZf20E4pBYLBywCXMt+FovG9Ri5g+uGfFB3JLFjt6DaX9Nb4Toap0AYPp5S3XaCZbKKa/c2DSkvKXCmzTVk/ixruc2LPf1aFVqC+DuyxfxvBM+dsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kLDA9qef; arc=fail smtp.client-ip=52.101.43.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIGr2+2Qp90sr7wwl+gOJKE2MRQMsmQ8YVSoclEu0+D8uoGxYWVBmeNbkQF7XCOQox81h/qZlx2C/swsSh+MKY0kEbD/NSxjTj9K1EsV7sgp+WneH/pB18oHtISIkSqH8srHvbKuDqIEL0wm6XQuS7O98NtF8V1pW+1aRXGeTbXLw4rnj7PTjlxLuGBwaUKmPPb8hH6tFY11G1cX+fkge6xP0LZI+YA3uSWU7IH8RpD4BXSsrRtRHJvs7+69rxn3RvbLn77QvfNgJqEpB2lu+pk3nPAoJD4eFPBsrfZDZVz8AY/UhVdHSFKWzrGefteQGBd5WblP5298pbjL4SpBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oORFPCqiuWeO+r/kIGi4cdJQv3yJsJ5zduTzpyAgaUk=;
 b=WwCMgMaaUeCImu846WwEB8UWhOHmWt7ukyPGypH0bUtC6YKBa1ITdOyUQOBRGGR5GyZET7LpYVSy1s6qpQN753Q79e8HR0LfMazGowTE7X/WpS4C9wGgzMjNmI4NgbQK6DUWxKMYPKYmv5nuro+4bDfl+Bmch5E05E3q+U140DUzJRpGkHrmUh+21YutUUWCSoRwualOkzXoiU4GC/aeMAkZXCcyZbEPWiPLtKj4zT406U7iCuB1Fz52ikGU8z28kBQfzkhzaGU/8VpNQddEXdLCwTQr92Lh6JSweKZ9z+TrneRag+h1X3tL4XK4SDFU9c/9gU9lZYzhSgIGd/LLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oORFPCqiuWeO+r/kIGi4cdJQv3yJsJ5zduTzpyAgaUk=;
 b=kLDA9qefuKK1Qrz8xdEnmU+mKW9YBFIZPddnbH3DONY4sP8jq1Pp8tcJC5N7ODPk8k4Wu1e6Ppoxh2cqNx4+3byEvy5hyQPQ0pbyrFpV6wadiKklfJvhpNoa3xc4DVMIxW/bxm+jiOdyaqkINuhvT7BfuEwELWKAnA0+58IeDiudl8J4Z8dBRpVmDEE1+64rIecD7KKOLujSDQiWig35Rne5RYOZqQtEpGTQy4EzktK4/VEH/+NvACmAV79DhorHrdxkXDY1N4lWAFdxCWraiU0rmWG1glJlynxBhmzaoEWhEpugxfAi5obEG3vxu2SNbPQzqAbdiNLBwYV1bnM+iA==
Received: from SN7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::35)
 by DM4PR12MB7743.namprd12.prod.outlook.com (2603:10b6:8:101::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 11:16:21 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::f2) by SN7P222CA0025.outlook.office365.com
 (2603:10b6:806:124::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 11:16:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 11:16:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 04:16:05 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 04:16:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 04:16:01 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>, <smangipudi@nvidia.com>
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
Date: Thu, 18 Sep 2025 16:46:00 +0530
Message-ID: <20250918111600.25189-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <af2462af-5b6e-4eb1-b1a3-59ec5f96f1d6@nvidia.com>
References: <af2462af-5b6e-4eb1-b1a3-59ec5f96f1d6@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|DM4PR12MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: ddaab9a0-74cf-4eaa-89b1-08ddf6a4cbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TvgIAYy1BflJ4/HMS8myfr/yBlKTIjDy58daHBCQp3BcWnss+/7BXp+XYfg/?=
 =?us-ascii?Q?XU5iflTNQKQx10/tJ2zNkmx0gi1sXzZ69yE12MUgfCtRDP6YKG42G3Ml1Z8k?=
 =?us-ascii?Q?pUKitUHy69UVH7VHcsk8RtFTKhWH/EzzILljQl+Vto20gU9dTETs3xVzM2pY?=
 =?us-ascii?Q?talYI9WOgAaHkJPmTiLo5bmhminMJd71Bpzo0LW9LyRLZOMEvWx9cceW5ovs?=
 =?us-ascii?Q?5arlFv07lNGZQMn2+IxbCGgDvO88rpa8vy8Qk/3pAIDb+9OAHq4Y4oLl+qmZ?=
 =?us-ascii?Q?Mv9mQ9S1VHlBUlaWZUOoVD0uZ3WQ1Np4vr/Zg8RFAzl6ikr/0nFlwE0CNzWb?=
 =?us-ascii?Q?Pqnh/f2oCh57FBg0HQCq6vLO0u7GHTebebbPPf3hDMW2bNVcLjsNQjRlcve3?=
 =?us-ascii?Q?N3H6CBVRHZG3kCYdJlQX+OYRvhuEzxSu4rkbq/XJ9smrmY+0nyeD+bAGZD+v?=
 =?us-ascii?Q?1z1UZGzqFqp80KAKQtNn+20qMcW//cYSCwR2K+nmPHrR2CWYKSoNjGkdI+t1?=
 =?us-ascii?Q?mkTlu3LE0gK9XPU85sLSA7OLXwD8vv9uyAEfAo5B4+69cRAHU/3nFomSY93y?=
 =?us-ascii?Q?jnQ4nhy+t8NI0mbRROpA4r1xe79HJ17/oBEHEHlkEi+m9roJJQWVBBPwJsjP?=
 =?us-ascii?Q?HdvgzPEuD7c7/ZiSSkqzzt/r5Vlt63vCuJXgvws7Kw8HSxrcLAxDzLnOC+fo?=
 =?us-ascii?Q?MmwreXsmTBXzBqVTt08ogQliSzb8d+rVNolThNuNWx99vh4RIrLnXOjy1XIx?=
 =?us-ascii?Q?kiBVu9oJfn8W52ziW0AZ+aaJqq1eqrq/a8v9prGKI3HGApaKR6+VMr/MptBP?=
 =?us-ascii?Q?HUSo6XmAUz+oQusf37WIQm5eS61JAgiwZcKitjy6g4TKmsP+jfME59f7/hWM?=
 =?us-ascii?Q?wSh5lmTb6E4NkS9uuOBUt36Oemy/tJtVABzVHKYtuapfH9YnwRSy7ufEvOIf?=
 =?us-ascii?Q?RF4+3qpHHoES2UYZu++BmMMPfJnCk6IeAT5zxUT/c2HUv+0RrksqOzbXdQ/v?=
 =?us-ascii?Q?+EdeuaL+UV+zfZLYbp/FWHmwBT3BWoc/bQzboUOZke3oizJ+rbrWqIKppsBV?=
 =?us-ascii?Q?r29XjV/0PHXwmntxI0oGxSWcfvnO9w4NkWX/ecHx184EB90V+6ScH3c3IdJT?=
 =?us-ascii?Q?C1kW/OeA+1BeF/rrBxGAiN+yflILaPz38r8lIlwIhFdl1UnyxHHc3cdou+1d?=
 =?us-ascii?Q?So0QYyhRq2lxpYTAPpdFb3ZpJGYgqygBiWJ/4FCmtyqcV58j1pVuupFffZ4N?=
 =?us-ascii?Q?gJQmDN71FXyxu0xUgwdKtVRXNBN04xVuiStdZmlYdFJCKl3rQny4VmJWZtTX?=
 =?us-ascii?Q?ZEhl5qK2ZXEa+yOjviszi+ikIdtXC0KvVfEUGBGfIr+WporLcSEHaQ5V50Hj?=
 =?us-ascii?Q?xgvit4AXvfGR0Tl9GRkt0H8D6GhmX9Qq07S90lcfxasoVSjn0O/GV77XuBrK?=
 =?us-ascii?Q?ZENfU0USMHGI2CZ1O3qBJHo7cVwIpO+Dx5NpcPmEkcHnXofmsGJv9lI1Tj7W?=
 =?us-ascii?Q?eygzTe3VTiicFB9XbM0AaodMIXMcnXf7gZ7Y?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 11:16:20.7485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaab9a0-74cf-4eaa-89b1-08ddf6a4cbb0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7743

On Thu, 18 Sep 2025 11:21:14 +0100, Jon Hunter wrote:
> On 18/09/2025 11:04, Akhil R wrote:
>> On Wed, 17 Sep 2025 14:59:54 +0100, Jon Hunter wrote:
>>> On 17/09/2025 09:56, Kartik Rajput wrote:
...
...

>>> No mention in the changelog about this part. Looks like this is a fallback.
>>>
>>> Should all of this be handled in the case statement for t->bus_freq_hz?
>>>
>>
>> HS mode timing parameters are programmed in registers different from the other
>> speed modes. These registers does not affect the timing in other speed modes.
>> HS mode registers being used or not is determined by the packet header.
>>
>> We may also want to program the regular timing registers, because it will be
>> used for the master code byte to transition to HS mode.
>>
>> So, I guess, even if we move this to the switch statement, we might end up
>> doing something similar outside it.
> 
> 
> The 'tlow', 'thigh' and 'tsu_thd' are configured under the case
> statement and so seems logical to also configure these for HS mode under
> this too. I see that there are different timing registers for HS mode,

We are just reusing the variables since the fields are similar. If required,
we can define separate variables with _hs suffix. Do you suggest it that way?

> but right now looks like we are programming both the normal ones and HS
> ones. Do both need to be programmed for HS mode?

Yes. As mentioned in my previous comment, the normal timing registers will
be used for the 'master code' byte sent to transition to HS mode. We need
to program both for HS mode.

So, I am not sure if moving this section to the switch block will add
any benefit. We might end up making it more complicated that it is now.

Regards,
Akhil


