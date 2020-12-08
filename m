Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2112D3030
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 17:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgLHQtt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 11:49:49 -0500
Received: from mail-eopbgr760044.outbound.protection.outlook.com ([40.107.76.44]:51695
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726703AbgLHQtt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 11:49:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDSUtfGtDjDwmLPO44HW7m6nZzRYHSHahpxo3z5uM26VguLfQzvVnHo4HoL/UR+s4frPhMYhkbuD5MHhIQVChisOxj65QTVg3FaGS8hhH7dFVnz1NGRCdTlRZQFz9Wzzekhe6uBK7vkvY4aWZL3tHUpbZnpzDG/pkjCUbVK01Q8rkM+PLz6DH7W9g4u8GwM0OFQnU2E4TBxuMxl77TVdAtnXSoGgJE6ORacshElNeIj+x/UCifWZsDG2t3w7IBxNDIenG/Z5h5rIeLpo0PJ4YOaLxftftr/RD9GQ3ThsuKALLIbaJ9GwdHMG6N5tlXHUYBFvaRlAEYHX91hPFgTh6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwPeNlc39C+g+DU5qPkKG+xQGFnHm4CVfP9D19+DgOU=;
 b=DAZDUrKTk6SCuJWCw1Ug+Gxsr09D+Y+WXnIrrDl9dSdskTZrmU/OHEFaclWx1IXuFGFsDjQnZtWIEODewCmZO6GvJhsIs9eJhMGOKeCn5hye9Pdynf12lJifSvJTt4RptwMAb29tqQXGEzH3gFkjTLKoBVb20b8rFcbPbv/SzwQgOrSyd8U5SxqJcSTdJ21CJGvkA1DzJof/VrL4RHqx1eCe3pG1QMgd2BEAOJMiMuwmNPFXTaxtVo6jH2CeF1+afTL79xjQSzN4Be4nIEEH1lVjO8NoAyq9qNN6WiKLLttxYBNfuGoaj5vFJVxIqnUAeLAXHddR64yYHYTIXvOC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwPeNlc39C+g+DU5qPkKG+xQGFnHm4CVfP9D19+DgOU=;
 b=tn2896QEtczY14ZoIBQo/s5g+fSJ6bb1WEtx1yXxvO43wANfgneSdnikmG/yfWZEc8KkPTdlLx5D2xsd8kyEFh33MvMth48/4AaxrXhtAe2TjN7jnwxuwfqaZv8bAdg/z0KJf+iBkSq1aw5v5ng0EDIj5Z/lxpHFx5U+FCwuDqQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3956.namprd12.prod.outlook.com (2603:10b6:a03:1ab::17)
 by BYAPR12MB3624.namprd12.prod.outlook.com (2603:10b6:a03:aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 16:48:57 +0000
Received: from BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411]) by BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 16:48:57 +0000
Subject: Re: [PATCH v2] i2c: add i2c bus driver for amd navi gpu
From:   Sanjay R Mehta <sanmehta@amd.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, kblaiech@mellanox.com,
        loic.poulain@linaro.org, rppt@kernel.org,
        bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com,
        linux-i2c@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
References: <1607431061-57635-1-git-send-email-sanju.mehta@amd.com>
 <20201208124724.GA29797@kozik-lap>
 <8fd4f648-9672-7e26-12df-4d0b953c1949@amd.com>
