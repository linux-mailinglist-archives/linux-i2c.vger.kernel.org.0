Return-Path: <linux-i2c+bounces-11280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A16AD1A37
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2725C7A56CB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DF522ACC6;
	Mon,  9 Jun 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CWbksOPZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1EB1C8630;
	Mon,  9 Jun 2025 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459760; cv=fail; b=FdtjX5Xs9tR7XIVnDu86UHiYz0cKVxwfEK4VZ2A6qNqmotSYTRBCZX+8gbroNj4DJXNInuezTWb5iD9zAnvnjZXY6ibj0P/GUztnkF8t6nxUXwXuNSc9v9GbwpKiNKhc2+Ecv/9OvAVqHanM2QvgEGtbH/nf+D+Ap5RMkr07xMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459760; c=relaxed/simple;
	bh=V8Ndwq4jkfpggIChfU8sOb0k2IbJNhclhpJ9BW8migY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lq6HbNuhY+vFEs5vREVwibTJjMPa+PxJGVK/hFVC2BqX0Cd2TDn8yb51UqU7ClqYzt/UHXooa85/DYGQWh0zRkTK8p+06K23zp9KBNals12/CuZpDHi9TKELXsxAfLWtoQnAShdxiRuu5YNaROxAdZNczAiyQcEYTxr/xRnhijY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CWbksOPZ; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWNMA2FBMbyIX7Vwda5fBzBdgQJu2YW5V7Xael+KpAS2oWhhWZBCb0Wgkf9pNzJWgmp6KE60uzbZ1BIZzk42075ajOErdzgIB1BcOSbzmPreM6M/ELk1MzC1xxXZPQ9UziIFFKgemH4hAsZgFQZH4iaMf3avGGvpw2HN0LsjW4xdgcXd5KNfRRVp1hucHEK3/El9d/mW/7yInALA3ekWIlBwjPVO+++WZgfYXMsFlELCQQeNU+kvQAjsb/oY/CJ8sC7dD7km6f9CtXhTf+DiuVWP0D11yeCPPvZU83qkozwFp8ZazpITRiLNTN237uoUu4/r8gfNKDc0U81t0F15+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNVAGHl2zdmaRnWviXyJh3VlmH+jDV85lAEho/7dQ2M=;
 b=MQNlnerOzlIkBs1bewtQtHa285VMsqYLY7YzIy9PRk93ti4C+wqYySQwbousBZSkZTvyjO5rlyJD3NJpvw+/BtDHrGQcjQYBOxsYdn3+83F+FCcGXMtVabjazd2k2O1roif6mJivqQcL45RTl4WoF5gIXwNsqEX5DE0ZhHQqwwsU9Tor0XYD8anqUMZnMt1szU6XdAt/fggpvIvTrsmKMXCdL4tiAVxn/IPuG6eP9IFuzEHL+AGRMFawYITvlTW5RyzH4aceRh1qqBJSOOTl71+Kh5EzW79t+ihdx2hsh+j5rtQrNiUa/RZf1njVTvEPjpcADMAYYKz7O3gvvdWt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNVAGHl2zdmaRnWviXyJh3VlmH+jDV85lAEho/7dQ2M=;
 b=CWbksOPZB2rXq5sOlinUVvQGZi0Oyg09ICX+EklTb4wK3UEzfCNCX1bcao0ZPOygBQEXhXGXC4bv80pvIR8Rw5Lu8KbvoU7a/Yw7IpFKFSpWeziBeAGQIg5dbh5dYFUfoWq8NEONAkRTPlRg3R11sS10VtoQ3Q31i5eEXqT5gFAlIp0DGSCdvfe+vsHSEaFeMsbq5J6Y6RqYFMcOlEMcrJ2UdhljwTpdAHtRLZjFEPgIIA1z8FgZhkmVSFqLmERvREW0wf3DWu/EQNw+cXBM6PA2pmsO7BQLUYJKoW3dSwcbynOcX61/MnM7tVJtU551Y+RB1cQC1ZILyNZTHUiuRg==
