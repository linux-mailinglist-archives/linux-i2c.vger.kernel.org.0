Return-Path: <linux-i2c+bounces-6836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3A97B421
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 20:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A4E287536
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 18:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F599165F13;
	Tue, 17 Sep 2024 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QJDr30mF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242519BBA
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726597895; cv=fail; b=qREnreD1Fv515OtoVx+nsA8gvUNaCiCLfiZT4kF4ZRPFUeYQW1rBeqdwvfmiKpPPNqJQeNYyN3J/kQquenSFJC3BTs7DQIVQEMC2PXL58SsivlOoW3o47NrHA4lP0+HxxitZeuK0mL+R6FB3lo1QTSp8afgREJpKHEYtPJk8fU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726597895; c=relaxed/simple;
	bh=7FOwvIP4RbEmKczr3l8C1um3MlOtc2shRHaK7oRCPeI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qO/tkTrmX1acyFQ7SB1HUyEkHFPAs2W3Z7YxJH7icaVJSdUpkr/aLCn3ixQXPVsc6dzw27mRlclaQlUUr27JsenpOl/M/MNykYeKNo1Voihc90iEcU1H79yWUGBTuVUfjOQHv1BvktPGAANUhyTr89Gh0Vr/Nu4j9JBN62MIbQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QJDr30mF; arc=fail smtp.client-ip=40.107.96.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoRSzd6TRF3LTJHQUR0tsCxjNJoymAPLqwhn1ZSGZRryQUAY/GtEvfHrvqt9I3G8I83gBNckQ5FXHFMlhBiLZxYh3Yf2caHBKUrF93M8paZptHXE3PlIX7hEyLuTD0vBEePU8DCOk89SAj8JhtdSrsDo6f7YZsREP3arRjl5PgaJMFBDk5vXNkuCXerNtHfpluSXGtgDBzJB7Spyi1Ap/axbyjsWOQyLq00etUrVAlsNfdwPFIXwqifeyuwGukVfIrv0wKAha6Lk9cFeM+M/snneFQFZDxjDamWzeRvf4uukstVpdo6AAktuvAC3E0qHDJwsy2TO3jfsX09Vd2LAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHJFJ2ODkCPX4tm4PmqFGhvvmG/cbAPBERzuYlE/+CE=;
 b=bscBNrqCeQZYk7HCZCBvchY6e66LYBZQKaBrTkzvV+0RRcLNjCaUc0NTj/QxMTw4Bd++KZxA1ocfEdprlspNBvNDr4r1bUff5k7PHA9fC1BcaeHwBslrnlIudCWEIQ8Lxsjap1fsphOlDT+KKwnfbNEvIMhI5nmSABSJsbPNDpdhr95ZYNGSaQGwxZfqsZSDfbWdqSEdaWECpky4Enr7Po6uyvbkGL57q52n2AKUDKImmqPLMyGpEpns9eEYotRLRlzfoEGBdzKUyTpPqUSg5nn7789K8jK6YvBaD1uhC1dpptuul95Bw0dt7Y855k/NNOmt0qXIKjH51b09/XPQhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHJFJ2ODkCPX4tm4PmqFGhvvmG/cbAPBERzuYlE/+CE=;
 b=QJDr30mFhiH0wTD9Tici+1C070DsNVrFgxb0SnJZH8ZmhfxNW5D4KhQMcCiOg1rE4togyaienY7il7LibHOZMr6U+/KbJ11+weFEcNSEf5iWCIMGLMUQ4wgqMAWLs4Y9TQxP1me9QMFWcOGickFxfiNbXw7yIUQmZ9YBPhLy2z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 18:31:30 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:31:30 +0000
