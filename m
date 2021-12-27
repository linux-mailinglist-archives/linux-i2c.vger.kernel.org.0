Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC87B47FA88
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Dec 2021 07:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhL0GbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Dec 2021 01:31:19 -0500
Received: from mail-bn8nam08on2066.outbound.protection.outlook.com ([40.107.100.66]:22241
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235318AbhL0GbT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Dec 2021 01:31:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcwSqy7jtm8zghFTpvY5nkNBK2lZCzcj7uUyDosCBI3Xnck58fhc1LTmKsGxR0WfphlE8ZkGB7b1szgcWfSeJmuzGaoJyfOBhaXT9z0mB1f7nTFZerLOpWZAR8eg6xxFFLYgGFsWgjWM/tRaSpMW4h6xmeWzzSysihb4achFEn/h7qXSmK1zmn/BjcMS2haSGJylrY1nw5N187b0+gLZJYc3XA8gDT7Rm7YX/uyq6XEmQwMp4dfN86tUtw0ezNa2xB+UNyXf48+7OxtIHC0LF9Z0ppFeAVCJZ8EQf2mCJslYAbMOqcftiCU/TQCWSTKyzijr9xVcrZp7QOukgO0cEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGFL5dhVir9T50vDnOX8Bp4yjTc+GisGh1FELmZSu00=;
 b=MY6vbdZxqA9M+Q5pwvIvEeRism6CZF7ZMYhdYOaK1WaWY637kk2Nn37A+pNt71c6M2IHNxuRPqk0iBA9VK3174DRZIqbt4N8eHLp7WSamIR3m7NQLsPIbXBENqilZfhjpRMt+abIPETjZ30hiPh+IEdCnspFqn4KCsNxdK+FZVvajsIoL3o0j2JkHKuOZndpDCebpTyKqaMEDKb4vc64aedWdunTPUaDv4jdE1386Qji4+GIb9Lq2dj2Dx/mrlNz5FGxjlE2Z1OOrCfCY32Qkk1+gk7fJA8In7pbJnvvMUQc0HXiO/LxeYI9ceM6/ce6BZ/tNJnzKSz2zJM7DNejUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGFL5dhVir9T50vDnOX8Bp4yjTc+GisGh1FELmZSu00=;
 b=OX6Wa1w1vKyzoP76QZuuW+WQV6R0WGvwo3u8pV8gnRJMemrPNVNlVUDkx288AtnCxmowQ7cEV0Be8kCw5cTrXAW0amWyRCqeHF5khyi2hiCkFEIqa9uMeOUKRvcN71guTVWCj7vTQMNtlMoWRUcT1ASzmZtDIQuGB6mRkladejw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by CH2PR12MB5001.namprd12.prod.outlook.com (2603:10b6:610:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 06:31:15 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::6118:6128:bd88:af7a]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::6118:6128:bd88:af7a%6]) with mapi id 15.20.4823.023; Mon, 27 Dec 2021
 06:31:14 +0000
