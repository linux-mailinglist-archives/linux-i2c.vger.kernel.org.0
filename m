Return-Path: <linux-i2c+bounces-13408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B34BC363D
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 07:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DF9C4E71B3
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 05:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E442E9EB8;
	Wed,  8 Oct 2025 05:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ikawT2kf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8E61FECAB;
	Wed,  8 Oct 2025 05:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759901761; cv=fail; b=pNXF6OT9qCQ4KhV7ad+DTe5gQXN7hXme5Gdr8AyCeR3ankfbd1vZi2MPTEUPOMAsoi/1B5eM6az5zT0+yGmtDZQEsvRSGtP/rfzz2+m2sf2QWmtjJxyn3ofQFwWCOdd89/vn71ZqfHJ9ScsKBk1BJL+XWLAHIJbrLI79bolChdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759901761; c=relaxed/simple;
	bh=6lCdlkGb7QBCfjV0ZibuUfipCNWgV8P154ZfEWVRksI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtcg08lLoCgJMElCG4ELkgUmi238mAGGjppGL+aiC4jaah1IxcG0MRtcAICRlOgeLw8bnHk7p2po2HeOjmd5v4hxuKBmnGLIpOUYvJdMp5tLMSsIDx1dH5lt0Ca3JbhoFATEsW4bmP4/+v46BiK4AcVE24ab7P4HkK+yOBdRe8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ikawT2kf; arc=fail smtp.client-ip=52.101.193.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duXqjWBOxAqEuvvMXvTnZKRubbUY/q0M/aftHIrsZZUtmBy80b0ghGiXDmKbT4780MTp4a0yRT/+YjzXJ57yj6R8Z8MO9/TcsZ+/Tegd2TTJhqPyZW1QjVuy0h58nkf4uyReojWQ69pzBccc35NoF1iJ9/wOpGgeEg9VrP8KkLbP0GqZWnvgMZB0h4JQUlIdvry1veZZEA0fZSAU58P71QvxUTkCbGuAOxCV5Gn8sdMdIgpfF/5dYHEn+34u1lkFa/FIbYOhMEIYbW9put+mjNnChqpGMRTBcLjBP9KbvjHeKmfFE1qhzyJza/1HSZRoKGlgK4gHBDenrGSgIXM2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OZ90+ZX37DeXcqwOCPmuy0RFsSkbVyH/bIzYEgkgKc=;
 b=IFUAkAfOMttx9M/TG5MP6RFS19IbAJxcOokrX+I+hEsYQv8XcRbGrvMC+GTJZn/qLTGfqZDUO+vwO8UR0eAP1eSZh1S6IwPMRlHOVknXnqg5x2hyAgJX2ftARl8x0yiXyHuyYLpzEZFAHn2bc0fR7ht5N7a+CoHqrcTYEGnZ6oeNXABpymkbxkMrF7uSBuFGtn6BW/PegmKbPR28j84AdE5Uj1j/riMeSWrcTMi3c50/iXKlX3Ebg6mSqxjDesMsZ4tjW4a1ws3U2Niel5yGkzIuWWYX0LTtzOoCuaAAJiqlfp8H37V6XurvDYTHlJLxP1A0NMzNLkix+ZLIm0q6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OZ90+ZX37DeXcqwOCPmuy0RFsSkbVyH/bIzYEgkgKc=;
 b=ikawT2kfky89dv28L4ZTn5odLgC7jiTyHVQkZZT4l6d3MmQWZRe++YsRgVLsEv7GavdVIilZiqycqR8c8EFutfI4gIzZCIzsNIxzNj6pSpvnI5sIEVq7IaQUPOQd5EDOtHjEutLk9xqpgOe3gBG6y4ZfmjbXZxSKlvysEOHpKRiMRGQRRNZwLPU5t58MxbD3pXTd43dtirD+MIIsQeGNURtO8w/kFAhwOevwRGdVPfInc2G+jqyh0EfVp3l1oa1E78p5nNXq1MqTQd18R9Euml2iD4bPEJ5C89egi+WgUIvhjZM28ttiDQhuyQB5DAX32dP2HcY+3PoQfOplCjdOvQ==
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 05:35:49 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::36) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Wed,
 8 Oct 2025 05:35:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 05:35:49 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 7 Oct
 2025 22:35:35 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 7 Oct 2025 22:35:34 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 22:35:31 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <krzk+dt@kernel.org>,
	<ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>, <treding@nvidia.com>
