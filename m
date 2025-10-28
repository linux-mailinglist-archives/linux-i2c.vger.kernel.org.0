Return-Path: <linux-i2c+bounces-13849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A25C13FAA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 11:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3703D4E2812
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 10:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EF71A0BD6;
	Tue, 28 Oct 2025 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OMNEoSFP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F526B0AE;
	Tue, 28 Oct 2025 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645665; cv=fail; b=sQNdCvLvAUuRSZt3GkIYeITqtJM2qRZrGQw1wqHLsw5ojdDtktxjEYpKaL4qOyexausUs7BFg6fmM03PpxTKhqZ00gGB2DaHgxGWQz6ajaGXGwQDmmNv4Fid0lXiVG6T+aElmkreIqhNOSOIopGntJTAQ/xoDJnQNpPX6wUeqlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645665; c=relaxed/simple;
	bh=F1dWtavog5YYOFouetHMZMjtZ3aR/SPHArDZo1mNwdE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0jjxVb8BdOUYMM9iBXd6WxtjY2BcZeRm9CZ/UmzFfQJeDZT6FXR3bWmuZ3x1n9HxdgwX47gADP8Bsf+1Fg9gFRRKSuSAKD4K5YoVGpHgZEZOLx8c6tTxC/FQecX4VhykZwKYxoxCr33S9ZaaxvQCC5VT+WqS2qZFDPit9NxZOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OMNEoSFP; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1WcoXOvYFFk+72QyeoUOKbXJzi+jyDNs+WyPHh055SolbIpzNEUmYQ1u/rFDJ1UqRX+qerGk5VhCVYf8jwf7zns4ldNXeJOFp8CDyy/da7GRxi2BX237J+71CltPIj6xIAOkHg7djatortKPWXQbVRhTGjrT0a2Wk3DBuyTIZN4rtb5a71pGfLEVvmS3ynH1t+4VUElTRchHQ4HHZX0yT9Pwo8oaMwGnGdG/dFyWx+lHvrqQiYFQRgoVhlZdnykEHmpzpjJH3dizr15FykXxsXwg/2vqEoE84SdVJrQVIvk52xYGRfwj06aeZzOmyFgiL3ZYiWFIIXuivMtfQZzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knrFXdRHFetaMuAWv43G3/6mSMHF7s6KeszO3tDEidI=;
 b=v+eoQSRbPoGZscYVC/hbOoSPlB8RtJnv/TVZHTFAQKI12gr1y3rIAvkq8woGe5udhrG4xpDnIM/Zpgs/e4mbzIjZEL4rd31EwMPvRaTCR4AWYheLg7f6RHLFZSKbSrg2/lEePTpPRnFXhnFPyNJmmU/7mQZ2C7J8Zz+xvK7dvwNVbqjDUq99V4F+69Vz0Mtnug0XzmpUryAV+yH+fi/KvjrO6J/K4OcbpH79Ev1y6uy/zikNaK1B8JzwWlFolpZGU4M/qpEbc8QX21U3NvT6s75QoVZV868n99Ya2tQDiE5amY8y3sggpVw+QPkzWLn/T53+IS2MHIJ01zMRVJ+H1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knrFXdRHFetaMuAWv43G3/6mSMHF7s6KeszO3tDEidI=;
 b=OMNEoSFP4rEWu5BT2JZ/lpCc5oDt7VWvElGB62w2mVMOwb0hc/sbFbKge0/pVzNHjsvIkSfN+okEx/Q/rgOnx4ET8iy70kTsWq1BjW1higgeTxbi4KxtxIYxkoyL8YEVTItAiZi87kvsfsLf3td7AZM3u9XOjQiWm5d5BQFhdfP5zYJ/i8JqxGGxBCKj6eno9S5bFbvvvi5W6vjJUQNu0f+635h0G9YnGMK4d5gJcblDLNEun8QwWNeSoQ0LSHcKrgCpdLWCGD1RqRErLrhFE7LbVX7g8rrw+FW+AqtmquQBVE3cgmVT9uIECyNUWorNqKHvteoOWKWiMpIGvbPz1g==
