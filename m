Return-Path: <linux-i2c+bounces-11821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96027AF8847
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 08:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD603BEACE
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 06:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95399200BAE;
	Fri,  4 Jul 2025 06:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ij+fKPqa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28384414;
	Fri,  4 Jul 2025 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611655; cv=fail; b=PuwiEK/Wkhyq95rXLMF1H1B3bsnmZuq3fdBKa4A7u7J3yaLks0RvOk6IQ1dccXp9F2n3uUSX6A2mwCZItHVfgcNx+a4Qnn9YU1/Ul4dppGcuDnkdue8e6OH00pDKPdOo5cowKEfQrYOlTNmworBKHuVrJpgx7B4sxRGTv2m3hfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611655; c=relaxed/simple;
	bh=iaXc9Qej3GUN4iOdbrkTnWROkmVB2DiXd4PmyWWM7K8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPmEkyOtMTY/q9mX8mZIsGbdXgtIt3mOfK9g5bpIYirp2KLZ8MzdAcE9bDkuf/7nwrWDXVNCaJrHZxfyWn1j1NxSpzbM8VpS5lL8hYJQTUCxw/cxQXmFYZ/kYfYXIoI0x4YOn+0bXpKhjl1W+3uJ2eO5z1xLFyO055BB0RoO7RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ij+fKPqa; arc=fail smtp.client-ip=40.107.223.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLXGB75Xlo+FmXF4ipAA3kHDC4ZKXKc2BkX0q4MlZcBymTmH55+CwqeW0tseBwG4efCRShMbNYWkK77eL0QkkJjqpdD5r+W+cLp6xBaMQklOLnN+0X6joCHdMxe5qXKsYqbcSyqPb42QARdxKQx+ytoqSL2lgUXoPVhIXFJd/mKTZoJ4YcaufxX2anGSvBWCpJlK7Ab4nLMVXZnN6qF22YtjJUAEmRotMFGVbWos0pqbhfPxi5GoUQbHrtmWehbCcC6rIKbY69wfbt7+IY5uKGAJ7VkaP+lK2eWxUK1uAdZ/itETMKV0bBhb5JhrdEV0r2ZmTKv56lRNudgOdx+dMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdGB6i5moktGGmseI38QRevBHdHZHMgQhyE2df5fJe0=;
 b=o31kknuEFfC8QmuX2m5vh5YmaXKzuYHeANsKDWqKCxCkwKefl54T2CQIqNIWKeZipdkSfNR1wLZFSIpRUcsmSiCwUJQIcM7dz5/42UX3K4/qf8uVJHg5v3EdrpcOVdzk39sQGlbb0Bd4TX/d2tSwzPrtqSTngXz7LRyiWtf2aLhRWu7Hw4Qm/JJVUl1E6a1kdS5s3d9x/pbJkTOQrVFJNZQKIPBT8BZ7j8WNFdizajGS0vqkdTQbI2P/cKiUXLwZwMMMJDjbw666FRHOFVzi8Cu58aQiwlKGYfKrejCpsmdaLoDTicHTVD++Sx9dStC8WDtDfBGCxmipQmDz5Dy6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdGB6i5moktGGmseI38QRevBHdHZHMgQhyE2df5fJe0=;
 b=Ij+fKPqadsvqqvXMwYu47dMDj7kNCNrUQ/Ell07NUnZKI+muoTtqOd7KCfxtrXUBZxbhpaeLXbjKtikBs4De7qO9sy3m0k2QQd0H/QXIqUMeTmW/BFKV32LHBrNmOrJCM+XM62g7F9u45nFxNstZCMHaGVYIxToctLi5045IbABs1nDU9adBJ4Uhnu3coOvz2S3H1aV6ohoSC+4A47zkX5x4fmMROGMIqWXsiUNwnFoTWKH7TFZ8eea3UJuqFxK7N7QIBFIU/B+BkE1dJLnmuRMn3l34fYvAOq7pbn00BRDU2vPriuymyp1kGDBVTM+9396zZU3a/4bQUSW5+/gNYQ==
