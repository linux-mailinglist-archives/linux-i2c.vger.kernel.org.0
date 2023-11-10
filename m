Return-Path: <linux-i2c+bounces-41-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C267E82D1
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA882810DE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739113A29C;
	Fri, 10 Nov 2023 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FmHo0pa0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BD208C6
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:39:39 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D11749F7;
	Fri, 10 Nov 2023 11:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fifxM5k9E0DWSSRm7JXX3uxy22PJvbg9Oe2opvqKnQh5bsVmCziwc7HRaoNHX9KmDgo3Z5mWpKS1FnGlgSz5Nv/ThBuGUyJv5tORLu56uxT0v2fU6z66U67N/2dfZ2ZDp1gSeH/mGdp4IrBsZr80opwH0uidYqIGzdeR+bYd7Xk30DUMniZOENu8maXACi813pmhz489fch3YyyyzjV+vQzg22OixvnLQrAkFp8UIQxFLB8EsSlJGHFljBZGkCGW0EjA1CPHaiWdaXOUwpVEwoC8XgzLNwDbd/s5izfYwM7lN/KV0EVdkQ5XoAsDTXP1fXyDHglXXYVrHaadoQwAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0cBDP0PgQyMAggSK5t3wiLXfIfgM9TUM4QAmXhIbcc=;
 b=FxmIEnyTOBoQxJBDf/KPCPpdfmxLO95mcRlolqOJ0OuN8R8WSJ9oVQtbSOdDiopwLadc3yHBcqa1EtIiTUZUyd+KuwW+zier0zc/38LhzlnIEjKlHqxAcJMTvQ4v1hZvw3DfWgG5ZJwRYJXNk58yX+bgynNPlPGog8EIVMZitMHhvsWLlq4Xvhu1LUBFgO7VClJpSMEh2+LTu2xbrUiAE5bmnGHoR9cbfmmOi8zAPRv81LMi5rj9+TKv+seJN4SY/93lv3J+uM4x3mDaGXt1vbKEXL7WMxgu7Wx8TVWc4KJR/sJ2amWCUjL2pH192VTJC5Oyj80HohSZRd1JzIw6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0cBDP0PgQyMAggSK5t3wiLXfIfgM9TUM4QAmXhIbcc=;
 b=FmHo0pa0AfKU0msi18i5Cb+gSsZEsQRpM8rOm3dTpy7kk/SJhcMNE62Dj/DXFCGlVDN5j89C38bKSAO5VQT3s7nI8YGq2VWkfnzD4KbsOcQeLJU8Age9H5+6gv4PXrToUPBanqLsCLFSWuJN/1UnpuFVjwa8WhnebobsG4j4QZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 19:39:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:39:35 +0000
