Return-Path: <linux-i2c+bounces-40-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 732467E82D0
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC40AB20E0B
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4713A262;
	Fri, 10 Nov 2023 19:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MM/NtgMY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5342BD01
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:39:17 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8C655B2;
	Fri, 10 Nov 2023 11:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQMev+Dv2m9M+wmoueODzTc5aVsXP3ibLLRyXcskst3Z4rQYUKOg22B181omhKlG53ME0aRK6C1Ni2x1qll7mjJP21nNmMzHga0BDYzDR8lin0xsi/CF6Ug8Qoz595z3uSqSJRvGkJGyz4lAT0wj7NxKGlndV/6WzQPaX8jYgnwswK7Lof/far4Hv11oyp43OB9Dp9446A9h42/DPNJIPolyHQIwIrc9wb5dRTdxek2XhNbSXcXl5aqgYLDP2pB0IOpwPK+hjQfPzu979QdbPdqLbUAigr6o0D/LIUjPbdSbNhYaEL40VbEn14pB2PCaJPRDahooJFbY6jbYOVpq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT0QlYq4rm0JXsGLOrCZA7fuj2EVtANtC21xIRd5/Uc=;
 b=gnSlMmvzrV3Xks9WWhOU0YnZOT8PfBU99yP2yTtV7573uKhci6otkSt9Mop3HR40CC0Hgy9YOnkcNxO8Ax/9kmKtmj9Rr/GeKwR+mk1Vig3M6zy0lkGgVbfawcOVLVDqVeTl1PXHB7o9w3wk8nut9EWU95ndHrriwfOBti3T8WlFJh+TYn9Rob5mZqFOy49yBDnppVcAr1n028Zd596oWcQ4Xgyw19mQKJagMZiCN1qbIez/ZvhTVyTa5EfeHQGQuyu3v3dQDAU/K6Ov4navcMcyxb4AfaQf/TeFrIihkBopc9efCHBW4ZgMbQ6Rss7XJD5CCYGXZSVdWgeohHTZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT0QlYq4rm0JXsGLOrCZA7fuj2EVtANtC21xIRd5/Uc=;
 b=MM/NtgMYSucB9MdRin1B+kUJ0Xasd6iHEM5Q4ak3sA5ms7UHY57YICH1TmLtU6bnSBNEkXPXn+Lb05t+bENRcONH95FfsKSzfcpoxVG1zJTEdsmatxVSXWpDkk//gDxXqv2rbFSEU4PyESlBuhNTnPb8nANr96cO5VLq4MJXmGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 19:39:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:39:13 +0000
