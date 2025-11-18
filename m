Return-Path: <linux-i2c+bounces-14135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8AC68FE2
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 12:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2C484EDEA0
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 11:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C35341649;
	Tue, 18 Nov 2025 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZG856wCc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E452DA76F;
	Tue, 18 Nov 2025 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464170; cv=fail; b=dburUYQJsTPx3Lbc+CaWL7vIPAVKBTQp6WFpw7vl6TvZVIQa+rwME6ggboXBQZKqVZjA53LIKjTIi1ccbMqigkOMf+QWvSFTPdNT9HKD8QMsE6wUMZXKaN5nWxjeKNqJN6HXWEz3xwU+haleElKYgch9oaoKn0ovSzdMZ4M2D60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464170; c=relaxed/simple;
	bh=FTZTvKZTBHxGBxwQ8Mi8ULEtIBOMU1QJC+R530RqVXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qg6MCz+ZyjV+HfCgECj2H22NOi7tL0CEEtDRow7ll+1gj5zmvq61ncMOOku94lPiDRiY5AF6HrfHcbZZbFPurA8DoiaI6x8Bq2jMgpa6BKUFIwUdRkGnulZ5oD4gddpm4ejEOAQsav+p3nnQirNvq85ie0y/Z941z8Bwj6A2duA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZG856wCc; arc=fail smtp.client-ip=40.93.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUtDuZZTghQqJQdsgAba8ihMVu2PoFolxaOOqRyTdsks2fbvvBtiq/D/yWOWH6ujqstkStNOlMlD7vvmigCYa7F97dl9iPlPLLUOD9yRnVLCF2xABsPMg5cOfspzpblrhdOuuPHC06oFA0gpWuV/05VbHI5zj8GogJS9QJ4MQZ3/tKof8ASL+5ildaspxJ1aky2uzZ5c/BPmc+9f/+JHmSbPoFtJevbsOC6vqnC8OME2GdI/EhSRRie9wrbIcEn5MI+GzoIjO5GKk9xd9g0HgpXMN4/7k+e+6N8DX1PGwaDnFzwnoe8yqZI48DCO4ENiQrnO5O8wkSpSWtgV81vxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IRgZE1AAfcA8HMTt71B+MWkYmDH8WtTdgMTaabPWz0=;
 b=R9SQOV1unoYgjY1Eo8o5EVcXW+dJWCIiadCpDIE53Bas9PAoElbXrM/rRAQybolPPh+5Kh0FDom9wW/7PmVJN58LBNpM2jSbnNpToiMZ4BnGiPv/9HOp1bU469RWOlCuvmsCLS8vMVj/Yh7LzwFhIS3dlTvQVsvnDdSa1PM6WOMrl8SwIAvTFa5m9QjbZzGFRl/2RJJ6D/IEX+rCSA/gIHWG12ikAoyofQsnMn9OwuWXZP32h2A3pW+WIlVHI1v+I8MadyIbld3gRCjCYGeT37g8zMfdkuIeg+Ay1lLK+qbVpeDyJV6zc42rDCa9/OYMSOElkkafx28d+E3snmzCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IRgZE1AAfcA8HMTt71B+MWkYmDH8WtTdgMTaabPWz0=;
 b=ZG856wCcDhpyk9RSuKkFLtX1Lh9RegjF4pp/JI96aV9SyPsmFey1PfaX4h2ueThx8+qekhcPDpq439XTkposKhYsQgjhYvSYO5EAlBt36ubW38JCyM9wH/OWyL5CIyZB7flwaUnlL+ThS2EioWZ3qgQFaxoqDYn2WSwi+2S829me8GJyVz3XhZqvFV+QcwK5L7C4On2C8EG8UprnsE5TuU0ZaHkvLMpB/06o59YRSOzzHYMnQedr0nvxMt9tCK/8OtaGDZeFOV9A99lUr2KtXEPJPS6ISy20yWTWpHmnpQvic/duZHBdOQPutCozPFyqQr0bil1pyQaztT/rNjOfRw==
