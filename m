Return-Path: <linux-i2c+bounces-38-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C37E82CD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9024D280F61
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D8338DCF;
	Fri, 10 Nov 2023 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mo/1ov8U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3BE1D539
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:37:06 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E267D59D0;
	Fri, 10 Nov 2023 11:37:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOOBSYMzGQV9LoY2sDZVjdf8YEZY7pAKIxjsr+ybyaXvF6go6+cnUK6UjWvly+98CjBEO63dT6bKb0CBMde8pH6+2lrbWtQ1YbaZqHe2h3Oah4DYt/uHje/RUIVJsIAHiSX4LSpUXNX/coz5AKCixcr4OIny6blDuun6MDF4+fBZV+lwNcTG8vAz48oXyz8PQ0YPTSKb4mg+NzuU25ESJQPKiHPbsK5HCISS0Nd21Bk+Lr1z5BErBd1cEKlvKLkK0/VLv6hj9KngYpg4lvOX9gKFhRZFCgLL/wi7+Uxfsf9Zna7paJnHSRkvZEHhcFXHr8hm/U1Sd/yLLX+OUTRiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEnq+xum48GXSRsKHLUlx6AUUu7p8cM/jsczLhtmqqo=;
 b=Y9P9VJwwEmC65wSXYWY3dwz4X3envN2kF248ab3Ki9pnycSMZoJ5ktDt1kiH4nngYZhWHM9O5Np2q0MplJFa6ZjPUnlAIn7tjyYriJLPiF61Md2RUGO0aB3goCBziqQjRGYAt8AuU7sxZYENN7qN5UF5cuSNXk74RrgTsMpLM18FZmPcuL1gjnY5r0wEegxCom4O++zTHSExv5g48XI7vD7Ct7JKbhvdws+6hyWPmMfrSVFAnRR7OUQcNZw2HFwVyCPv8LCSdinBBvSgTq0c0xNE2HDaDMy69oURI4x/cCxTuZjz5533MGLHlGrguiz62cP0VkvDPGWTL6svTu2ytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEnq+xum48GXSRsKHLUlx6AUUu7p8cM/jsczLhtmqqo=;
 b=Mo/1ov8UAAlxwSG7LaU9YZpHs9XGmx4EvKrddlXM88ODNUyaKoSOac9TzdWTgyv+pbuH4jT1900izgjQogKqAXXdLfwxZ/579xXXX6gJr9WvhSk7jeZpidogHh1NJIstKuraHTffynSMzHZekmKDEY07rZ5/2OABe7+vclM6dxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 19:37:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:37:01 +0000