Message-ID: <6e4ad7d7-cc60-4642-bec0-e519a2eac493@amd.com>
Date:   Tue, 8 Dec 2020 22:18:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <8fd4f648-9672-7e26-12df-4d0b953c1949@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.158.249]
X-ClientProxiedBy: MAXPR0101CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::21) To BY5PR12MB3956.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.253.16] (165.204.158.249) by MAXPR0101CA0035.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 16:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06c981c4-6525-435b-6248-08d89b992807
X-MS-TrafficTypeDiagnostic: BYAPR12MB3624:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB36242C6AC32F5945926EFA0EE5CD0@BYAPR12MB3624.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVXyKn1TsePvepgNa7/ALtNB6zKN2V82FZWt7oTc7MO/NA8+3b2yNcO97ffRD2PNL8JoKABz876yXnBhJGe6iDaYmMohPXA8cMXXqVsXYjd9KN7HflUyVS/D7Xu8+2iXvt+GJvJ8qmTOEheWiGTL/14noLkm+17Sl78sd3ppFuxh5QKAI52iL7IHvgdcSqLqvWVQJf8cY47BIjm4C8tZrxa5IqgJsggWLYmtUSdyeYOAVzSfhobRR5olt6sOBe+ZNCS3xWM596rvN4peC+ipCc+Di4wAJEL/hyKdRKqFYMTC0ps/62k3hjvFw+ML7/vQtLKmpcR3iie7B52gCz2e/IgwxIW05hQA7wPwzflg6/Zv2ttOkg08V80W8g1c/dQ+1CvFwGJGRNc6j5zcLsgmjLgbGCvJOCfWqDAYnNKO82Eyh2B4nV7Obz7excTc67HUqYy7oF0llcGqjdP1atqtbugzrhevdI0LwgeH3B8IthtCYkJLt9CURItlDLgIgGd3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(2906002)(66556008)(110136005)(66946007)(66476007)(8936002)(83380400001)(6666004)(478600001)(5660300002)(8676002)(36756003)(316002)(31686004)(4326008)(6636002)(7416002)(53546011)(956004)(2616005)(52116002)(26005)(16526019)(186003)(16576012)(31696002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3hQTVZodlVqemxQVGJuRDFKbk5VRU5tWXpCVE1vc1c3US9DVnQ3NVdHa284?=
 =?utf-8?B?cWU0MmlYQUlKK0hCU3E3YWYwenAxS0lUOVB1WXVPVzJNY0tXWENwZWFyTUF1?=
 =?utf-8?B?WWZwRE1RbjZXdHYyVlQxNzNkM1NLN1FoRGMwMnN2eXk0cTk3T0d0eGNxbUU4?=
 =?utf-8?B?WXBxalhUTStvcmpFSzFPaWxhSzJWREQzS0RvaTQxSHEzZ0hKWVkxeXRjUE9J?=
 =?utf-8?B?RW1Gc2NKKzRkMjZpM2VBZXZ2aXJVK3JyL29xaHZQSUVaNmdMcDNndS9pdWdY?=
 =?utf-8?B?elk0eHpzZ0ovRXF3ekpXaHV1bFNaWVR6T0tJYkVMMlJ1Z29wOFVwWFM4L1Iw?=
 =?utf-8?B?S2U3d1R6UXpFWFBBQzh3aFVlWWYvcjlJeWExT3g0QW4yb3B2TXZvTm5UQkRq?=
 =?utf-8?B?U21CcFR1VUFLWU1FaG1zUGQzYmZGUlp5ZUxzMzREbUFTSG5JQUsvYjhFeXky?=
 =?utf-8?B?WUhtaXhkMUE5U29vek9OTTBiR0llNmI1NjRXVkhGaU51WGJON2hzVDNVWkFy?=
 =?utf-8?B?LzBJYkM4c2JESGwwQzd6bDN5cVhrZHY5NHZiYTg1d2x4VlVUMjJwZ0dMZWxx?=
 =?utf-8?B?dHJ5bWZ1L0ZGNzdhaXVIOFFhdGRZQlpjNU0xNU9vRWI4dFIyak1nU3dlTTlI?=
 =?utf-8?B?ejdUZjMxOG9QU3hSeWdVTGNqdWRmMXpqOXNaMnErWUEyNmQ5Y3dLaURncHFs?=
 =?utf-8?B?VkNVd3dUdSt5T0c5b2ZHcGNGT3VxVGtDbmZQM2lmNy9kYVF5SVJBanl0aTdZ?=
 =?utf-8?B?TnBmY0p2ZE84UWhJS3IzN21Ec0pWQjlXZkN4Q084WEhHRXQwNHVoQk5CWnVS?=
 =?utf-8?B?cTNiUzNNRHNFSnEyUFh5aFJMTVZ5K2dneXZBNU9BOUtSMmoxS0hGcHpOdTI1?=
 =?utf-8?B?QXRxaldEVmp6cGQyY0I5b3ExMjVGMjhOTjVsZCtaQWZDQ2dDSkxpaEFsa29R?=
 =?utf-8?B?WFdqM3dRbVdDVlNlZXB1SFVXNXVYY2lQY1Z6NnFFOUlBYlc4VmdaR3F4djB5?=
 =?utf-8?B?eVU2R1BZK2xQRjRsMTBSWis2QUVncVF1WTF0QlJYQ0w2YzUwelR1QWZVclY3?=
 =?utf-8?B?WHhld0w1RGlmbUg3RWhBeE4rUVBvbDgrdG1mTUEwNFZwUkdMZENwQkJsNkMv?=
 =?utf-8?B?L2FOYjl2Qlhlc2tJQWM0Mlp3a1pFcmpmeFBWNUI5UWx5TElLVDY4MGpJcGpK?=
 =?utf-8?B?OE5uU3RhUGhRYzg0NjBhWHdSSWc4RnQrNUgyZ1NhTEZtS0cwRFM5cHp0VEYw?=
 =?utf-8?B?UEhsZzlzQnA0VzBTTmN4QzhKQ0trSFhGWnZQZkpzbjNHY3JNTFVXQXdzY0tW?=
 =?utf-8?Q?irE3myz9dpiJv824/fsJTPD5VKluv0kW3d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 16:48:57.5719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c981c4-6525-435b-6248-08d89b992807
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PtE9uREZiIQZKlepiF2wEzCdTGq2FEGobKEtuC91PuVObwCKLQ55C3xikdH9ZxLsRXazZkct4TG6KnbVerpCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3624
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/8/2020 6:32 PM, Sanjay R Mehta wrote:
> 
> 
> On 12/8/2020 6:17 PM, Krzysztof Kozlowski wrote:
>> [CAUTION: External Email]
>>
>> On Tue, Dec 08, 2020 at 06:37:41AM -0600, Sanjay R Mehta wrote:
>>> From: Sanjay R Mehta <Sanju.Mehta@amd.com>
>>>
>>> Latest amdgpu card has USB Type-C interface. There is a Type-C controller
>>> which can be accessed over I2C.
>>>
>>> This driver adds I2C bus driver to communicate with Type-C controller. I2C
>>> client driver will be part of USB Type-C UCSI driver.
>>>
>>> Signed-off-by: Sanjay R Mehta <Sanju.Mehta@amd.com>
>>> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>>> ---
>>>
>>> Changes in v2:
>>>
>>> - converted the code to use regmap, read_poll_timeout and made some cosmetic
>>>   changes as suggested by Andy Shevchenko.
>>> ---
>>>  MAINTAINERS                          |   7 +
>>>  drivers/i2c/busses/Kconfig           |   9 +
>>>  drivers/i2c/busses/Makefile          |   1 +
>>>  drivers/i2c/busses/i2c-amdgpu-navi.c | 345 +++++++++++++++++++++++++++
>>>  4 files changed, 362 insertions(+)
>>>  create mode 100644 drivers/i2c/busses/i2c-amdgpu-navi.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 190c7fa2ea01..93894459a4c8 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -8119,6 +8119,13 @@ L:     linux-acpi@vger.kernel.org
>>>  S:   Maintained
>>>  F:   drivers/i2c/i2c-core-acpi.c
>>>
>>> +I2C CONTROLLER DRIVER FOR AMD GPU
>>> +M:   Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>>> +M:   Sanjay R Mehta <sanju.mehta@amd.com>
>>> +L:   linux-i2c@vger.kernel.org
>>> +S:   Maintained
>>> +F:   drivers/i2c/busses/i2c-amdgpu-navi.*
>>> +
>>>  I2C CONTROLLER DRIVER FOR NVIDIA GPU
>>>  M:   Ajay Gupta <ajayg@nvidia.com>
>>>  L:   linux-i2c@vger.kernel.org
>>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>>> index 293e7a0760e7..0ff369c0f41f 100644
>>> --- a/drivers/i2c/busses/Kconfig
>>> +++ b/drivers/i2c/busses/Kconfig
>>> @@ -88,6 +88,15 @@ config I2C_AMD_MP2
>>>         This driver can also be built as modules.  If so, the modules will
>>>         be called i2c-amd-mp2-pci and i2c-amd-mp2-plat.
>>>
>>> +config I2C_AMDGPU_NAVI
>>> +     tristate "AMDGPU NAVI I2C controller"
>>> +     depends on PCI
>>> +     help
>>> +       If you say yes to this option, support will be included for the
>>> +       NAVI I2C controller which is used to communicate with the GPU's
>>> +       Type-C controller. This driver can also be built as a module called
>>> +       i2c-amdgpu-navi.
>>> +
>>>  config I2C_HIX5HD2
>>>       tristate "Hix5hd2 high-speed I2C driver"
>>>       depends on ARCH_HISI || ARCH_HIX5HD2 || COMPILE_TEST
>>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>>> index 19aff0e45cb5..f599473a8ad9 100644
>>> --- a/drivers/i2c/busses/Makefile
>>> +++ b/drivers/i2c/busses/Makefile
>>> @@ -13,6 +13,7 @@ obj-$(CONFIG_I2C_ALI15X3)   += i2c-ali15x3.o
>>>  obj-$(CONFIG_I2C_AMD756)     += i2c-amd756.o
>>>  obj-$(CONFIG_I2C_AMD756_S4882)       += i2c-amd756-s4882.o
>>>  obj-$(CONFIG_I2C_AMD8111)    += i2c-amd8111.o
>>> +obj-$(CONFIG_I2C_AMDGPU_NAVI)        += i2c-amdgpu-navi.o
>>>  obj-$(CONFIG_I2C_CHT_WC)     += i2c-cht-wc.o
>>>  obj-$(CONFIG_I2C_I801)               += i2c-i801.o
>>>  obj-$(CONFIG_I2C_ISCH)               += i2c-isch.o
>>> diff --git a/drivers/i2c/busses/i2c-amdgpu-navi.c b/drivers/i2c/busses/i2c-amdgpu-navi.c
>>> new file mode 100644
>>> index 000000000000..3922b8aebc26
>>> --- /dev/null
>>> +++ b/drivers/i2c/busses/i2c-amdgpu-navi.c
>>> @@ -0,0 +1,345 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +//
>>> +// AMD I2C Controller Driver for Navi GPU's
>>> +//
>>> +// Copyright (c) 2020, Advanced Micro Devices, Inc.
>>> +//
>>> +// Authors:
>>> +//   Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>>> +//   Sanjay R Mehta <Sanju.Mehta@amd.com>
>>> +
>>> +#include <linux/bits.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pci.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm.h>
>>> +#include <linux/regmap.h>
>>> +#include <asm/unaligned.h>
>>> +#include "i2c-designware-core.h"
>>> +
>>> +#define AMD_UCSI_INTR_EN     0xD
>>> +#define AMD_UCSI_INTR_REG    0x474
>>> +#define AMD_MASTERCFG_MASK   GENMASK(15, 0)
>>> +
>>> +struct amdgpu_i2c_dev {
>>> +     void __iomem            *regs;
>>> +     struct regmap           *map;
>>> +     struct device           *dev;
>>> +     u32                     master_cfg;
>>> +     u32                     slave_adr;
>>> +     u32                     tx_fifo_depth;
>>> +     u32                     rx_fifo_depth;
>>> +     u16                     ss_hcnt;
>>> +     u16                     ss_lcnt;
>>> +     struct i2c_adapter      adapter;
>>> +     struct i2c_board_info   *gpu_ccgx_ucsi;
>>> +     struct i2c_client       *ccgx_client;
>>> +};
>>> +
>>> +static int amdgpu_i2c_read(void *context, unsigned int reg, unsigned int *val)
>>> +{
>>> +     struct amdgpu_i2c_dev *i2cd = context;
>>> +
>>> +     *val = readl_relaxed(i2cd->regs + reg);
>>
>> It's quite confusing calling it "i2c_read" function. What is more
>> important - why do you need it? It's a simple MMIO on PCI, so why regmap
>> MMIO cannot be used?
>>
Hi Krzysztof,

As suggested have made the changes in the code to use regmap MMIO and it works fine :).
will send v3 patch with this change.

Thanks,
Sanjay


> Thanks Krzysztof.
> 
> I am new to using regmap based API's and had referred to designware code for this.
> (https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-designware-common.c#L61)
> 
> Any specific API you recommend me to use or any driver you want me to refer will be helpful.
> 
> Thanks & Regards,
> Sanjay
> 
>> Best regards,
>> Krzysztof
>>
