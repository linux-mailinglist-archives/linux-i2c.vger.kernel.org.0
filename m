Return-Path: <linux-i2c+bounces-11773-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18AAF5F8E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 19:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD8E170ABC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD67D2FC3D4;
	Wed,  2 Jul 2025 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EZzu18Ql"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83131A256E;
	Wed,  2 Jul 2025 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476261; cv=fail; b=Wn3gzDY/+RwRtVufPszbbATT83EWdBJEK787zJ9XVrw7Hd6J9ut67wZAoRZMfFMH7LKpiEoTpaQHyJv4BNze7+ZWQbUreSsAp/yAzHyOHDJox8zSRWUN+m9+JOGor9tK9G/ePH9aEASgkdceQHM0U+9HriZBcf5/Zzd5CRJlaOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476261; c=relaxed/simple;
	bh=EgisFgfTPguxIL5s1aHVFavnVEckpDfe/8DJGY5es0M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNGJWERNvCFI8rMDQ0O4WfkwtY0iumT3K2+BwarZq8DaNiYZRTTnUxGThciX/egh8R29GREzH45Q56lL3sb6AUuTix4M+59gyzh5xdPKb4E4r65P15VouR9obcBWJXpXH1/1pjayCF3BeAJjc5Qks9I7YXGE6evjUm/LP+6Cdlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EZzu18Ql; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwYPE3HM0gKmUUVjqKycgGa1YqZqhHRU5EKb437OPni2vYrfcdFkjzhCbZov6LUfZ6l+FpIPULQKo2Q+tl71tvf/uLzza5EqSaSQWlDNelhyloG+8NWDgRwCDY9KHRtgXAOFoTsHVOpZjWM7NRaXzaCwnh7HOMcDZZ3CRSWflLHvuRYbyT9gWobYS3cM+OARy6Xiq2vwsTSDnEGUbb7kRRuUUNNMaREliHZ9Uvzh7+Vs44U2vVrXrTpum010yoim81AtamStqRRog41jTVh/PfZPlJYLRLALix64AfgVMpFD9LQ5jCugqU0ef96D/tJK3uso6lnbLBF84jkObATzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROp9HHn2H/DroY1cDgkYaFGiLEsBTm4HAx0lCZ5CAes=;
 b=GkpxKM8uenv05klxqDd3NDdPiJ2qPYhrm9GxJ0auWkNpLFArdrPVr9s9mIVO0+xLu43M1nhwUnXm/C0WGw55vbvYRLM/PNemXu1Rrn5SZWd8P7tyghfb0CQDr+tmX43zgNd1vweEglQKIoHFHLs3Z/yygRZAqZubECgRXdSH6T5lQ6lFpcSImBRFVaXHRF452FKabB0yAt/pZ7P8XOnV0p1Wxtry6iu4LIwzIexVGNJIhptmysIbY8OmKfqxQwe6UpNghsbeEYFqNkYcRo/ptvgR4/AGdzcF1G3g8GgtWziNx4n4ISONz+7Bz6NPUJQkl/Zwpup17yD/ocCyT47eJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROp9HHn2H/DroY1cDgkYaFGiLEsBTm4HAx0lCZ5CAes=;
 b=EZzu18QlTpuZEaB9iVWuXiJ+k+x5J4rfgsC/NBbxqlLgeM+kvvnIhvwUC719k1GWZH1GrlEWp9pbQJfeLmgBLyuOPw6aG/S4JMq466U8EmT2IVYcXBMkEdjhEAD2qQhtwoofYuFi78OmMjYIIJp7/I22adLu2kXKi2bjAJdrAiSnFNv6o1iZJc28j/dOtOkJNPieHJ6LdZ/+Brm9Pf/NWTWmGpK+mzoeuYjUfkqeqw/I4uz2DaJPUYgTfzYHKONuyHuGI/FkycedWFS0LlyzaVKo5lobqfbPQwqlBNnqlxxeIY8WNgaDbAEYH5R0Z2pFt5dPEqxRSAjQuABiUZG3Uw==