Received: from MN0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:52c::28)
 by CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 09:02:34 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:52c:cafe::97) by MN0PR05CA0015.outlook.office365.com
 (2603:10b6:208:52c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.16 via Frontend Transport; Mon,
 9 Jun 2025 09:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 09:02:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 02:02:18 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 9 Jun 2025 02:02:17 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 02:02:13 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>, <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>,
	<wsa@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<digetx@gmail.com>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties
Date: Mon, 9 Jun 2025 14:32:11 +0530
Message-ID: <20250609090212.48820-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <9803c165-fa2f-44ba-a6fb-f11852c319e1@kernel.org>
References: <9803c165-fa2f-44ba-a6fb-f11852c319e1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb5e5d5-346e-4ed8-19f4-08dda7345f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czF2Nnl3TWFQVjBNUjN4OWN4a2VRWmNKRFNSVGc2bTd0N1c2VG01aGFibUpl?=
 =?utf-8?B?Mk40MzJiWXdENEpIa2FQZ0hSc1lvMmZjUmZSeUwzcGxVQ0dPZUJXOXlscVNl?=
 =?utf-8?B?b1R2WFFBYjVka1l4UE1ZTm5iNnhlUUg1bzVoQnN4c3Y5QmtjeTlzR2dQTzZl?=
 =?utf-8?B?K01GdHBFdVhiWjh0cy9SL1pySC8vbUtmYkdkLzZKa2hnelpzWWZ5K3BoaHUv?=
 =?utf-8?B?WUFKNk50TXFMeGVmeHhZUFhQWS9Rc292SE1nVmN1RHpNUXd6ZGR2REJQRWVU?=
 =?utf-8?B?bWE2YjlyeW5QaTJlOGd6ejFwbUQvU2NKL2RJdHUxcjd0ejJadmhjTVJUWHBo?=
 =?utf-8?B?dUx5R1k2UEZ2QlJKVVdsT0NQbkpleGExdHQ4VmJKWHZ6dFZ6MlF1ZkhEN0hB?=
 =?utf-8?B?SW1pRkU1dzV6VVRjS3M1WUZVZGdheDBtYVdubEx3cW0xOVNQM2xvVU9ZWDcw?=
 =?utf-8?B?OHhtRkROemRyR0xXZTA4bzN5ZzdEU1UwMWV0N003alhRVitkM2hXaWF3RG1U?=
 =?utf-8?B?K3ZMM1hpOVltcGR6eU5XL1ZBeWU2cnR3eE9kQnJNeXZOcng4QWZNQUhMVEpS?=
 =?utf-8?B?bkMyamRMaTBaeTludWg0VFFpMUdhNFEyRzRRdE53c0tnN3c3VUlmR3VUcWE0?=
 =?utf-8?B?d01jK3h6Uk1QRVByWkZnenRZOWxLMFhtc2d6NlJsYWNBRFBrNHFnTUhnd2hp?=
 =?utf-8?B?UkpTRm9YQldaNW8wQzB4ZVdhZU9lbEg2YjJoMzc5dm4rdDVIcVFHN1dKeGFp?=
 =?utf-8?B?TEt6TVppV3Z6OFYySVg4cXE3aVZPWXlvbTdnVzAzUGdHNVNlRHpMZ3ZqSXc0?=
 =?utf-8?B?UFZqY01SbkRPTmdab3AxcERsR0sxcVdUakZYcFBIMVVBZjBwSGlqb2Q4WldC?=
 =?utf-8?B?dE5BcnAvZFNzekcvRUhnUHF6MEIyQ2RMWEdIUGYzRm8vTTAxMWZwUm9Tb0wv?=
 =?utf-8?B?UndqcjlPRGpXV3IvZGUwbEx2cE9zb3I2Z3RmZmlJdE9ZTXRtUGxETXAyRStK?=
 =?utf-8?B?YkNLemt6bEJncW1Gc2NxREhIcnpjOG1DVDhUeFJYUWszL2hteUpVczZqUDFw?=
 =?utf-8?B?UzJyMGdzeGpET2kyaFJzN0NPQVJEaHdUdFdyUEpUQkNVNW91bWxJMzFCNkRk?=
 =?utf-8?B?dEY3LzFXa3MvNnNKcXk2cGxNSlRUbFh1TjczUktHb1RPbnVndUVuS21Tb0Vm?=
 =?utf-8?B?a25PdXhPWWxtM3l2V3FEaEREWkM3VFJISWNBRWs1cmZkZ1kzZmlwZUNBZlls?=
 =?utf-8?B?ZXgzcGE0VkpJUG5vMmF0amhFWjZZVElGOHc4MnlZcktLZm54MStyaUd3RHRa?=
 =?utf-8?B?YkVNUy9WSVNaK0hLR1VTeCtrQkVkYWl6S1hUS2xERExxbHBiViswNTJTdDBW?=
 =?utf-8?B?UDhkaGlKS1ZQVTRmQ1VLV3FQOHRnWGdTWnhJWVRMWFVBMHl4a2F2K0s2T2tn?=
 =?utf-8?B?dVhjbjV1RDR0MnAwakRDZlhOU01HamNCbnBBdkt6UUk1ZXpCbkdpbEtCOTk3?=
 =?utf-8?B?eVNFV0RWRkZRYkxpemlDSExPekpYcGVaai9Pd0tyU25iYjBaQUtNM3hEZy9D?=
 =?utf-8?B?MEM5TG9mUTJTYzB1RDBWQ2xXZkFnR2RrRm8yaytKdThpQjYwaXFzSndZeFV3?=
 =?utf-8?B?MzM2aEtrRHdFSkUxUXRNSStvU0RrL2dFTVo4dXIrVXB2blBmTENUZDlsUXRs?=
 =?utf-8?B?aDJYVGxsMU5iRW9xMllQS2c4UTFweG1LL1Bkd2NVNVRLRGFmTW9IcXlrd0Nw?=
 =?utf-8?B?S3dZek5vT3M3QTY4UTdDaFFyNjNKNUw2ckc1dExPSXk3clM2L2l6Q0docDk3?=
 =?utf-8?B?Vmw4WlZKRFFwbUxmSUg4MlF2RVQvNDJRNFZObWdVVDJWVjN5MUlwMTBBNE0v?=
 =?utf-8?B?d1FlR1hNMHArOWNyN0E2Qkp4Yk1QazFmNmJncUxEdFZUYnVOL3orb0R0ZC91?=
 =?utf-8?B?UnB6b2hxcmdJZWJobTJEdjNpQWpvMW5PY1hYS0hhQXp0NVV5TEF6MmhLblUx?=
 =?utf-8?B?T212bzZRYTFQNDFINnpWVERtL2pLZDhyM0N4cVI3cjVwT3Q4dkpibnRNdXY5?=
 =?utf-8?B?N29mRzIrbVVHVWtrRFNTcFg2ZVA0VkRRVUNnQT09?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:02:33.7076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb5e5d5-346e-4ed8-19f4-08dda7345f83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387

>> Specify the properties which are essential and which are not for the
>> Tegra I2C driver to function correctly. This was not added correctly when
>> the TXT binding was converted to yaml. All the existing DT nodes have
>> these properties already and hence this does not break the ABI.
>> 
>> dmas and dma-names which were specified as a must in the TXT binding
>> is now made optional since the driver can work in PIO mode if dmas are
>> missing.
>> 
>> Fixes: f10a9b722f80 ("dt-bindings: i2c: tegra: Convert to json-schema”)
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof for the review.

Hi Andi and Wolfram,

Could you share if you see any more concerns with these patches?

Regards,
Akhil

