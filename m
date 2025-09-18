Return-Path: <linux-i2c+bounces-13043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C013B83F54
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 12:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09741C051B1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 10:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B252826FA6F;
	Thu, 18 Sep 2025 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jvF5S1x+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC2E27726;
	Thu, 18 Sep 2025 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189919; cv=fail; b=jnLx/NCOInQNkoiPgYniZwOr6tKgBnuYLhlBST1U1EhCuV/Zu2H6BxdFWDj0cc9cjVgwXegZQlzwvWZRulb4iRQW/WOirDp9S6zV0XsvUD/UBm6h76Ez3TtVo5D69BAzy1w9hpaLSlMs7+YB2ce/bnFR/jTpGjytvsZnmjWpC+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189919; c=relaxed/simple;
	bh=VMyMQ/tIcB77stZRU6PX/dTkgUcIsOIRCykWvL+AisE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkPqZnp+7T+ejZ0pVbJbj+aDOjykgEcSz9YThP/+9bkrwYWIV1GpizLfxYbMvC0hvLUmX2IDhjC0h254ZpAIRI+axiK0VMQUKlj+xFjkm9h3U6qz8F1gxrxbQqHzsliyLLgmyuph0acxtPuD0k8UqnUejtsEUQOcrCTcXWl/P14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jvF5S1x+; arc=fail smtp.client-ip=40.107.200.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyVHvQkLo77S/O4xjUKC/qi9X3ln7iCs4expASJSgZKUWWuBp/GoZ07Brc8Nz6HZmiyIZd2tl57BHMdekHEhhwBNMA7M5WGA4IvLvAQ5nQvDGJXFYe1JvnRj31Pyx97WHMA+bWuzxAhJXN0tfQnA2FfpB7YMTtv4H8pXwmpN5u/tueYdxdA4FGkMFE7rQyWdxvdggG2HJptjF2j5BZ9GT3DCnsN5jdKD7YKOlauq+70DHGpD/AOeVwWT+C48z//jVw4T25A9+4PnWmx3DZGgQWmjULVqNMknVuNJ1qALfhtHwMjCvuu6i4jOsyGOdIpiOwiNiv7xu0nY7HDeD4IapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0RLrzrCypvtP+zyPytpJY98uTKz1QNS8ORboW1M0R4=;
 b=OSTSWrS9Qbzu8gX2gSQHiBH9dKuJfleo7VoEq9rCz7/tq/dlSoJiPq6XGsbdmaybvyrs9lpYsKz5behixsS1BWUwAVTi1iK+6Bo53Z29QKr5lCYcFV05H7LAZVkv7CBLb8s8TKOL14QfvoiNCaNdcz/N2xLt0p3zJRyzkUZxcaTXwGrLdgT7ZDnvXCXZ6UZtbcVRstbFu7ulvvzmoCb7k5VMJaHgPta0iO1yujpYEwMKq5BMcSbcFMJmPRpwixa8NmnUKj6kWcI54+JNRA3pvkB78TbKEs21I4xuw/0btBsZ537p42MPKK4wkQiUJsy7yu4pZsBCNLQFkVd+Qq+K5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0RLrzrCypvtP+zyPytpJY98uTKz1QNS8ORboW1M0R4=;
 b=jvF5S1x+6sreyyJbG2O6P3dYG1F9xKecSCl2gRn07QDA9WY4FmLGmct4sz/OfDNdlv5AWVm/9VsvwH88STXIRnfWpNTD+VzsXhhZwme5g9zwU5s2Iq8m2MYP+Tqy6JnIRs3dDmDbYQ7GPOScSXphzQLgQULptj8eas9238LXAH3MQ/afYIbBTR3ICft0X8x7kX+MPzfTE9+eWDytdpeVxB61DKubLfbUI48HmL0RLDh8Fhs4StvH9/znS4SqCGNdyt9QABvHUbP7/lq6lxPAxf5nugfFwKJxODoNzWO7LF0F0a+SgnsPuYwC6pDqAC0CA8vOK9oUB8a6ptkn7lMtng==
