Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5C72CB3FF
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 05:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgLBEpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 23:45:12 -0500
Received: from mail-eopbgr700045.outbound.protection.outlook.com ([40.107.70.45]:40385
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725902AbgLBEpM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Dec 2020 23:45:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q71cR8EbLXB8XLSFjkFcIGZKAlic2TZ1gntFogZBOhcjbfkfLG6oYuBEHFo07Ad379PJfZArI6s0ZQpLbP0CF7ukVMgrP5sdg3Us0GUzDmtdjSutWYF0zBGpTErAvs+Aldhe58VVNH/muBhjfG1b6cdYoJkb0xxkwBmKFkIvcxdiYCIiIt0c+rnpMo+hVhTEKe9YGuSCz+mesBsg/VgLpTSVO7/sB77DP2NWNMSbhKDYqdTKHd265dOlcu8e1eeSI+kEjcOLz1NwLT2dFJq3UifDCYPSGVLE7OLvcKsRQkl8zOSHNyrjFRthr6iFkSOKYrYtSEvemx9OCpzKgCsV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HOI+OGMHTuIyZKNRu7dr+64/wXO4SCNHuS2olh0zd8=;
 b=PZ/uhD566z8qgfPMOXVedLiIMc7D1e0edFR4Yv/xomdDdQba/Z4a/io87MDZbO/jC82cgGkRZxeEKHtg6+aYYmYHv+DYROZr2a2ESvv1ybHCYItVdg5QmM89n0M/YHKL0/1jRKMk1HXJEWxWwD7Oo1zOQMhwlIKGaZKmf9lkpJkrj4C2EUzcG5LAQN+yICWV/tzXcrEU0o+bhq9dGl6STaoSqZ3XdVjHImyC2OwaKItKaR55W19nQ6vOc6qLVe9gKXblHeWr/wAOrnQ7l8Fkw9rkAwVKvmQH4fwJb3NmQ73ZyjXJvcz67OhdAoDRxlniidIXoVFdGKIx/em3exZGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HOI+OGMHTuIyZKNRu7dr+64/wXO4SCNHuS2olh0zd8=;
 b=mhYQrSsBZ01ftwmrVVXFXwm8MjC+zweXFOHssxTRFnIRhyFPWNPug5x1oB5ocMzfVoTRMWUzTCb+CuOLWb9V20ZM5BcU/vghXxhBYtfx7Fx6F+mrr+i6U2SlNtr1I+to2feBOEsyDupMogviqkYLUxxmWCLmFLWZtPeL2KsyZSM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3956.namprd12.prod.outlook.com (2603:10b6:a03:1ab::17)
 by BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 04:44:19 +0000
Received: from BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411]) by BY5PR12MB3956.namprd12.prod.outlook.com
 ([fe80::e552:71a1:999d:e411%7]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 04:44:19 +0000
Subject: Re: [PATCH] i2c: add i2c bus driver for AMD NAVI GPU
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, kblaiech@mellanox.com, loic.poulain@linaro.org,
        rppt@kernel.org, bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com,
        linux-i2c@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
References: <1606505439-39836-1-git-send-email-sanju.mehta@amd.com>
 <20201130111909.GJ4077@smile.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <1293a00f-dad0-b2ef-cb4d-eaa887d9bf32@amd.com>
Date:   Wed, 2 Dec 2020 10:14:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201130111909.GJ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BMXPR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To BY5PR12MB3956.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.32.35] (165.204.159.242) by BMXPR01CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 04:44:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8295d3c1-cd0f-4b40-1e0b-08d8967cedc4
X-MS-TrafficTypeDiagnostic: BY5PR12MB4870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB487048D91BDC0C74B3788ED1E5F30@BY5PR12MB4870.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvIGZBQJ26INyM0lhk8r9a4fN20p8/dB638tJorL+Al7rqW6HhZnrobVrI0dx3ptOdXzZOcisHc6y/j2tk/zEpoukM5X22fkQtP83tGLsjVzZppTww9CKmxGE6QPCVY0myowfnqnBgYoon+oT3l0K37S2kQBR5BZrvzwYoAv15pfveqQWgtqY/O2RqbDfJbzaOMl6egNoZDdTLID42WSpxlV68g5qVyTnuMIRyJkWsZJkML4Df0I/PT0QGAjfYb7XxFo2iXjpJ2wibzeAaqBCgI+zv2kUlsylfcuSLNwMLwBF1l7WxAYXZlrS6yZB/wHkby8eLIe7uGZ2f2Dy7DSqrliQl+lfZPNFCwKuilpw2v6B7IVJnYfuqffyxSoHA8mYv0C89pSzpWvZvbw77kAQI98s+S3YWzYJAGG9xyqh4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(6636002)(8936002)(52116002)(5660300002)(53546011)(2616005)(956004)(31686004)(8676002)(110136005)(16576012)(316002)(7416002)(2906002)(36756003)(478600001)(16526019)(186003)(26005)(6666004)(4326008)(83380400001)(31696002)(66476007)(6486002)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHE2SkhocFdBZmtra282TGE0NWtHSXBNYXdkcW90ZU9id3E3RTRFR08rUlNO?=
 =?utf-8?B?V25WS24wdG9BZDJYeFRIRUh4VVpPeUNpT1VKZ085ekNXYllrRTRtYXNWd2tr?=
 =?utf-8?B?RjBSaWsxaHpQc0liNjNKTDJUQjkvbEFic3JwWFV1dk9uOVhkQTc2UUxLWVNP?=
 =?utf-8?B?L0Z1RWN6QnJTcGEwT2liWlNWUHBnVWZDemhLQUd5b09RS2xjbFV5TjhFMHRv?=
 =?utf-8?B?WVRScS8xTzNBZmpyeG1TenlkZzVrYlJFM3RaL0szYytkR2tMQTQveXBZK2NZ?=
 =?utf-8?B?SjVRUE9nQVNHdmI4RGVmc3hLb0ZaZ2NCZFp4THZtSUgwMmhRL0I2MzgrdFlC?=
 =?utf-8?B?NzFXRHlhNEpCMjdFaHNqeXo3emthWjJEczlzV0VwNDNGY20zZ1lFN0lQQkNl?=
 =?utf-8?B?R3VONEpZN2lkT0RsS2NqaW8vT0dWUWFJSlJUZW1vbWdWalpaRlpvanNIZ1By?=
 =?utf-8?B?dUVCdUc2NStCNDFkcFpEdzVFOEZ6ODd5SGhrSzRYbkJKVkhRV2dwWERIVEwx?=
 =?utf-8?B?YnR0YVlRSTBXUmFkcGdXTWt4ZHhseXFtREp6Vi84SHRhWVRiTlJ2NnZJZlow?=
 =?utf-8?B?L056czQwOXVEV2hZTExLMEtSYThjTUY1UUhzNjM2T0tFa1NybHpDRXFyOUtv?=
 =?utf-8?B?K0lSOVp0aDNtYnRPMWRjZnBYblhiWFNxeTR3UGZITzhsdEtrYmNwZGVmenV5?=
 =?utf-8?B?aTdMOTRnNE9CUWFBWUVMdzBUOExsaFRhRm8rdmIzU25zNERGemlPdkhhcmhx?=
 =?utf-8?B?bzk3STBFdDI2RG9pbjNURXRoNUVBVVhDL3hWUWtYeHkwdjBlMXAwNFpaMlU2?=
 =?utf-8?B?WU1pY2d2WjdjT1hKTjFGTVRZSUhCaXEwT3hUMlJ2SUZJMVdwcXNhWDVWMHQw?=
 =?utf-8?B?WG9jbzJQSFo2ZHIvdFpwamxjS2xqZ0kycU12OXVmbVFHOGpKTncxVFhmUm03?=
 =?utf-8?B?RFZxeEFkYmhGS1k1c0Z6R1FmT0grRmlDdXhUMTBhYkNsL1c3cXZvSFN0bWhC?=
 =?utf-8?B?TW9aSkVLTDBlZG53ekhycUhmTFFvRmszWmRhbXlKR1dsRWkxVHRGQlpqN05E?=
 =?utf-8?B?L0dhcERHOC9SV0xYMnRtQ0hLTWxYUWpMRjhjZHNWR1ZiT2xyTVVWeldHOGJL?=
 =?utf-8?B?dXNaWWlERGIzY2NRcXhHcnV0M0pQNlNXdGRNQ21ieklTL1ZhNjdDUFNBQW9h?=
 =?utf-8?B?WkNNQmtPQUVINmlXQVVNWXhJYSt0SHZ4T0tPRHZ6NnhWR3AyeUdrMkY1NFRn?=
 =?utf-8?B?WGxkWEcrVzhwSjljUmhJZGxZWHYwMEFJLytFWjNGdTRQRGdCZXcyNlRaS05p?=
 =?utf-8?Q?Cg9mxJ4p1EcuBC4Hn8hd0SCjlbCXqS2svh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8295d3c1-cd0f-4b40-1e0b-08d8967cedc4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 04:44:19.0074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/fvnEgUUOsoX3FV87eCDu/Aee9km5QuqD5EuJxYK7alXM6eDNEAayQbmi5hOZtiuK49KcwhSFtaGIo98/5u/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 11/30/2020 4:49 PM, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Fri, Nov 27, 2020 at 01:30:39PM -0600, Sanjay R Mehta wrote:
>> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
>>
>> Latest AMD GPU card has USB Type-C interface. There is a
>> Type-C controller which can be accessed over I2C.
>>
>> This driver adds I2C bus driver to communicate with Type-C controller.
>> I2C client driver will be part of USB Type-C UCSI driver.
> 
> ...
> 
>> +I2C CONTROLLER DRIVER FOR AMD NAVI GPU
> 
>>  I2C MUXES
> 
> I always thought that NVIDIA should come after AMD...
> You still didn't learn to run checkpatch.pl?
> 
> ...
> 
>> +#include <asm/unaligned.h>
> 
> Move this after linux/* ones, or explain why should it be first.
> 
>> +#include <linux/delay.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
> 
> ...
> 
>> +#define DRIVER_DESC "AMD I2C Controller Driver for Navi"
>> +#define AMD_UCSI_INTR_REG 0x474
>> +#define AMD_UCSI_INTR_EN 0xD
>> +#define AMD_MASTERCFG_MASK GENMASK_ULL(15, 0)
> 
> linux/bits.h is missing.
> 
> May you create a better indentation of the values to make it easier to read?
> 
>> +struct amdgpu_i2c_dev {
>> +     void __iomem *regs;
> 
> DesignWare driver has been converted to use regmap. How comes you are using old
> approach?
> 
>> +     struct device *dev;
>> +     u32 master_cfg;
>> +     u32 slave_adr;
>> +     u32                     tx_fifo_depth;
>> +     u32                     rx_fifo_depth;
>> +     u32                     sda_hold_time;
>> +     u16                     ss_hcnt;
>> +     u16                     ss_lcnt;
>> +     u16                     fs_hcnt;
>> +     u16                     fs_lcnt;
>> +     u16                     fp_hcnt;
>> +     u16                     fp_lcnt;
>> +     u16                     hs_hcnt;
>> +     u16                     hs_lcnt;
>> +     struct i2c_adapter adapter;
>> +     struct i2c_board_info *gpu_ccgx_ucsi;
>> +     struct i2c_client *ccgx_client;
>> +};
> 
> ...
> 
>> +     while (readl(i2cd->regs + DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY) {
>> +             if (timeout <= 0) {
>> +                     dev_dbg(i2cd->dev, "timeout waiting for bus ready\n");
>> +                     if (readl(i2cd->regs + DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY)
>> +                             return -ETIMEDOUT;
>> +                     return 0;
>> +             }
>> +             timeout--;
>> +             usleep_range(1000, 1100);
>> +     }
> 
> Homework: discover iopoll.h (or regmap.h if we take into account previous
> comment). Bonus: try to read newest kernel submission in the area to see what's
> new.
> 
> I stopped here. I think it's enough to revisit entire patch.
> It will look differently for sure when you address all given comments.
> 
Thanks Andy. Will incorporate the changes in the next version of patch.

> --
> With Best Regards,
> Andy Shevchenko
> 
> 