Subject: Re: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
Date: Wed, 8 Oct 2025 11:05:30 +0530
Message-ID: <20251008053530.27253-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <91da537e-01ea-4b51-8493-8cf88d64b435@nvidia.com>
References: <91da537e-01ea-4b51-8493-8cf88d64b435@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 21382ee0-9f64-41dc-3d08-08de062c89bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?485pXdGUxAMFexEM+Ff1NxEXdkLDQByklaixKz57LYhxFXN/HiTNvh3RFi2o?=
 =?us-ascii?Q?nQIS12p9BFhGsj7JayhVSVsvMgekpRspmr4yzKoJWs2U9F2NddQcmqZXgmgx?=
 =?us-ascii?Q?7HYuxHSiKwqn7H2aEDxg+3GtGMlhlpiU904bT/fX6WdX5/kIpGoBe6f85I1R?=
 =?us-ascii?Q?eh/K8XdzVfTXlrRde4XDl35jLLdTugJrPrWXs5RfJmGrbG+pWRkMblcRBKRj?=
 =?us-ascii?Q?ZVCMz/9ojruapCGsgFA7V6IYCg9VVoy7hikiWCinAhaXzMtwP/1vdK7gtqmG?=
 =?us-ascii?Q?TqmlOWgGOIarDwfnTaHlSty1uqHi+5o5RJdcy1Tjm4AGTW3NxiGdHghhcGHB?=
 =?us-ascii?Q?AXYoBLw4rYWgRLyXZiGgRJxSgb9wbmuz4aVKArf875eAQtrd533VDE2VJ3/c?=
 =?us-ascii?Q?ZEw3LKlhl4way2iEm4a2H6zM+5QzEKQHnhbfiaUeEhp2lDeiqu7JdsAvWt82?=
 =?us-ascii?Q?jTEo/nKlBE18SQXU4FFlrB9UKA4OMIxvXapDsJ7+Szfj8O3fiUR9t5B09uFL?=
 =?us-ascii?Q?c43dwvn/T9DbdEHnjT7g61M1o5pYBnAV7OjpAVu2qYFK1THVeMxOZ/2rc4lZ?=
 =?us-ascii?Q?o0bOemaWkP8XMPYmYxUb12C+mAEvawSVC93JqZjToqNeqwYV7tCLt1ncWP10?=
 =?us-ascii?Q?PYdBzRi26T4+bngmnMxWcyuyuQ5yUXnPI2N/VWsxMUARNBy/j+Yn0AaP4OTO?=
 =?us-ascii?Q?jNNxIHqlp8EDC5Oa4dqrlHcxdFmKHq4h74QKTF6jiGtdhAnGv4p+yOGY+VaM?=
 =?us-ascii?Q?Cth358qlcil744SoO7OhGnKf9N0whVdOtahZrnTRbGchsOULEXjDfnKRa1o6?=
 =?us-ascii?Q?ylxV6/Ay2GY4Viaa2egqqE3YJgRT7gAisazEq5LEUqJncfhWPRGQJgDebQg3?=
 =?us-ascii?Q?H4zbxuJ+WcqbrdrJiAyVf+ozFEkygIFytR0558eczkz+GEY5ah+et3qY53kG?=
 =?us-ascii?Q?LBSYv/k7CGM3nDkgHpl0AthUixLkv+0ozENMtwdAQIcCAcuRlfPpXpus59i+?=
 =?us-ascii?Q?qR27tMwG+IZtEqmr6FhWGhRhUwLbm1L6OYDLlYg9ETNuPZZ4OVY4TCToxsOS?=
 =?us-ascii?Q?GQx3K/WlTeCaNnPV2Z1H0hNVmZIob6n6SxCjhIFpVo5mv+XT5ktA37TE3Nq6?=
 =?us-ascii?Q?L+VHJbc7AXms96Tdzmic0ty09bR4ticGDIMMwW9VXgWwW00zF9QjJV6Xxj8G?=
 =?us-ascii?Q?yaUXGFCGQEK0tB/VumpZCOz89ZeAX9ZrTdr4T+4U7aD6sqER27Jt3VDT/DtW?=
 =?us-ascii?Q?EMvAO0CrANRWcS33661Rp7QIxEWGG9F4l97LYMhmhWXcKIfRBHr6g6k4Vd7L?=
 =?us-ascii?Q?BU7Bb7oOegITp1K6LxBOS9WLA9HQuKBZETlwtlV9c7OnqMd7ZBwItAGE9s0Q?=
 =?us-ascii?Q?KkBKa0rRE2dKL8E9fPBiHwcHBqUSrLT6kvvAc6gn5/7uRB5/SWUTfwbyubIX?=
 =?us-ascii?Q?n/9+BK/7cc1DF5ScKXF94tlVHB880IFon5LpVXYMCOZ6K+6jJvV54QhhAkWT?=
 =?us-ascii?Q?ayMdMNJeFF1ryMZ4K1IQTWR0MpA3UWNflQzYnuQ9Tu1ACh/fUM1vZQddPILE?=
 =?us-ascii?Q?2341ce336+nrsR2hsLM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 05:35:49.1133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21382ee0-9f64-41dc-3d08-08de062c89bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694

Hi Jon,

On Tue, 7 Oct 2025 15:50:56 +0100, Jon Hunter wrote:
> On 18/08/2025 05:33, Akhil R wrote:
>> Add compatible and the hardware struct for Tegra256. Tegra256 controllers
>> use a different parent clock. Hence the timing parameters are different
>> from the previous generations to meet the expected frequencies.
>>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 4eb31b913c1a..e533460bccc3 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1649,7 +1649,33 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>>        .has_interface_timing_reg = true,
>>   };
>>  
>> +static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>> +     .has_continue_xfer_support = true,
>> +     .has_per_pkt_xfer_complete_irq = true,
>> +     .clk_divisor_hs_mode = 7,
>> +     .clk_divisor_std_mode = 0x7a,
>> +     .clk_divisor_fast_mode = 0x40,
>> +     .clk_divisor_fast_plus_mode = 0x19,
> 
> 
> Can you check this divisor value? I see we have been using a value of
> 0x14 for this which does not align with what we have here. Can you
> confirm if this should be 0x19 or 0x14?

If you happen to notice, we are using a different tlow, thigh and hold
time values as well internally. We are also using separate variables
(tlow, thigh) for fast and fastplus modes, whereas this driver currently
uses the same variable (and value) for both fast and fastplus mode. With
that limitation, these are the closest timing values we can use now to
get the required frequency.

I am preparing the patches for the above changes and to align with the
internally used values. But I would probably wait for Kartik's patches
to conclude before sending this out, so as to reduce any conflicts.

Regards,
Akhil