Received: from SN4PR0501CA0053.namprd05.prod.outlook.com
 (2603:10b6:803:41::30) by DM6PR12MB4186.namprd12.prod.outlook.com
 (2603:10b6:5:21b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 10:05:10 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:803:41:cafe::fc) by SN4PR0501CA0053.outlook.office365.com
 (2603:10b6:803:41::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Thu,
 18 Sep 2025 10:05:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 10:05:10 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 03:04:57 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 18 Sep 2025 03:04:56 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 03:04:52 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
Date: Thu, 18 Sep 2025 15:34:51 +0530
Message-ID: <20250918100452.9478-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <bceeb247-a8db-4ee7-9c7c-ea2f521ef376@nvidia.com>
References: <bceeb247-a8db-4ee7-9c7c-ea2f521ef376@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb6e8cd-3c51-4fde-2913-08ddf69ada3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qO4udS1lJxLNbqSOTgsOyuqpqf7G9ke5aM7fsHo9abNlVrua5sqLWRXtdemT?=
 =?us-ascii?Q?P12ttTI0REyeDSYzwT9gQiI/0ffMTLGuznOdJ6Vmusfaz5uuhnwTRU4Rc18J?=
 =?us-ascii?Q?ZUdxOfJfsw3cN4eH752F4spiculQknaak29xVYhPiE0V9vI1tjiFapowUZsg?=
 =?us-ascii?Q?zQM4swYvpAyicxz1t4huezWZHlLig0LmwOPwOEsm3vmvJjpGliUfkKrhwAFx?=
 =?us-ascii?Q?brXWdL3HNQY41om0BKyCjFcaZkXpkhv9bIZ7aSmOc6mQJ8VtiFR+n9DHD5pI?=
 =?us-ascii?Q?QW19nS4iqk8NYFzDiMk4N6gto7DinSYP13ulMdVA2RlYYDNdUrk+rtJxZ7dw?=
 =?us-ascii?Q?v4OACC+5kpq79wb6xS8ESjpa6n4pH2mVTNhfuiXo9RcSC37dBGs6zWftr5PU?=
 =?us-ascii?Q?0kPXPVS+bW4Pkg8AsOEP7jRRjxXdcgY7lazH9N5Lak5JAUO4vpyuJTrAFBks?=
 =?us-ascii?Q?Gu31QmYTH/OiXegLpD1EGoWpZcet1tezazzXuqBSQF+UUS/nv668E0X3s/be?=
 =?us-ascii?Q?/6bnpdUd4NIerxBmlUqGE19zUUWrW6VlS3nGjGpnreVdb9XWdZ6W+MtaxiAH?=
 =?us-ascii?Q?P8juCdTKGZRkSySxg53Eg5JVwHV44hWOTwDSQCaXi/+ZZ+irR10d4F2q571m?=
 =?us-ascii?Q?0P7V6bFqL6iOet46ZEbYlvWVR8wukHkgripLvWHb/HGru/iM/dWAdnyYW1aa?=
 =?us-ascii?Q?Hp+IwPnmY2rKQxfvxCBxg0IUVwS9orFGMK4ciChYRCpFn3NHRIIsskruvJZu?=
 =?us-ascii?Q?tJ7QdGmiaQneXVEyUMyuqY8b3t8sjudE96QA6AtTgQe/TKZyPP7v2Ew+pGEo?=
 =?us-ascii?Q?fBDpoGbtfvFVtdVpur2Bo5AEJSpcG/UwgUiCRhVpkqOWP/pE7RhvJaJfku/5?=
 =?us-ascii?Q?e961e7/w5utdgDB1b7q+G6lyE43/6FBXDfsFnCfosDRO4cGXug+J+2M63eoe?=
 =?us-ascii?Q?CMTz/MZlRj1XWJ7qLHMAnWGFd2qSE0vmiA5ysj+AYq5aexcPelAtht8ii02p?=
 =?us-ascii?Q?qaYh0VLgv8Skz82zqVKf30mfoILEAJurScoTv9YqM24iBoUCwUOcNxTyl9vy?=
 =?us-ascii?Q?QL933gBlP/H5KYXXXAtpedFJSbnsXtJe2vdduzPpVanRvxzvjEJhD+h7Onbm?=
 =?us-ascii?Q?9F7u559sU9Ns+rCLyloXzBTMMGxkHJ3R3eNcmj0L/AF72gRhp5j1WHjfFj7S?=
 =?us-ascii?Q?WUgpDkmDkxlQ2b8ZtR3plqBQZb8UR7UqHmOYkrZ1YUpCycXQSfLGyAH1G4qX?=
 =?us-ascii?Q?Yo1+VAm4oB0XKTTgNNen/kk3yr82aKDqZpwmgFnbNFyHyYeSkiXa2wIS3OvZ?=
 =?us-ascii?Q?uCReOfdToxWIvPHJQ24O9zW037Myk1Fukybo4Mrs5Cr2W2wTZ7umA9av5Pub?=
 =?us-ascii?Q?ZePsYOB2gQzaJXAiTSp5PJmmrbWC2Ti5OJ1g+jnevfOOo9Qtfq6088WrEodu?=
 =?us-ascii?Q?vtHLbG5QWCOzvCW12BaCLyXuISDdYanm/CWZFrVQKaSbiJq+wozMA/LldsdQ?=
 =?us-ascii?Q?CBJStrBnPi5ew74BOF48Qgwj928ycedZOizx?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:05:10.1855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb6e8cd-3c51-4fde-2913-08ddf69ada3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186


On Wed, 17 Sep 2025 14:59:54 +0100, Jon Hunter wrote:
> On 17/09/2025 09:56, Kartik Rajput wrote:
>> From: Akhil R <akhilrajeev@nvidia.com>
>> 
>> Add support for HS (High Speed) mode transfers, which is supported by
>> Tegra194 onwards.
>> 
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> v3 -> v5:
>> 	* Set has_hs_mode_support to false for unsupported SoCs.
>> v2 -> v3:
>> 	* Document tlow_hs_mode and thigh_hs_mode.
>> v1 -> v2:
>> 	* Document has_hs_mode_support.
>> 	* Add a check to set the frequency to fastmode+ if the device
>> 	  does not support HS mode but the requested frequency is more
>> 	  than fastmode+.
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index d908e5e3f0af..6f816de8b3af 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -91,6 +91,7 @@
>>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>>   #define I2C_HEADER_REPEAT_START			BIT(16)
>>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
>> +#define I2C_HEADER_HS_MODE			BIT(22)
>>   #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>>   
>>   #define I2C_BUS_CLEAR_CNFG			0x084
>> @@ -198,6 +199,8 @@ enum msg_end_type {
>>    * @thigh_std_mode: High period of the clock in standard mode.
>>    * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
>>    * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
>> + * @tlow_hs_mode: Low period of the clock in HS mode.
>> + * @thigh_hs_mode: High period of the clock in HS mode.
>>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>>    *		in standard mode.
>>    * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
>> @@ -206,6 +209,7 @@ enum msg_end_type {
>>    *		in HS mode.
>>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>>    *		timing settings.
>> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>>    */
>>   struct tegra_i2c_hw_feature {
>>   	bool has_continue_xfer_support;
>> @@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
>>   	u32 thigh_std_mode;
>>   	u32 tlow_fast_fastplus_mode;
>>   	u32 thigh_fast_fastplus_mode;
>> +	u32 tlow_hs_mode;
>> +	u32 thigh_hs_mode;
>>   	u32 setup_hold_time_std_mode;
>>   	u32 setup_hold_time_fast_fast_plus_mode;
>>   	u32 setup_hold_time_hs_mode;
>>   	bool has_interface_timing_reg;
>> +	bool has_hs_mode_support;
>>   };
>>   
>>   /**
>> @@ -717,6 +724,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>   	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>>   		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>>   
>> +	/* Write HS mode registers. These will get used only for HS mode*/
>> +	if (i2c_dev->hw->has_hs_mode_support) {
>> +		tlow = i2c_dev->hw->tlow_hs_mode;
>> +		thigh = i2c_dev->hw->thigh_hs_mode;
>> +		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
>> +
>> +		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
>> +			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
>> +		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
>> +		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
>> +	} else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
>> +		t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
> 
> No mention in the changelog about this part. Looks like this is a fallback.
> 
> Should all of this be handled in the case statement for t->bus_freq_hz?
> 

HS mode timing parameters are programmed in registers different from the other
speed modes. These registers does not affect the timing in other speed modes.
HS mode registers being used or not is determined by the packet header.

We may also want to program the regular timing registers, because it will be
used for the master code byte to transition to HS mode.

So, I guess, even if we move this to the switch statement, we might end up
doing something similar outside it.


Regards,
Akhil