Message-ID: <8e12b68c-0a90-413b-bf02-f8637629f2be@amd.com>
Date: Wed, 18 Sep 2024 00:01:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] i2c: amd-asf: Clear remote IRR bit to get
 successive interrupt
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
 <ZuSQVpIqM3yOSuf4@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuSQVpIqM3yOSuf4@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY5PR12MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0bee2d-641f-4c93-7ffa-08dcd746f139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3Y0N3drRUtmMHNnU3k3ZXdTK3VPdmQ2UDV2ZmNkcGRlK0NTYTBLKzV1OFdp?=
 =?utf-8?B?SHFPMVhvSCtoUWVURDdkOEtvS0V5aHI3RWNBTXR5MHlaVUUyVWkvVm9GSHEv?=
 =?utf-8?B?Mk45d2NCd2hrSXBZdUdOdGIvQ29TbjdPaXR1eG1sZnhJVUp3RSt2aHJXaXZF?=
 =?utf-8?B?QTc4cWxEZTdpdUFxRC9oMDNkNEdKV2VlT3doK0xpQm9IMk1PN2hucTJyM0dm?=
 =?utf-8?B?SE1CcFZNeWYwdGhla21BK3JEYlQwTlE0L0lQSTF1dFYwZldDQXJST3BkalQy?=
 =?utf-8?B?cURlZ05uclA0RVQ2TWRUanJmMnBRZW5wYkoxQ1dEZVpwUzZJTG96cU1OR3Bi?=
 =?utf-8?B?enNYZ2lTcG84aEFHZU1vYWZjbHpWQnJqUGZPdHN1TWE4YjJvemkzRC95SVhs?=
 =?utf-8?B?aTVXOEJXVzhWNG4xc3hMM0dFdHc5ai94Yy85R0tEUkhVcUliNkRyd01qYkFZ?=
 =?utf-8?B?WFFHNWJrcTVucmFTZEVaY29xTTRqVUpLNzJ5SmlPbnVuZERUZEpsSmdsVFo4?=
 =?utf-8?B?NXVjeFVrU2V1eGNnM1Q5SUx5MXNhU2paZllXamN3RGF1cnNCNFRHSHVRZWNU?=
 =?utf-8?B?SVhaeGFFSW9pZmJIMUlvbnYyblVNcGJ3TDBPM2QxblhKZytPYzYvT3k0aVRs?=
 =?utf-8?B?T3RCMXlweUNkMDJYVTV4SHJpdVJSMytOZWNDNlRmdksxQ2lLTUQ3NElXTzR0?=
 =?utf-8?B?c0lPN2V0THBTN2dLWGRJOUZ5MXZFcGcvbnVnaFVma0tGTVR3bTRYbVh4M0VU?=
 =?utf-8?B?c0hzbzdrMVhKZ0JaSkxEd2xBTVNZcjhXbjFERE1vREJwbE9RM1hIeFZsZXhx?=
 =?utf-8?B?TVNFYUU5akp1OW5ybGIrMldUbXIrUTl4TnVLZHlUbzNGN2tVYmUrSC9VWXU2?=
 =?utf-8?B?RDhWbUwvc0JEenc2ZnByTW9FOUFMNGU3NGpUZDNqblBZNzU2RmM4RmtNQ2Fu?=
 =?utf-8?B?VkMxNXk0OGI4OWxTR0FYa0JzWlhKc01keGpIWDVCQUd6RW9ySk5mWm54SnVy?=
 =?utf-8?B?OTh3dE8rQ0c0dTd5MDdiK1gveU9pU2Q3cmxidStTOGdZS0g3OU1DZG9ic3h0?=
 =?utf-8?B?c2FBcFowMkNwTC94clBOdVdoUWt5NndyY3hybGtYaVJobzBvQ200bUtNYUNm?=
 =?utf-8?B?MEhLQVo4U3BzZ2ZENEtqN044SUlZTkxabmNVM3pKVktPWjZtUlF5dE8xM1dm?=
 =?utf-8?B?RkdMb0JQVGVMLzhySktmSGxpcytIMGZRYzkzVkRoaWE1ZzZzRWpHV0FGVmdS?=
 =?utf-8?B?dWkvYlY1UTlKR3BodENPWUVnM3d3dzFsM1VQdFZ6VEhKSU90T3RQdUxWNFVk?=
 =?utf-8?B?THhsTWJKQWJTdVBBMWk4K1pDQSt1ZkhESWM1b1lacUhqd1JucTQ0QXdlakF3?=
 =?utf-8?B?VjZERkhNQkpqU3Q0RUZUbURuK1lMQWRMZlFXM1dMK2pUYXpCNzhwOU1vbWtn?=
 =?utf-8?B?Sys0OVFXUFh3OUxPRzJoRXB3VkdSakR2b3NqL0ZISFduSTVhVU9ZOTlMTHA3?=
 =?utf-8?B?c2kyVkxpRE4wUGhDcGpEUUtNQlFGOUY0S210bzlOMytUNWU5T2NRelhwVjUy?=
 =?utf-8?B?SUVlaDhYZVVWcHpBSU40Vko0Q0c0bmwvQWI4Z1BZWVNFQmxvZzk3WVVvRTVZ?=
 =?utf-8?B?R1I2TjNaNWdJalVXNE8xTEpJeXRJOUlmN05GSVErbStPZDdTamREcEQ0cDdI?=
 =?utf-8?B?eEJsUStsU2Z4aUtaWGUrR3NwTU1ZNWhrcDY4alhKRllycHU4bzBnVElMbFZG?=
 =?utf-8?B?VlFnWVZ3VHJjaURXTWFEU21yK3lsYko2blBRY2kvb05vMERadnloekRWd0Ev?=
 =?utf-8?B?QzVDeTRHcnlrTkxCR1h4Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXc5STUzYjc2T2gxV3hrQVA0YTJVTGx0aVppcjM5NU9ONUVVamsxUGZIVnUx?=
 =?utf-8?B?TEcrNGV0Tmo1ZkFWK3M0RmgwWW5ZcXQ5MTA0SmplVlQ3MndrM1pRRFhBT2NQ?=
 =?utf-8?B?c29WdjZqSGwvbGVQS2YwWkJJNk12YVZqaUtPdlFncHFtVm5QOGw3RlRIZnZy?=
 =?utf-8?B?aHcyTFhmWjN6SjA2eHdwVXRpSGNMVm9XTEdSRUJtSndaWjF2QzdUNkdFbXRH?=
 =?utf-8?B?NFd4djZlQ2xzaVN0Tnk5UzI3L0Mxczh4MFhWcDVZdXFkTHVrVTdCd1d5WG9D?=
 =?utf-8?B?aWJRSmxLWTIvNXN5cENkaWFMdU1RZ1MyRUJNYmJnTk0vcmR6TndYNHhoaEkv?=
 =?utf-8?B?SERRbDdLcUFVamhVWWZxZmpMa0ZWdGw1Z1pOUkI5ajFlRUhTd2gwZUZpUWI4?=
 =?utf-8?B?SGhHQ1VkSDFtQkZQOTJiNjZqNkVFRHRveEo0R2lEU0RXOVRQT0NDUGNMNXV0?=
 =?utf-8?B?TFVoRktqV0xVTEw1dUJlcGJwVmN3aVJEMml2Q0hmK2NaelhKMHhYMTdyRDV2?=
 =?utf-8?B?Smw4RlkrTXJNZzdMLzZlS2s0L3lUQ0tMUGdQVXB1S0x6QndsaXp2dnFtNjNt?=
 =?utf-8?B?akYybGxIbWFZTlhJcCtqeFREQmMrWmFLVzR2STBHd3lFaENWbXRZYUJJRUZi?=
 =?utf-8?B?aVpXdlVuTFZqayt1L2RFUnROcW1JcXBIU2ViQ2FJQXZRRTQ4VC9jVE96dGs1?=
 =?utf-8?B?dW9lMG5qQ1dBMnJyT2dPMm0zVVhTUGJZTzQ4RFAwb1YwMmdyWENMMkVKRFFj?=
 =?utf-8?B?Z25VWkhpbWpCZEwyeFVEMXdnUjcyc2ZsMVFsZUpPMHp2YnVuK244Rjk5Tjl4?=
 =?utf-8?B?ZUdOYmVvZmhMWVRGZ2lSWFIzaE9FTFlGcHIrL2VKQlFuN1oxd0hXQlRjMzIv?=
 =?utf-8?B?L2xFM0dYYmNyOWlkSGkvK1JTM1JCOFlTVUpReE4yS1BMbEI1Ky9GSVhGNEFq?=
 =?utf-8?B?Q0Y2UHBMWG9iRXllWkE5TFlzYzBtWVR0YUtERkRKb0ZjcVd1aHVRNzhhT2Rh?=
 =?utf-8?B?SDlmK08vM0VEQjB6SEtxL21JaWVEbHJmbU9FV3NFQjkyL2RzM2VSRktQZFdE?=
 =?utf-8?B?S0xwS1owK003Q2cyU1F2UFgwRU1BOThqT1Z0MDZiR2Z3UXA1ZmFiVk1vcVFV?=
 =?utf-8?B?MkowUjBZTDQyL1FNby9xd2QyZWZCZTY4YzJ2Y2doUGM0bklLZjVGVDZmTFlK?=
 =?utf-8?B?ZjVNVDF0ZEp4bWh2YS8yaW9mVzM3MVlndWEwSnNmT1p6M0JRTk0wT2RYZlpJ?=
 =?utf-8?B?cEZFK2U2MU5iOExlTzdoV1Q4QXJ4akNZckYzNnB6dnJhTHp0c29mRUo2TUlr?=
 =?utf-8?B?OFBLalFab1QvTVcrdW84Z0UwR3M5LzE5eGRSRjVNVUgwVkZJdWpJVlY4NTBy?=
 =?utf-8?B?SnFqVko2aitWM0k4T0VGbzhBd2xndUNmZTJRSWdVQTVJbTBteUlCSDc3RnhG?=
 =?utf-8?B?Mit4M0MrcTBJWXZkbXZLT2ZUK3RycEhwNUxRM0JyTEVGT2c3Z3NEMTlUUFRw?=
 =?utf-8?B?Z2JCVVdzNnZKa1E3WitUNm4zM0I2U1lJZm1VTktPaVFKRTd0bEF1djRZZjNP?=
 =?utf-8?B?biszb3dEbVhqZ1RHRmo2SXdMUE9rQWFLak9UcktOSGxlQVFLZVhiWGFYTWpD?=
 =?utf-8?B?bURXcTBaRENGa2g3RW9tdzRTRDI0bzVSVEpjS2QrclBuaXZETy9tNld5bmMx?=
 =?utf-8?B?WG1GVC9wYXg4cmd5encyNk1GSlRBb0cxSENmZ2xVcXlGbUxPUGxhN1h1VUx0?=
 =?utf-8?B?L2E4ejNvQTlYN05FL2RrUUZRdzFTWTc3eTdEU3F6cG1JL1JnT3hCN01PUWtn?=
 =?utf-8?B?RWJlczc1Q2xIY0MrZ1RIOTZUaWM1SUxyVUhsVFU4eTdSSVdPRS9TM2NIMEFn?=
 =?utf-8?B?SzB2bWNCdWlPeVIwTkN5eHM2dmYyUW9aU210blRxWTV1azRNYmtNS1IyUXF4?=
 =?utf-8?B?RW5kOXhOOVNWU1lDVzVVT09rcTlhd1R2a3dRcUFIUm9zaHQ5SGVzWEU4c1dS?=
 =?utf-8?B?bWpicElBZUtIKys3UzgzMmpzcHdrMzAwakF3NWNJeTk4NVozSXUwcTNOdE1h?=
 =?utf-8?B?ZTlTSngrQ2xzMkxZUy9HRVpNbXhwc0sycjlFeXdGS29selVMdUhScWJVY2ph?=
 =?utf-8?Q?oE8Iq8s4VMnKL01CbI/DQ7JCu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0bee2d-641f-4c93-7ffa-08dcd746f139
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:31:30.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bb4gFBW7blUW88ZlTO9IxJhplttVw7fd59fKAJYHtkDwVftghXbt8qrDfoPN4NZ6jMLWZcRSlgnvIEcu8yEJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178



