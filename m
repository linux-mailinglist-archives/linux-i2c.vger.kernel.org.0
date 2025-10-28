Return-Path: <linux-i2c+bounces-13854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A7C14C55
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 14:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D06601B255A5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 13:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF903314A9;
	Tue, 28 Oct 2025 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JTJERSN/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C4308F11;
	Tue, 28 Oct 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656932; cv=fail; b=ZP5F5cdjqWeZKUKymovjq9RffiLABv8ayByWl1rvijCDNFS7gkuaafTBEkv2xmMHS0N9zEqfxzLgD34pgInxJFFwzFx1I2+7tqibgwoKbKE6X46OlZpQ3EtwLg7BCAVbF3GHv6Unrp9r9kjNnCaM9U96dJ/4JZ/+clOTo2Cd+E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656932; c=relaxed/simple;
	bh=bzRdyDQ4jWW9VHbbDpGxHMbUrHyiuEmWOeCn7NXqJ1k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZ9d5qc5UVaJ1l566eJyOiWuul+F5hwOKJFC5rgl6ghDyK0SI6R+F5Uh+EeiB8xVwbgnCUvuitoJs92aSCY/j0+Izta9wQoPO+QxOjaAiROzwjYws5sTzt8MkaH28Gw9a3CiraDbDdKybGfBw0rFYv5mGv2n1lP8thsvoyXiU5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JTJERSN/; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fymp/eX4Omrj01xdlRLDSJcvD2M2GRrGOdMr/2zdz9o7h+eZ8Xp4buUJe1H/Lrzj6+GKnJeYCafzTmnV8VxT/+FGpz+rEapXt0wxycHWdriSiUcRhjerGyv0bpurw1tcy7vVwxAHq2GoWsYCXVwphC9/D6cZMvF1pCQvhC83dN06PREJB4OwLCjuv0iCIbvhbzWWCPQHkB23QuXz2LyQQBWPXLcw39xy1Pb4/FHFgaRE/khsHxhLjerY11b5b8pqnrMYzS/AFgIdbT3zP/LvDkB7TSl780LmvlmSl+PZ0yfqhpRkRqN/p7cpdQYFlAT5f35cbkJKRAWy/+KgvobJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFVh2glKoF/tsNz8i/q9CAXWQAiSSJThy0CZ5Q5YsE4=;
 b=x564rc5sxOOdXdjZkUEXCVebDjzJ89v8Mpr6qKrcoaCFeSJP+YAuPCM7EogO9TEGDMbJSYy17oEnU9XSqByI19nDal2Ecne3hL4stBQjz6gjVJz/onl7ujROP232acXUwytm8NzScYVVkvuPCSgUGBPyXikSSd0DO84PG5SLQv7A6Ux4KzieEJredAhswDGO4dbZPvwtXO1zTYhFEaW739WfQEwYeFAZ5/m7EM6HtAck0fu2YOToNtv55MPWevB1+eGMzf08tskYm29BeO0MXWFCgP5ylvABtLbSJZVeCUG//CLLroCyIr2xkFEKCkYI1MbvExpO0rwqvTpLHBYiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFVh2glKoF/tsNz8i/q9CAXWQAiSSJThy0CZ5Q5YsE4=;
 b=JTJERSN/1Q04X8HdCAo8tZ+0GI+mEkwpsrZ5NV2fJDpI7F1DUknDRP/ZWpfMr1CmymkWcfGyY9ae/rH8eyXQzwGXxDZERr7/7jRwQYASbjc2O1hVpjihaX7KwvBLJULqzES420+a2o4yZCaY31SOkcRfNOtZ79nl7hbxQQD0HCJ9K2jM+v58NH4FgB2niVs2jGUed0KnumniVPJJV0TX/wbHxyAW8RMhOCBEFe1sWk9tuxhpQX24nCgKbJ7b9l9fpbXAB0Tox100PiHVb0vtpqb6/mxguOHenyqd4J5XFLoprw0NC6CXfdA2qxf8K9rT1XrJn8ScJEU1ndnc3xRwPQ==
