Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B642D2B98
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 14:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgLHNDX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 08:03:23 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com ([40.107.93.64]:55777
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726584AbgLHNDW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 08:03:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+AgjQoxU6uQVXjtMH06QmCZ76Omtlhhq4ql2O+SQbdwSTCHPy5gv/abtr1bPVYdCP7jmyEwL3ZJ5hRFDim27D59uRpgPLJEVNhq1BkfpZ52GzJpOhenYDW7ASoTfWKMmy54BrYxTZ06Chg1RJ6iCeZF4tBZD3l8JfYFyCpzeOLltH1cx9B5joyibXHGSXbz8g18USPchP7nT1mth1namInAxykYYeT4XOan/9eWwzRFDjlJzy2I6cBq/SzaxaBA3LJQlNNB8aOMm5N07iIKz4lkw9NbtlwBMjq/PDUbUEoiDsULAGtykXUquZ6PrE/bcHJbqTz7X8h25K9y9xlrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj/xxoanw0hFJyT3KIm/nA7Ydfj1w6K7UHiDebtGNR8=;
 b=UyIW9kB2Nx64attWCsuA66aU8OVAs65lERSI/aEK2srss27JrUx8MiLDkwnr7vR0lrNnY31pik+uGjdqIb0NWd3KVa7gH9enBlJKQGSfHIck3410DVTMcDnpR7wEIuIidV0UW/31N8Q07OMRY1VXM3tZYjq0gOPaLqStD7G4InH/QeLia4uc5sy5JdY0WMAoQYcoqwhyeWYZ7T6ucV6e/JN5hRYZGBOWJvEYf6rXuvp6/9yUEV1x6gt7Rc/M7zE5Q4nSj80j/AQ3xpRSOD4aaRzJ/Ls5CIn8c/CDRyK4T5SYd09z8KldwZjTdB6pTKBe4t+K8plmlo4RZrTsALOiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj/xxoanw0hFJyT3KIm/nA7Ydfj1w6K7UHiDebtGNR8=;
 b=FR2Rl4fXpUKMV+JC38HvKr+LWzYDVOEtUebloll1hL7MK7tMeggAq33va0RrwFD7Qpg/4CVjC06TLjHl70SIkAwLYWoGKRMl3ZOhUri5sDdql+V8L7vFsjmCL8oMqsJceFcBtf4jDbq8Je4m2HZVm9DTjynC1Ltk9AwafL9XNK8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3956.namprd12.prod.outlook.com (2603:10b6:a03:1ab::17)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Tue, 8 Dec
 2020 13:02:27 +0000
Received: from BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411]) by BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 13:02:27 +0000
Subject: Re: [PATCH v2] i2c: add i2c bus driver for amd navi gpu
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
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <8fd4f648-9672-7e26-12df-4d0b953c1949@amd.com>
Date:   Tue, 8 Dec 2020 18:32:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201208124724.GA29797@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.158.249]
X-ClientProxiedBy: MA1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::36) To BY5PR12MB3956.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.253.16] (165.204.158.249) by MA1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 13:02:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6551ddab-750b-4838-775f-08d89b7983c3
X-MS-TrafficTypeDiagnostic: BY5PR12MB4114:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB411400D0599D9016A3110EFBE5CD0@BY5PR12MB4114.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3U6WNNp9kKtqFY/oczBYEf6Bm7IsjdjgcDF57Y4LI/A3lkQF9rzVF5G7xIt+uKVVNr7+CxFZ4PcTw4wufYwOH4WPe5/dLjZ6OiqVYyq/wFkmDq9QWXicV7B+KkEING8xicVO/t0wGm6/CPZPPVNanH/zvt4qciys1VjbxfMfn/YszSNR8Vk52BacM56l4lP+p6WDJntRjNSdPBp5l3PXpq+F/lJczW5ibNE8kp8tfBLdRnj/QkxiwipHESm5y0zXywgvvCA5BkhHIfNNQ68Baw46vINco6Srkua+hEsTSCmaeF31fD57dvDABubaaOmdPQGTOJmjoxrLilAMuMIYn4UPHIi6YHI20zjd8uMElWrEkixLByG9PJc3xcc2dOs2MwS9TZvA206WNhmHHooyAinidka6k5QItsuiX6D9Aotf8X6xhpwIUVKTkBsE75lUzL0ATtPZyHhbIUfT40+PQcWzCwOB6U6cr2smQZIIgKdYhWD35qc6MiOhSM6bDuK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(36756003)(5660300002)(2616005)(316002)(26005)(66556008)(478600001)(6666004)(83380400001)(66946007)(8676002)(8936002)(16526019)(7416002)(110136005)(2906002)(186003)(4326008)(53546011)(31696002)(66476007)(16576012)(6636002)(31686004)(6486002)(956004)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dXFyL1AvQnZlaXVuMEJJaEliVDE0aTRMV2ZuMHZXcFp2aXNLQkNKaFZ0Wkd6?=
 =?utf-8?B?bktGM2xjZzNJNnFsc21lNkM1Tzl1cEpnRG9NWk9kVjgvUjVsZUlJcEpzdTBl?=
 =?utf-8?B?Z0RSLzkrZHFRSitzb0FUU2FBdXplM3paQURVbm5wM2lDY1VMeTdSa0M3b0cz?=
 =?utf-8?B?QlEzRzdXM2QxNmZKQjR4dHRodVE3UUYwcVRLTVM5a29HamxpUTlkOExGa2Vx?=
 =?utf-8?B?OTFiaXpQMXE0eGF4aGRtZEJ2bkZHWXZMS3JYOE9SSStGVll1TXRsN3h2S05P?=
 =?utf-8?B?YURoQ2twMjJyK3YzNGtUdjkvRi9ySTRyK2NWUmxRTGt6ZFduakt3ajFMOUJj?=
 =?utf-8?B?cHZqOTdKS2hWNE02N2F0TmlpWFJSRFh3eU4zelduZmNlMVdFZ2JZRzNLM2w5?=
 =?utf-8?B?cW4vOWJrT3BLRmYyU3RPYi96SW1kR0FnQUtyc2pWS0pQUEU3ekUxSDc4b0FC?=
 =?utf-8?B?Z3hnQVJETXoyUnBadFBjRzNYdmZwblRPM2VqZTE0ZFM0ZTQ0MkR3bkNNR2RO?=
 =?utf-8?B?Nms3TUJ0YWhUYmd5dHVSd1lKb1Vwd25oWk5jYXg3d3Bwb3d5RkxIclVSbXps?=
 =?utf-8?B?d21RNzZxbnJIQUY4dWY4L01vMmZLR1B5dGJKdDdVOVpNWnNsdjFheE9ySEFL?=
 =?utf-8?B?MGNSMi9ML1RCL2c3dnRiUTUxY2YzME8rcHAxNUIzeHI0WXpSaFZIMVJkUWY4?=
 =?utf-8?B?Y1MzMUFUOHRUNEpjZWw4VkpqK2U2b3dVYnBpVnd2ZHozNmtiQXRNMEI2b2Vp?=
 =?utf-8?B?OC96YkpiU1NWMzQ5N2x5QytaeXRZVnc4TWdtTGpGdHVia3RSbnBmbHNXYXVT?=
 =?utf-8?B?VWIrVnp4MGhPN0xRUk4xV2tIOWQ2U1RJL2pwVVg3K3Qxcy8xaC84S2tCQUcz?=
 =?utf-8?B?RU13N1dEZHpsVDNZSkpGL3pzR0ZDUk15K0RLK2wwTlpJL09FVHRkWkJtd28y?=
 =?utf-8?B?OU14djNyUUZFczFjeG9aU05qN2xmbGxkdzI0ejRoUWl0OVhheFBlS1E2WXNO?=
 =?utf-8?B?ejl6VmgxQ0U3dElhUnBxVktZTnBJQVd2OTFFbTJmSWhXb0NzSHFJQTZBcHdo?=
 =?utf-8?B?UlgzQjZ4UzJPeW5NdGNxNjNxOWtzaStvdzJySS9EZHY0NVgwbTUvSDExayth?=
 =?utf-8?B?Z0FzOFJ5Y0J5QmNpWWlBdjdOMHlQb21GVVVyS0RMYkxaK2FzUzhuQkFISFpB?=
 =?utf-8?B?WDJSdlozUU5ValZnemhXTUMzcDRXOU1QVGl4Z3A3c01JQU9MN2ZhbFBDL0Jq?=
 =?utf-8?B?bUp3VkxGazdIYXpkbzJleFQvSXplMUp1OFZwYXhLODZTck91OUl6RkxxcnFn?=
 =?utf-8?Q?YhgDci7N5/OeuuW1EgXOUNwv74O51kolZC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 13:02:27.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6551ddab-750b-4838-775f-08d89b7983c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujVOB40G2z0+qMh7v2jPB7XkPNWotzrkqlZwrByHQ2XJ+Jo3pJIt1XNpvu/0Vs+CHH2o54UQVXwO00Am908/zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/8/2020 6:17 PM, Krzysztof Kozlowski wrote:
