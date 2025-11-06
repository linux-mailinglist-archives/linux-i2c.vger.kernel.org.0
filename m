Return-Path: <linux-i2c+bounces-13983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EDFC3940A
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 07:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F7D18895B5
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 06:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6342D9484;
	Thu,  6 Nov 2025 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jIVNjDvq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F3BA3F;
	Thu,  6 Nov 2025 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762409884; cv=fail; b=I9RpbkZjKgipvm4c1/bt7S6wFYGUyLvVZn8lmSiubASTC2ecT6CT21kql9JANe6JuSTetqvj/CUZQwnkpoWs8H4BAa1AVcEGG5iP8uUlqjCwuCg3ta2zCN4s/RMpPKLFUiBr6q/hZvN1WGJxDiSM3Axu66Cl7qv43//3oNkG/NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762409884; c=relaxed/simple;
	bh=AhphWSvumPjv5WZPFcy8z29FBcfGXm40e74/SV9cTT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/DGARIY+xVSs74CdIQ7m7UVLou1in7zj6ObOUBW9IwcQXZ6HWjCS+TTjj+EbFCpXgyYhflZf7RhMKWv0NlEMhcZ60D1x39ZbeQRUCCHqNXyd9pM8OzGT8z4nCAqSzuihPVfgYlM8nY4W4JOM09XDfF5lu9bjIR63Q43FrxCPBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jIVNjDvq; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCaOVcSz8uYtb+Lm3t9fER0wr+Wdo2Nm3vgiconx2qErncJP4ltucexr86yjgeiBrCbpObJY0mxMZmpruwDSUoU1p5JVmdy0SQBnH5lEs2p8j5MOgXr9AC+hXy2OyLr9lScUh8IG7va9dPmtdd3knPKKau2/1T72FsTJVzM30JWPen7uHzT06bgaUZMtI3+3/OVTkPtvYZuWyMMthbVSVPs9+Cwk9U0fU854SoPUlSf8xt4HUXEbbpxpdpcwHpn3LmadwDc7e3SB6wV+cctVY8/pHGfSpCTEFlaeVQ6bzPXJ1soQUH4+oanF8RIkaDxVF26QYdA8hsTuUg3b8EM0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bN/fSX2V/7Vo+Hf8MARfl8DroICdh/NGI/5XWabtAlE=;
 b=op+JlkVafRGDj4IIA3g1W7nW81AAAatnChiTImPYQOOeDTYj4k4DavzfxiTYJhyMKWbfE0C5eTn2TYOH16qy0XXec/D750C+RwAsCZ30uBjeFTAjt/r+R/6cfFtFxBOOYlyFriWiZrsnq9q8o08Zu77BJ3+eavbgKtq9ir5uVzI3KYbCiimIC9onf++l6b8rlou2HQOMaiD2sPtB2BMKteOY2AVGIilDucqoESbPfzyQ94DXuvLgHQ84jEYzZuBhDZeBgMmu2W1mC1goJxdTDl2n5kUpa1Bb284rsMLj85cYuxgOWNCaC2vsP6H1Hhou0VRIsB9YT0zbhOV1msghBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN/fSX2V/7Vo+Hf8MARfl8DroICdh/NGI/5XWabtAlE=;
 b=jIVNjDvqsql63r9Oy8hGRkaNKa8ytqm8WXgAtjKjXIi6QEk68G80gNglX6SFp46ygn2ymznO6FeepktCkd8V6NIB+T8Sj7gQopbcygnbDmcnTBrQ7uw2pwQBJ9xKV23roLYmF2mT1ip5Uh96XaD/q7Kvip5lJwsMkIq+3gjKsXvhZPVyFLzPkgw7FugarsmV/svx4qn/FxOGFkofvB825MGgL5KHxmdt3YnZ1DQWur6hLvgE4uVCBmXGkiZnTjSa4KNSOC+JP4AI3TEvL59HP19Nf2lnuqqZ0ac6esagxMYLCrNDh2NCqy/dqCtAEri01W+zxW3cOiX23smtLPri8A==
Received: from CH2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:610:60::22)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 06:17:56 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::3b) by CH2PR14CA0012.outlook.office365.com
 (2603:10b6:610:60::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
 Nov 2025 06:17:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 06:17:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 22:17:39 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 22:17:38 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 22:17:34 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v9 2/4] i2c: tegra: Add HS mode support