Received: from BL1P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::20)
 by MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 11:09:24 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::ad) by BL1P223CA0015.outlook.office365.com
 (2603:10b6:208:2c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Tue,
 18 Nov 2025 11:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:09:23 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:09:08 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:09:07 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 03:09:04 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <digetx@gmail.com>,
	<kkartik@nvidia.com>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<smangipudi@nvidia.com>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
Subject: Re: [PATCH v12 4/6] i2c: tegra: Add HS mode support
Date: Tue, 18 Nov 2025 16:39:02 +0530
Message-ID: <20251118110903.61560-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <828b6131-24bf-4a92-9c86-4c9f0461e6d0@nvidia.com>
References: <828b6131-24bf-4a92-9c86-4c9f0461e6d0@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|MW3PR12MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 9615e57b-e3e4-483c-c021-08de2692ee0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?axiYw5yWSMbaC7aoNwqOuDEjoASU3evaEdgqaXDT3/OSYpcCKDI8XolVKHHv?=
 =?us-ascii?Q?l9r/DslT8sp+Olr31oARHMeYR2eGWzTtfPjm/Oare9u9YmVvnzdIA0Lu+iIJ?=
 =?us-ascii?Q?s80YjPjVKcgiaAF0x4QRZn1bgjNi2ZOB0OBhg+pn1gxzRmB8+c2EgdtmbK+F?=
 =?us-ascii?Q?p/WLwwCX0ZMaP9iKFUAxdK1+chHzI604PDWfTKbKVgU8nSAZToxs2721GhC3?=
 =?us-ascii?Q?WzmtX1WHQyScrtiOg3SJLE3WfXCjrh0EfpPLPCNS6ZhR5v3ntcNyKvYOOjXd?=
 =?us-ascii?Q?2njhWM5iwfNkicZS61T6WKR8qZzd1nbtXl9w7j01rwblFUT/3xqrSKL48Nv9?=
 =?us-ascii?Q?pg052GPceb2ByXb0CALnRqPN+zC8K92yVBaHq6dakATrYDZdvNZgFtj5k5Un?=
 =?us-ascii?Q?nD8B2uNriGniC+ZifLABiaIU/pxm6BurtkZr4kTnfyQ40tRqMNHfA2CJrtVh?=
 =?us-ascii?Q?SISoss7FQYT6Xq03qGPIwLH5w8/A9kCyU16fTZ8oo3baWcj5gYE1+d2QGzIB?=
 =?us-ascii?Q?p1XoHr6i8gMwOkC3Ss8FoGvTtz+5lEG75ndHLtb7O+OpWrPbLglfiHROV53/?=
 =?us-ascii?Q?IEwm8YhPXfTI3WQzqBI7LmU+3A4v/kmVtdYSRHW0SLNllJBQlIvBz3lDcn6c?=
 =?us-ascii?Q?Y8/81l6+i4d+DzhqySDjpwwCTIvDv/aOoZe0MFRnLsZuckGLc7H0SRzyORke?=
 =?us-ascii?Q?ltMw5Zvhb083MylXiYJ5JqB2DjtKR3cB3QFJy/gv0HjfrEqhuDMHuEl2CZop?=
 =?us-ascii?Q?Jv9/El6HTRxJluXGlZdn12soIxrW8rNsc9hN5fjimcO1DYKECFQ9a3CgCzVl?=
 =?us-ascii?Q?jf7iYejpjJoD0D+tpU3O3gdMLHK555bA3VJTEvyyGoX4nknNyFeDTz/6saYV?=
 =?us-ascii?Q?ZPLMbBDFP/n6dwiNGtCstWlPTUSBHRaad8lu/N5kxmYsq57Bzeu75MvvfgRM?=
 =?us-ascii?Q?rVJQsb6pe5KmB+h8Vs/u3LqTbUKrbg4eea/xsOGKkzhobj+ZspfuGUfvVZCJ?=
 =?us-ascii?Q?9pJJ0yd0H0EzVCI8YMiRAUuz/dC8lsCbPvLHpkGgQ80lYo4qEax2jaKHEDAT?=
 =?us-ascii?Q?Hslts7rcR8KCOMPs+7+iozTMVBVjdKajXR9xA7xk5hhxZ9ASAPS4jE2Xo5+r?=
 =?us-ascii?Q?6yqXac7mIp7habvCa3nKq8Mvckie8c4rdNRkBvX5vSZJmYYXJbEmvfYAdCOQ?=
 =?us-ascii?Q?ub01W+8THUecW9/cqQULmt7TAwqF8ytQkhpcBegMOWAy7cQhi4SXgY4tJGIt?=
 =?us-ascii?Q?cRJB/lVmgC3yVWkEgZsHtVNpGupz3pTfmQ6yic1bt5d9kCBjXr2xnD1B+pO9?=
 =?us-ascii?Q?yrZJVWd8xMhyKBQKSCyjLowgl3iFmHsuOo4Wf/xPtP4//6+ww/Ffr+eYkHiM?=
 =?us-ascii?Q?gVhVcMCzgtu6kjDi56NKKLksQ/gBBo2Tq622Q3LNYaYl4W87HkxXWCLOMLSa?=
 =?us-ascii?Q?kILAB6dO4S0ou+xdXllpmUJYzBlgX/fckawzVWLo0nBPJi1i00P4GknxOG12?=
 =?us-ascii?Q?puUaXJ+wa483/etNvDXK+9y+TYw5lrD685WPzSWalI9NYgyyIVkCwy+ed28I?=
 =?us-ascii?Q?svlJlGcGM+yW6xr43Ptm2YYvDTXHI+KPKh6PuM3q?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:09:23.2774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9615e57b-e3e4-483c-c021-08de2692ee0c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474

On Mon, 17 Nov 2025 11:07:07 +0000, Jon Hunter wrote:
> On 15/11/2025 04:26, Akhil R wrote:
>> Add support for HS (High Speed) mode transfers, which is supported by
>> Tegra194 onwards. Also adjust the bus frequency such that it uses the
>> fast plus mode when HS mode is not supported.
>> 
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> v10 -> v12:
>> 	* Update bus_freq_hz to max supported freq and updates to
>> 	  accomodate the changes from Patch 2/6.
>> v10 -> v11:
>> 	* Update the if condition as per the comments received on:
>> 	  https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
>> v9 -> v10:
>>          * Change switch block to an if-else block.
>> v5 -> v9:
>>          * In the switch block, handle the case when hs mode is not
>>            supported. Also update it to use Fast mode for master code
>>            byte as per the I2C spec for HS mode.
>> v3 -> v5:
>>          * Set has_hs_mode_support to false for unsupported SoCs.
>> v2 -> v3:
>>          * Document tlow_hs_mode and thigh_hs_mode.
>> v1 -> v2:
>>          * Document has_hs_mode_support.
>>          * Add a check to set the frequency to fastmode+ if the device
>>            does not support HS mode but the requested frequency is more
>>            than fastmode+.
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
>>   1 file changed, 57 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 8a696c88882e..9ebeb6a2eaf5 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -91,6 +91,7 @@
>>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>>   #define I2C_HEADER_REPEAT_START			BIT(16)
>>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
>> +#define I2C_HEADER_HS_MODE			BIT(22)
>
> This should be ordered according to the value. So place this above 
> I2C_HEADER_CONT_ON_NAK.

Agree.

Do we need a new version with this change or would it be possible to
update while applying?

Regards,
Akhil