> [CAUTION: External Email]
> 
> On Tue, Dec 08, 2020 at 06:37:41AM -0600, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <Sanju.Mehta@amd.com>
>>
>> Latest amdgpu card has USB Type-C interface. There is a Type-C controller
>> which can be accessed over I2C.
>>
>> This driver adds I2C bus driver to communicate with Type-C controller. I2C
>> client driver will be part of USB Type-C UCSI driver.
>>
>> Signed-off-by: Sanjay R Mehta <Sanju.Mehta@amd.com>
>> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>> ---
>>
>> Changes in v2:
>>
>> - converted the code to use regmap, read_poll_timeout and made some cosmetic
>>   changes as suggested by Andy Shevchenko.
>> ---
>>  MAINTAINERS                          |   7 +
>>  drivers/i2c/busses/Kconfig           |   9 +
>>  drivers/i2c/busses/Makefile          |   1 +
>>  drivers/i2c/busses/i2c-amdgpu-navi.c | 345 +++++++++++++++++++++++++++
>>  4 files changed, 362 insertions(+)
>>  create mode 100644 drivers/i2c/busses/i2c-amdgpu-navi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 190c7fa2ea01..93894459a4c8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8119,6 +8119,13 @@ L:     linux-acpi@vger.kernel.org
>>  S:   Maintained
>>  F:   drivers/i2c/i2c-core-acpi.c
>>
>> +I2C CONTROLLER DRIVER FOR AMD GPU
>> +M:   Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>> +M:   Sanjay R Mehta <sanju.mehta@amd.com>
>> +L:   linux-i2c@vger.kernel.org
>> +S:   Maintained
>> +F:   drivers/i2c/busses/i2c-amdgpu-navi.*
>> +
>>  I2C CONTROLLER DRIVER FOR NVIDIA GPU
>>  M:   Ajay Gupta <ajayg@nvidia.com>
>>  L:   linux-i2c@vger.kernel.org
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 293e7a0760e7..0ff369c0f41f 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -88,6 +88,15 @@ config I2C_AMD_MP2
>>         This driver can also be built as modules.  If so, the modules will
>>         be called i2c-amd-mp2-pci and i2c-amd-mp2-plat.
>>
>> +config I2C_AMDGPU_NAVI
>> +     tristate "AMDGPU NAVI I2C controller"
>> +     depends on PCI
>> +     help
>> +       If you say yes to this option, support will be included for the
>> +       NAVI I2C controller which is used to communicate with the GPU's
>> +       Type-C controller. This driver can also be built as a module called
>> +       i2c-amdgpu-navi.
>> +
>>  config I2C_HIX5HD2
>>       tristate "Hix5hd2 high-speed I2C driver"
>>       depends on ARCH_HISI || ARCH_HIX5HD2 || COMPILE_TEST
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 19aff0e45cb5..f599473a8ad9 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -13,6 +13,7 @@ obj-$(CONFIG_I2C_ALI15X3)   += i2c-ali15x3.o
>>  obj-$(CONFIG_I2C_AMD756)     += i2c-amd756.o
>>  obj-$(CONFIG_I2C_AMD756_S4882)       += i2c-amd756-s4882.o
>>  obj-$(CONFIG_I2C_AMD8111)    += i2c-amd8111.o
>> +obj-$(CONFIG_I2C_AMDGPU_NAVI)        += i2c-amdgpu-navi.o
>>  obj-$(CONFIG_I2C_CHT_WC)     += i2c-cht-wc.o
>>  obj-$(CONFIG_I2C_I801)               += i2c-i801.o
>>  obj-$(CONFIG_I2C_ISCH)               += i2c-isch.o
>> diff --git a/drivers/i2c/busses/i2c-amdgpu-navi.c b/drivers/i2c/busses/i2c-amdgpu-navi.c
>> new file mode 100644
>> index 000000000000..3922b8aebc26
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-amdgpu-navi.c
>> @@ -0,0 +1,345 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +//
>> +// AMD I2C Controller Driver for Navi GPU's
>> +//
>> +// Copyright (c) 2020, Advanced Micro Devices, Inc.
>> +//
>> +// Authors:
>> +//   Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>> +//   Sanjay R Mehta <Sanju.Mehta@amd.com>
>> +
>> +#include <linux/bits.h>
>> +#include <linux/delay.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/regmap.h>
>> +#include <asm/unaligned.h>
>> +#include "i2c-designware-core.h"
>> +
>> +#define AMD_UCSI_INTR_EN     0xD
>> +#define AMD_UCSI_INTR_REG    0x474
>> +#define AMD_MASTERCFG_MASK   GENMASK(15, 0)
>> +
>> +struct amdgpu_i2c_dev {
>> +     void __iomem            *regs;
>> +     struct regmap           *map;
>> +     struct device           *dev;
>> +     u32                     master_cfg;
>> +     u32                     slave_adr;
>> +     u32                     tx_fifo_depth;
>> +     u32                     rx_fifo_depth;
>> +     u16                     ss_hcnt;
>> +     u16                     ss_lcnt;
>> +     struct i2c_adapter      adapter;
>> +     struct i2c_board_info   *gpu_ccgx_ucsi;
>> +     struct i2c_client       *ccgx_client;
>> +};
>> +
>> +static int amdgpu_i2c_read(void *context, unsigned int reg, unsigned int *val)
>> +{
>> +     struct amdgpu_i2c_dev *i2cd = context;
>> +
>> +     *val = readl_relaxed(i2cd->regs + reg);
> 
> It's quite confusing calling it "i2c_read" function. What is more
> important - why do you need it? It's a simple MMIO on PCI, so why regmap
> MMIO cannot be used?
> 
Thanks Krzysztof.

I am new to using regmap based API's and had referred to designware code for this.
(https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-designware-common.c#L61)

Any specific API you recommend me to use or any driver you want me to refer will be helpful.

Thanks & Regards,
Sanjay

> Best regards,
> Krzysztof
> 