Message-ID: <c39d3c5b-6722-4cbd-a2c5-a8b642b47016@amd.com>
Date: Fri, 10 Nov 2023 13:39:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/25] i2c: designware: Replace MODULE_ALIAS() with
 MODULE_DEVICE_TABLE()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-10-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-10-andriy.shevchenko@linux.intel.com>
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 740d6763-aefa-4372-05cd-08dbe224b7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RbmqKtR8oMHUPPM9N442zUlu1hT2DeiexUyh5IlOpDFfFYLiYocUE9Dpk4O5aNLu0SDNGkeYmUJhyuQ9HuKPkK0r4jEJkX3lKAjW3cm9LyfQRPacLX4LKBWrhNo4l38UF4ZAzGaOV6sGlnwvbWsRAh6BHctw7dul3wvO4Xeb8fsxcyiEZyEWwK75Z+CQCtCZ/r6vmwCYsW5/pWm22AU/tR0LZI9QD9N2LKHCkLgS8KswOPSGi66RPxRgzSniyDFPKJ1n6JVAwXrSAKwRgCDx4GXmPH7L34++oUOkcmRmWUmNRLf0e790jhzwLsNoK2KDkzidpMPEgkHWjKB4/m/wLWNtEDCKdAc5xG973ThCJzcnXFHuUKYIqJ4l38BsIM/K5qIo9ZPTVnBWrDOPuFCzRJzsQa1p6K4FO6Q8VSZvtpsFsB4wDjuCHINAUkeAElIttMW/msxHOFxNxFsaEI8n192BSvlOojGy57owQzTj9wZ07Dp8nL6PKPKXAXIjgvxvBpBy19brT6kBSe6TnfmTbP17Hc7RiU6tP7Qr0x2GkMWxmqd904pBGheeZK9rM9Crx3+uFjiWrlVnK58TUdiQbFFEYNjVOWBnYeLDcM7WRTyK6Lxj3CDLbck9LdyRmG51fFdOQGD11oNaWWMt4yRfFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2616005)(83380400001)(66946007)(26005)(478600001)(6506007)(110136005)(66556008)(6486002)(53546011)(6512007)(2906002)(4326008)(8676002)(316002)(36756003)(8936002)(41300700001)(5660300002)(38100700002)(31696002)(44832011)(7416002)(86362001)(54906003)(31686004)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjE3M2VGbUwxL2tVclhady9zc083RisrTlJ0TnFWeDYybE5qY1dqZ2lrSVIr?=
 =?utf-8?B?cGxMUzlKU3NvSFdiUDBQb2p1VkhpNllDQjlqeExqcWgwaXZncWV4cGlqaExQ?=
 =?utf-8?B?bk5sU0VHeTF0R21panFUcFROZkJsMEdjemxQTGZPMUhMUTRsWHM5SHZ4K2Fl?=
 =?utf-8?B?NVc2UW1reWVqT1Z2YytsM3pwY05XNEg1Uk00SldiSmgycVlUemdRUnp6QzBx?=
 =?utf-8?B?d3hhN3k5dzgreGh6eXdGNEdKa05RWS9QcnVQMlpHRVRnV1FKamswWStpQjRi?=
 =?utf-8?B?OHpFNWZoVzdkanR5TDNTRUtsbS9ZZFA4NkRJcC8zdkdaZURxUVNiT1RqOGlj?=
 =?utf-8?B?dkl5bGN3dEcydWJvclpsK2szN05tUEdjb3JuWWs1am9GbWNtazlTTUNTNld0?=
 =?utf-8?B?ZUFJcHl5Zk1wYkhTQTlTRVBya25NNWtIZ0pGakpTa0czTE03S1RCNE5oUG54?=
 =?utf-8?B?R0lTSTVLakkzMkFHbkdvRVBOZFFIeXpqbThKMFcxdlpFdEFFMjZVTDMvTlBJ?=
 =?utf-8?B?d3ZVZEZhMWRxRG51RWJWQWJRRS9ibzIvV0pvdWFsTlZlZVpndUxpdGJ5a0sw?=
 =?utf-8?B?R1RxNW9HRDRQdndwWFp4YUtKZzlhZ013cTRLc2RmdHU1MVlTUnNVKzJwWkxo?=
 =?utf-8?B?UzJqeWo1ZlVNOFBmcXZlK29XSUEzNWM5WVZSWFJVQnJCa3VvOEZWSkw2SGUr?=
 =?utf-8?B?RmdveGhUWVhZU1gzOTk1RFFQWEl0ZTNMVkRMRDJmeDd4MStEcnRtM1p5cndI?=
 =?utf-8?B?VGI3aU1YUmloc3NXNE5QVyszNWpQWXpvcEc0c0gwclBNRHBXd28zK3IvMFlL?=
 =?utf-8?B?VVhFZXc2SHBDcjg1MEQ0NklQSnV1dGNhdjg0dm1VbWxOd2lmOGlWM2xTalh5?=
 =?utf-8?B?Q2JrYjZFZ0hXYUFlaC9XQm52ZmVYLyt5R2VyMnBsVStDSjRXRXNTWmhJVy9Z?=
 =?utf-8?B?NzJtMVRuL1Rub204QlZtRkJnTjdTeXlLNEpPcVlaaHViY1FYTFBySXg4QnV3?=
 =?utf-8?B?Z3lmVjBHQmRHL24rSnYvdHlzRGtjY09EN0VCWWJpcDZNcGF0OGF3U2ZRdHNw?=
 =?utf-8?B?cVZYUm5FbkQ3YUVZWC9Wdnp5ckQ0ell5S21MWEgzcnY1NlpQUnB4M1YxVUVC?=
 =?utf-8?B?RFVJWUVVVXc3M1lzM0lsOHk3ZldOc0FGaUtFQktkRHAwd2hESGFKWlpnMTZ1?=
 =?utf-8?B?eEg5ZTY3NHU0Z0xPUEd2YVB5b0thSkJKbVpnM0lHSkR3VnhzcmlxbmF5eFpL?=
 =?utf-8?B?VWFUTVZCbnc0TmFTMERHaGlNYXFjUUU0SEEyNnFqU1ZhQ3ByTGdhTDRla3VM?=
 =?utf-8?B?RkNTRy9mR2tOQWJwZ3JnVVpmcFJ4WGp3bTRZa1VTcC9aZHZTVkQrRkhvWTlH?=
 =?utf-8?B?aHozM2RSUTFjNG9PM1QvSDl4RitueUgxRkY0UDRBOUJ2eGswUDRzSjVvdnZz?=
 =?utf-8?B?QVJsTDMzQThSeWtYdHZFdUw4akN4UzhwQ3dnMlVBV1Q1eFM3TUZyWUFHSGtK?=
 =?utf-8?B?WlRHMk9NN0NRQVRxVjZod0g3SGVQOXkzcXVmRW5tdjAvbUFpVVRwY0Q3YnI5?=
 =?utf-8?B?Mm9HRnhsSXMzc3F0VXhvU0FRU1psNG14Q3h1cGgwK1ZuQnFoTC9Uai82aTJl?=
 =?utf-8?B?ejFwOFJjRzVqRXgwLzhRYVpVcm9wTDRubkFZcHlCMnRUeWdxa3hvc0FvQUdu?=
 =?utf-8?B?dzNsdUt6SFlIcjNTanhtQUxSMzE3M3dibFpTK2svMmQydG1UOHRFUUdZNy91?=
 =?utf-8?B?bFh0VnR6K0xyWE4rN0ttN2FEK0wvU1p6R21lTDA5N1pNa3hiMG5oaHVRWVR6?=
 =?utf-8?B?RzBTWHBWUnZ5SkVqK0NnUGhWVGtWUlg3dERPK0RCaFJKQkRjdUQvMmg3OG93?=
 =?utf-8?B?d2hIa2VSVVdwV2xSTUI1Q1FUNUJYUEluYWFiblM2dkZwNU01L1ZYd2JuVmwv?=
 =?utf-8?B?T0M2aFNrVGFZYUZEc3JIYzNCTWs4MjMzazUwZnBRMSt0THlPM0ZuS3k2RUVS?=
 =?utf-8?B?K3QwVjBCK2QyK2lGV2dOMG9VRFFQZlJ3b1ZCck9MMXNmWmtRUUM5cDhvM2cv?=
 =?utf-8?B?aG8rc0JpN2JHRW01OUoyYzBSSHE2SllHcFNHMnltakRGYjR5S3gyVlBEUTFy?=
 =?utf-8?Q?xVtfZKvAoxiELXdKxG+IMKtcW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740d6763-aefa-4372-05cd-08dbe224b7e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:39:13.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrP9TwRHlNbif37DoFpqRv8v5pbosiwwD2MEl1aE6+HT3EeyVT/sTnGwEIgTFZ12A8Btg/3atVqNpCJ1AU4mKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310