Message-ID: <57ef9519-23d5-25f0-9385-7646aba52316@amd.com>
Date:   Mon, 27 Dec 2021 12:01:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, sanket.goswami@amd.com
References: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
In-Reply-To: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::24) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26339403-29c2-40f1-1a30-08d9c9027b11
X-MS-TrafficTypeDiagnostic: CH2PR12MB5001:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB5001505BAB50C9A8C4624C8FA0429@CH2PR12MB5001.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkVBoHF2VgDm+lNnCd9EhYW87H6nNELS0SaNLSnZxfQv6u+/5/n6bMEXBtuYtg9aBr1rniyEMQk8cHrDv5nnBY0/BMITXkvKAMLCZU9uIcr5/mvKVVh3xdsQyz8lg0sRY+KjGcW2AsMmUP2ZyRB+SjuBjyEGQEAJUbu9bUxGWVECV+a0fiC+8V0Vdgzf2/7axjyGflWLkEEIo8ginkJf8CDASlERH6fqZiO3G7CX13bh5G6ntisOfCtr7tbD18FnsVK1VNhyU7EG0Y2dkEIqW2sfrZw3xwrxDfyVQjVOoX1M263lUZ0Ic3bFQNMwzXGvY8qyJ14zCcMC6B/MjK1ym6FFProH31kSYwbw0/p0ChbKrHjunqn9MmQ9hktYI6ssMpoqEoARDOnomgUw2YS33fW4o6UcRJTEtkoC5MIQtemdwKVxjvgBu+aggTuG5wsOPZh8mt3aFrlVViA/SqwNSy2uN9e4q7q7mBmWaFU14kw9vTFLhbeCJRKKh5eVU5gAfMIS4ETU2DkYdQuSDueevzSIzYK6Qg1jZfeKrwdWPg7hPEEugu0s+YSBIF1D1NbyUQr2RzoZro781ekVxVolqZGgb7XRk5CkVVIYb0qQ2kZVg+N7Rojpx4PjDP5/hiEiiiFGZKA1NRxwb9lj2H41sz8XNvzjkvzAjLO9H0vFzX5XbSJIKfH1gaLAgmohUXTmGCe7ZCp3sJeqn9TTlb/ZPBdecF/f7nF9vtnvYfK4h76NtZmGWw6GOQuy0z769guf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4181.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(316002)(83380400001)(66556008)(6512007)(66476007)(54906003)(110136005)(2906002)(6666004)(31696002)(4326008)(5660300002)(86362001)(8676002)(6506007)(2616005)(186003)(36756003)(31686004)(6486002)(26005)(8936002)(508600001)(38100700002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpXQkdhYVVEZWdGWlZ0WjN1elVmeXVOcCs5clNLYndSTUdiVVBFcjZ1NUEr?=
 =?utf-8?B?bEgxL2xtMlZ4bS9lVE83R2lRSktMNzNrQzc0TDJvQTVuUVBYZ2I4dzhpYnlO?=
 =?utf-8?B?Q3ZWcS8yaGJ5UEdqSlpEa2hpemhGRFNLNkRzelF6VTR3Y2VwQU1GZ1RUcWRR?=
 =?utf-8?B?bFB6aGNhRms5cW1EMXVYNkZQTXd6TC85UHJhM0NLSmVuaXdsaDROSjhib3lM?=
 =?utf-8?B?M013S2d1QWRyNGQvZG14ZVNDdGJRWERBbmY4bkdYbzFzTUE2YzJUdXFwcFAy?=
 =?utf-8?B?NlZrOVNCT3VvRXhpdFRvQU1SSC9GL3J6R0JyN2VvdGthSkFneEk3TXBlNmZL?=
 =?utf-8?B?UUhBUVRRclk4dUEwTFM5NWJnRkZhdnRMclNnN3JzSmpNbWtxVTdmRGM4NFBT?=
 =?utf-8?B?bFVlRGxSWmoxeUx2bXZCVVNiZk80dkFmeXV0Zmo1QWRhVENYbnR3N2NMRmVl?=
 =?utf-8?B?clh6S3ZhRkw4SGp0SEg4ZEcvWTQ1Q21qbENBMDdQR1VWbnVMSHdzdEVuL1pO?=
 =?utf-8?B?M0swc2FGMHE5cUtiZVl4bUNRTytjOUl0eDlqaXRjdzNadmF2cDlieGZiL0xy?=
 =?utf-8?B?WUtOQ25jUmkyRGtRL2oxOVk3Mlh2ZHhJSFU3blk3M0RNRzZibm1MekZoQVV6?=
 =?utf-8?B?NnovLzRYeml4S3dpZTFScjA1U0JvV2ZoZTdsaEJRenMrNHBPQ24rb2x4b0da?=
 =?utf-8?B?aGVSZmlRTSsrZjBoenpkWDZTRytBNitLRGx2RjNxVDZqNmF0QURrM3FWaVNk?=
 =?utf-8?B?TGFYNHBtdUF5dkF3TjdhL3ZHOXAvVndqV2t4QjVjRG4vTWpMT2Nrd092a09w?=
 =?utf-8?B?bWhSd0hhMkJBL2JibWM4bWxSNW9BV3dPY2xaQ3pUM3o3OXZJZXIwcjBuM1Nx?=
 =?utf-8?B?dmFvWEw1cDl1WFd4eXN5TkkrMmVmcDNweTFXOGFEZzA3dVBhYUF6TFpjZ1FI?=
 =?utf-8?B?MGI2UFlGKzg0S1A0RUZSTlpvczJHdENYais1L2FTWWVuZXBoeUdKNXM1Zmc1?=
 =?utf-8?B?Z2RPdHUxeHY0VlBRdFNrRHpSSkE2c1hHcWNmZSt6VDZpRnAzWEt4NnljZXhX?=
 =?utf-8?B?a1hlTmJjMHBDaUxVYkwvY1MvM3llZ0JuWHdvaGVHRjliSnQ1SEZCeE9JZFlm?=
 =?utf-8?B?T2lkRW95OUlmRlNYSURjSWNleW96ZVJka3hjVXlWT3o0MHp3RDBVVnFkYjdR?=
 =?utf-8?B?TFlwV0F2ZktvQVRBZDE2NEgyM2JVd1RNVkRoeml4NXc3cWFTVGNFZEtyRFpO?=
 =?utf-8?B?N0I0ZkRIdXJ5MzRzRER5WlFEcEl0ZThzNlovc01NYzA4ZUZyejdzSWo4K2lE?=
 =?utf-8?B?M2k4eFBrOEFiUmY5akVjbWp4U0twbmZIbzB5UHZ6Ui9GU0NkWE1UN0RHb2xo?=
 =?utf-8?B?aGgxOTF6UUtmaVQ4c3hLZlc0eDVvMFArNzRvV1BkWTk5ZWxuTC9QS2ZEc3gz?=
 =?utf-8?B?emlVcWVRY0pSRUwydXlzT0JBUmtSeXVjdjkza015Ym54MjlsVXFaYzJ4ODU5?=
 =?utf-8?B?a1RHeTZCeWlnKzlPTjNYNFdCbk5UaWFvdEVJaS9ZUmQ4ejc1TlNXNkJHZmFu?=
 =?utf-8?B?dm9KOXMxYWRtMU9MbGtaL0FOL0RIa1dMWVFSY1N1VjJac1NIQnFNRHg0amwv?=
 =?utf-8?B?Rnc1UkphVFJxUlg4K2Q5aytPVlpCcXZjb2FRd1VUSzZoeVFqMERZamJTU1ph?=
 =?utf-8?B?M3doZngxbUtPdWtTWk51SWQ5dUdGM25xcHRWL1Vqc0c0TERDVmRPdVFpbjVS?=
 =?utf-8?B?Q2REcHhpaXdreUhxY01VQnZneitJQ2dZL1hBRzNtSHpQdXREYzRydUxBV3Jz?=
 =?utf-8?B?SHI3Q0JPZ2xFakNGVnNZeFEzekdtTis0WThzcHMxOW4zOTkzUmNISTdYbnJ1?=
 =?utf-8?B?Q09ZYmhSdE9zWkNrZ0xVenFwcDh3c1Q4ZmM3cWJxYi8rWlYzcjJ2RHU5bnJP?=
 =?utf-8?B?bG1nVTY1cFRsS3hyVmR4Y1hYTWZzbk05bVkxVHhrQXZNZ2h5MElmRFBkQnlu?=
 =?utf-8?B?TXhuTTg3S1ZmSEJ6YU45a3ZHbmhSWmJubWpJSXlrWHdROWU3UG0va29kcUJ3?=
 =?utf-8?B?SE11dit5M25HL2k5SlVZYXJzT2sxQkVEb1gvUDVQOTF5ZE5LMlY3c3JXd0Zj?=
 =?utf-8?Q?xgdo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26339403-29c2-40f1-1a30-08d9c9027b11
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 06:31:14.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/zez0d28MjG1oYQBw4P8EEEZ67A6KZ7miwFCsMhqjY2uhnq4VgzXj7JnGbTZLun
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5001
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

Thanks for the this patch series.
On 12/22/2021 9:50 PM, Andy Shevchenko wrote:
> Introduce a common module to provide an API to instantiate UCSI device
> for Cypress CCGx Type-C controller. Individual bus drivers need to select
> this one on demand.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: rebased on top of current i2c/for-next
>   drivers/i2c/busses/Kconfig         |  7 +++++++
>   drivers/i2c/busses/Makefile        |  3 +++
>   drivers/i2c/busses/i2c-ccgx-ucsi.c | 27 +++++++++++++++++++++++++++
>   drivers/i2c/busses/i2c-ccgx-ucsi.h | 11 +++++++++++
>   4 files changed, 48 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.c
>   create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.h
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..08e24e396e37 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -9,6 +9,13 @@ menu "I2C Hardware Bus support"
>   comment "PC SMBus host controller drivers"
>   	depends on PCI
>   
> +config I2C_CCGX_UCSI
> +	tristate
> +	help
> +	  A common module to provide an API to instantiate UCSI device
> +	  for Cypress CCGx Type-C controller. Individual bus drivers
> +	  need to select this one on demand.
> +
>   config I2C_ALI1535
>   	tristate "ALI 1535"
>   	depends on PCI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1d00dce77098..79405cb5d600 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -6,6 +6,9 @@
>   # ACPI drivers
>   obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
>   
> +# Auxiliary I2C/SMBus modules
> +obj-$(CONFIG_I2C_CCGX_UCSI)	+= i2c-ccgx-ucsi.o
> +
>   # PC SMBus host controller drivers
>   obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
>   obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
> diff --git a/drivers/i2c/busses/i2c-ccgx-ucsi.c b/drivers/i2c/busses/i2c-ccgx-ucsi.c
> new file mode 100644
> index 000000000000..141c3d1ef752
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ccgx-ucsi.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Instantiate UCSI device for Cypress CCGx Type-C controller.
> + * Derived from i2c-designware-pcidrv.c and i2c-nvidia-gpu.c.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/export.h>
> +#include <linux/string.h>
> +
> +#include "i2c-ccgx-ucsi.h"
> +
> +struct software_node;
> +
> +struct i2c_client *i2c_new_ccgx_ucsi(struct i2c_adapter *adapter, int irq,
> +				     const struct software_node *swnode)
> +{
> +	struct i2c_board_info info = {};
> +
> +	strscpy(info.type, "ccgx-ucsi", sizeof(info.type));
> +	info.addr = 0x08;
> +	info.irq = irq;
> +	info.swnode = swnode;
> +
> +	return i2c_new_client_device(adapter, &info);
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_ccgx_ucsi);c
  it needs MODULE_LICENSE("GPL"); else if driver is built as module it 
fails to probe. However after adding this we validated and it is working 
fine.
> diff --git a/drivers/i2c/busses/i2c-ccgx-ucsi.h b/drivers/i2c/busses/i2c-ccgx-ucsi.h
> new file mode 100644
> index 000000000000..739ac7a4b117
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ccgx-ucsi.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __I2C_CCGX_UCSI_H_
> +#define __I2C_CCGX_UCSI_H_
> +
> +struct i2c_adapter;
> +struct i2c_client;
> +struct software_node;
> +
> +struct i2c_client *i2c_new_ccgx_ucsi(struct i2c_adapter *adapter, int irq,
> +				     const struct software_node *swnode);
> +#endif /* __I2C_CCGX_UCSI_H_ */
> 

Here, One more suggestion if can be incorporated , instead of passing 
only irq we should pass irq number and irq type. For example in our next 
generation platform , CCGX driver is using IRQF_TRIGGER_FALLING type 
where is default hard coded is IRQF_TRIGGER_HIGH. So in CCGX driver in 
request_threaded_irq function along with passing irq number , irq type 
also can be passed.

Regards
Nehal Shah
