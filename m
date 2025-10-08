Return-Path: <linux-i2c+bounces-13414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD5BC4478
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 12:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D05F19E14F7
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 10:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D792F4A10;
	Wed,  8 Oct 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iU8rw2l5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E642571DA;
	Wed,  8 Oct 2025 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918688; cv=fail; b=c2qvi5JvAKoR8/+Lwk5v8PQiVRImSiozXaa1zJmWjeX3V/1PSoKq3cZxjqdYhjv3b29VmfaceoR4hXhy8bn+p7Vm4fgCYtYu+iLI5LKFklLRMoxI3GYayW7mocou104VHEPo+dxl42Zpsd9mKr7XMGH0xKeD8sl1CiGcz4BHA+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918688; c=relaxed/simple;
	bh=xHlslPNmEPAhClC/Zl8e/FMA0PNDCMvb9dfVV2hIr/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdXVQw8t2ZDrMb1ADt72OJZtcxNPlv4FZmnX8wqrrRb/5DU7L7cvIRCh0SlB25IRxYZO36vmZoKDGKxRlgDcBaXgTwUaczkksqOMQGyo2zsfhCVWwEJvSTuW0Bc/ef77eMDeMkYbp91G65smeb+qH3OrKOQTffH1+Jc5YFU/CCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iU8rw2l5; arc=fail smtp.client-ip=40.93.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgXfwSUeJ2zDIIVuLru4rRJ+Rtcl7qCioK21Fsgm9zhf01BQwzYJ6+EzdebPEwlvRr0NVav2mROIy6SdMe4AfNI/5NxcneJgXu0cGwzcHmGJLHhDrO8HELzYcwaP7Y9kOgkol5VCeUuKG/BBL6ct3iU/SYY2aCqXTZRlKbQfnij5H5mpkud/dlyYVgp0+QhLBbLY+CYbswu/U8FzE2YHh/Hl8t7PnEYMIY4OYQB0knFiSI1ghV7Fy+DdyS9kyNzVUXDgnzjbuFJKCx+n4fXIADXatzG9WFOniXofieFA+zcqedD6S26qz+bUYjV1uexg7QKmAQCLdJwuclfei8FwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYl6HG6/Nswz5umzvMcP+MIyseKdK4xaJHywDnl9RI8=;
 b=X/JIyKChz0Kh1EGOlMuOpgMKPHV6bJrLmr/uakc3rVNKK5oU4ZxJg2TZWgDgH+J6Avcu+tTZ4y4lA1nEyg0269LD+7ga0koDf08AyNj9PHLb8VPPNb1leDJwHcyxXZfCPnwSHLH2ZMDh6bz+HrxLb7Pe6wHttjc3x2t1DOEWsN4qv80iqi3NqFiUqtnhqxbJv5k7YKMXD3dek/DGKl+qAr86kcEsczNi7RCOTwKV7zeZznENRqmCA7fb/B6eJz8rrRleAyq1TX7Z3ZC2CkJQoyOlOd6tsVFyOR9g6kX2RKDBIZgfFm03OM/sUV94Dk2j5GoHXxbcy7rfp9FVHCw8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYl6HG6/Nswz5umzvMcP+MIyseKdK4xaJHywDnl9RI8=;
 b=iU8rw2l5o0uiNawWEC0YT/6nDAnDaee/LICE0eK8I4dl5O6DTVof6keEjGEVn4gk1OeYqPQS5RP0dwzAk69NgDEwfP5LEV1eZcL7BVreI7EOGs8PZHb5WUdz17bFFoYfpZcKhG44U/k+M0MYRtLI099AyTe2H9MeHhcFkd9G2g0sy3A/4A8uTRcICiMTJGNlGUuWdSjdnp1JZCza/Rz2FgQEvgsig2TircKjmRJ5shiRjkrJCQl7kQBNqdo7g2VQB2ppbh0c6ASi33Nt5f/KEI4V5Cjc/F+mIwVqV20xkVofXRYmMdE+1BEv9EA/2PCUy9rqGgPGsF2i1TBQDWjsdA==
