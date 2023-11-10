Return-Path: <linux-i2c+bounces-39-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D627E82CF
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A86BBB20DD7
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D30D3A262;
	Fri, 10 Nov 2023 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fZbw9pw5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C5D208C6
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:38:39 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8A46718;
	Fri, 10 Nov 2023 11:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWJ+UF9NHv4X6NMSySIgJPlIAAU8QMm2b60XlnMSwxmCc/awY0eStICzRvHg57bgR53opcBpiKVHXufs0F2tfxhbpPGNgK/L30NRqMRwABleyVZvyaM+LCzDrVpHuRwY7dTSL7iP0e8Ma94M6KB/wphGfzubym5X2McwgsZcYh7cW+UzTMHyDwqRl5hQNSXlt5lRxHmkOBnEBFHgl9K12o7TklRlp1qmCaDsJ91AHNhqG1937PAZ0ZrJoYUd/NLeiUxFl7dw4FHiME5msMxt6uGwhaLI5ztxmYUVl5cUhYacIFK/kcDfyublJkwkjHgaRYY6n9F7HNY/r/dmlg0afA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4Huo64iz2eMnFfiwECY9RDk+dNaLEoyIH+bDhO0zdM=;
 b=RVCkrze0kYBkwqr6DNrSladwHM9Lg9MutEk2vQtJQYvJlA9jtZrqlBr0Bkw3cCh7OFSADAVn2rNAzCC6CsIV8nwM+ook3PbgehqqSeI+4t5YAAQIE10pqC//9WDiZT9kONH83UjmXMbue3/GFDQRqtD5COUym2EhexlXt7XEY9hN0xhFd5PvYS1QWNbXPtE5VKPfQq8Hl1mk3ljZj91pjdJpgnZ75IJCf92giElJ8UANYjhDUHKMfKAzVjE1ZUuuTVbeOzvMOuCMEAWKTWRDsGCcKujEK7oWLaRQnyI7q7P12tngMro6wJ0Zx36cussbn6vCTlcEgpZ0XkO0Qf47OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4Huo64iz2eMnFfiwECY9RDk+dNaLEoyIH+bDhO0zdM=;
 b=fZbw9pw5Ri1jqVYPovTw+u/9ZEtSXKOvR44NVxwbZ9EIEdedcsKhaGVkMAVd1knaJuWfzKAoWLdARp562tFIQCPTCnW+f5lQt1Rdr/MpU/8JczdOs1T9bivh633eJSH4Sn1am5+3UIk9M/S0IL333b9J6bcSHQnRt2e5JoIUNyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 19:38:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:38:35 +0000
