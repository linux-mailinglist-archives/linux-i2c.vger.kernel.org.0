Return-Path: <linux-i2c+bounces-11402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F526AD82DF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 08:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840071899813
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 06:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D97255F3C;
	Fri, 13 Jun 2025 06:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RCBjGd03"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B50422157F;
	Fri, 13 Jun 2025 06:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794461; cv=fail; b=Frk8/YYREV0MF29Eya1xHPmsv6CMvLGbXeYjiciXqN1K5tQwBBHBpEv0nhWRT/9z9AoN6FI5L7hN6sqI5l0PEwpjn+Set5ro4Q8qgL0bcg/XjDt1waL2WAq5dBDgv0jD+PBEhD85tztr6rp3e63h6og9gd6nho7q/VHPanDt/CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794461; c=relaxed/simple;
	bh=htxtD/lwPvMIN6YC03sfGLStRY8Ct/G69TUjvK45iwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQigOKrRe8ME6sPWSS0UjFi4+n26gFcul02PiIZB9hFSRmUk28v1G74FH8LY3th2oFR5AjgFuQMw83VAKYrcyTABTU9tW6GiK7Q8/we9YbOEZFLy4KS5KnvnKv28YrWmqATxYN8W2gvJ/i65N2nl0ShgmpiRMkMR0Db0JHV7Azc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RCBjGd03; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZnrdY1QRTuSx8rB9vw50YvbUvfm5QZ8HucToPMNvR2U5UjilRqHDZTvWuIgew41B97Q9VU7j21jCqHafWrFGkKM1e2RGC2ka4m3/jmrlP1jUx/bKZDFNVtpfxhaEN3X5Teb0crGhDeAA68RbHKeZm8SLSZhiuPD5pcTrsHdcZv3azVycW/T7/inb/aA0Z34nrHZe2MG8ES5N44uEqSqdTOTGT//YlRJs65KhhcuBOCaIXdLt1uAtYlk6v7xtkCAPN1+i/zdvJWFePm7NrkcNkvOiYN1T74yck1X5w3ApnWsdX4GboTfpb90vbLSjidLSedd/6aHewzlx1Uo3cUncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faNQP2fyY+ZkpP9GOuCQJNodHoS2EKDP6N9KBZ2u6vw=;
 b=YH9YvTlKu7JTpgzURFkaax0M/VdynhRKjheVx5fMJcWwXEUfyELnvbc80NBevyXKd54bUIHyWifpmQ56wq1Vxsaab+nlmrjYtGvtPfKrvMJ7LrZD4XAsLF2kfaKRC0BXJ3wupD0xL/cMvsyqA0r2ToSj/ITlBj/3pq4bqqtT4xNAhq+Ekq3g5g+nfgMucd4htFyGebHPF7hohEvvA8naipVTKdbbFosheBEySkDKXd9eFNEEflBHqU6HQ1hFJpj0jGq7wfdF9uiFnU1ilhUxVsObWI2vWOprddxku6FLrRcgW/e2aLF2uF+7mFBAGGPmmH/tIU4MP1DyQrxwmXw1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faNQP2fyY+ZkpP9GOuCQJNodHoS2EKDP6N9KBZ2u6vw=;
 b=RCBjGd03+OWDagS5YufHjLDHNwh5if86+Cuv+U9XPW3+TP9GbQBWAyUry4V3GZUzofSknWpEwGQA9z6edWOX6Um4V7gymUOSAlmHN07XHxsS/3oqHUJj9CvzF3YCl9f4Pwc5MyawenUbUrh2Yjj0MpewvJyhynXFrAgcRAGuIJoHppBv5lZukpfLBUW2KResnY5ud3VkwwnNWNJTan/5jRzeq68HlA0Ky8ylTNluOSnKi0V136vfl1Pj3anl9pVjPSuDiUlbBjxiL79+Hqoqpqo+kkRJxiNS57Zu/ATerOKDFin0xTAa45GQwszQq42/QUH8Ex0OMks6DeB50g+wCA==