Received: from CH5P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::7)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 10:17:56 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::cb) by CH5P222CA0012.outlook.office365.com
 (2603:10b6:610:1ee::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Wed, 8
 Oct 2025 10:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Wed, 8 Oct 2025 10:17:56 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 8 Oct
 2025 03:17:45 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Oct 2025 03:17:44 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Oct 2025 03:17:41 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <krzk+dt@kernel.org>,
	<ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>, <treding@nvidia.com>
Subject: Re: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
Date: Wed, 8 Oct 2025 15:47:39 +0530
Message-ID: <20251008101740.63661-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <f954b162-f9bc-4693-92a5-8ac73b3a788e@nvidia.com>
References: <f954b162-f9bc-4693-92a5-8ac73b3a788e@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|LV8PR12MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bae0a73-889a-476e-8a2d-08de0653f31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K/OuA8py+y6IePDF892l4B57rGncwMnbxygfcNNSg0bEkYzCkMcxrOsRpQjF?=
 =?us-ascii?Q?qVEuBYYJ4M+2p5wZA04bLcdyjvfVZmMPx8xLtmcsS/xSIjleQlD2KySTt8AZ?=
 =?us-ascii?Q?M4lmvZbB9qYuknG8Xpe93Cd+oP6QKjG3hyTdDqbIVhXEvu4+SDggKiNeCjfs?=
 =?us-ascii?Q?ec59T4rZBJiyq38dly6rruYlI9GD7W9zTb7Ib44qROc4Z+mcq29m2SNyBJdB?=
 =?us-ascii?Q?JOMd5ccxURD2jAKlkuqu5ernat1OE9k/YL80BoJnq0t6LgqyDjr92k+UJEOP?=
 =?us-ascii?Q?zToUzprvA4OakwB5yAhMTTQxy3FTJkJQzdnxfEM7tCTMmBkJPo4aALNJgpZh?=
 =?us-ascii?Q?ivxh3K08PbafReXdg7aEeatY4kVWnHzqQXEb5ZyhTtYSf+wQAMxTA/0Y5ac6?=
 =?us-ascii?Q?05eRaPe3In+0QAdH6eOOOwHSNRWEornswx1skaz3rtPs8Js/dRjKbDIRKLDe?=
 =?us-ascii?Q?/LVjK/haDO6cgmTY3HFkxSK5HudGki0TfW4pg4CFxMMyYJkklF6rn4ITFDnY?=
 =?us-ascii?Q?qjTfLtIibwKw0qVn1PZMex5/arivA+zFfPNgmxUtKeZNX6LbKtW+9yVs2Z3c?=
 =?us-ascii?Q?hu44yB+an6bHN8xQFXPpDB01ZG1Oh/IMh7ohkKKTVZzzYEiClywor9rAWOT4?=
 =?us-ascii?Q?no1iI7ersj0eTYpCvr0XVjvT+F+LY3aYSAGLol5+jtbEZyxccbm9UUQsFrLZ?=
 =?us-ascii?Q?u/icyMId13k5sQwlsphUieVy7+VaGdabrV2DhQanbAc5jCmw7gsyF8+CCrpw?=
 =?us-ascii?Q?A6lCv6Z5QY9aWUfhZq8X9GOY31DgBwchFAPadM9AlibsPtqiLr1+xjRyon9r?=
 =?us-ascii?Q?Cs6kdO2HNbTtyv1Yhy59p1ZoW+66yPwQ8mC0I8E1mkyCMJkgtflTSFDQh0G/?=
 =?us-ascii?Q?n5/N3cvDeyQ4jpGlV5vDNDbz6aUZTeXFEXY3AiZ4YvhYKF3xJSYvWGskI5os?=
 =?us-ascii?Q?xHF15GQ+M2WJ6vq8hsvR+S26VIKzEhElhMMWgWShV8wn11StVn4kHI4LzWzK?=
 =?us-ascii?Q?VCh7ANrUbhk0ib67cRzERch1LbKaNETnC/5uLFnDoaIqW7rtzkOhE+AFq3/Z?=
 =?us-ascii?Q?jv6rGIfz1wOwTi2fvHG8LShJY8KYbbI35+R3p47ZBXaWAwgW6e0GVc+ZDUTv?=
 =?us-ascii?Q?GOqc7iL1eWfrd5Fv0psp3O22z5hyHCRpGqfzpA3lCZqXrawJv+QE8dPuu0fG?=
 =?us-ascii?Q?NJLYAnHm36OUF53dvTw8jd/CaBXOYWh6PDpwTBNWTa1qfUJkp/lj5kLhWq2V?=
 =?us-ascii?Q?kzrOL7gxUrM4anuHUd3ML2lea/yGJbEne12KFE/7FpIkuXVCQqPyqm+WhMXU?=
 =?us-ascii?Q?6XwpD250nys+YVF0qTVhF6+dIcKD79/nDmHecUydc3yGKqn6YP3dPp2DR8wa?=
 =?us-ascii?Q?Xb5jS75eS2dmrmGMn3xgkHCSBYjARnexZaUI1zdGMxvIU3bEsS74AErjkMlf?=
 =?us-ascii?Q?02obSxcvtY4RYecI2r6xDk9qFqSxkyb5Th2etfDVmevZRj2KXdK4QRXaR5kg?=
 =?us-ascii?Q?Lp/TMTR/F1FHDt/5m052msOG4OawXvO95mki5twqQ8J/ANr68kPDjLCzybyM?=
 =?us-ascii?Q?7iWA66+9GDI8d3xktOs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 10:17:56.2591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bae0a73-889a-476e-8a2d-08de0653f31d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111

On Wed, 8 Oct 2025 10:52:14 +0100, Jon Hunter wrote:
> On 08/10/2025 10:33, Jon Hunter wrote:
>> Hi Akhil,
>>
>> On 08/10/2025 06:35, Akhil R wrote:
>>> Hi Jon,
>>>
>>> On Tue, 7 Oct 2025 15:50:56 +0100, Jon Hunter wrote:
>>>> On 18/08/2025 05:33, Akhil R wrote:
>>>>> Add compatible and the hardware struct for Tegra256. Tegra256
>>>>> controllers
>>>>> use a different parent clock. Hence the timing parameters are different
>>>>> from the previous generations to meet the expected frequencies.
>>>>>
>>>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> ---
>>>>>    drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
>>>>>    1 file changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/
>>>>> i2c-tegra.c
>>>>> index 4eb31b913c1a..e533460bccc3 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -1649,7 +1649,33 @@ static const struct tegra_i2c_hw_feature
>>>>> tegra194_i2c_hw = {
>>>>>         .has_interface_timing_reg = true,
>>>>>    };
>>>>> +static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>>>>> +     .has_continue_xfer_support = true,
>>>>> +     .has_per_pkt_xfer_complete_irq = true,
>>>>> +     .clk_divisor_hs_mode = 7,
>>>>> +     .clk_divisor_std_mode = 0x7a,
>>>>> +     .clk_divisor_fast_mode = 0x40,
>>>>> +     .clk_divisor_fast_plus_mode = 0x19,
>>>>
>>>>
>>>> Can you check this divisor value? I see we have been using a value of
>>>> 0x14 for this which does not align with what we have here. Can you
>>>> confirm if this should be 0x19 or 0x14?
>>>
>>> If you happen to notice, we are using a different tlow, thigh and hold
>>> time values as well internally. We are also using separate variables
>>> (tlow, thigh) for fast and fastplus modes, whereas this driver currently
>>> uses the same variable (and value) for both fast and fastplus mode. With
>>> that limitation, these are the closest timing values we can use now to
>>> get the required frequency.
>>
>> Yes I did see that we have been re-working these variables and separated
>> some of the variables. However, this parameter itself has not changed
>> and now we have a different value in upstream. So regardless of the
>> changes being planned, I don't see why we are not using the same value
>> for this variable everywhere.
> 
> Or are you saying that this divisor value is correct per the other
> settings we have here? And when we push the other changes to separate
> the settings for fast mode and fast plus mode, we will then update this
> accordingly? If so, then that is fine.

Correct. For this tlow/thigh etc values, we have to use 0x19 as the clock divisor
to get the required frequency.

Regards,
Akhil