Message-ID: <f92f670d-11a0-4ff5-944c-d5809588b1e7@amd.com>
Date: Fri, 10 Nov 2023 13:39:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/25] i2c: designware: Rename dw_i2c_of_configure() ->
 i2c_dw_of_configure()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-15-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-15-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:5:337::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d52961-9c11-472a-da6e-08dbe224c51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3Qbfa0N6iOzLccm8NKieZzyEzOT3SeGqMp90lSJ056hQAM6Y6vHAp2uuDlkHtCqKdATUF7zeKwGZQDqhlNgQ1E1uAyKh3O6zpLIisSWpurd9MSDKKcBvvD0Yf+LQ/HKgiZFYvemI6EDR7kh6MDQ3WM6ZCUMNkYmeAhXbfQssFV9KZ52eJwaqUMTxHli35S664wMnO+5k+hiWBBJn2TqvqanuhYKaIQhNDJbimVqRnRPFJ5KOFnI7XMcvts9B0AU6MmDd3KImFoHTSYxCMUmDCoYXSK9QaBdIZa3t7r9C4gRK5+IBQ1iJ42X8jcbxwsVKWFMJ0TD6AoxO4v2qy2vJ+iVsqZIz5Nb3qCE94JMtpXne+w6mvrDQb1vk/Z5qpWJfjHniClCl8VjmkSMA70al0mjK6KkVoP8Pyea3SzCCuHcQ21d/IaxpXXrpSaQcXcEJ6Mmep5k5Rdio5CVt1opi/zuijFxQIMoOPe+nrI8AddxOKZ1w57Er9CwlUnZsBf3HR9+XEk4tuVr8EeFXLO7e8XIKtojShfdzjsFfwS6xKtpwN6h6U5W+iZxbB3IABwLI5rHlOwalOtCNzqytRT0pyB6nD2UvO98xxHELTEr4jJtizKs9P9o5YbioL6QogWT+8cgdj7ilasc1Hv6jp2l9TFSUkns21sgVKmntHwr7QUNKRVfbyQmQNnvRlxGcNfgf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(83380400001)(66946007)(26005)(478600001)(6506007)(110136005)(7416002)(41300700001)(66556008)(6486002)(2906002)(53546011)(6512007)(38100700002)(4326008)(36756003)(8936002)(316002)(8676002)(5660300002)(31696002)(44832011)(86362001)(54906003)(66476007)(31686004)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTZIaFZadkdZUmtET2h4WmdKSk4zY2NETXBGeU1vWk1CY3h6YlpPbElETFZq?=
 =?utf-8?B?Q0Z0bm5uS3VHMFFUQUg3bDNCL3hsL25kYkJzdXd0Yzk1VFl4Nis0WXhMbGtV?=
 =?utf-8?B?dHhqeUk1SGJXWS9yMnN3MTd3WVhFNVpRTU54OGY0YVVEZzd3NHpVeTlwWjNZ?=
 =?utf-8?B?UnhvSFZac1daTCtDR1BSZDEvbHZ6dDBEelZZK1dxZ0ZxOUFrWHZRQW9jZWdv?=
 =?utf-8?B?TExranJMUXZHdFhia1JzaVVWMVhxdFVWZWg0MHR6dEhJZndXazBJemtiazEx?=
 =?utf-8?B?NHZRQUd5dHAxTGpEQm9rNkpDb1Rwb0xrY0lHTjRhUnQ3ays0ZGhvVTNCYkY5?=
 =?utf-8?B?NFZWN1c5aEJyQTVkVHprb0p1RGVXZWQwQU1aalhmY3FvdmpuY1hCOUJtU2wy?=
 =?utf-8?B?TzlVWDNLTy9HNUE4UTduTzJRMGZuMFZac29ON3Z3YXRsMm9Zdmg0UmUzRk1q?=
 =?utf-8?B?MnFoUVRSOTVuck1PZW80d0F1aVlNbUt0KzNwUWJYQ2JGNHhqaE50ZkRnaTly?=
 =?utf-8?B?Sk9RMUFFQVcvelVJQmVYV0c4ekVHdjNHVXF2WUcwNVRWcTFwNU9JTThzMDMw?=
 =?utf-8?B?cldrcnNXaWRCemtHZzJSSVFLYyt0M0I3OTNOdE83M01OUlhMQk1pb2VRNDI5?=
 =?utf-8?B?RmxjL1E1VE5Kam9PcFVDR0p1bThRUlNzdk4vTXdEcW5BaWtibnMxeEVxaFlJ?=
 =?utf-8?B?bUpVQzNtazR0M1YvNStaekFGSDQzcEo0TVBjWHVJYzlVb2NhOGlEbG1tYkRr?=
 =?utf-8?B?OVpyU0U4TTAxWk1RTkJVaVlUeXB5OFIyOFIyTSsvOXZXcmdxVDVFSjZFWGJv?=
 =?utf-8?B?V0dueGdsaWErNmo5YkdsZjJaMHhpYTJpbjdEVkJTd1V6ZXhDM2xHemFJb3Bh?=
 =?utf-8?B?UGphRmNlQzRhaGt1d2IwQ2hKS2V0Zmc4V0c3SWl3MjRYNk1qZ1hscTAwVm8z?=
 =?utf-8?B?R3Fhei9FV0hlN210MXpSYjdSRko2dzMzQUtuUEZJTnFsOGp3cjFqeEZPRmFt?=
 =?utf-8?B?YWlKcUZMU05LWlJFVFpRMXFmRTk0WUpUNDJwUVBITjFneVZuRW5aeGM1SWNh?=
 =?utf-8?B?YzkzNlB1NDkvc0hIWUtEbUs1UURXUS96NUxLblp5NkZreS94amFtK3B6aHFx?=
 =?utf-8?B?cWQvSVVURWFBaXdDblF5em1PbTFWYWl5aGNCM0l1Nk0ya1Y3eExnaG1Kai85?=
 =?utf-8?B?NFJ3WTdWU3ZuYXNnejJBYUdxT0J0S2IwNlNJRDZ2Yi9JaVk1NUpMMVRQbElK?=
 =?utf-8?B?YlhPd3ZxcWV4ZUkvTG1Bcm11dVgwbXpUZEh0TFJETmVmaVVEd3I1dmJheVp5?=
 =?utf-8?B?WGFYNFExVzdnU3A4T0RHQ2Y1cGJJK2VzU1AzL2dsRjk2eGN5R3V2NHhNTE1k?=
 =?utf-8?B?TEtrTWFteithQjlWNkh1d1o0R09OSlZiQm4vK3JYTlh4YjVhSjJWYkNxUkUv?=
 =?utf-8?B?YkdkbUdSUDlDdjRNWUNIQWxENEdOKzYvK1ByM0dzYS8vdEFYTlRlTGlOdXUw?=
 =?utf-8?B?Y1VhMzlmSW9TQ2Z3NkFmK09HelUvMmZMM0hpcWFZYmZ0NlpJa29Ha2xLNldX?=
 =?utf-8?B?R3NjSnpRMElCS21tb0twTU8wcDlIb0Z6Wnp0M0tXMzFTOERKdjF1bmJRSTl1?=
 =?utf-8?B?d2tENjgyVzhIM3dUc1Y5bjdTOFg4eWUvYjdnbGNGZ0JPc1VxYURNZ2ZDRmRH?=
 =?utf-8?B?OTl2QXVwQjlyMU9PY0tMbXlTNnBGOTcxUmZBQWFlTkU0NDV3NU0wZy9YVWs4?=
 =?utf-8?B?STBYWDExa1lCa3BXV2hTQVJSS3Zjb1A5aUYrTElIUEVxQ0U2bHZZUUVhanpW?=
 =?utf-8?B?Nm1NV0JLOWdtNEZBc3hBUlZQcThNbzE2Um5TL3NBYW9RRDZaQTM1QkN3SXVJ?=
 =?utf-8?B?MUQ1S21ZUVp5TU50dDBiZjVVd0ZhbnczNEtJYi9WVjRVcTFlT1E1bG8vaS9W?=
 =?utf-8?B?SGNFNEVuNEFsWEJ2Rjh0dGJXREFBajA0K2JDc1ZkRDlvVHd0c3QwY01rL1ph?=
 =?utf-8?B?b1VEQ0VKQkY5cWFmTEhtaTdJRGs4eFJ6Wi9aeU5UajFtSXhOU3d4Nkl0ZExa?=
 =?utf-8?B?elZkcHdRVVNuVnp4VGl6UzMrQmlDcnQ4YXF0R3hRRG51bU40em1MejdWQ1B6?=
 =?utf-8?Q?nDJGXTNWPlyObBw0/72GE8Mdu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d52961-9c11-472a-da6e-08dbe224c51c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:39:35.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KX3v7ZAbQe3FViwBMQmTFANp1LREHOgiFEmhoGjprE2zsPo0MZ08Gr9De4ChcjBY7foCYlgZqZCygN5pEuVyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925