Received: from DS7PR03CA0206.namprd03.prod.outlook.com (2603:10b6:5:3b6::31)
 by SA1PR12MB6823.namprd12.prod.outlook.com (2603:10b6:806:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 2 Jul
 2025 17:10:56 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3b6:cafe::2) by DS7PR03CA0206.outlook.office365.com
 (2603:10b6:5:3b6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 17:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 17:10:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 10:10:41 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 10:10:41 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 2 Jul 2025 10:10:37 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
Date: Wed, 2 Jul 2025 22:40:36 +0530
Message-ID: <20250702171036.1892-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aGVMr87HLrYGEw98@smile.fi.intel.com>
References: <aGVMr87HLrYGEw98@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SA1PR12MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e698399-16dc-41f9-fa60-08ddb98b6879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tnhCtvdzQCSkOcSWgIyFZaz4+ms2A8Z6IGFtF0ftJ+j33RmrZGxFoIAq9cFk?=
 =?us-ascii?Q?6E1AsmV7Xp9/GMO3j9fMkG6MfG0ZsaGfK3mmGI09NZAWqu9cX3VagoxF6u5T?=
 =?us-ascii?Q?XQCUutsHtLR3BLe3xA5ypIdawc+ty5e5oj5m57TlGykyrQIBEZTwwb3ZGILy?=
 =?us-ascii?Q?gD9x+aCBssS1IOIulbZWWsBn2u2K2xQxQ41hmn5e+IenvBseSaD7QJjolzGk?=
 =?us-ascii?Q?jY43JlQqPWMr6pPVoh7Ojtk6SGi/s/VRI8d1A2o9taZvCGh6K+uEEnJW9ruM?=
 =?us-ascii?Q?YZ4H8uXxAWEvHVp3Z11kgb890OUMHK7vNdE7ryjlnKGjKaR2nnu0hUi05MEe?=
 =?us-ascii?Q?LffVYgAvLOJUlaiMRv/O/EljgtrUyARqiXYjQzGad/AIKzgwaKTkt+njxt9h?=
 =?us-ascii?Q?dbzIfK76kkg1l9xEFf20RkyrN5iRx1tfWE5nr/F7ED86rCwB3CePZc2etUqT?=
 =?us-ascii?Q?dPuUlGr1Z/g7NY1j7SHuUx8Od7NvIg+j3gbrSlxIs35hZRpAsg1aAkn1ZM8R?=
 =?us-ascii?Q?fE6Ov4FHmAd6OLNMjpUxymB0iq8krUVUcKFu+XvWhu4iZUanIUYJfB7R9/wi?=
 =?us-ascii?Q?AA0uTzNqAKkFR3o5vu4qwEY9/+K+7bWdhsxueCawII5ICW5mxTbxEOJonNN5?=
 =?us-ascii?Q?fI91skQXmcYaVeea77E1FfhYHu95iY/Rqh3ELBo5A4l9KgC3/q8wFh9ii0Zi?=
 =?us-ascii?Q?KFEzhyjCEbNl34zo4kfaiUQgBhGdyS9a0wPdzInZuwFirFp3xPwON8SkdPbK?=
 =?us-ascii?Q?ES8M4hv053/UCzyYknkTmC0PNGJeq6+sAcBOYj80oy2D9R4fvqAHE6wnmvOn?=
 =?us-ascii?Q?rt/XIhKctUtkwYfIDE/fNjQJ0CSqMgG30QvF9DwWL0Uo+KKjxd/zXrCMys0s?=
 =?us-ascii?Q?QMff7GaqFEBHYYtnCeHn+0fDd9TApOsd3CbqjrmK/Axs0rVXItrgUIoZ+Q7K?=
 =?us-ascii?Q?59aFdlc+fQV/g13XY4vrxrC2lu+nIBKna/SD/DEESXpA+M+5rfbULrJZJ4Mc?=
 =?us-ascii?Q?TFXu9pD/1L6K33/R4x4lakFM7B97A1T0kITROzXWjqDatKNvcdtZZ9qMOFPq?=
 =?us-ascii?Q?4pyxTDDAw7XigONaYYMGLP+kOaNnKN3eue1H+UeNohncasr4niTDjVnqJj50?=
 =?us-ascii?Q?CsjCfumlBVP03G0NvC2zQZ4RYYX755XHUaYqR4WJAVUS0n0Iikam9w+BU3gv?=
 =?us-ascii?Q?DkIskzX1Oc7IHQLmCu+yRQ2KJ9dje2doNF0HpA4H0qmA30x+1AACuAoUFWLu?=
 =?us-ascii?Q?JEqZYx4KSbhxHQ7EeO3OmzGgmIMLETdpG0qSLuY4oxrbB4XoZagm18sIwL+v?=
 =?us-ascii?Q?cdiZg4OdMG9mRQrWBnUpulDS8nSF63NfaMr6I50mcOsRr/+akjX/lHayeCnk?=
 =?us-ascii?Q?t4kZbONdo6tGVEDSTsL3qXQQW2D35rJc2eMUATlMS1OjANIdKGv57M8ABTaJ?=
 =?us-ascii?Q?YXIme2IAVjL0FLiUJIzm5Tffgn8r5xZQW1NKN2UJMT6h5NyTAsm3sBgZ166a?=
 =?us-ascii?Q?VRqpU4HhtLMA2f42PuygnbHri6QN7J8zweHVpznDo49DNnjlgx1M389avg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:10:55.9440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e698399-16dc-41f9-fa60-08ddb98b6879
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6823

On Wed, 2 Jul 2025 18:13:51 +0300, Andy Shevchenko wrote:
>> > +static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
>> > +{
>> > +	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
>> > +	int err;
>> > +
>> > +	if (handle) {
>> > +		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
>> > +		if (ACPI_FAILURE(err))
>> > +			return -EIO;
>> > +
>> > +		return 0;
>> > +	}
>> > +
>> > +	return reset_control_reset(i2c_dev->rst);
>> 
>> It's better to be written other way around:
>> 
>> 	acpi_handle handle;
>> 	int err;
>> 
>> 	handle = ACPI_HANDLE(i2c_dev->dev);
>> 	if (!handle)
>> 		return reset_control_reset(i2c_dev->rst);
>> 
>> 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
>> 	if (ACPI_FAILURE(err))
>> 		return -EIO;
>> 
>> 	return 0;
>> 
>> > +}
>> 
>> Other than that, LGTM,
>> 
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Actually I have to withdraw the tag. The above function is repetition of
> the device_reset() / device_reset_optional(). Please use that instead.

I did check that. But device_reset_optional() returns '0' if reset is
not available or when the reset succeeds. Then there is no option to
conditionally trigger the internal reset when the reset is not available.

Other option was to do the internal reset unconditionally. But then the
devices that do not have an internal reset will have to skip the reset
silently if the reset property is absent in the device tree (or _RST
method is absent in the ACPI table).

Though device_reset() returns error when reset is absent, it looks to
be not so straight-forward to detect from the return value that if there
is an actual error during reset or if the reset is absent.

I do agree that some part of it is redundant to device_ reset()/_optional]().
But I couldn't find a proper way to make it work for the above issue.

> Also in the next version provide a cover letter. I use my own script [1]
> that makes me sure I won't skip it.
>
>[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

Sure. Will add. Thanks for sharing.


Best Regards,
Akhil

