Return-Path: <linux-i2c+bounces-14658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A4CCF161
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 10:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0105B302FA00
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 09:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4B12E9ECA;
	Fri, 19 Dec 2025 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="idZC7+/2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664622E22B5;
	Fri, 19 Dec 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135380; cv=fail; b=NVQw0es+uFEvuRY3SS8fpqsYF9akZGnFy5CJ2v4LwkCj1a2HD0G/hh0PgEfU5wGg0DrA8yCK0EbvBa7Jra29kUHbgYAcq6Ui4DtjWqoddqeJgx/fvx7ZTCkJckxadyzpuGif0FK/Ss7bTBXOVO8F/FRYSpODwbrGBELhOZsYj6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135380; c=relaxed/simple;
	bh=TBO/6MO97HXkUq+GGKpqtErvEjmz+FskRtJw9sEfYtc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wn/4Q7ERpsAKFooeYbOKoiYZRT1zH7cNAHEbMbHKHgzHVqlBO13QH4fc6navNIYPzENndFh6+HMTQHXXOc0zDNNIqJcn9HjYabOtPYBJ87xxV5ORapPAHYGV/gvd7KZhrUN7sdoVmVVdA7XK1G7Ime7gJtCUs3EhwFYYZJkM3og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=idZC7+/2; arc=fail smtp.client-ip=52.101.62.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTTcrjcxF8l1u23A8vxIi49znZGEj+W08/MfZk+poeowpsnxcmMIT4cAWWtIJMm7pYiv5ZBGkfTHBSIYmX+Y3103QdtOU5lCs5YMCIsHWkJCk0mZCaDWxC8kytz81KMk223IwrsnD0czk3XayEaD/nehIZdNOAujufr0QdBLfLAk6pFkOy5EnQN40AtMGO7rVtmacFlJgG6F7nRqA6N8X/5U8bprK583G4/k66eiaN1zLDfsnMPDs5VSrpmQ/EFQH/78o9cMDx2R10AmHHSoSkNm07DLjs75lEVNHt4m3Kf3UnW9cJJQzdzK5E+4xWnvHEKNIu9Cc2xFKecodg9Jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7NW0bGMcJkwVkcOzdLTTzyKqTjGosT2UycKZMr/Jsw=;
 b=w8A8O+slX1txv46/GqM5huAxWhMLYlEyF1+C7XVaP+HA7YlKcnI+rFgZ+aeJiFBNHeagPCWKTu6t588fitw2YNaU+OAxpvt2upwK0NIQwmviFEKtJ0MN+8gKX4PTX9nIGhdV+vzJRqeF1oawOUYOPqsaDIoy0YcucQMeZGyaB74afofcJHo2im/hLn7mqx1oARo6jQRmcQbJ4UQxFhtfxIWGP9guvpgZDtqeK2UoBRBzaxztx6OcBvYe5ot+Yo68/u1IYh/ttk1N87ghKTWOdgovp6J2Atyxd5y8ggHLqzmBcwmIWMctBMJb38Dt0nwUIHA1Rix2iTD5lytqQLqGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7NW0bGMcJkwVkcOzdLTTzyKqTjGosT2UycKZMr/Jsw=;
 b=idZC7+/21xFcsY0mu2IYbv188tZlILrvypwe1/fLl+nxM0jpVjZEj0Qj6sisVebVtyBFphGVeJDlCRtUchMXaEd5LUAnZD04TtQnrLzdA7WEGUMGNzo434QgfQKGdkpOBk8XB9syBjAfcCs1z0tlBGacacIub2s2CGYVDqSE/WEDfGckn29yBnuDbWZKfe4S6Sf94Fl16BHgQymliVoFSimmsn9v2lvknObBN2a69dsZyoyojMtKJfjrmOkQK2dA6HYlq3IqbC31YAZAbLBNc7QO/9vLLEnILiwOgWbkgA/VQwlwxfLD0CoCKlU4zBkUo1uObN94Kf2IuIpLhOmUow==
