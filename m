Return-Path: <linux-i2c+bounces-13985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A66C3984F
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 09:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1751889418
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 08:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D134301475;
	Thu,  6 Nov 2025 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LXCqa2GV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012036.outbound.protection.outlook.com [40.93.195.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DCF3002B0;
	Thu,  6 Nov 2025 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762416402; cv=fail; b=op1bL/+tj+EjxAJee9DxPVHXy4HmLlhYEfP+A+femsobvXkdGz3P2Mcw2L1etFgdRDz9z37rESd5SdxB5hYx6ud2Oj+DgUOFBsWfi4Hxm0ceGJ6Jwe6DJR7LUo1Aelh4yr3DWuJTLXvGZwAwC3Ua1ssVqn2X0n5VNGP7+NpyMLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762416402; c=relaxed/simple;
	bh=3dX+0/8aeUqGzjHWFpExsmJl/UKgZcfYmaqDl+96iPA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mC3/fObxBDxLkJ8Ld0QBBq8xa54iG3JEgl5Brmb4gqBVpJt79Ud6gAW7ktPKym65LIWKhmIxxMlIi2MppeyCz812+9PYpdBvMazU4wt6GAYeNG7VHy1ZCnxKjusYSe6gKBggUf0g/LP9O1H0WBOA22ETBE5IlG2LiIsOZAe2SXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LXCqa2GV; arc=fail smtp.client-ip=40.93.195.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkCHS6cLcBPnSrCG8+KNRPnqfgCbrnFH6V1GpQyGZGQWSgjya4Ld9fx2scAu9q5cUfAt1i2kYZTw+Wu7IUwVqzV+M+pLd3/W/46jRCxzqgeD0/M7AvRVi8kqqqkz15Ma9aPnWuRoy2kXVDq/ZuCIs2a2dmXnzFpFyVN2ruTfwW6p9PgKOpy7Rd1yNQPI/01e+hNO6sG1v8QPQnwADsTKSa39d1h+y3ApAwKIQtnMA7ztT3adhtgaqAwvsOtwfuTsTwGmzoGK7LxqQ6tbBpCucCunKvUP2Iy5vhBN6e74ie75ZMYrK3prIQoK4s5IjdVsgI55o9c47UUV/+CGO6cssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ns0IbJsN8dNXv49T8Jz4FvPENdWfWxCOkDv9+iMmxY=;
 b=xz1/F4hwJOasX47MPBL3bMsWQXLHnkgOmYS8EQbgppkYgljvBsQFuCRbJFizoh0uHnqhKCMAhHfWjE3Qv4NeunyADJctMpeEDBIxD4c5UaZNFYDWrCA1cOlCh33PwHHA0y6bvhYkSDLkyazUaCr57UHooFB4ClBj2QVmYZx7pwJsX2dwbThoCA+emhWztB29Mhy3r5QfFCHbOn88zln39ND/ylY3G1hXojhAXdFcvPK8ETYgg+OLykuXJjDxYNdlECa9NSd+acvNx9Ked8YO7yEn3/kSRImtInkP+X30NFMxC5QEv8ckLqlpbPACF95QuDzwI4CzeJnNXh2vpQEB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ns0IbJsN8dNXv49T8Jz4FvPENdWfWxCOkDv9+iMmxY=;
 b=LXCqa2GVOs6TmmVLc1eNziCqZ4PJswOEOKDw31GNZYwl3ZlCvtcr8FDUPt7bUr3cWnDJ3goBBp4LH5vScXjn7CEsUfzt1/IKSc516mhjf5okIMX+c+RM/YSeOlV2RDmk4BEM6+7E/za5Csojb0GN3XaF5PwSDVs+HvdNd3SYpt2zVhpkTgHp8y0ffGn77icgCUBtq+f/kKQJLCRShUOIB9Xfq7yAN8okCaJvMV3hcC8d48LDgQYtcelegavJKddNkj2WWuwph5QJSE4WsIx5xbECQtbUbfgCkNOFXSw4bikDUo81LWiN85bfGhmKZtYXthIPOeQV7XkXtxcJ/hR21Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SA1PR12MB7222.namprd12.prod.outlook.com (2603:10b6:806:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 08:06:37 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 08:06:36 +0000
Message-ID: <75cb233c-8089-4da7-b7c1-1b229e2b5931@nvidia.com>
Date: Thu, 6 Nov 2025 13:36:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: tegra: Add logic to support different register
 offsets
To: Jon Hunter <jonathanh@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-2-kkartik@nvidia.com>
 <4b121269-1efe-4741-b67f-42346b6c5c88@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <4b121269-1efe-4741-b67f-42346b6c5c88@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::7) To DM4PR12MB5721.namprd12.prod.outlook.com
 (2603:10b6:8:5c::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|SA1PR12MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: f16a58e7-046d-4927-64ec-08de1d0b67a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MStGS05FQzdjSklKblI2V1pzRmRPVm9kajJ0VWFpandTQjhsd0RlaTg5WkJJ?=
 =?utf-8?B?bXl3MlRXc2MvTjR3dkVWREdtUEUzRnJRdG9kcGZFS2l3eGxLQ3hoQ0hsTW52?=
 =?utf-8?B?OVRKYlNiVmRlclVjWXhpZE9IdTF3TWlJQkpBYnVaSnNsZy9CS2hkUUg1dTNy?=
 =?utf-8?B?UDRWMkV1MlAvMkMrQnBaZ0tMMGxNMEk3dThqZkp5d3FWZG53cEpmMlBXTndZ?=
 =?utf-8?B?eVk0UFNXOUducUJ0SzFPbTBKdnozVTZlMDBJTGg2T0lsR2NTeXV2WGZlYzJZ?=
 =?utf-8?B?TW9BNGVFa2lQMVJwTEMyZDU3dlYzamVMb2dpNkhhbFVnQ2g4V2pQaU5ZeS9p?=
 =?utf-8?B?a1pnSnlEdFBtWWIxbnpJdkJucm9VTnhUS25Yc3FpQXI3ZytETFlBR2M3WDhV?=
 =?utf-8?B?TVo5Rk16ZTkzTnU0MmI1SWc0T1ZUQTJWaS9ReDZBRjJQSGpqa3hCN1h4SDVp?=
 =?utf-8?B?amlaZDlOVHM5SlRGdXRzNmtJWGo5VzFpd3Buc1Q5akROeWxsODZmTURXQjA2?=
 =?utf-8?B?eU9QVDJhcWw3aFBXTFZqMU13V212MGFLT0MwdEVvMzZxS2krM3V0QWpwd1Bk?=
 =?utf-8?B?dXljc2crQkwvQ2VScjlJU2V3c3NBM0ZZN1NuRjFCa0NCNmtCR0JrdlVxZHlK?=
 =?utf-8?B?dVVCRGgxSkdiODdjQVFLOWRsSkpRSFRGNC8yTTQ1anB3SFg1WnNFVGZLbU1R?=
 =?utf-8?B?dU5GRU5jcUhxVDB5RjlKV01zUnh3WVR2eHB3bkwwQTZNZDRVTjFNcFdTUXo2?=
 =?utf-8?B?cVMwMkdRN3ZEeWxxck01WHV3Ri9HbkVnOEtHRkE2dFgwNlNzV1FRVXBRMjly?=
 =?utf-8?B?Vm9tb0tlU1ZJdXV1eTVjYlp6VFNicUFpYVo2djhtN0xENmY0bk9Wano4c0lo?=
 =?utf-8?B?cXloRGdSRmhkZGRTUUJSVmljaXFVTDNOdDFsYXVlZEIrd09ZdVBsQ2RKczF1?=
 =?utf-8?B?YkE5c21Cazc4TWFKSnk5VStkTVVJblVkY1BxUHRXNEdSM0ZKR2MzRkg2MXow?=
 =?utf-8?B?STMvUS81eGM2WS9OOUt4Tk1GUDMyQ2p6L2l2aDZiK2R6UkxwZHNOZkxwajRt?=
 =?utf-8?B?czR3djdmUURCWXlnS1kxRStGeDhTRnpWcVFZWk92ZTQzU1prdHBZZ2Y1Rnk2?=
 =?utf-8?B?a05wd3dTdzNoZkcyL1k2bmNZdE5kVE9QaE9NREJlNUtpQXJjbHZzN2h1RWc1?=
 =?utf-8?B?SXFvVTFzRVNjN0NoYkJpNENXUjJUVjFnYmcwVlpCRzdEK3Z0YTF3ZEJ2cXJl?=
 =?utf-8?B?ZloyOUhCdzFjUTA5UlBpL0N2Z0lCd3UrSjZkNGVtOWFoeWpjSmFBazJaRlZu?=
 =?utf-8?B?OTkvWjNrb1lFV1ErSWdkSktHM0NEQkhrdjR4RG1sZ1FpNHhBbW45dzFMeGla?=
 =?utf-8?B?NFdHc0grOXhhaW9VaGZYTHdFaXV5N21BRTFrSzJUVE9wZ0hYR3daZVNreFps?=
 =?utf-8?B?Nko4OGpQRExSVTNWS01XVE5LT3BURE55a3dTQTAzWmd5bWh1NW9yZitnZ2ZQ?=
 =?utf-8?B?MSs3VU95ei9mbGZ2VzlhL0hHZTdzRmRBUm9UTjN1RFpOdUhrL3JzZUZYVnlK?=
 =?utf-8?B?c1M5WjNZTkRRUEdqNDAzVWhEalcwMGhBQjY2UWhvUks1ekJFemtTZE00TFIr?=
 =?utf-8?B?VnRRQXJYYUtrL1IzV3pTdEpGSGJHc3JKZDIzSXlNczhrVEwxZE1JUmErWVBp?=
 =?utf-8?B?ZndVUjB0MEFUU2Z6cDFPaG1wZ1psQkw2VTgxRXowaU5wV0poRWlVRHNpV01r?=
 =?utf-8?B?dVhlNmh2Uzh6d3NJUlAranNUUkVxTERSaUt2aDBzd2wyRTJQNUVlTU9oV3U1?=
 =?utf-8?B?dUdsYk1nZGVRR2JVTWVwcEtnWEFqaXJxK1NjR3NDQWVuYkNWdGdsNCtzejRR?=
 =?utf-8?B?Uk1ISXBaRS9VZ21PY25hRVluLzBwdVFFdGUyNmdSR3N5TVNJMUU5ZVJKd1Z4?=
 =?utf-8?B?WDBqdXpWa2s0bXp5a0xBb0hzcXBYL1JuODdiYWZpdmpSaEVwSGFpcGlaZTZT?=
 =?utf-8?Q?2CCg7IPxkIlhfaDwi+zvnjFUzoq4Yo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUNscVkxaldFMWRKOWp5YVpncDZGUTk4cDJiTXZmRC92N1M0eDh3U05KUllG?=
 =?utf-8?B?NWtRRjZyUkRSaWhpVUFyYXpPSllvTERVdHZtZERWRWUySFV0NXpSc3hpNHFR?=
 =?utf-8?B?QlV3T0NkV3dvanFYNms2SW9YblhZb2VOVUV1c2k3Z3ZZY1lBYmJ5ZjdtQ1pX?=
 =?utf-8?B?R09nRm9vbGFpTm4yNWorQ2VEWUxUOG9uVmhxVXF0Y25yY2hJQTlCY285Q1B2?=
 =?utf-8?B?TjAxUjhEdVo1NWFidjQ4UEJMaWowcmdvNGJhU3dFSFhRcTVVdFlsLy8wazhK?=
 =?utf-8?B?TExzRnV5Tk9QZVEzK05LOHV1ME9DSlI2RW9hRjJmYklMSlY5clNjZjlMQXlE?=
 =?utf-8?B?RUxJNUNuOGs0ZTJ0c3hsbmw1em9GeTcwN3JYa3IxOENid0RVOVNJMUhIZnhM?=
 =?utf-8?B?WE01L0RSaTFVaG5VQmpjY2RobUxFUTNYbEJsT3ZlbFlqQ2VGNnhKdkQzd2lL?=
 =?utf-8?B?dVRDVzhLMXlBVG4yd2plVFg1bkVlWTZUREpTcHVlemtIb3JyVVhMZFI2ZFA4?=
 =?utf-8?B?c0tkZ0FnRW5QTnVmYW9JcVpTUC9ZVElXY08rRVZvazJDV0YzTDhZdzM1aWEz?=
 =?utf-8?B?bzNZRzgyR3pSakpQcDE1NkR3bUY0S09lVDJmZDlMTm1ZelljV0lGV0VIZVNM?=
 =?utf-8?B?Z0x5bWx0RkRLd0x6MTdCMEgxMlpkYkptZGU0dXBmdFhnYlBnN01URDB3THlP?=
 =?utf-8?B?Qm85elJ0TEhMdnZ0czBUakxybDdGd0RRenhmcXlwMkprYU94Yjd0UW5GcG9W?=
 =?utf-8?B?b0p1akFOK205YlIyMzcxQXZqMGRSS2VHTUg0aG1yaEpxWG5Yb2svV0JjdHkv?=
 =?utf-8?B?cEhYSzFCNWgvZ0hTUmhFMGM3WVZtaEVlTy9PVTYzZE1oSFkvU1FKNm9WbHQv?=
 =?utf-8?B?c3BLOXUwS1RCaFdkaWJ6SWo2YkdDYUw2Y0U2NmYva0oyYUR5OUNHbG13SW9N?=
 =?utf-8?B?Uis2YTRRbS9VREpUanBDQXFsZC9IcTdsdm9nUHVTQlVnQ0k3U094T2RRaC83?=
 =?utf-8?B?dHZRaE9mREw3cld1Nnc5bGhuUzE3dWs4bUR4M1owMmFGWkQ3QzRsU2U1c3BM?=
 =?utf-8?B?bVpDUjNiL01TUmV6cSsvQTZ4NkkwSjJXWFcxYzVsMHlzU3V2MzhFYU1TRis2?=
 =?utf-8?B?Q3dhQnptK0ZyVkUvMzFHaDFXYTdPc0FzWVFRRFc5V0tMWG1FWmh5eDhpWnVI?=
 =?utf-8?B?ZVdGSWpxNVByT3lpZlVLQ2VWKzNUS1VJVFBtQ3g3djlqNXVlNjdlRDExQ3NZ?=
 =?utf-8?B?VzAxck9BU1RUQ0VQSHJYZXd1SXRqSXpqSVZUV21QbEhFWThmbHZZOTFzeVAx?=
 =?utf-8?B?UHU2OFRoa29IdlgvR0wybC95RXVBSGJhUDYzeVVHMUdILzhrRTRxMFhjQ3lN?=
 =?utf-8?B?bHRsNEpKd3FPYndYdnEycG52RWVUK1ZHQWhtZGlZaWRHT3FNQzA5TkJqS1FQ?=
 =?utf-8?B?RFhuNTZlVXlzaEFWWXdhL21oaEZUdDF1YWZiTEVKWjZrNXE1MG9NS001TVFm?=
 =?utf-8?B?RytDY2dOYzRBSnJSYkh3WXdLRVZSb2xjV2xkNEplbXRFTFRNS2hWZTQ1OHdC?=
 =?utf-8?B?MjJ4OW8vZmFqNEg1Tm5KK2EvUElsMjZKVlIrREdwSUxXalJjOTNkMGR4NGNQ?=
 =?utf-8?B?b2tKTThnNDQreU1LRVY3a1VHMnZRN0FnWGFBN2JCSHNFTkZjSzRwQ2xZbktr?=
 =?utf-8?B?WkxCbDVEVmxIYjh2UFBJMW1VSzdxY2hzL3ZUWkY3QjNaVkJ0VmdHYkVVVmJi?=
 =?utf-8?B?bEVSMjV1dFVEaXlhQVN2Q2N1WGV1MkE4aVZ0Vm1KL3FMUXY3NEltR0VndHps?=
 =?utf-8?B?RWVlNjhhVjZlSDlJVUdwQThHNnJkMWF2aVFuV3ZIK1lUK0NaazlDN3dURGRl?=
 =?utf-8?B?WnJZbEZCUVlmVS9pWGNmRHJNeG5YMHZ6QkJzWnlpUDNjYVhVeTIzRWFCdlla?=
 =?utf-8?B?YXhTc2FOdVNIUGtSeUdYZXRKcGx6Rlpad1ZuSFJ0MnY2NkVVTFNzSkRyS1cv?=
 =?utf-8?B?V1ZOTHU5eVRESVdoUnQyb2RrbElaSzg1cm9NTmtKOGUxL1RnLzM5TWRnK3Ex?=
 =?utf-8?B?YlNMckh2MHBqZm5RSDFRVlBRWTBDSnl2OWRiMERFckFSQUF5aFF4ekNNTG9B?=
 =?utf-8?Q?U/mS6ECtTtOXp+eTCxEe0bOEc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16a58e7-046d-4927-64ec-08de1d0b67a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5721.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 08:06:36.5467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAQPjr40xEdy4I0vMCQ+gIcsD7nk1Ume0HlMwUfxY7Ghz24900ffkIiK7SKseBnzpyWbisW2nxEqBhjYOvLuuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222

On 06/11/25 13:29, Jon Hunter wrote:
> 
> On 01/10/2025 16:36, Kartik Rajput wrote:
>> Tegra410 use different offsets for existing I2C registers, update
>> the logic to use appropriate offsets per SoC.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
>>   1 file changed, 334 insertions(+), 165 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 038809264526..1e26d67cbd30 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
> 
> ...
> 
>>   /*
>>    * msg_end_type: The bus control which needs to be sent at end of transfer.
>>    * @MSG_END_STOP: Send stop pulse.
>> @@ -219,6 +322,9 @@ enum msg_end_type {
>>    *        timing settings.
>>    * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>>    * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
>> + * @is_dvc: This instance represents the DVC I2C controller variant.
>> + * @is_vi: This instance represents the VI I2C controller variant.
>> + * @regs: Register offsets for the specific SoC variant.
>>    */
>>   struct tegra_i2c_hw_feature {
>>       bool has_continue_xfer_support;
>> @@ -247,6 +353,9 @@ struct tegra_i2c_hw_feature {
>>       bool has_interface_timing_reg;
>>       bool has_hs_mode_support;
>>       bool has_mutex;
>> +    bool is_dvc;
>> +    bool is_vi;
>> +    const struct tegra_i2c_regs *regs;
>>   };
> 
> 
> I think it could be better to have a 'variant' flag for these is_dvc and is_vi variables because they are mutually exclusive.
> 
> Jon
> 

Ack, I will use a flag for 'is_dvc' and 'is_vi' in the next version.

Thanks,
Kartik

