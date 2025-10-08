Return-Path: <linux-i2c+bounces-13412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F359BC42A9
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 11:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E0E401AC5
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 09:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354C2ECD20;
	Wed,  8 Oct 2025 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVw9H6/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC9264A7F;
	Wed,  8 Oct 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759916000; cv=fail; b=ulSradb4p3tkjJChxZ6z9jganYRtD/b5Rorqkz1SX8aUK5xT3su4maFJBK25+kmuCGtjoxTYTdW03yxxx9Ya9vqsiLOGPYYX9uukhnY31SW2zMJZJGRWVaA9NNqXWOjDCcyAhpel5FuPmjuSkhr8KobcTKPaFxij4IAoZoXim1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759916000; c=relaxed/simple;
	bh=JEU0uKQ2a6EUqMi5XT3YdnJOsWQchVPwIWE0SYL+8sM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BPMEUdRHRWUOLAirZCJIQKywSmogYxC00Te2/W3l+2XtQ/cG7yQ7EQkTNpIzOjj+qdaFGPrh9xpp2iJbiKTnlC51Mwk9LxCx/IHIZW2zfQza/yNOGeKNTdP/JEQr++lkJ9PWSNviD42DlqzdAgADjVSwdU2pgQEDhrnDJiPmFD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVw9H6/e; arc=fail smtp.client-ip=40.93.196.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp88kDfwY1PLEm9Ivzw2qjujWOcXAw4Kwek9md1BkjyO0pD5VgfUo2YW6ZUH30ZVZzVHa1dDm75eoNQMtfv9fTF6NQY3SG1WfXoNe7r7ZwCqUhX62mT91FX+Ivu/qSq/rDFPIkzGPtvy4VStif4WeZR59YlKhQ59JoYNvo+Lg6UUDy5n5128AMiCYG3xf6xqScCrpEMxxXZgziMlvRjqHqvF+hMCouSQQy/Z8Mzi9sp9gbP6oIxdmha6ZrJFz4dgFOTyvKUxvFNtJuJcpo6NMSCg3KC/STHQbbXR2ZQeNuGjF5SjMzDffSJBuFsm6cEmTStyX4D5dUFl/Wezv6DwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leSRB1rrpH6KlvNglOY9EY/440Hcy+Jei3wpZV4Nt4k=;
 b=hXwd5aWrLn925EPErSYB2CTZ7Dl8KGFfr9qnc3UnwOLQrjKAhJ38sYGh0nMFVEZw0Beq2vrad+ZDu0abkBtYrv7YX01lxCIEnk6dyZx6ZdHnAjSx7rutF8dNHIuOrd8iuime/qshubjgeYNiMQPJBx7RQ+loiRudfPWsXhWw/boyOEOWq3kVlb8mknF+gGDlFTMkZugoWL0rUGVlur4SQMvKe/nMC/IzpZ6Q8puJTnyBE/mFOciJtUlVfORBMIRka+QuFYuoT3iVlIncQ3OtaJKVuKzKdRK2fl6iMJQ0sy9hAPsIJBsdUp9q7bbeBpk6SKOMiJhz4nXr0wKQcVWnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leSRB1rrpH6KlvNglOY9EY/440Hcy+Jei3wpZV4Nt4k=;
 b=bVw9H6/eOGi/F977se6CrYNZrx4aLC04f/+/5J+6xhMF6d4U1oAfQmfjhrdPNkKNuecE76gqkj2eOHH/kPi/i/0DtXfNdclHHmOMcxyVLE5QhSCnABSIJmaZXwKVuu0hZyuPrXodcQHgRp+Hx2gmfoYv666AvGEXeca6j77+dJmyKjxqfP8E7g7wvbG79PYG6/V46eLhFzNX5E+v3lHR3xlRlhXw01dsQLazrPV57NiP3z9GX4UWEO7of7H+K7awVAdsJ3DqIt8d1M6KVvR8usnHOJn/Kd4MsylxHowQS4YSTvRLOB2cM6n8RhBD1IsOmuQZ2czuTE35pOxe8YAlXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9689.namprd12.prod.outlook.com (2603:10b6:408:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 09:33:15 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 09:33:15 +0000
Message-ID: <4a434229-31a1-4f16-94dd-9adcaa6f6932@nvidia.com>
Date: Wed, 8 Oct 2025 10:33:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, krzk+dt@kernel.org, ldewangan@nvidia.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, robh@kernel.org, thierry.reding@gmail.com,
 treding@nvidia.com
References: <91da537e-01ea-4b51-8493-8cf88d64b435@nvidia.com>
 <20251008053530.27253-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251008053530.27253-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 9305e65b-97c7-41ef-4935-08de064db4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZisxOXJMalZTU1FCMkRmSmkyZnczUWZGQVcvOUNoUFVUWnJiZXIvL2RwQ3RU?=
 =?utf-8?B?dm5IeDJydU5wUGVuNnRmTUREeWFNUlJITG8xb2o4WkIzaHJIL1VROUJLNHNY?=
 =?utf-8?B?Y2w4LytPRmZiTzh4ZndKeDBXb3NwWTJZZTUvcFZNbnVVTkp1RUYrajljZDNu?=
 =?utf-8?B?dFd0YStzTmZHdTZWcm5vMHpaUU5tb2VNMEZMRlhHQXY5M29xTWVmSythRi9l?=
 =?utf-8?B?bndHNXQ5c0dKVit2RGRCSk1ocnRtaklzYkFOb1VrV2JZUXk1elVNdTUzcUt4?=
 =?utf-8?B?SmVDYW5hb1pWU3RHUTlSVE91b3E3c1pvalgzcUlDSkd5c3g1M3hhVkZ4MHl6?=
 =?utf-8?B?eTYyRHloaCtFS1FKenBqUVpLdWNnbGU1c3RraHplMVVSS09ReHoyVllrUm1z?=
 =?utf-8?B?QWo1RFNVd1kwMFJvYlVCQ0cvRytUY0lzc2J4TWpFWlJHWmNQNGhXNkxHNlFJ?=
 =?utf-8?B?T3hJZ1RZSmtPRUxaUzdQU0VjeU0wU0wwYTRVL3pxbmhuRTdUVTFEVzA2TTF3?=
 =?utf-8?B?VmwyRHR1aFV3N0JDVXV2Y3h4UjU2N011WmwwUjBkai95OHBpTnpFWENJZGU3?=
 =?utf-8?B?K1phTUZXRmdCQUlDQXNGYy9DZ3B3TCtTV3RyK3BKbEgrMGtGZUNZTW9tNWRZ?=
 =?utf-8?B?bXZSaDc5a1p3QUkvbFduZXVpVTdXU1c5cU9jQ09sWUw3VG4ySTRrUFRaU1VJ?=
 =?utf-8?B?bTVZeEV4b3NkZEdJWWIzWXVtQzQrZjNOZStSUWxpVngzU3BuSTVmVThLU1FV?=
 =?utf-8?B?N0xmOFJrQ0toT1dzTVlNQmNsQlhmUStSNUtVK3BzZE12RDRNMFBlR3o3ZVhL?=
 =?utf-8?B?YXV2VDM0QnlycWpUSDc3a202eDVDbmdHYTRhbG1oVW92VHllZ0ZEMnF0aFJK?=
 =?utf-8?B?akgxc0VJTU9XOUNEQ0Z6ckRzT1lFRVI0cTRVNDI2NEhzYS9ROVFsUUJyTEE3?=
 =?utf-8?B?aStPUjY0d3dTR2kxdnlORXdSRlFzZU5XbitZaDd4b0Yvd0VuNlM2M0VYTVF2?=
 =?utf-8?B?K0gvdm5uSmV5MjZIU3ZSTXNHT0JqUklwbm9lUFpkWFY0K3VvdEFTa1Z0TmUv?=
 =?utf-8?B?THNmbWNPMjM1WkFHbnRtYWFJR2ROZTc2YUZlSzJMMThRdmt2SCs4emc3Q2Zu?=
 =?utf-8?B?WlFlT3hRMk9vUWFqZWsweXZib1I3ejl6SFVlVk5EUVJXZkxLNXk2RkxlSlgz?=
 =?utf-8?B?UVEzc01YYTNEMDQ3OGtiSlozRXZURUxhNGdpRjVSMlFGZkQvNVBVbVJmVFNo?=
 =?utf-8?B?WjRsSkRESWtQcmEza2VLRkRaV0NLYUtPMVdEUlBmK0ZJZmRTSmxJODVYVkRl?=
 =?utf-8?B?YTNpREhOS1p1MDlPeVh0OTVKM3pJSUg5bUcyVzcyMnhDT2tNNldkOUFPMVBN?=
 =?utf-8?B?ZnBka1Y3akl3c1FnM2lHaUpwRDh6V2ZEOHhsdnhzQlhMQzV6VlBQaW9Nb09o?=
 =?utf-8?B?ckZoN3JPenNWc3Nxbnc1clNzYjNlYVAyVUYwRkNkUWVZbUJVcXRMMkYvM2xx?=
 =?utf-8?B?MGtCYWRWeHBxZ2NFRHhtb3l4TEVlODYwRk9PdUNabkJJKytxQ0xySjJSSU1u?=
 =?utf-8?B?eU0wUkRodlA2MENkNW5zeHVOSk9sVmhFdVhYbmI5R0twaWh6NUFCSXdQUWlK?=
 =?utf-8?B?N3FFVklXa05hQ0I2eHY2K1VGTCtYRXIwTFNFM3pEZnFMWHBxa2JaaE5HOTB6?=
 =?utf-8?B?Ull0MzFFUk5iQXBRaTlCWmFKNGpDcS9hV0tVZGtxSFpqSHNCNkl5ODY5Sk5h?=
 =?utf-8?B?c0xFTzBzRUhYZzc2YjNTZUNIeUhjU0ZVdHhsMHUzZndTNzY2d1JQMFZFcGxU?=
 =?utf-8?B?Z1lKZzVLbVQyMHZESDM2bEhqRDRyZlJ1cWNYczVxQXpwczYrVUhacXR4aERn?=
 =?utf-8?B?dXNZMWU1SXB6NkNDVit3RVJ6dkJOS0UxZEU5TE1JVk5iWmM4M1crbXB2ZGNs?=
 =?utf-8?Q?wZ0873TjtNDWwZlK67ffwjlQvfvIx0Oz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1I4dC9ZenZ2cm05MFJQanRoM3hpWjQwekp5eGN3VGlYVys2ZXFaVnBmaHVW?=
 =?utf-8?B?aHlZS041UGZRR3BTMWEySjR1OGsrWjZIYkJkdjA0K2VzQTIwbXNMeUxkSkM4?=
 =?utf-8?B?N1p0U3NnYUhJTEg3Vm50aVV6SGowWDBwN0VWcE1HQWp0M3duY3didzZsM3Bj?=
 =?utf-8?B?QnRNVjFMdXpoOEVva25QN0NXMkRPTjNXQ28vQnB1RHFBd2F6R1R2aXJvYkw0?=
 =?utf-8?B?OGFOWFhncUhYTmVyYjZtWThxbGJ0R0QzYWVzVTJ1WTN1c21qREw0WEY5dVRx?=
 =?utf-8?B?ODdKWkxpR0Q2c2FvanA0cFpXU205T041U2tDRmkycXQvNjZ0dVFDVnptVHp4?=
 =?utf-8?B?bkszUW1iaHFOMnhteVNJK2lCZjJmM3ZydmV4R3N5eFBxYzBWamxiODFiandt?=
 =?utf-8?B?MG52MlFwa3psQVZkS2ZGa1hBMTZlUGJKbWRLbFI4NW91UTl1WVVUeW1ZOXFH?=
 =?utf-8?B?TVI3ajcyT09MUDRmcEVyVjhBWS9pTEQ2TTk2Qlp1UE1XTEJncnFWVlVVYlJj?=
 =?utf-8?B?NXUxcFo5TWpwMmI5V25Mck1JZjRtYndjeVZydWNMTTY4R0VYY2pWU0I1Rml0?=
 =?utf-8?B?amF1MFU2Yy92RVNWNnhnaE1WNFp6N3YvL0VrVXE0SUsvRWUvWGpZditCNE0r?=
 =?utf-8?B?NkFQNWk4L1NzVkk3TlFQZjhCMlc4TlQ2SCtFZzVlK2xsTDJVV3FrSVlieitR?=
 =?utf-8?B?ekhNNjd5Y0ZMOUZWSVc3bitGTHE2bnhNbitTNUx2dUUybVZvS3JkTGRCMk9o?=
 =?utf-8?B?ajFJNkp0bXZGcmdLSDBNMGNsM094cEdUT2RCWWFsZzBWMXpncGU3Ylc0d09O?=
 =?utf-8?B?TUVpSUdQNG5TS3dhR1hlYStMd0ZDZ1l1ZGpHdEpUNEE0U29qZ0J1M0ZaTy84?=
 =?utf-8?B?Uk4rbkJQK3hrVkJlQndocVRJNkJ1U25sdDZlajgxREx6MktiL3ZOTmh2NkVo?=
 =?utf-8?B?a2g4U09hZEJ2V0h6c094MGFocTB2Zk00NkJDbjJIaWx4N1J6YVJ4ZUtsYlhr?=
 =?utf-8?B?OXlnNmV4ZGZmdkRmNlZlTklaVkwzZng2Y0FzbEUvVldtaW5yWVNzQmxZcno0?=
 =?utf-8?B?YXJQazVTSG02V0dZSGlWZE8yTTdhbW9CR3FnWWc2TEFxVm8zNW5NalFDQWk4?=
 =?utf-8?B?Z0xIazI5L1QxWnZ3WnkzeXUzdUpNeUxyWUxKTENOdWdJRWl3Q0JFQzRkaGIv?=
 =?utf-8?B?Z2hzU1pkKzVySkNTZVRjTnVEOC9Od2hqTE9mMWNTYldWZ0h4M0NHZS8rNlJ0?=
 =?utf-8?B?SDhNajJNaW9vUDhVeUp0cVhEUjJ6eGJGVW1uV3hHSmg0eURyVHh1RmI1a0JJ?=
 =?utf-8?B?a2M5bnVDeGpUYkVDd2RpTVUrYjBLUUlzVG43Q0JVRUx1Vm9USzNVRWpzNERH?=
 =?utf-8?B?ZkM0VXlGUmJPYjY0UGgyaFcvZWxXbFRWd1dGSVdnNzBVN094R0hCSlJGalVn?=
 =?utf-8?B?bmplZjdieEk0Y1d1QmIyTzJGbytSRlpUZVpkQU9kYUxNeUpRSDRVMW9HeWdk?=
 =?utf-8?B?N2NGWVpuaGpVWUVUeFZwbWJjUjhFR1BSU3NRcThBRkQybk1GdC9nMHpiTVhD?=
 =?utf-8?B?aXc1NVJpY2xZLzg5dkxTY29DdkdJQ0RJM1BvTG9EWE5tUGdCMm8wMUZCdHkw?=
 =?utf-8?B?ek9hUHUxZjBBcnlIRkQ1dlp1YmNGWjF0QlljU1krR0l4VWszQjRZRjRlTDZ1?=
 =?utf-8?B?VDAwaExTS041M1dYNGFJSjIxdUR4UzgrMUluTzRiSzZWOEJvdGZCK3hGclBx?=
 =?utf-8?B?Z1VLNDFxNEJoQkEvZ0pZdmEwN2FYOWxUNVhybUJZUGRKbXplU0lRZVFOZytw?=
 =?utf-8?B?eTZ3VlJSaXM0VkhqajVQRkl5Zmp0dTFWeWpxK01SYzl3cVVlM0k5c0RPZHl1?=
 =?utf-8?B?NWd5aUtYM29UT1JsMkZ1bDlsUGtrWmtXUVd4Y3NIMmRYYm5DVWxTaVM0bmdj?=
 =?utf-8?B?ZlIxTGk2T1BwdmkvUmN0c3YySWpCQno4c0JEM2lYV1A4czJ5NjhtSEExeTVS?=
 =?utf-8?B?eHpsbWZRazloTkk1ZVVKTEpsdi9zQUJiODdlbTJkdVFUUUh1UU9KRVZMa0sv?=
 =?utf-8?B?UnFvYVlHRVI0SG1MYTNBcWpEQzBTVzFqdTF4VDlNQ21lbXVRQ2tRYWZJNUNM?=
 =?utf-8?B?NEY4cVpDRkpSTTZxMFJXd012ajliZGMzN3dHZnBkbTB4aWFwWk9CZEhENm4y?=
 =?utf-8?Q?mNrAhi+HX4WBx+gJcCMnkkuR/HF0jH16Z6yrnSk2bOdn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9305e65b-97c7-41ef-4935-08de064db4c1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 09:33:15.0467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwL79szd1kDlD67k6hTxmjl4QlvdY6AItU/M+FkYSVtK9fVHJvdQ8+AKDwApjmkiUY50nIf27BBGJEHqYGU0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9689

Hi Akhil,

On 08/10/2025 06:35, Akhil R wrote:
> Hi Jon,
> 
> On Tue, 7 Oct 2025 15:50:56 +0100, Jon Hunter wrote:
>> On 18/08/2025 05:33, Akhil R wrote:
>>> Add compatible and the hardware struct for Tegra256. Tegra256 controllers
>>> use a different parent clock. Hence the timing parameters are different
>>> from the previous generations to meet the expected frequencies.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>
>>> ---
>>>    drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 4eb31b913c1a..e533460bccc3 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1649,7 +1649,33 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>>>         .has_interface_timing_reg = true,
>>>    };
>>>   
>>> +static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>>> +     .has_continue_xfer_support = true,
>>> +     .has_per_pkt_xfer_complete_irq = true,
>>> +     .clk_divisor_hs_mode = 7,
>>> +     .clk_divisor_std_mode = 0x7a,
>>> +     .clk_divisor_fast_mode = 0x40,
>>> +     .clk_divisor_fast_plus_mode = 0x19,
>>
>>
>> Can you check this divisor value? I see we have been using a value of
>> 0x14 for this which does not align with what we have here. Can you
>> confirm if this should be 0x19 or 0x14?
> 
> If you happen to notice, we are using a different tlow, thigh and hold
> time values as well internally. We are also using separate variables
> (tlow, thigh) for fast and fastplus modes, whereas this driver currently
> uses the same variable (and value) for both fast and fastplus mode. With
> that limitation, these are the closest timing values we can use now to
> get the required frequency.

Yes I did see that we have been re-working these variables and separated 
some of the variables. However, this parameter itself has not changed 
and now we have a different value in upstream. So regardless of the 
changes being planned, I don't see why we are not using the same value 
for this variable everywhere.

Jon

-- 
nvpublic