Received: from BYAPR03CA0023.namprd03.prod.outlook.com (2603:10b6:a02:a8::36)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 09:09:33 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a02:a8:cafe::f0) by BYAPR03CA0023.outlook.office365.com
 (2603:10b6:a02:a8::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 09:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 09:09:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 01:09:23 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 19 Dec 2025 01:09:23 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 01:09:19 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <thierry.reding@gmail.com>, <andi.shyti@kernel.org>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <akhilrajeev@nvidia.com>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<kkartik@nvidia.com>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<smangipudi@nvidia.com>
Subject: Re: [PATCH v13 0/6] Updates for Tegra264 and Tegra256
Date: Fri, 19 Dec 2025 14:39:18 +0530
Message-ID: <20251219090919.14287-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <rf7m5rwnz75ft65zxy27fmndoxo6cc2hckbgzfltzyz27zt24u@n6hmqstpp6pk>
References: <rf7m5rwnz75ft65zxy27fmndoxo6cc2hckbgzfltzyz27zt24u@n6hmqstpp6pk>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9ab056-07ce-47d6-8ec3-08de3ede5346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FkTKYLCUqHJwAWR0sNGBgotK2dblPQFtJxCgGYVWXP3vzMsxD3z3CXWZIoch?=
 =?us-ascii?Q?540RwykPlF4JAGJvIxY2FARZdh4J0uIGLbg7KZq4w0DGhIxot1RKgr6+iB8D?=
 =?us-ascii?Q?aADC26EhTnF6ui63dyCuQHBtgPG/7y6FRnDfHcI7WttNxZrWP7Mz/s5CQpjJ?=
 =?us-ascii?Q?TAB54UM7uLaXbvD/3BaatcQfFb5H/DWFKvnjFbVen2zHINIiY8D9ruITE1YH?=
 =?us-ascii?Q?25XFbeTeJfZzOiaDNYPnxzJIifwod8p4QRQqwcYkiPWBApyMcEOlVjwsJY1f?=
 =?us-ascii?Q?2rP+UKptoWva8yH+y3wOg7SdeL3sfN8Rngz6yDcR9Nd9NzOTvd7wE3YdvodL?=
 =?us-ascii?Q?7ddROzaiXIKJVa66oW7a+JxE/N/vX4i9PYvPtjEGusAf6E/8bkQ371YwnP4C?=
 =?us-ascii?Q?IoRkiTChqzrG3tAhcdm7t8sdP4ijkOQh465R+PxhFDCsrsk3/g5QW/dzv0jG?=
 =?us-ascii?Q?sB1DaARrJg9P+JrB9aYL6NFFV8jJbRxLVdpYpXvQ7lDo7/hPkLfQ/8G3bnCs?=
 =?us-ascii?Q?t+hXjpXPITfdFVdbNDCxBAAis0WI6kmjbeitI8kUEpYQNv+79abp/iazl9lg?=
 =?us-ascii?Q?bGTmE0FAxg9SE7E7ks8kmGD/SKEwwiaBFm5dAKGNIjccJvRyStzkwKBCY43u?=
 =?us-ascii?Q?vNuPU9tgnBnfEqcXXtcPbgQvqnwUlLj+fhzjeNI3IqmXD4h5l9HRFocyMOz2?=
 =?us-ascii?Q?jWg7ptRrtJ6cWY9GrxAa0kQ8JwxbVWD8mKdCZMQDV6cCH9emOXndYpCrB9D3?=
 =?us-ascii?Q?P7F+PuBYE6XraRvd3C4+fFSXkFjJpinRu/F+1+4xo/iXzUWAQfmXZvLS5mMB?=
 =?us-ascii?Q?BlaBrJBWVKfDGjw3/r5o9lfqI1Jn04BSWdRikaylT86Awbl2KvC87yAoDjyn?=
 =?us-ascii?Q?ltLJ907IiSbGBnG95EwbwVaMSzjomLa2Jntf9ToINCA5BL2yLZIlB1Mct0Vk?=
 =?us-ascii?Q?xfTMQBpg2z9aAhxoZHapqCzwKj1XIWZkBqcuhsZHv6T2wb9sJD/2DV+EjS35?=
 =?us-ascii?Q?Ky6gr4MW5qfXq4A8ydGN0kV6Yfh3bPHF2IqP4JFww+IvmrwKzBcgKzRYOlPV?=
 =?us-ascii?Q?Q7U8ZydGW0p5f/QBget/DTcmuIgU8txI2rfc1mD+Dnu6r8YuebxOsQeQkc7d?=
 =?us-ascii?Q?G3Bjw8pJL3cgQu8IGAKoBqQtgCXfZlfK8dtkIsWIy24tw3StQVbOMaPxcB9g?=
 =?us-ascii?Q?AURItYWz5I9i/SONKXFQYjRVuNIGT4C/p4IVBoqwphoSpiB5SRziHd8Nml50?=
 =?us-ascii?Q?nAbla/Ps3WW6ueh5ix8+MGARZWKFQ7Hl/EgBkGBh2CPZQL4H3mJ4C+vsmE+P?=
 =?us-ascii?Q?rYs2ZcUPDpwzfVC/9cUYKK5RTx8P9Rv5j1R8kuAPmKI+3v9IiCmsmDw9bHNE?=
 =?us-ascii?Q?qvimPxFLP1j2IV26oAEIBftGu/fjXKW2wDMGxg2gSxenD6lRy6RVmYtNG2h8?=
 =?us-ascii?Q?3N9Q47dXMlEMFj/ptDmXXuTxb/eWNc7PyeIF4GwYosSCV0roQwNEt6Me6hZK?=
 =?us-ascii?Q?pS+gY+u9lFMTK3jLKnBJ+E2nlrgS3ExQqHsQVMPqtVniTacT9+MLHccILvG0?=
 =?us-ascii?Q?AxGvRq6k6+X3VX6GmcK8d2lpcy0Fmrvf3iAOLzSB?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:09:33.3846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9ab056-07ce-47d6-8ec3-08de3ede5346
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727

On Thu, 27 Nov 2025 10:37:43 +0100, Thierry Reding wrote:
> On Tue, Nov 18, 2025 at 07:36:14PM +0530, Akhil R wrote:
>> Following series of patches consist of updates for Tegra264 and Tegra256
>> along with adding support for High Speed (HS) Mode in i2c-tegra.c driver.
>> 
>> v12->v13: Update has_hs_mode_support to enable_hs_mode_support
>> v11->v12:
>>   * Added two more patches to the series which are needed for Tegra256 and
>>     also cleans up the timing settings configuration.
>> v1->v11: Changelogs are in respective patches.
>> v[11] https://lore.kernel.org/linux-tegra/20251111091627.870613-1-kkartik@nvidia.com/T/#t
>> 
>> Akhil R (4):
>>   i2c: tegra: Use separate variables for fast and fastplus
>>   i2c: tegra: Update Tegra256 timing parameters
>>   i2c: tegra: Add HS mode support
>>   i2c: tegra: Add Tegra264 support
>> 
>> Kartik Rajput (2):
>>   i2c: tegra: Do not configure DMA if not supported
>>   i2c: tegra: Add support for SW mutex register
>> 
>>  drivers/i2c/busses/i2c-tegra.c | 304 ++++++++++++++++++++++++++++-----
>>  1 file changed, 258 insertions(+), 46 deletions(-)
>
> I really like how this looks now. Thanks for seeing this through.

<resending since my previous mail contained HTML and  was
 blocked by mailing lists>
 
Thanks Thierry,
 
Hi Andi and Wolfram,
Do you see any concerns with this patchset?
 
Regards,
Akhil