Received: from SJ0PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:33f::25)
 by CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 13:08:44 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::f0) by SJ0PR05CA0050.outlook.office365.com
 (2603:10b6:a03:33f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Tue,
 28 Oct 2025 13:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 13:08:44 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 28 Oct
 2025 06:08:26 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 06:08:25 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 06:08:21 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Tue, 28 Oct 2025 18:38:20 +0530
Message-ID: <20251028130820.52188-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <bf3672db-0013-4696-940d-87bd68e7518c@nvidia.com>
References: <bf3672db-0013-4696-940d-87bd68e7518c@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c71673c-c9ac-44e6-d2a8-08de16231f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7iGIOIxQKfxP/77zYH9r87Oodrcf8BPJ8c9j8eWM0eJI8rWNCnOErGhwJQL0?=
 =?us-ascii?Q?uDUq+96YbomJjfy3/5H8FnxIajRuEhnLJvHaJhlhxhhmp8VehC0qWDbriz7V?=
 =?us-ascii?Q?aZ9kDhMgKTiVPJWu0fJ0XDcbj2sUdycU7tR1ZPqJ99V2zVPLxWWAuW0FkT/6?=
 =?us-ascii?Q?ogS5Ml+mVfO9EZKZvTHphzamcJw+PHxEb2Oh64A32C3f5LrZAKc86YZ5Lxmy?=
 =?us-ascii?Q?tu2GDTRgK1EAGt6S5MKE+WN5Z2/15qy/EiUS19hdu8Vi88c4idt6syxXlqvT?=
 =?us-ascii?Q?VD4Epd2b+sL+3cIqRCLxIH9LmaZHEhEMC9pAniRm3fEWPrqa8ndMVbcaMkSS?=
 =?us-ascii?Q?AwPJQrTzFfSbWFqrEs3r0QI+CceWfekQ/o+q9HI7BXuSzPjPJpqAFA0ybtrA?=
 =?us-ascii?Q?H4NK8Ji3kUZIUa6GtLabolkRkGXl78nXKFNearQQJ/Z0yFMqDb1VYO6xEQFI?=
 =?us-ascii?Q?uuVyfi+ja/oZ7eDIahckO4SsNibRN3iEwocZHMRuzIh5RhoLKaDTek7BUI9k?=
 =?us-ascii?Q?uyo0w/rpbJV3ZKmy3DupHcfy4hRHwtP7NDW37e5/QSEE/OK0akrKFlIkPdPQ?=
 =?us-ascii?Q?fou9cF0E6FhvbkuXvDuk+GzoKOrlzA/zmeEm9SSHt00ew8Vu4piP+OgJSJcp?=
 =?us-ascii?Q?oRdkLslD8RovQ1W8nwOja8bgf6gVRcCPqG8vn6LHeHm1eME+IDVu8qjM45JM?=
 =?us-ascii?Q?gTqEQCyAYFtq+pZiLo5BBlVCMo/4hmyYbGwNTSKjc+/GUEul9h12Ycep6wKN?=
 =?us-ascii?Q?/2SlK51YGT9MXIXNJJ2UmSFfy45k2mTyEnQ86suW1iiOxnWftpdNGfYsgEfX?=
 =?us-ascii?Q?8sT1VLfkgfQaD+75EGeaPgvtg9+gt9Tjg8o5Qdf2WaoMQ5btXcDaXXgjRF8y?=
 =?us-ascii?Q?/W5JeLlpOhX/YNF0JCawmIszMuLqGc1EwW+G9YejQR8Xt4a9cSTA8XZIErVm?=
 =?us-ascii?Q?ZBkz6xqxLj0lKyudFBZnCWinBU7Ysm6c3OC2cLKTuSA9+co+SgzpnXEzU1+C?=
 =?us-ascii?Q?dIw1WvRVUX+UJV0v561UNdBU0TjLWygzPsereUp07dhtxGEZjg72SaWqJVyw?=
 =?us-ascii?Q?imW4rotGZOEwPuFg1cUl5E501elmBxnWIGe3Ab2Pz794RHEyRQy4H0cJV7M8?=
 =?us-ascii?Q?NYbimVPqjUDeuHIiAznuUbN7Y3RY4zaKXafHeBGlVNxtHzDzSxj+iE6t7iIm?=
 =?us-ascii?Q?95HDKGrJe7wRhBnvahQdN9LPnl5aXgXh1csSeEtNyGvZ/TCPFgM3hS39Sd4E?=
 =?us-ascii?Q?h+FyXOplfJ/0bio8Vrjv72fKn7UCUmTRGgiIadvOySNgt5V/acZcvaeDCF/R?=
 =?us-ascii?Q?roCtpSrYfmAOfa0PAIQEcYOOjusIzFE442kVYXBguj69zPQioBH0yBVrAsQg?=
 =?us-ascii?Q?3VKAl8XxqC+SRFY21a7xQVHmmnzbQFDBKO5Q24MF4R6Sj1P2+7tG06QsbQnw?=
 =?us-ascii?Q?ctxU4jAyIVu26KdVYfuIXC+5lEPCMppLTZxKdaVsERzFC1jlMZNJslr2Aa3M?=
 =?us-ascii?Q?6fThjndntq02/o/k6+JcEIOeWB173QBb40ei6ZcY1hbX4/9dRPS4GVfqettp?=
 =?us-ascii?Q?SlRfMZo8dWrNr4EMQRg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:08:44.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c71673c-c9ac-44e6-d2a8-08de16231f85
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1

On Tue, 28 Oct 2025 10:41:54 +0000 Jon Hunter wrote:
> On 28/10/2025 10:00, Akhil R wrote:
>> On Fri, 24 Oct 2025 16:20:09 +0100, Jon Hunter wrote:
>>> On 01/10/2025 07:47, Kartik Rajput wrote:

...

>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>> index e533460bccc3..aa7c0d8c0941 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>>>>         if (IS_VI(i2c_dev))
>>>>                 return 0;
>>>>  
>>>> +     if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
>>>> +             dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
>>>> +             return 0;
>>>> +     }
>>>> +
>>>>         if (i2c_dev->hw->has_apb_dma) {
>>>>                 if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>>>>                         dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
>>>
>>> What about ACPI based devices?
>>
>> The of_ function returns false if using ACPI. Since these DMA drivers does
>> not support ACPI enumeration currently, we would not require to proceed
>> further anyway. But if required we can add an additional check with
>> acpi_dma_supported() or similar. Do you suggest adding a check for ACPI?
>
> I was just wondering if it is better to use fwnode_property_present()
> instead.

I think ACPI does not use 'dmas' property to connect a DMA resource.
It uses FixedDMA or something similar. It may not be helpful to use
fwnode_*() or device_*() check here in that case.

Regards,
Akhil