Received: from PH8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:510:2d2::11)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 10:00:56 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::a9) by PH8PR15CA0018.outlook.office365.com
 (2603:10b6:510:2d2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Tue,
 28 Oct 2025 10:00:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 10:00:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 28 Oct
 2025 03:00:33 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 03:00:33 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 03:00:29 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Tue, 28 Oct 2025 15:30:28 +0530
Message-ID: <20251028100028.67388-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <fa389b08-7ca9-4c0e-b9fb-68d9a58ce79b@nvidia.com>
References: <fa389b08-7ca9-4c0e-b9fb-68d9a58ce79b@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d834d02-cc6a-4718-2162-08de1608e2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IgQlxwGsgw3upq0szYKvO7GZJMK1k6chzqUxN4t4sSwyKQHMQ5f07cKS+31k?=
 =?us-ascii?Q?bYy6pU+NY2FAvJ32FT85N1003S4kVdeeMY81Q3ZFtZmjiwlzLoqyPXmZdnKc?=
 =?us-ascii?Q?QpXCaTXjggf5quPgdZzmbfkQ4xWEAtMga/TMc4xIAEhFBWCIFqqBjW7kf85M?=
 =?us-ascii?Q?H7osTR5aVuNHArfSk5qwPidjIdfb8Pe98hQ+w+YJBToq5gHIc9UdcX+r/fGI?=
 =?us-ascii?Q?+F7gT1ZBFtB3pOeONQ6kmNc7F7M//paoehhkGtBYYD8xDrCVG0IJoiNxSe5y?=
 =?us-ascii?Q?KAUJlUQsd6pxdMqIe+EEHerVan45Wd2sXjYORISB5a/LZ4Z0Qf9dvKABy5zL?=
 =?us-ascii?Q?ebLYcKFtd+cZAQO0Iiu2ue1Lf/6jldzge5O4h5nCyDy+2uF7cU+I2+DzL79D?=
 =?us-ascii?Q?SN0qtvjdgF1Qyzc8OgSrRpABMeNVVQr1kXbreRimlwr/VmDzZr6YN6nz4noz?=
 =?us-ascii?Q?oRHxxwPDzVAuHkixQypY8pG1CSlluKQxx35I7ulBl4ECsHXFERM7l+lH+87z?=
 =?us-ascii?Q?86IocN9zVGQhKlaeTR4/xiNVgQxMRF0VTr+Ucc/vsPCGojUdvQRArxpUH1/+?=
 =?us-ascii?Q?4RY4bnBZfoJlsrUMl51VMjAVLabEbQK4FatUnvy1YGZ49Q5nl16yTO5+r0Xp?=
 =?us-ascii?Q?Pzm2bGxmVx37AEIciv5RVAWE8wrO0S8zJEoL1Y8qRx8Q9hg6E7TrVW+2LT02?=
 =?us-ascii?Q?7KDk+oEKt+/bsV+lB5H8WbT4EyzvsS/KoYTGK1IMRaw38yxxojwWxXKU54ST?=
 =?us-ascii?Q?AImHFT6a79nMe1TuPltwxtNZ1HIy0orpn2JJyMzEBJKcd2Rnve35w8XFWXQu?=
 =?us-ascii?Q?/2Ww5GtrqTxdWotMk1TGxMJvw63W0oe73PWDlopBpC46zL1gcNO06BIKmARH?=
 =?us-ascii?Q?326N+k74xG2SpiZV2qMGaVW5WS3yjVe9S3nzbu6xG7tSoIEr95Kfcyp+Jtp0?=
 =?us-ascii?Q?UYBkEb66pPxDxHFET0k7iSCUTVURVa/lidcjFfPfPdteDz74wdqLRUPEIfvc?=
 =?us-ascii?Q?/IEmZ0m5CCxhi53sNkxnfBcFTxx1yjtjPjFPuhnsqJIjRskrAKXQ6j0T2BBm?=
 =?us-ascii?Q?5x0X6VqU76Wr66DedAnU7buEX4aLnY4K7jNYjcdih7xFy4kH+M8u7xyMDK9R?=
 =?us-ascii?Q?X+i54M/JNpmOyYKF3r3zJB9Uri33dXW4LhbECHJjljRvGU1J8Wc7C92WRFnl?=
 =?us-ascii?Q?AKDLd3LZcdjo4o8ytHSQq1jrsHN5YJgiYwKz0shM7KOELpOva0vqRwI9DUxL?=
 =?us-ascii?Q?rFbVMygTrm5KrlgbWsxDXbrtFqtSYApdQW8ujbtrbe7uTEVjeL2yaYPjTUpt?=
 =?us-ascii?Q?JJMgPEZrnjHWHwEek0QqGVIn1tlEQGNwtezSkFmsQUxIGOVN5YwCLmFG22OR?=
 =?us-ascii?Q?G6Gqqh6OCodiJchOABLALNsAgoBKEaT3ecQ3gtXAsNmhLDW5O9THNcM7+0aY?=
 =?us-ascii?Q?tjWTn3XjB6S6mWLihyWDJDDnCiMabAteLvGrKJ8pcnU9azclt/HK1PTKN+0i?=
 =?us-ascii?Q?BfyfMhb27dx8tk7OayilTxrTSe4CWQ+WyU1W9tm9ILWPfoHWxJkhP08T7S15?=
 =?us-ascii?Q?b64mQQ0wSDaCgxYhEQo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:00:55.3259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d834d02-cc6a-4718-2162-08de1608e2d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393

On Fri, 24 Oct 2025 16:20:09 +0100, Jon Hunter wrote:
> On 01/10/2025 07:47, Kartik Rajput wrote:
>>> On Tegra264, not all I2C controllers have the necessary interface to
>> GPC DMA, this causes failures when function tegra_i2c_init_dma()
>> is called.
>>
>> Ensure that "dmas" device-tree property is present before initializing
>> DMA in function tegra_i2c_init_dma().
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> v4 -> v9: Moved the condition down to have all dma checks together.
>> v2 -> v4:
>>          * Add debug print if DMA is not supported by the I2C controller.
>> v1 -> v2:
>>          * Update commit message to clarify that some I2C controllers may
>>            not have the necessary interface to GPC DMA.
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index e533460bccc3..aa7c0d8c0941 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>        if (IS_VI(i2c_dev))
>>                return 0;
>>  
>> +     if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
>> +             dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
>> +             return 0;
>> +     }
>> +
>>        if (i2c_dev->hw->has_apb_dma) {
>>                if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>>                        dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
>
> What about ACPI based devices?

The of_ function returns false if using ACPI. Since these DMA drivers does
not support ACPI enumeration currently, we would not require to proceed
further anyway. But if required we can add an additional check with
acpi_dma_supported() or similar. Do you suggest adding a check for ACPI?

Regards,
Akhil