Message-ID: <382a9f86-f907-4432-9580-3a1b1b449121@amd.com>
Date: Fri, 10 Nov 2023 13:38:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/25] i2c: designware: Unify terminator in device ID
 tables
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-11-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-11-andriy.shevchenko@linux.intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 64cb8cc8-efc6-40cf-a8cd-08dbe224a154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XMDTPWtcD+Jph0Avj631h9ir1QMo9Agdu+748BnMqq2FcwzUIxrIBd/A+O1QZT4y/tagSwlOmqmJWJsSkCyRUBPYplOGyT4M6XEhDys7GwcpgYScjG0f581MrFNPqxyvLvZ9xCsV+IxLJx+DsbnxBxme2dlicV+oKsInQSOoetzwBYiyFQGLJU1dR7zix4o+30RBBT1btaYM/uPO7hxWxz3nTPiNwcbUiVXN3YxUaPlyVZPQTpK91Aksne+/w6yggaFEfH41/liHA9QMEoRkXXjdNz/Iy0nqJHys9G7DfYZQ/3RrupC281QshzFR/qaT2EL1KXNaxdgOXU+9FSH1xqTWfFMTgXQjHyHjemtuXR3suvkw7IP0GEJ0VWRD3jwtX+u+6xUhhyOjPMRy509z0Yxc9aIHGKuzmNRHTTkCIHra3qgd5uBEc+ibbSbN7chE9ZGXbuuRvvacfyejfuFQ20aWOsxFSfMeKmD+FlRVihfJWuwzM3hcDp20DDoioVX2Vb7Y8wRZynOwETX4g/BnT3dMY+r8QLXlp/3lBjOVU2YyyVUMgzocZckV5F9q9eb/+t/9+yqOtH/+bwPzyQm3Xx5zWfD1yTIuSlgpgdl/hBe60OUmgvdxfeDmt5B7mY6g+vHLgvguObDBb2zHVwBNgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(83380400001)(66946007)(26005)(478600001)(6506007)(110136005)(7416002)(41300700001)(66556008)(6486002)(2906002)(53546011)(6512007)(38100700002)(4326008)(36756003)(8936002)(316002)(8676002)(5660300002)(31696002)(44832011)(86362001)(54906003)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y04xNE9hMGk4TXhVRkRKYUVuanloNkk2TFJnWWxkeVBreDdtc0tlUVA0REVj?=
 =?utf-8?B?RXdFcmZzZjhORVFGVzlUZDRrNUF4VE5YNk1YZVl6dys1Mks2NGxHamxlYXVK?=
 =?utf-8?B?WmpkTWNpVkVZWVhPMDlrQXJaWlhYYTZONjB5OEMvZWdySnpLb3lBOU9VVEpn?=
 =?utf-8?B?R0JqcGJtaWV3ZWFDSm9sY21MQk5nWTZBelBEMzR4dW9UelJ5TlBxWlhHcnFW?=
 =?utf-8?B?WjVBNTNEaWsyeERmT0Zpb05BZzY5QktwYlZ0akxKSWNnMjN0Qnc2MjZzZTE3?=
 =?utf-8?B?QWxkcnpSaUhneVZ2ZS9TeUxQNElOWlFSZXdxM2JTNS9qby9IMDU2TkpoWWYr?=
 =?utf-8?B?ZnRLTndad2VJSkd6MkdhY3RqOGFTbzhPL215VWxpaTFqT0pQOFRheTFtN2ov?=
 =?utf-8?B?TXdGeXFITWoxME80RTBVMjBDSnJBay9HSklxK0JvNXd6RkczSk41MWVuREwv?=
 =?utf-8?B?eE5QQmNwakp4VFMzMFRSVEdNc1RjQ1o2Z0dSWU9UK013S0ZLNURCWGd2azhH?=
 =?utf-8?B?bmVtQm5wdEJldkZmZWVvVEoxZUFCZnVVZ0xxdmFvbUF6K2pKcHVsZzN6ZW8w?=
 =?utf-8?B?eEk4eFA3OVQ1dFgwQ3JFcWZQWVQ2bjVHRHh5cjAvRmdLaSt3RzFocjlsNWc0?=
 =?utf-8?B?eHJkcVRiaFZGK29XalpoTHU2TnkwbEsrcU5xRklNNzJxQmZHS21yaXd3SDF5?=
 =?utf-8?B?REZEZHZYK3dJM0VNNHI5TXdkVEMyb0JENUpzbFQ2dEhjWHVhd2JEa1hodjgx?=
 =?utf-8?B?K1YrbkZ2YklDdmk1QmtpblVnM2QvL1k0QVpJN1lSOXNmZTB6WlNOWVFyVDlw?=
 =?utf-8?B?NjYyWWhQdys3Yll2Q0Zxbm5jTWdRdDFkNmxDTko5Wm1lOE85cGl0Slp1NTVS?=
 =?utf-8?B?YVg1cmh5NzZpV0FSeC9ZZFIyWjZCejJ0RS92WXQwVkVDQ21SS2N3UUdrWlpl?=
 =?utf-8?B?M1czYkNESDZoZUFVdWplbnNkMks0RmNlL3MyUFVOWm9BVlE0WmxlUWQwejUy?=
 =?utf-8?B?SndEdGFselQ1L0Vic1h4STlJSGtPR0RCRkRwZHlWK291dVovOUM0K1A3K1Fp?=
 =?utf-8?B?WHZKSTkzMWNyc3R6ejlyeDU4VUgzMEhiR1ZQVzdFbWh0NEJtWVBaaUw5c3dw?=
 =?utf-8?B?MEtobUlOV3RkSTBwVE51UE5JUk9aSmpON2c4dFpGcW1UWDhlM0JUdDVzVUdi?=
 =?utf-8?B?VHVEOFI3UlRjYkpVRFgxY0NOQ3RtNE00MzJsRGJObkNmZ1VhR2Y2RzNUVjhW?=
 =?utf-8?B?OCt5Z3psRGVhWnZPL2xHbmxXSzByaTVPUms1VzQ2UTdtblhnUVU3WmltZWNN?=
 =?utf-8?B?Z3k0aE9HbmhRVVZGemQ3UmwvNXBBS2UxM0ZHMldoM1UraFhvRWVFZXEvYlZl?=
 =?utf-8?B?Y2YyZ29CMzluVlhmd0Zad1FpazhIMFk4WERjYWp5RlFoMjdGbUIwbzl0blRi?=
 =?utf-8?B?SEVBc2lNTTQ0N0VYYzZIYUtXN0FWWko3QjlPcUVDUHYrVlVydVNvU0taSHJX?=
 =?utf-8?B?UjI0b0d4RlliODVyalA3TTJuNFNSV2RlZHl4S3NFS2hGYURxTDJKSHBJTytZ?=
 =?utf-8?B?RXdvdTloK3pyTUV1MGl1bkM3L1E0ckpWN3FIelVQWWxuTCtKdHZOWlM3UndH?=
 =?utf-8?B?MGxEOWFQc3NhNmVHd3k2SUVhK05hbzQ3MmR2SUovWUVLVExmNy95bElEdnRi?=
 =?utf-8?B?NWxaRi9WMDNlWFhtdVU0WWNqeUswWmh6K1dqcVNGRWVqYVZLUzVDbDFqdE1x?=
 =?utf-8?B?VlBLY2l5djNKNGx3Q2ZadWNydENVTkcrd0FkTkd4RitwNkl2RjJhSWJuVmlR?=
 =?utf-8?B?Uy84bjdWdG9vUE1idk8yVXE5S1BzOWtXdjdESXdXVkJaVzR4T25FYjUrV3l5?=
 =?utf-8?B?aS9ya3YrMEZNNmJyTkZ3UDFma1hsRGRaL3ZQeVM3enR5S3Z3YmlNRVNYU2hr?=
 =?utf-8?B?TnlnMjhwMXB5TzYrM1A0d21uSW5hU1A2Sk9GM1BrczZ0QzVKQy91QmNSRWRr?=
 =?utf-8?B?UG9jd2FhdzZiTmxDM3JVUU9wQzNlVGVlYzZLQVJMYVZ3djVyL1I2MWdoeUlT?=
 =?utf-8?B?UW1WZDhWNHN5SGpkeCtlbGkzVnlJOElZTlQ1M3VqcGNnU0RTTVo4T1RwYTVD?=
 =?utf-8?Q?jqTMjfvO35NoBJea5NvKfl2wg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cb8cc8-efc6-40cf-a8cd-08dbe224a154
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:38:35.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRX1YCYFxSMLQ9kgOPnIt2235iZbQeffrEkcUwJr+d4LIWRJ3gNskxuvuiVEK17OkH3exWpLTgO8pFMCWNfnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925

On 11/10/2023 12:11, Andy Shevchenko wrote:
> Make the terminator entry look the same in all device ID tables.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 +-
>   drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index db642e0aa61f..7f04dc33e6f7 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -402,7 +402,7 @@ static const struct pci_device_id i2c_designware_pci_ids[] = {
>   	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
>   	{ PCI_VDEVICE(ATI,  0x7444), navi_amd },
>   	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
> -	{ 0,}
> +	{}
>   };
>   MODULE_DEVICE_TABLE(pci, i2c_designware_pci_ids);
>   
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 5d8427ccc9b4..018c353a456a 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -57,7 +57,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>   	{ "HISI02A2", 0 },
>   	{ "HISI02A3", 0 },
>   	{ "HYGO0010", ACCESS_INTR_MASK },
> -	{ }
> +	{}
>   };
>   MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
>   #endif
> @@ -153,7 +153,7 @@ static const struct of_device_id dw_i2c_of_match[] = {
>   	{ .compatible = "snps,designware-i2c", },
>   	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
>   	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
> -	{},
> +	{}
>   };
>   MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
>   #else