Date: Thu, 6 Nov 2025 11:47:33 +0530
Message-ID: <20251106061733.36157-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <84f7f5d4-bb6a-4e2a-9579-0d957b692de2@nvidia.com>
References: <84f7f5d4-bb6a-4e2a-9579-0d957b692de2@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|MN0PR12MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c776e92-2e76-4651-d442-08de1cfc39dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|30052699003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?69K0YSRkbESDQEQjF5UEFXWmbTCuQjeZOSc0xYuh1FpUjeM6VEmIguPp3Fft?=
 =?us-ascii?Q?PRKF3NgLxYz+ZVIwhcgGMgud1U0MpKgJ45E2U9loCzYsadK3Jx7I+L0DBjZm?=
 =?us-ascii?Q?DSzIZbo1pd5AraEqTxZDEa+ZO4lTyrMIywOP6077a2iXJd1JTCY7j9b1+Lil?=
 =?us-ascii?Q?QShhFIWPOX6FkEILs086DWFkrdgH8BZkd9h7pJizMWCFZ7zxORcQuyQHEPjl?=
 =?us-ascii?Q?d7D9gEWBA0bZ9XRQNQys+agJtS6YvxJwcP2xmp9o5g5kG7+8POc/a12Db4CQ?=
 =?us-ascii?Q?g25ETFaubKDeRAG43ybKJWjhkpOOD0aJ56mwJ/Tly10Ph77T7xTT339Wcby2?=
 =?us-ascii?Q?WJLW5fU976YCkwGX4WkbETsrbpfNHSBk05MegN6GGEGT0388oIvhlyDxCIz6?=
 =?us-ascii?Q?MAy6axwvJjqbs60gWXVL8nSN+g8e8hBSdh6bgf4AbD25bfZfl8IZn1WnbGdv?=
 =?us-ascii?Q?dmgLOZfyAWAThwKNvUhF+GXfcdqJ2TtKR3pC7H6/L6QGqr8+iM3Blm6tkL8s?=
 =?us-ascii?Q?wsgDsEhaqSto9KOuR1a4FSMxjB6YOlkXgeD+HG6CNgj4b/nXY9+pyeaQ+3Wr?=
 =?us-ascii?Q?Hh80+6QBO5ocKFpxH/L+ArSqy9ueDMZVeCE7PFB5mEkQeKDvrBuAgjjOL8Xj?=
 =?us-ascii?Q?6MPsCuDkNdIN7x+Xob4LlQIwm2GNXI2st0TMTCKVV8lfvWcKNPEPvZ1xPBDb?=
 =?us-ascii?Q?MbS7VZ0n9yd/X5lIXsLiglun/9NF1QwBYIgfPiYNKN+mgHmP11kmujzpFV+n?=
 =?us-ascii?Q?sj2S/LAOZAVvLGyu3ZlTEHRLkwSFjgQRVUbk4+NBqyfErHW4R0kQs57O5GcH?=
 =?us-ascii?Q?b8S7+kM8JABgkOjDjPFWyaqOXDFZo1pvoD3xzmn8ZcU+XMqW6HpkoA0g4M/h?=
 =?us-ascii?Q?qFhrnkpOfsGzkqKczAy+1yJCHjodU11ZcAYsESmf+voYvMCgpTxNjwTRGN+l?=
 =?us-ascii?Q?EjSqFPBGjWVDGjVYYBA4oki/A9COGd3ek6JR8a35fk9ohTUWWVKbDu+nw47q?=
 =?us-ascii?Q?PYSaKptRN//mUVSIS8e5SBMgElmgQq+aN7J00Tq9EPnk9ZflzrS67swKovHU?=
 =?us-ascii?Q?b2nwovSGvaqmXTyjIj+1O7CefvEgGERjJZ7FQUT6BZsPljGAjeGY1V0dyfVS?=
 =?us-ascii?Q?6aF5UKjHygZ9sPHcixJt7T9JPMnMT9kF3reNCM09cWF1bkg4b1rrMqxJrWhT?=
 =?us-ascii?Q?JvDGgBq4u/SGLZSIqAy5YqHSysTNEzNqE2c0AFOdhNS4xG2YXb8d0j29h0j7?=
 =?us-ascii?Q?YoGWXy2NH+ejb9j8+Bpc1sNDT9Q1oHmtcdVXtxo8J6oY7CWFm5KhvzvQBIY/?=
 =?us-ascii?Q?rmrfnqYn7TqlDaNIZfdZ3bPn/MkIpyiCfOT4iQ/tyMfCgGPZx+HgcRk3TLZk?=
 =?us-ascii?Q?xfioHt9j/QsxDRnRsySnPRL0QSrGPh1oH3/7f292WPmhrK4oziGSuyDbN4Yk?=
 =?us-ascii?Q?vZgZ8KiSyXsPNnTK4OJwHJyRyZCkMmrD4K69BDejXjcl1YJu4NOQJT0+vnix?=
 =?us-ascii?Q?EyxY0ITZS4eeCVLWot8qY+wxNkMS7dDRC7hKAMVxtPmPCOAkZe3w2ZVeyUQe?=
 =?us-ascii?Q?3MlS6zTRfBgaOeIHtn0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(30052699003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 06:17:55.9395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c776e92-2e76-4651-d442-08de1cfc39dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080

On Fri, 24 Oct 2025 16:28:50 +0100, Jon Hunter wrote:
> On 01/10/2025 07:47, Kartik Rajput wrote:

...

>>   /**
>> @@ -678,16 +685,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>                tegra_i2c_vi_init(i2c_dev);
>>  
>>        switch (t->bus_freq_hz) {
>> -     case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>>        default:
>> +             if (!i2c_dev->hw->has_hs_mode_support)
>> +                     t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
>> +             fallthrough;
>> +
>>
> This looks odd. I guess this is carry over from the previous code, but
> now it looks very odd to someone reviewing the code after this change
> has been made. We need to make the code here more logical so that the
> reader stands a chance of understanding the new logic.

Would it look better if I update as below?

@@ -678,8 +685,26 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
                tegra_i2c_vi_init(i2c_dev);
 
        switch (t->bus_freq_hz) {
-       case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
        default:
+               /*
+                * When HS mode is supported, the non-hs timing registers will be used for the
+                * master code byte for transition to HS mode. As per the spec, the 8 bit master
+                * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
+                * Whereas when HS mode is not supported, allow the highest speed mode capable.
+                */
+               if (i2c_dev->hw->has_hs_mode_support) {
+                       tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
+                       thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
+                       tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
+                       non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+
+                       break;
+               } else {
+                       t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
+               }
+               fallthrough;
+
+       case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
                tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
                thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
                tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
@@ -688,6 +713,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)

...

>> @@ -717,6 +736,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>   	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>>   		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>>   
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
>> +	}
>> +
>
> I still think all of the above needs a bit of work.

I suppose the above section can be as is since HS mode registers are independent
of other speed modes. Any suggestions or thoughts?

Regards,
Akhil