Received: from BYAPR02CA0037.namprd02.prod.outlook.com (2603:10b6:a03:54::14)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Fri, 13 Jun
 2025 06:00:56 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::a4) by BYAPR02CA0037.outlook.office365.com
 (2603:10b6:a03:54::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 06:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 06:00:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Jun
 2025 23:00:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 12 Jun
 2025 23:00:37 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 12 Jun 2025 23:00:33 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andy.shevchenko@gmail.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<p.zabel@pengutronix.de>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Date: Fri, 13 Jun 2025 11:30:32 +0530
Message-ID: <20250613060032.14927-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aEsf7Ml__JE1ixQX@surfacebook.localdomain>
References: <aEsf7Ml__JE1ixQX@surfacebook.localdomain>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: f88461b3-f033-4358-95e4-08ddaa3fa9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ZMLvhGreXyyLIubvr9c3zqcXHW89d5ptOcJRT7khojxvtOIC1zO6A0ksJiw?=
 =?us-ascii?Q?PMhfz+JEbuDTmZOZ6oY8X7rMe5UimqGVohN4jHMH2Bxv+f+CIst+WsuYLmL0?=
 =?us-ascii?Q?Q+MB55Kw8yAKJ8uj7LfYETmHYdmZGJ60Q4qGqIeQihZ7Vc/hCV2AJVPh6eKH?=
 =?us-ascii?Q?EcwFztnhL/ce8KBDusB0t4c/OYAZFWXLYF7966PN7jUi7cVe4SL/LxlVG4Lr?=
 =?us-ascii?Q?0Dfak3UAes6e05fRbcPA/Yuj1TizIntfzwzcL5HnAlCz3cqF/FkBHrvxjL9J?=
 =?us-ascii?Q?r7OnCE09B3vN5EjuoNAnLckSwzISXlpCZYPNrquv1i8gxFjEVybxGTNglxn7?=
 =?us-ascii?Q?k8JWSwSHMcCmxu06qW84oryBd3ooviRunLRR0GlPyzL8BUSbJihbnniGslms?=
 =?us-ascii?Q?X4WpAFUPvOBTwKvg+1xKl0HnGRGoZqfZAvVw2ASHG8sEDCbLjrx8VHJJNwaW?=
 =?us-ascii?Q?2pCHADQDfs6yhb/m6MvtMpVQzMjg1/PyXp7UX9dSlTcYa2Big8LR849t7quZ?=
 =?us-ascii?Q?kdUqS/G6O2R2Kaq0Wz6eVR6+7zMgZRSGvqpsY7fa3qH9qBFVkiugWyo4rXXs?=
 =?us-ascii?Q?D0iMwAdBlyC+ogmB7x/Or7FugXVmfcs6wS5OzCgQDo1xrKHzdFUTH2amnc18?=
 =?us-ascii?Q?dHKx2PMQCyO7RJzhLMdWBMtBJSgsYPqeOHYUXuUogFjbj6QwJW3c2hfr7cqb?=
 =?us-ascii?Q?XAWjnyzwlEW8GFbC1gLfR9tKIOfTQP7irrWo54GTXbkOJ0mq/t+qMkdjK9Qe?=
 =?us-ascii?Q?pWcW2DBigOYg+4kiQsd9vUwzqZ11lVl3AOcNuwIRleFuhgaySoaaoHAAAU67?=
 =?us-ascii?Q?PmT67KyUL91qauI4mmuSmQdvqZH73rhpfznJAY+hchElehh5TgWzeio9r36x?=
 =?us-ascii?Q?sdrltKGV5nMScVB8VK+bz8c8CzEwCv1BULL7OyZc0oIg2gY/ZTISySvY5KeM?=
 =?us-ascii?Q?vfpztxVF1IWSNB1WeUXlB/lbPpmVVwL+bsUbnir3VBrY6pzIPDRxhdgeFKM7?=
 =?us-ascii?Q?KJsM6jrYs54lNMcGM827/FKiZ8sgWy6+JQqsN4wRsdO7n+oWw9xb9OutEtS+?=
 =?us-ascii?Q?konpk0gtTdKOVQiB4j0AkH1de0C+nffwPDePKuSDXfI/G+MDD7cDsxw4enrP?=
 =?us-ascii?Q?yhfP7MuktQYa5gMqQZsFK75VdME2wryPtl8cRj6aS13jmTQ/ZIaUEOAS8U+y?=
 =?us-ascii?Q?oWxrKugwzzCB3sZFewxuSDayz2WTD2aW0MVgRSULE3mm9N7xQ9wDI2KyO3pq?=
 =?us-ascii?Q?lUgypF30u9BvqnvtZ2rWVulzgb6JFcqQFKmZKJALm/bBYsz0YY6P6pBWJX6s?=
 =?us-ascii?Q?3IaHF5kSgrmvZYSeDgmMM5lWPeijxBRwLLk3rQ7wtEyWKuN83KURQvdX2bdw?=
 =?us-ascii?Q?seuSePhJVu057jBgdxqaVtXf0dn1Fpm5p2qazcbXqbuUzAXtywxxV4D1wBcj?=
 =?us-ascii?Q?r3aGEPc94B2Yd60aCMl/EM8X39WcJYpItzSOTQZW2nv9VeqTU2h+YhXhVko6?=
 =?us-ascii?Q?x5oYQhCjaPcgpLzE0UYSYpK6ZnOGaQHvpYSg?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 06:00:56.4877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f88461b3-f033-4358-95e4-08ddaa3fa9d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988

On Thu, 12 Jun 2025 21:43:56 +0300, Andy Shevchenko wrote:

>> >> >     if (handle)
>> >> >             err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
>> >> > -   else
>> >> > +   else if (i2c_dev->rst)
>> >> >             err = reset_control_reset(i2c_dev->rst);
>> >> > +   else
>> >> > +           err = tegra_i2c_master_reset(i2c_dev);
>> >>
>> >> Can you please take a look here? Should the reset happen in ACPI?
>> >
>> > This is a good question. Without seeing all the implementations of _RST method
>> > for the platforms based on this SoC it's hard to say. Ideally the _RST (which
>> > is called above) must handle it properly, but firmwares have bugs...
>> >
>> > TL;DR: I think the approach is correct, and if any bug in ACPI will be found,
>> > the workaround (quirk) needs to be added here later on.
>> 
>> As in Thierry's comment, I was in thought of updating the code as below.
>> Does it make sense or would it be better keep what it is there now?
>> 
>> if (handle && acpi_has_method(handle, "_RST"))
>> 	err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
>> else if (i2c_dev->rst)
>> 	err = reset_control_reset(i2c_dev->rst);
>> else
>> 	err = tegra_i2c_master_reset(i2c_dev);
>
> This will change current behaviour for the ACPI based platforms that do not
> have an _RST method. At bare minumum this has to be elaborated in the commit
> message with an explanation why it's not a probnlem.
>

This sequence is hit only at boot and on any error. It should be good to reset
the controller internally at least for those cases. We are reconfiguring the I2C
anyway after this and hence should not cause any problem.
Will add these in the commit message as well.

Thanks & Regards,
Akhil