On 11/10/2023 12:11, Andy Shevchenko wrote:
> For the sake of consistency, rename dw_i2c_of_configure() and change
> its parameter to be aligned with the i2c_dw_acpi_configure().
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 7449f1b37ecf..b8606b651feb 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -110,9 +110,10 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static void dw_i2c_of_configure(struct platform_device *pdev)
> +static void i2c_dw_of_configure(struct device *device)
>   {
> -	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
> +	struct platform_device *pdev = to_platform_device(device);
> +	struct dw_i2c_dev *dev = dev_get_drvdata(device);
>   
>   	switch (dev->flags & MODEL_MASK) {
>   	case MODEL_MSCC_OCELOT:
> @@ -130,7 +131,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
>   	return -ENODEV;
>   }
>   
> -static inline void dw_i2c_of_configure(struct platform_device *pdev)
> +static inline void i2c_dw_of_configure(struct device *device)
>   {
>   }
>   #endif
> @@ -306,7 +307,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	i2c_dw_adjust_bus_speed(dev);
>   
>   	if (pdev->dev.of_node)
> -		dw_i2c_of_configure(pdev);
> +		i2c_dw_of_configure(&pdev->dev);
>   
>   	if (has_acpi_companion(&pdev->dev))
>   		i2c_dw_acpi_configure(&pdev->dev);


