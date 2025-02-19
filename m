Return-Path: <linux-i2c+bounces-9497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36724A3BFA4
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 14:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B4B3A23DF
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699D81E0DCC;
	Wed, 19 Feb 2025 13:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AQWoz3fn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619651E0080
	for <linux-i2c@vger.kernel.org>; Wed, 19 Feb 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739970923; cv=fail; b=NkJTwayGre15XMpw8AU59tAZ77zSXghZ0rDVfbpKA2qIXynRZjGtDPCetFxxbsxYLMG/nkX8Qsok7TTP/aAbf3ojfdKBfEoaZvvZw0njN+T/LR/pq6yaOXO5tpWKxojn+pYdcf0GMhsizX3OuXknbv1xideLdk+vUfEmnvnUnNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739970923; c=relaxed/simple;
	bh=Fp4b78fArrfkiKCXInX1UDcIQ9sfbdw0SWY7UaiPXZo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N8/GfYDWLM/ygmsvl3bAWQ53WE7k7njCxW+XWKA/Hc0e32lOYxIkd+smIC00y0a+0mXnMvZfedRar2Vcu1TY5/Py874cvnSqJAQZwGT7NSt5YD+NZaTY+i05MCaiFu0k0LZMYPKUZ9Ndn/dzXHtpuqWTuJQZvQICt+VDZKLH/M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AQWoz3fn; arc=fail smtp.client-ip=40.107.101.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLDJmPpFxYXsALEup6Ls8X+vOFLDUGS5Q5Pr08zKSP7du2IttJPnSZ7m9kYtnoL2Kyp4IE7WHxtysR+z/+NDZgjBMEvXnV4VskYC0z3TTeUXsu6U573JptC8pDcE1wqeYIQ5HHus8EbPhE79T20Hjhkp1Uv130c2wsTYdpQQ5JcOmjLV3BC0fFxDISBu86xtL26mFzDmupuHfUYaa5a8bSPEtQRWooXRPOZ8k62Tuy3aiqaZ7BqgLaUr8yOtmH9ddu2Xx7tQlMNX17U4jEQLrwoDg+F8oUTuJTfTmxBqNCxzYYX4CDZg67zX7qDpEIHGnXUId9KJjPOz7xdgOVVTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foYbh+vvhxZH9dxt1gqnMIwDx3kqzzvq393U3U1yVTE=;
 b=xeJY75TX9ma4EBem6wNPv9efiDP5Ma3/vKraNmh4pBZC6IigVMMAxicgk/PU0WYTEn4+T065BAPfpiigsfE518DdxTwdJG1y1/M39F8PB13ni7MJLbClIpxOBX+EqSQOUrGj9AcR865h40QN4P4mTSWSb8mR5yM9kQzV1e7txTs3yQQV6420wzCMlQd318dvIe4pjAlHdtnnbCeH8Q+CVBqGjHHoU0s1nmQbWj9NWggkQ80+BXPppaEvcang4KaJ8Z8DBlx3hXtcJu8jUU+aoGbPzdEO5HMpgD/GYMIxIn2w844uKC/sS/ezix4pnQqovLVtdROQ0ZYF8s46cdfzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foYbh+vvhxZH9dxt1gqnMIwDx3kqzzvq393U3U1yVTE=;
 b=AQWoz3fnWlaj9TBlyMS2faqfRGTpE7w8yseg3CABW1kontPHgrgvPreQ6fqfxDj/n+ua5EqL0fCElfBF85D3pjYB0TCJmEtOvQcN0JR7WDgrfo7yw4rRLf0XklU+EVuyJ9tj27Ztu59EwskG3bsqPIATRru3p2kJfxi+MmzsBEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB8817.namprd12.prod.outlook.com (2603:10b6:806:347::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 13:15:17 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 13:15:17 +0000
Message-ID: <a0283a00-8473-450f-821f-b88845657da7@amd.com>
Date: Wed, 19 Feb 2025 18:45:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: amd-asf: Clear remote IRR bit to get successive
 interrupt
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 Sanket.Goswami@amd.com
References: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
 <20250217090258.398540-3-Shyam-sundar.S-k@amd.com>
 <bpgx4co5tpmeycqo73pu2ystlw4umnqsblpxhgbiz6dieegjvg@rewe6gyo5e7b>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <bpgx4co5tpmeycqo73pu2ystlw4umnqsblpxhgbiz6dieegjvg@rewe6gyo5e7b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: 091e349d-0068-4856-cc80-08dd50e773da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTVWMzhLUXdmbmE1RWM2cUdTMXhRZFkydmhzV3ZyR21DU3R2RU1xcTIwZ3ZD?=
 =?utf-8?B?U0hFcS9JVGtIL3U4Q2JiUzZ4THY1b0djZHl6OUZsQlVDRmsrbHRVRXFmSjBW?=
 =?utf-8?B?ZGJRaFNhbnVJb1NWUGR2MXVYbGdMUFEzQ0tsQ3QyalpTdkh0V0FyME50cGJL?=
 =?utf-8?B?MkhEWDFMVWtaaThGQTlnOVE1bnlKMTFibS9PZkFvTUd6ZytIdlJFNW93L0p1?=
 =?utf-8?B?OVVjZHFiV3IycGhvNVg1c3lzZjBzeitDR3piajU0ZVY4YlpOK3phc016UTNE?=
 =?utf-8?B?a1A2bklFd1VhTkcvNkdIb2JuN1RrSU85L0ZNbWFaS0lpbHJGU2paYVFVdWFa?=
 =?utf-8?B?NmNvQXo1TytVb1hVa094RlNIUkFCWEM2NFcyWVFOWXdiYWdoZTRoNmdRdzNP?=
 =?utf-8?B?ZTRIWnRTcTJmak96TldqWFZJanhScXI0bUdab3hZUUhSWXNHbTZkdDU3V3N3?=
 =?utf-8?B?b1FvT283K1hOdGVGV3dZMlVic0x6eGY4NmxDc1BuWkhxd1UrTVVjZ1V3QVp1?=
 =?utf-8?B?NVNpZm1CeGhwand1QUMzWkJDZzFPNW82ckM2eVljM28wcFcxRXhsMkN4L2Z0?=
 =?utf-8?B?YjZmMG1SOVNxTW1JZkp3bkhaVG9Ta3VZT3pMQ1I3clIyejFkMkFSQWljU3BJ?=
 =?utf-8?B?NFhMZFZkeGh4QmgwNHRaWXozSjlBQm1MU0NPcjhsVWdJbUNubjE5SDZkSVZP?=
 =?utf-8?B?c1ZHUlRNY2E5VDFBRVZ2SkpaekEzWmFBSVdQbDVkZzYvaTBkSjRIb0pqV3VO?=
 =?utf-8?B?ODBsMzJIVlh1a3QzSzdVN3pCZERDc2N0ZjNtbTR1c2hRQkIvR3kxODYwdWZK?=
 =?utf-8?B?eThOZUtSSU5hbjFmcjNRY2tpNHJMS2dta2N4UkQxcVFHSy9HNk9ib1BsQzdp?=
 =?utf-8?B?RUtWNnJoWU4xTHVianEwRENnVmNtbmZ0dExINVc4Mnc1cU04MmdxeUtuclhT?=
 =?utf-8?B?Tldlak9ETVFRWFN1bEp6bXAwYUJHMnM4ZXNaazFONUZaei95dWJOcWZ5OWdV?=
 =?utf-8?B?RVNCVjlOSHliZDJNdjAzMzFpMFpEQVhwaDAzY2F4cHlCTEhlelEvM1MzU1dJ?=
 =?utf-8?B?bEhFTlp1Ky92YjVyb1JmeThUdUJQdnFNVzV2OFhxZkdmNVc1bzNnTWdmUkpK?=
 =?utf-8?B?UENzUzF1eVpSdTJiUUlhS3YxRDk4eTVGaW5Wbm1zU3hjdlowZ2pPaG9iM201?=
 =?utf-8?B?YW02RzRHSlo4Q1E5THE4ZGR0K3RDTjh0Y0JqbTY5NFpyQU55bk1KelE1OTVK?=
 =?utf-8?B?cEFGV0M3aDlIbHN5ckNsMnY5OGhFNXBvTTFHbmNzTU53Vk55L01XT1lna2V6?=
 =?utf-8?B?Q2lYY2hPbysvUWxGVGxHa2xSRUNvUnhjcFFxZmovVlQ0MDFJcEQ0K3h5Tlh4?=
 =?utf-8?B?amxvQjIwTjJRTmkzMlRiVmZMcGJ0RDVkRDFyRDNZT3RrQURuK0hkWjhicGdW?=
 =?utf-8?B?bDRlRGkxRWxmc1lManJJQUtxRzRiVllhdEJySm1ITm80TmpYcXAraGpPSVZE?=
 =?utf-8?B?NEkyRjVVRWVwZU8zQnE2RFRWR09VUDY3VnR4bk5WcW9PYmxxOGpUbTkrYkRk?=
 =?utf-8?B?OWhhU1J0cVdyY1h1QThaK2hZWVdvNW5kOFU5ejJHWlZSK0wvS1lCNFl2WGEw?=
 =?utf-8?B?eldIWSttYlFXaWgrWnRTNE9teUxPTzZnWlhBR0pqNnAvcFU0QnJiR0wyZDhs?=
 =?utf-8?B?QUx1Mjh1NjBvbi94Vm1DQ2JOVWhVRE5MaFRURVdlbW40emJLTWYxeFk0T0FH?=
 =?utf-8?B?NkJBd3Ayall1WXVua0dqNndoMS9GV2M0RFVHd0JuRlU3eHoyTHJoNDFidkRS?=
 =?utf-8?B?ZFA2R1FvZzFESWtQTGNldjljazlqNkYxTzZzei9RWGRVTlBOeXgzSVU4bUh0?=
 =?utf-8?Q?aQPvjprC45aod?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlhOSHFhYUl0WHRzeXc3b0R0NmU0ajRJaFRrT0ptaElnVm0xOVk3YTBSYnFP?=
 =?utf-8?B?K09QZmdiR0FsVkM5U2NKQjNyQ2JJdGUwWGV3Zjg0OFlWSjgxSkNCVmFmRkhk?=
 =?utf-8?B?ZmQ2L2NHU2s0N3ZEOWFBNFBmWU9Pb0hSaXNBSHR3bmt0WTdHcytFdGNjcFhz?=
 =?utf-8?B?Wk1wckREVUpKdXBzL0FRSzloK1NJMXRZR2ZoU1hIN1RzRlIyQ0hIZXZ6TWZ1?=
 =?utf-8?B?WkxpRXYxZmdnc2RsRUgvSGJhY3g2OWV0WFNvMXVNaWFrRkNkcytQRTFqTkFt?=
 =?utf-8?B?ZkVPQTNVa0VIbXloakYwZVNldlZsTytTT1RMQ3JkYzZMMk9VbUFmdzdaWHZI?=
 =?utf-8?B?VGR3WGRUR1AwMnd5ZHQ2bktqVHdpcDJwN1lMVDhrYllVWXVzbDZ1OFNxMXFM?=
 =?utf-8?B?YmNIQXYvUHFTY2VBd0VORnFhOGNOWWtQMEdZeXA1VENhLzFmUlF4ZFQ4eDZD?=
 =?utf-8?B?eGhZREFnRG5jU0VsZmYxU0pTYXVxYUxITW9PU2VQZExMRnRVMjN4ZkRNa094?=
 =?utf-8?B?TkRMaUpBMUs0RE1nc2F6MmUzYkREbE5UZ05LWmVCcmZZdk91K1VsNlNYYUha?=
 =?utf-8?B?TU1EaG9JbTViZ1FkSzhFcGw0RE52S1BKSVJWNExtWHJYSVV3Rm9XYy9UWVh1?=
 =?utf-8?B?ZHg4ekJDZkRzVGlYRXVybUk4QUorRmhTV3FVczROdHZWMkU1RzgxRlA5TkVC?=
 =?utf-8?B?V2IxdFZFYXV5K2d4TXdib0d4ZXZ2OHBveGc5QkoxcDZpSmJTK2xaYjJDaWpp?=
 =?utf-8?B?NTl1OFU3YzdRTHpwenN6b1l1bitSYWRPbTBvZ1hJY0t5K1FZK3RoVnNyZXNp?=
 =?utf-8?B?K0tlanZJOFpBQXFWaVF4OTU2ZVNCS2wralh4NGJmN2lLaXYxcjNBUlZ2K21s?=
 =?utf-8?B?ZWNXNWdQRkxYOHJJazBKYmQyNVRKWHlDS1o1dUk0MlVCOUxZNEh5YmlyWnNE?=
 =?utf-8?B?S04wLzNLdXhIZm1TTElDS3Brd0FnVmRuK1htN3R5S01uR3ZJbTc0MkJZMXRL?=
 =?utf-8?B?bCtZVXVUTkdud1Z0VFJPckhoc1JDbUE1RFY3MGs2aEpIekZPMmQ0U0x0aHBh?=
 =?utf-8?B?Q3JENC9qVkVodThMa0Y1SnUrdlBuR0w0NXl2WjUzbVkwcmlWL0JrZTMyakhK?=
 =?utf-8?B?L2tUdFIwb09GOVp1c254QkkyeWdNQXdTSGVSTE1yVjE3R0w1emhPN2hmeG9t?=
 =?utf-8?B?c3FaNzZjZDhnajNDQ1ppQndxbmFzeElKcms5cVN1TWY1MmxCVVdiRXdwNkk4?=
 =?utf-8?B?b1JBQnV5RkdoVXI0ZCtCVWZWZFl3Q1VHYzZiWmFIS3BpRHFxMFZiVVdJcm9i?=
 =?utf-8?B?R2FPT05VZGxrZXR1VGRNMFBVWkc1YmtjQ3c3elNJSitUb2VlL0txbGlhYWJh?=
 =?utf-8?B?MVZCS1grbWt4ckZKNEJUQ1UzVnd6cVo0L2RjeUF0NDJvczkzanV3d1FzbnI1?=
 =?utf-8?B?RjJjaU01YmhJbTRiMlV6K2VJMEYxN3VpdGFETlpCQkVNUFE4MWNQelVjZkk4?=
 =?utf-8?B?L1lvS3JqWmg2MDd3TUw2RnNETUJpRUlWaGFQVUkyOGRsemJqbnkzWmcyaUJw?=
 =?utf-8?B?UHgyc3QzV2dneUk1dVhrYWh2cEhvRDQ0ODBYTXp2Y2txRVFSOEhSV2FxZUxt?=
 =?utf-8?B?aUw2WjFpVnlBT3VnQUNQTElZSlV1NlpkTUE0MFdRaFNqamFJdmpobUJFeFRW?=
 =?utf-8?B?bHQzRXJNMHJpMU84Zk1zc1V0QmRqSHZmQ0h2VzhDcEErQWZJZXRCckNTR3pB?=
 =?utf-8?B?VXgvZjVadk9kd2JsOStEUXlpMDNnRjJGaVdsTlFKUHllbTgzRGM4WS8vNVBu?=
 =?utf-8?B?UUV0alRpckp5WVdGUTd0ZUZuYmtoR0tpUjBTRVpNSmZwWkpTb3JTNENYSHp0?=
 =?utf-8?B?K3EvUEdBWWMwK1d5TmxpMUpsYTMreXMzcW5uVzFIdzFYNmh1L0ZTbzh4N2JN?=
 =?utf-8?B?WTZpY2JycHIrQk93OGhMMzVTVi90cmdST3NvbzNVa3dJZ0o1dERzZVZYNkVn?=
 =?utf-8?B?Sm4xYVdGUjNEMDVvay9FOUZVOUdtaFdVWjQ4dGRkNXA4MmdoTjRpeFVMSlo1?=
 =?utf-8?B?RTFPVHZwM25RSytUSVBLRDF1UXRrZFY4Qjh1WDFjYldMWUExckVRcGYwdEZ5?=
 =?utf-8?Q?GMr+BgYkNZU8CRR7+NRYTUe5j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091e349d-0068-4856-cc80-08dd50e773da
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 13:15:17.1377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hxqb3WCh44ozydDjDrx8/d1tEpZWvW7L/JNsTChyWSoRI5strIolHN6PQcWKDEeUPvVyGeDhJXZK47kYGMT2aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8817

Hi Andi,

On 2/19/2025 04:00, Andi Shyti wrote:
> Hi Shyam,
> 
> On Mon, Feb 17, 2025 at 02:32:58PM +0530, Shyam Sundar S K wrote:
>> In order to get the successive interrupts after receiving MCTP packet,
>> it is necessary to clear the remote IRR bit by writing the interrupt
>> number to the EOI register.
>>
>> Fixes: b1f8921dfbaa ("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")
> 
> how is the current patch fix the one above?

the Fixes tag is correct. Perhaps, I can reword the commit to a
slightly different version and resend with Cc to stable.

Thanks,
Shyam

> 
> Can it be:
> 
> Fixes: 9b25419ad397 ("i2c: amd-asf: Add routine to handle the ASF slave process")
> Cc: <stable@vger.kernel.org> # v6.13+
> 
> ?
> 
> If that's the case, please resend just this patch and don't
> forget to Cc the stable kernel.
> 
> Thanks,
> Andi
> 
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/i2c/busses/i2c-amd-asf-plat.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
>> index 438db5a9d0ed..ca45f0f23321 100644
>> --- a/drivers/i2c/busses/i2c-amd-asf-plat.c
>> +++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
>> @@ -293,6 +293,7 @@ static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
>>  		amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
>>  	}
>>  
>> +	iowrite32(irq, dev->eoi_base);
>>  	return IRQ_HANDLED;
>>  }
>>  
>> -- 
>> 2.34.1
>>