Received: from BN9PR03CA0436.namprd03.prod.outlook.com (2603:10b6:408:113::21)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 4 Jul
 2025 06:47:27 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::e6) by BN9PR03CA0436.outlook.office365.com
 (2603:10b6:408:113::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 06:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 06:47:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 23:47:10 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 23:47:09 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 23:47:05 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@linux.intel.com>, <p.zabel@pengutronix.de>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
Date: Fri, 4 Jul 2025 12:17:04 +0530
Message-ID: <20250704064704.23003-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aGaPf_j1SHXMGAn1@smile.fi.intel.com>
References: <aGaPf_j1SHXMGAn1@smile.fi.intel.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 8660f2f6-568c-4d18-b3dd-08ddbac6a3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zEx1kDBcVlRhGm8zvDthgNqlDuAh/kutWusqymB4IFVSfC2qtQWwx9/nco5r?=
 =?us-ascii?Q?bkWloV45JZ4zEjvGDzKzQYovwC7N55dI2ivdwcbBHX8Qy5p/3e569TQjcYhT?=
 =?us-ascii?Q?53f9p94dzJ0O9NaZexXq4KDZXEgH1IMdsH52xBbKkzKyPaImNZjlZW8y4IDd?=
 =?us-ascii?Q?zQRbZ2MIY9hjb8yRfJ2zYAcb4ypWbbONlkfgLJQAYWG6xUsbxUKXDR/ydjId?=
 =?us-ascii?Q?AXFRbVzDioDr6NS0zgmSKxIFDYkpgO0pqFUBRGOVVc+cNUzE5GzWGjG8h4Jc?=
 =?us-ascii?Q?RI4fF2VwkzKjzkBWO9AV3FVXP9JLRAs2pjprdvVypOWm/dpVOOJaY52CtQiY?=
 =?us-ascii?Q?IF5Vazh9lJiweKR4dx/21GN1+q8D6bIWu6TmrhTg7cM+03uOmKng77D6LoHa?=
 =?us-ascii?Q?jvQAVRcUwF1nqJKYMVDmB+mNwHvCfWMVQ8LQzoSHP6cWFMcKA7Ku5lR5fT67?=
 =?us-ascii?Q?JeGKJgXEM5GaVrZwe1Fcn/wfxUoGmWBYeAwuBeM9z5ueBazsfY91pPvwcVUZ?=
 =?us-ascii?Q?IUNq8ex85PvHGEwqE5unV7scKrE/T/hIknxKOaAVY24sPh9l/j2AIxPHImGs?=
 =?us-ascii?Q?+tK9AsQxfGtwnVhtVPKiIzxiFYmRFDij9wrr1G6bcGpDskKryUdm4JcsvoTA?=
 =?us-ascii?Q?Y2padKkLN/xz2u4c9gmgiVC6KI9Sw5mmzuvTEBf4DdRUlJQ8MLXVTUkLDS8p?=
 =?us-ascii?Q?yr7Jl3YXdVCHp8lsBQnaE3OOxzJyfkk+3raOdyY0RW1nnPCQUZhTYs7LOBui?=
 =?us-ascii?Q?d+qI7dpEn0dTnjfJ1iic5xVhLGw5HKRl1xKyW+zg2Tc46k0e9yEUT+au82XC?=
 =?us-ascii?Q?98nw/i+MeF8LLuX8PEVTDKj7/BFjB3vhqO7AtsJEWboitokoathYWU48PDgc?=
 =?us-ascii?Q?uSUKoQa/OFj8oumfB/5gfMrTm5sWmj+0PoYIagMgDT8rzqnG9yyO6tyXE5AK?=
 =?us-ascii?Q?IWzki8YFiV4fdGb6myRz68LQPUQAdbCvAXlk3Y2w1KQPl2q2QiqVpvAP/g2S?=
 =?us-ascii?Q?jivn6hgL9rCvyXlT5PI/kCWi1O4/KzQtR6gT9ugUGO1xzHrzVgK0bqb1ab/9?=
 =?us-ascii?Q?rFS0E7svlJKuQBX8UOXB0gqSYpxbaxV+DWmMkym8Tp7DnIouWWtisUb8E/j7?=
 =?us-ascii?Q?cTVmMQR8rojFJrust2OLB8iFFeay2+diSz5zjk42qdsIEIw6fFmReLQ2rrZE?=
 =?us-ascii?Q?I0B29t/hj5NOm/vL5LVc9/gLoEt7bSRW0QY81g3eZM1raLOEoKduwma3y8P5?=
 =?us-ascii?Q?G9gHTay93jeQjBddwaJIxKZad8k+n7WD14CQEhACwrJragBbT5RB6UI5M3oF?=
 =?us-ascii?Q?lyXPAdNhgzw4qMLh/89yN+7StsjVwQzTnKA5IIOvzkJLaN5RitYe08B+wgcZ?=
 =?us-ascii?Q?cD2igZWV2iqoNP/71G7bbxmlG6kl31A34yjlqpoRTQeQRaHxpYdocquTpw9w?=
 =?us-ascii?Q?oDLsl0mXWiF7LEzMyEami+ARIdtX9XodYn1a1AUn9yDWik2uOLFZy9tXR15A?=
 =?us-ascii?Q?q14bv+aYtXlhUh+jggrI4mLvKMb3J2h3bu42?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 06:47:26.6354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8660f2f6-568c-4d18-b3dd-08ddbac6a3a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665

On Thu, 3 Jul 2025 17:11:11 +0300, Andy Shevchenko wrote:

...

>>> I did check that. But device_reset_optional() returns '0' if reset is
>>> not available or when the reset succeeds. Then there is no option to
>>> conditionally trigger the internal reset when the reset is not available.
>>> 
>>> Other option was to do the internal reset unconditionally. But then the
>>> devices that do not have an internal reset will have to skip the reset
>>> silently if the reset property is absent in the device tree (or _RST
>>> method is absent in the ACPI table).
>>> 
>>> Though device_reset() returns error when reset is absent, it looks to
>>> be not so straight-forward to detect from the return value that if there
>>> is an actual error during reset or if the reset is absent.
>> 
>> device_reset() should return -ENOENT if the reset is absent (as opposed
>> to present but somehow broken). If there is any code path where this
>> isn't the case, we should probably fix this.
>> 
>> In the ACPI case, -ENOENT is returned by __device_reset() if the "_RST"
>> method is not found.
>> 
>> In the OF case, -ENOENT is returned by __of_reset_control_get() if the
>> requested id can't be found in a "reset-names" property, or if
>> of_parse_phandle_with_args() returns -ENOENT for the "resets" (or
>> "reset-gpios") property - that is, when this property doesn't exist or
>> the entry indicated by the reset id is empty.
>
> I have nothing to add to what Philipp just said. I believe we don't want
> open coded variant of the device_reset*().

Agree and makes sense. Will update the code as below and will separate the
change in two patches similar to this version. Hope it looks good.

	err = device_reset(i2c_dev->dev);
	if (err == -ENOENT)
		err = tegra_i2c_master_reset(i2c_dev);
	
	WARN_ON_ONCE(err);

Best Regards,
Akhil