Message-ID: <92e374bd-cb58-4bde-9e84-b7cbaf6fa541@amd.com>
Date: Fri, 10 Nov 2023 13:36:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/25] i2c: designware: Use temporary variable for
 struct device
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-24-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-24-andriy.shevchenko@linux.intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 713df221-9b82-4830-b3de-08dbe2246937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sNjA1L26C0TMIKL3LbG0LkQK3knJiCSjD/Uh7P+T49zBVtf9UMYLTJIWtaDQppY/vVYDfWWqxYuj3SbC2u9o6YnXgiB/eYCLuJu1TYgWXKsYldfLMEdeqEHYo7GOgKjjW5F/7zoBcfVg2XPM1cZ7qQFQsNpbAvOi3GY4Q1pFbdHb7RiQm43/BaMmr/FCjO1AO/VAQBal+ozZG7lFkMBQM0MhQPk7cTehcAxEUGfU0Hcji3OQM2NGxFSk0enXWOMQC3pcR+H5aFRZBeN1EPjTxth38GOjldWATpo5yRpvIjyG1DnZJ0MqblHzW/MAaMjA9MwVBKjuhCQGeRLO7GUB+Xc8Tllwa4votxYh0KRZJ5efgz658dZBnsSdUq/Q4yKYivd8FZxAzC7VJr6ImdLVq61qiM9OaqnFr0dHTmhjbHV9ld6lqtOE7bAHU2O5qYyFE8I9964KZpCBG8bns45e+2l311p0DrfABCO/RsKkcnLkyI8xLX53HO30+e3UzK5W7rOD6tuoF0pzVHeQ0V5YG5qd57MDnyznlOkIaofkSx8iTfi/YOLb/LVh0/Dr5vWcfchyD9AyG8bg5/rZ1cWNifYQ1E4G5zzJXxYJCo7LvwjUVY5uCEXF2P0CLgtG18j/lyXGofLNzt2QcXY3tsGwnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2616005)(83380400001)(66946007)(26005)(6666004)(478600001)(6506007)(110136005)(66556008)(6486002)(53546011)(6512007)(2906002)(4326008)(8676002)(316002)(36756003)(8936002)(41300700001)(5660300002)(38100700002)(31696002)(44832011)(7416002)(86362001)(54906003)(31686004)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5XaCtnZ0drRVVDdkNFZldFdmNhNkdOMHJNUm1DSzFnaUNKMEZ2UXUrYmVV?=
 =?utf-8?B?Ty9IM09IM3ZYc0pTYmtNTjZOaEVYRHJNLzUvVlE2bERLY3p1L0tZVDRYWmkx?=
 =?utf-8?B?UklFSTM2TDhwcTZ5eXlJeUw2SUUwWWNqTG5jMUd3K0RPYWlKTi85aVJWRDFF?=
 =?utf-8?B?ZEVBcDh3Wk80ZFd1bXhCS3ppWnpHcFNRZHFoZnJrN3JZc0Q5Y2YxenJaS2E0?=
 =?utf-8?B?WDlKSlBSd0NNRU84UlFSOU93WTB6YWw3cXQydXVUR3hqdDB3VlpJTU1WeUNz?=
 =?utf-8?B?Z2V2ZDUvYksrSHlwOFI0RTJ6MjJ6T2tQaFF6MloxL2xwMnFpeEpSclgzdDFn?=
 =?utf-8?B?N1YrRVJ1Ri9sWDJhbnl1U2pzbEVCM1dTemNHUGpmYkxXaE9acE1hWkhMN2NM?=
 =?utf-8?B?OGFIenlnTzVmS1l4SVl1TU8rdHlrRTZFYnZNVFNBZmowcmhxcmR4cHlEZWhr?=
 =?utf-8?B?R09sa2RDMjRSOEZJUDA2dUdieDNSbVYvNHVEMmNaTTM4NUhJUDZQajZqc09q?=
 =?utf-8?B?djZWeTJWdXNoSWk2MGJrU0tya3VYMHR2Y0F4Tnl1UmN3enhIWGRkTWNCUWV1?=
 =?utf-8?B?ZEhNRnV5VVFLWlN6eGFaeEN1dCtyQkMwSFpBU1pMWVhHcmlmeFZnZ2UwNTRw?=
 =?utf-8?B?cmt0VEUzd0tYQkRzUTZIVis3VGpyMVNxQlUvcmJaL3FsRzNDa2FoK1Vtd0tV?=
 =?utf-8?B?cndQZEtua1VzYXl3bVNyN3dQNmpNQXZMNG1HOVR1VHhKaVNEWWRBbEpyTUlW?=
 =?utf-8?B?cjU0N0NNMXJqZDlEcVpWdGl5cHBmSUNOSWpjMHQ2ZG0xNkViaE9vKys5ZzZP?=
 =?utf-8?B?UURhQWl6aWxjUjN1WHk5V0RaUVpCOUlDK0F1c3NrNVlRTTdzOE5iMVQxWFVm?=
 =?utf-8?B?RFViTlpYMEJkOUdNR1VSK3VsMzEwVzAzSkRGNjYvUFVzTG54bEhINlVWcHN0?=
 =?utf-8?B?MGUwTndwdXZJVFIxWmNWcEpvYlRnK0RGRG1jTXBGbDBnUllmYmhTK0g0Y2Fo?=
 =?utf-8?B?Mi8velRwMk1oS0ttTlRJU2s2bXFlaHpVT0tMbUtEMk5DVXdOeEVvajVpakJP?=
 =?utf-8?B?YkJqZTNESDNIblJPOFBRSklkK041Yi9kZEdpSExPNTBtVElpWkJCeWI1Kytj?=
 =?utf-8?B?alF2REQwb0l1T0drQjNYNHgzZ09rUitzSEMxQlZkU0U0bWZQTWh0K1dVWlF3?=
 =?utf-8?B?V0lMUWY2UmRnVXM2aFZvQzhXQy9wYjE3Z0x1OHU4eTNFekh3bzBmWG9KNkE3?=
 =?utf-8?B?am1CQUx5d3h1MmE5TUtxbGRxM2g5MEJVYmlkWk9XRW9uamdTdXV3SjZIS0dE?=
 =?utf-8?B?NUF1MnFiWFQyTUcyaWVPcG94Rlc3YWtKeXdlUGFpUmx5VEVwWFdaM0dZNUtH?=
 =?utf-8?B?cmRublVUQ0Z4N3F0V1dURytwakJXTndHYzBXWFBOM1VHbmRRQmRjUStHellN?=
 =?utf-8?B?akN3ejdvd1FSbFozaE1TT1JIMUJMZHlIR2I1UytmUFF4cU4zcWhQMmRGaGFC?=
 =?utf-8?B?VmV3VFBHSmczdXlLMkVJV1NMekdPYnlVOUNKYWJhQVdXYUdVYmpqb2VDeGVv?=
 =?utf-8?B?MHdhbk9iOFFvRUhEQlB1Rm5JVVBNMFU5SzVQakR4cjZ0dW95U3BwcHBlc0ha?=
 =?utf-8?B?RUtVUmZTeXFCd2Rscm9ON2w2VytpbXZrd1JITE5ha3VyaDA2RGh1U1dTeHQv?=
 =?utf-8?B?N0RMa0RPdXdPVU5sZGMzdkVIU2pMNEFLcGt0YnlGQjEwUHhGWWVzZzhvZm1I?=
 =?utf-8?B?c0hLT1RhZWxpcWRjT2JiV1J4YzZ2cW5YdFdMbHJkQVkxeFFmK1k0bS81WWNu?=
 =?utf-8?B?bWJXdVlZS1BVTC9QVU1FeWM5TWhvSFBIRFVkQXJUV0tyaVNGbnhYOGtmalZz?=
 =?utf-8?B?djZFUVZKYlhzU2pQYkNvQzZzSzNrTm5sOVhhdTdldlljWkU5dG5PNzVOUk8r?=
 =?utf-8?B?RkxseDdrdC9sVVh5S01YRGl0MzI1QnMySnpWVS9zR2pxUWhNbStXWFgyczl0?=
 =?utf-8?B?RzMxMTZHVFV6dU9XMVJUOUFmbUNtcnpRbmUxRmNQUzNNclVzZjJrSEJuVkNG?=
 =?utf-8?B?U2cwZXp1QWYxbUVqZ1hXVVQ1R3Z4QytnYXU3THIrNU41MFV4K0laYXZqWFBo?=
 =?utf-8?Q?uGj6nFyeS2qRZE4maaBaEB79N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713df221-9b82-4830-b3de-08dbe2246937
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:37:01.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /k+W/8mUj07Jv+bam7bA2L/DrAp1qIt2fObreiEQ1XUGpwohntAk58cjR2BccujmFGIidjX7SbjI/5k0ZNHY7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310