On 9/14/2024 00:49, Andy Shevchenko wrote:
> On Fri, Sep 13, 2024 at 05:41:09PM +0530, Shyam Sundar S K wrote:
>> To ensure successive interrupts upon packet reception, it is necessary to
>> clear the remote IRR bit by writing the interrupt number to the EOI
>> register. The base address for this operation is provided by the BIOS and
>> retrieved by the driver by traversing the ASF object's namespace.
> 
> ...
> 
>> +	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!eoi_addr)
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
>> +
>> +	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
>> +	if (!asf_dev->eoi_base)
>> +		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");
> 
> Home grown copy of devm_platform_ioremap_resource().
> 

devm_platform_ioremap_resource() internally calls
devm_platform_get_and_ioremap_resource(), performing two main actions:

It uses platform_get_resource().
It then calls devm_ioremap_resource().

However, there's an issue.

devm_ioremap_resource() invokes devm_request_mem_region() followed by
__devm_ioremap(). In this driver, the resource obtained via ASL might
not actually belong to the ASF device address space. Instead, it could
be within other IP blocks of the ASIC, which are crucial for
generating subsequent interrupts (the main focus of this patch). As a
result, devm_request_mem_region() fails, preventing __devm_ioremap()
from being executed.

TL;DR, it’s more appropriate to call platform_get_resource() and
devm_ioremap() separately in this scenario.

Thanks,
Shyam