On 11/10/2023 12:11, Andy Shevchenko wrote:
> As Krzysztof Kozlowski pointed out the better is to use
> MODULE_DEVICE_TABLE() as it will be consistent with the content
> of the real ID table of the platform devices.
> 
> While at it, drop unneeded and unused module alias in PCI glue
> driver as PCI already has its own ID table and automatic loading
> should just work.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
>   drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++++++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index d2ed4e77afb3..db642e0aa61f 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -417,8 +417,6 @@ static struct pci_driver dw_i2c_driver = {
>   };
>   module_pci_driver(dw_i2c_driver);
>   
> -/* Work with hotplug and coldplug */
> -MODULE_ALIAS("i2c_designware-pci");
>   MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
>   MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 4b5e58e1ce5b..5d8427ccc9b4 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -486,8 +486,11 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
>   	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
>   };
>   
> -/* Work with hotplug and coldplug */
> -MODULE_ALIAS("platform:i2c_designware");
> +static const struct platform_device_id dw_i2c_platform_ids[] = {
> +	{ "i2c_designware" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, dw_i2c_platform_ids);
>   
>   static struct platform_driver dw_i2c_driver = {
>   	.probe = dw_i2c_plat_probe,
> @@ -498,6 +501,7 @@ static struct platform_driver dw_i2c_driver = {
>   		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
>   		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
>   	},
> +	.id_table = dw_i2c_platform_ids,
>   };
>   
>   static int __init dw_i2c_init_driver(void)