On 11/10/2023 12:11, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 24 +++++++-------
>   drivers/i2c/busses/i2c-designware-platdrv.c | 35 ++++++++++-----------
>   2 files changed, 27 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 826c0c0a7c8d..34002c5eb67c 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -207,6 +207,7 @@ static const struct software_node dgpu_node = {
>   static int i2c_dw_pci_probe(struct pci_dev *pdev,
>   			    const struct pci_device_id *id)
>   {
> +	struct device *device = &pdev->dev;
>   	struct dw_i2c_dev *dev;
>   	struct i2c_adapter *adap;
>   	int r;
> @@ -214,25 +215,22 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>   	struct dw_scl_sda_cfg *cfg;
>   
>   	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
> -		return dev_err_probe(&pdev->dev, -EINVAL,
> -				     "Invalid driver data %ld\n",
> +		return dev_err_probe(device, -EINVAL, "Invalid driver data %ld\n",
>   				     id->driver_data);
>   
>   	controller = &dw_pci_controllers[id->driver_data];
>   
>   	r = pcim_enable_device(pdev);
>   	if (r)
> -		return dev_err_probe(&pdev->dev, r,
> -				     "Failed to enable I2C PCI device\n");
> +		return dev_err_probe(device, r, "Failed to enable I2C PCI device\n");
>   
>   	pci_set_master(pdev);
>   
>   	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
>   	if (r)
> -		return dev_err_probe(&pdev->dev, r,
> -				     "I/O memory remapping failed\n");
> +		return dev_err_probe(device, r, "I/O memory remapping failed\n");
>   
> -	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
>   		return -ENOMEM;
>   
> @@ -242,7 +240,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>   
>   	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
>   	dev->base = pcim_iomap_table(pdev)[0];
> -	dev->dev = &pdev->dev;
> +	dev->dev = device;
>   	dev->irq = pci_irq_vector(pdev, 0);
>   	dev->flags |= controller->flags;
>   
> @@ -281,14 +279,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>   	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
>   		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
>   		if (IS_ERR(dev->slave))
> -			return dev_err_probe(dev->dev, PTR_ERR(dev->slave),
> +			return dev_err_probe(device, PTR_ERR(dev->slave),
>   					     "register UCSI failed\n");
>   	}
>   
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> -	pm_runtime_use_autosuspend(&pdev->dev);
> -	pm_runtime_put_autosuspend(&pdev->dev);
> -	pm_runtime_allow(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(device, 1000);
> +	pm_runtime_use_autosuspend(device);
> +	pm_runtime_put_autosuspend(device);
> +	pm_runtime_allow(device);
>   
>   	return 0;
>   }
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 1b76f721bf81..02dc1d1001f2 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -237,6 +237,7 @@ static int dw_i2c_plat_get_reset(struct dw_i2c_dev *dev)
>   
>   static int dw_i2c_plat_probe(struct platform_device *pdev)
>   {
> +	struct device *device = &pdev->dev;
>   	struct i2c_adapter *adap;
>   	struct dw_i2c_dev *dev;
>   	int irq, ret;
> @@ -245,15 +246,15 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> -	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
> +	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
>   		return -ENOMEM;
>   
> -	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
> -	if (device_property_present(&pdev->dev, "wx,i2c-snps-model"))
> +	dev->flags = (uintptr_t)device_get_match_data(device);
> +	if (device_property_present(device, "wx,i2c-snps-model"))
>   		dev->flags = MODEL_WANGXUN_SP;
>   
> -	dev->dev = &pdev->dev;
> +	dev->dev = device;
>   	dev->irq = irq;
>   	platform_set_drvdata(pdev, dev);
>   
> @@ -276,11 +277,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   	i2c_dw_configure(dev);
>   
>   	/* Optional interface clock */
> -	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> +	dev->pclk = devm_clk_get_optional(device, "pclk");
>   	if (IS_ERR(dev->pclk))
>   		return PTR_ERR(dev->pclk);
>   
> -	dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	dev->clk = devm_clk_get_optional(device, NULL);
>   	if (IS_ERR(dev->clk))
>   		return PTR_ERR(dev->clk);
>   
> @@ -306,23 +307,19 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>   					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
>   	adap->nr = -1;
>   
> -	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
> -		dev_pm_set_driver_flags(&pdev->dev,
> -					DPM_FLAG_SMART_PREPARE);
> -	} else {
> -		dev_pm_set_driver_flags(&pdev->dev,
> -					DPM_FLAG_SMART_PREPARE |
> -					DPM_FLAG_SMART_SUSPEND);
> -	}
> +	if (dev->flags & ACCESS_NO_IRQ_SUSPEND)
> +		dev_pm_set_driver_flags(device, DPM_FLAG_SMART_PREPARE);
> +	else
> +		dev_pm_set_driver_flags(device, DPM_FLAG_SMART_PREPARE | DPM_FLAG_SMART_SUSPEND);
>   
> -	device_enable_async_suspend(&pdev->dev);
> +	device_enable_async_suspend(device);
>   
>   	/* The code below assumes runtime PM to be disabled. */
> -	WARN_ON(pm_runtime_enabled(&pdev->dev));
> +	WARN_ON(pm_runtime_enabled(device));
>   
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> -	pm_runtime_use_autosuspend(&pdev->dev);
> -	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(device, 1000);
> +	pm_runtime_use_autosuspend(device);
> +	pm_runtime_set_active(device);
>   
>   	ret = dw_i2c_plat_pm_setup(dev);
>   	if (ret)


