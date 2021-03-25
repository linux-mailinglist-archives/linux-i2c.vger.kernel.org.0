Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880633493EB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 15:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhCYOYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 10:24:52 -0400
Received: from mail-dm6nam12on2057.outbound.protection.outlook.com ([40.107.243.57]:2400
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229547AbhCYOYe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Mar 2021 10:24:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPuzfrxQUhTrwV5rd+IDJexTyWg9TMAOUX7fjqRXb65PrsmcnZ0vBx3IU+JrP9/i5uJ2iOj0xViGqHUOWwnYUx34OXUCTVILA5vpPYwO2ynsHmAWHwzRGXyQXkU27teiIVUU7lMT/XDpRSFnuwgNe/0jsTXrbu0CovPoakaaPU9y3iIX7ZJv2x6rc/K/Rxs2u8EATRgQcl27dJpSIvHvS2e9XxwFDp8Z7idTjkuh7HOv0Ir3iUy0z/LSlIoJSl9iPxa09El9jj8TgmQ8EU/qGl2TFvdDm0g1iI41cz5vUbNbcAfI7/Eu0n4FS1HSJsW1N6LV/mVBpS2cQaR/N1FKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBVNrFDWCjKw8DmLEbofS7qMpGCpJ6TnSY0DOfx7fCk=;
 b=it4VggXrQoZoB2IqcJ8WnhTAgou7gGZ/2B0c1V8g/rtHI9+yQO1HB/r9Jm6Lz07XXkparJUUDkvyQ7p/M7aNkE2ocV6DM/Hd4e9WGe1hFeDrx9mN9bwh2xWZaJJH67Sz1e7yZqk51h9CXcERJksQCiWDW4cpz0ekCh10RtqOFugiXMcvAOJpIgp03MtS/v1KyDxtcqlBEileblUqpK8sb1wBpkkaa9tt0K9X46jry7XCVvl+7rHt75S3/Huwf+o8F4+jcvrQi+vpo9de7zJOgdUF1HNoLprXgh+oc/Cb2g5/J3uQEqZVCIw2oNgIwEq/FFl1K3xnrCyvqwHBFKN+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBVNrFDWCjKw8DmLEbofS7qMpGCpJ6TnSY0DOfx7fCk=;
 b=KFjtDatItj1eEQdTRXzueOY6tHlypNtHZ36vrq46nhx224MzfB4FiV6USH8UcyG+h0448RiIT1d3ymQOSdG516dcl/JagO3mG7l35e5xXzrbJwuNlxyjz0c1DKeCEDjcyPGhNvbmpenYXI9bth+JJ7niFc/5UxVZN3nxcBZEwWg=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM6PR12MB4603.namprd12.prod.outlook.com (2603:10b6:5:166::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29; Thu, 25 Mar 2021 14:24:29 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.024; Thu, 25 Mar
 2021 14:24:29 +0000
Subject: Re: [PATCH v2] i2c: designware: Add driver support for AMD NAVI GPU
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        mika.westerberg@linux.intel.com
References: <20210322165947.1921770-1-Sanket.Goswami@amd.com>
 <629d5f1a-b5a6-c457-4108-f4c546d702db@linux.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <51e4f815-3745-65ec-55d1-1a0d9569ea70@amd.com>
Date:   Thu, 25 Mar 2021 19:54:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <629d5f1a-b5a6-c457-4108-f4c546d702db@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::33) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.172] (165.204.156.251) by MA1PR0101CA0071.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 14:24:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a04bd3e-ac5b-42df-99d1-08d8ef99b357
X-MS-TrafficTypeDiagnostic: DM6PR12MB4603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB460302A08E05E2E41B1903619C629@DM6PR12MB4603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vn6qE/tDRZmQadmJJfWYz4qCTkU0F++kSRVpg/XNuOm9MgkNq2b84FGEYQwT9LCCLfRCoUh1z8hYsJ0XMGmbyVY1PQ1GijCQAC4QBgsPoyY2o9M7x0y2NWsV2/S8K942+9UtHf5NLzd09y3AjrTFlc0r3HAOsXNEfe2bUG4OEw5JmRIymsCdyQiqaYy8a++00SJq2GkZ9vrMDdje0s6BSJS1bxomcICNnVH1dLL1Lk+onZFsCivIADJ9aREcZlNeRLiVKzZ7V3z70PYmCsW85eJX7BFwyCqAqXDLf55r1unfFIKY8fcZ71hXZ+HhWQrojSwvWZwxHq1kk0+/TPR+bwj4+ek/ZWyLQn9/mmWFSU+K4uZ+AfY9oNhPegtu599Lmf8r++YAeWLjsBtxDSK8/yKfTow9EvTpskxQlZPF/dfSXn9C/fBCWbrce8a4p+Gbo0xqMF36sfMjRk30Aomfe2sESwTQY/HNjPMbwbRQ3budSKyzogg7PMDetdZKzA+usIC1SGkHrmZfwZQLMtFkLE2NiYVvgH5AvH7tJrXBog4xcees/F+TYSsun7ce7wgrBObmiRtL2UyArX0qXCHPpW3aka3RxGMI9a6fFsTurzD4xOKu2hh2NyczSZHmbAB2JxAX6lXgBGQI6Z/a6g9FPyCfHmTdIiptVeM5tvCh9kSAkZBbXXRK/K2XyrZQXsffGWKO1QMnoWuiv8g5wGedxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(83380400001)(31686004)(38100700001)(8936002)(8676002)(31696002)(54906003)(316002)(16576012)(86362001)(66476007)(6486002)(66556008)(6916009)(2906002)(5660300002)(36756003)(66946007)(16526019)(186003)(26005)(6666004)(52116002)(53546011)(478600001)(2616005)(956004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bExBZ2JtUW1DL2ovbTI2NlRBQjIybVQ4aGNRZzJHVVNQMzZqWFV0K2p0S2Vk?=
 =?utf-8?B?NnlWOVcrTWVQMHU0S2J0d2pFYWRLUTBPc1FvbUtoUU1zZGc0S0E4eUdIM2FD?=
 =?utf-8?B?TWpEalVIZVdrNy92NFhuNjdIUnNCZDlLL0tsQjZTVlRjLzhVRzgreFo4OHJM?=
 =?utf-8?B?Y0dXb2VSNHVtSVBEWS9wWnN3dDJzQ0d1WW80NjR4TjdXTW1veHdXUVlJZWlF?=
 =?utf-8?B?WFVxRkszRWxFMmR6QWJFOUU3USt2OXA4OVhKQVROaDBzcnV1dkNON3F0V1pv?=
 =?utf-8?B?RVpOTlJNNWZzVVRKVTNpdW1FMkd5bE1xR1phd0dJUW5ZTythRVhqYlo4WFAz?=
 =?utf-8?B?TXBDKzd2ZlZmemJtVys4NkdoZDZzZzFRMjVsa2syaVFrMTBVS3Q0WFljMjNm?=
 =?utf-8?B?MStHeEI3MStRY2hlMGJvaUxsVmFvcFFGR3YvbktnTTloV2F0am5GMVFwRFNY?=
 =?utf-8?B?QzgxY3paRVZWQmNEQWlwSGZsSmowYVhJbDZSdWtjdElyd0srcFRRNnpQenNx?=
 =?utf-8?B?eHpBZFI4MjlidTU2SG9YdXVoaWJ6TGFtSWJNeFBWSVp6MWZBWHhGdG15aFQy?=
 =?utf-8?B?cDZPNHRteWdTYks2QzE2RzVPYkYvdk9na0FaZjZianAvZ2tmOXQwZUkwN1VX?=
 =?utf-8?B?ak00RG1SVEE2QW5pbSszM0diditLVjZGdS9MejVkZ1FqelRuN29FOXIreUgz?=
 =?utf-8?B?MGgyeDVmZ2ZsYndnWGNZS1U0cjNBaG1ZQ1kxdzB3Z3JEV1B4Y3R2U3oyWTVD?=
 =?utf-8?B?L1RZQ3VVSkY1cUJvS3JZSG10MnR2Y1Y0WDNaUUUreEhBY09Da1pmbGdGbWZN?=
 =?utf-8?B?Q1NXSnBUYnhsMWR6OENucFhadUpJeFVobWs3aHgySGYxMnhOaTRxVHVBM1F2?=
 =?utf-8?B?U0I2QkI0TFo5Y3JEemFyVHpycTBOTlJlYjFZZE1mbTRBa2VySzludCtMQ1hC?=
 =?utf-8?B?dGNoSzAyY2NrWGp0OHRxejdmelBSYjNnbXVsZXVHaE1TNUFVMDFmRnJLclht?=
 =?utf-8?B?VlJCUmVHR3l3MEwzazJHVFRaMnpvdkNjbm92NjdpSklUSUFMeS94U3dWcVhh?=
 =?utf-8?B?RFVNMU41aVdCbTBhNlZYalJydm02YWhjZlZGL1J3MG5lRWNENmtUR2NBU2hw?=
 =?utf-8?B?dFZmSkpscjBFL0J0Vy8rSlUwV2R3Q05kUE1oK25vYlJMNnkzdXllWmF1QW9z?=
 =?utf-8?B?TzBiTnhWbTlyTVpUQU92L0VUNFd0a3VOajFTVkErbW83eFpZZTB4d1c4Q2ZI?=
 =?utf-8?B?RUxhM3hRcExBZGJSZjVYSTk4VUNsRlY1UWxPOWJ0VWxqblpqWmpCZVZVOEg3?=
 =?utf-8?B?TFZRbTZldDhLVzNHamErbDJBSUM3ZE0zblhjOHp5TnRSVTY4SUY4ZjhaMTI3?=
 =?utf-8?B?NjEraWtGUWhRTUYwUzJxcEoyTHZaT0dWVEZtU05RVHVXRW84dUNjSmVZN0xx?=
 =?utf-8?B?T0pnaGtVQ2lDMEVTMW5CcTAzL3BGTXVGVytvRWZzWWJNU3RUVEQ2Y1lLV0Ux?=
 =?utf-8?B?L2Q0VnRTRnZYd1h0Q1ZaMWFCZVZCYjlBMHRXZWlCL0J0bVJPQ2hSRmhmMVlh?=
 =?utf-8?B?SkNZVEhlbTJCNG85TzdVSFVkUlV5ek5tT0I2NG5EUkV0d0pUS1h6a0hHVDhL?=
 =?utf-8?B?R2cwcVlLSDVzQXVQb1lqanE2bXBnSXkrcllUa3dqVlZxb1hkSUhRajV4em03?=
 =?utf-8?B?bWtTZFlOeHlXaVpoQzdZZVppeG4rc0dOU1VjZGlDZldLUE0zM1h6TE5IY0FZ?=
 =?utf-8?Q?h+KCS1BxLSKqE5uo/wpDVB9/bAtBVYf5iI3xE8C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a04bd3e-ac5b-42df-99d1-08d8ef99b357
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 14:24:29.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmGsRVQTq7qqrPesLspACxDUrhhoFkf2WN5xyamsXWR6w0LZpmLq1KeUHIJS88GW6UmAnZkMyyJ7azEkzLKfKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4603
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On 23-Mar-21 19:40, Jarkko Nikula wrote:
> [CAUTION: External Email]
> 
> Hi
> 
> On 3/22/21 6:59 PM, Sanket Goswami wrote:
>> The Latest AMD NAVI GPU card has an integrated Type-C controller and
>> Designware I2C with PCI Interface. The Type-C controller can be
>> accessed over I2C. The client driver is part of the USB Type-C UCSI
>> driver.
>>
>> Also, there exists a couple of notable IP limitations that are dealt as
>> workarounds:
>> - I2C transaction work on a polling mode as IP does not generate
>> interrupt.
>> - I2C read command sent twice to address the IP issues.
>>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> ---
>> Changes in v2:
>> - Utilized existing functionality of i2c_dw_xfer_init to configure I2C
>>    bus.
>> - Removed i2c_dw_populate_client and rewrrient navi_amd_register_client
>>    to deduplicate from existing drivers.
>> - Addressed review comments from Andy.
>>
>> drivers/i2c/busses/i2c-designware-common.c |   3 +
>>   drivers/i2c/busses/i2c-designware-core.h   |   3 +
>>   drivers/i2c/busses/i2c-designware-master.c | 136 +++++++++++++++++++++
>>   drivers/i2c/busses/i2c-designware-pcidrv.c |  57 +++++++++
>>   4 files changed, 199 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
>> index 3c19aada4b30..50883a70b482 100644
>> --- a/drivers/i2c/busses/i2c-designware-common.c
>> +++ b/drivers/i2c/busses/i2c-designware-common.c
>> @@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>>       reg = readl(dev->base + DW_IC_COMP_TYPE);
>>       i2c_dw_release_lock(dev);
>>
>> +     if (dev->flags & AMD_NON_INTR_MODE)
>> +             map_cfg.max_register = AMD_UCSI_INTR_REG;
>> +
>>       if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
>>               map_cfg.reg_read = dw_reg_read_swab;
>>               map_cfg.reg_write = dw_reg_write_swab;
>> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
>> index 5392b82f68a4..f29923c452ac 100644
>> --- a/drivers/i2c/busses/i2c-designware-core.h
>> +++ b/drivers/i2c/busses/i2c-designware-core.h
>> @@ -293,9 +293,12 @@ struct dw_i2c_dev {
>>   #define ACCESS_INTR_MASK    BIT(0)
>>   #define ACCESS_NO_IRQ_SUSPEND       BIT(1)
>>
>> +#define AMD_NON_INTR_MODE    BIT(2)
>>   #define MODEL_MSCC_OCELOT   BIT(8)
>>   #define MODEL_BAIKAL_BT1    BIT(9)
>>   #define MODEL_MASK          GENMASK(11, 8)
>> +#define AMD_UCSI_INTR_EN     0xd
>> +#define AMD_UCSI_INTR_REG    0x474
>>
>>   int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>>   u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>> index dd27b9dbe931..a76e1f992850 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -23,6 +23,10 @@
>>
>>   #include "i2c-designware-core.h"
>>
>> +#define AMD_TIMEOUT_MIN_MSEC 10000
>> +#define AMD_TIMEOUT_MAX_MSEC 11000
>> +#define AMD_MASTERCFG_MASK   GENMASK(15, 0)
>> +
>>   static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
>>   {
>>       /* Configure Tx/Rx FIFO threshold levels */
>> @@ -208,6 +212,13 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
>>       if (dev->sda_hold_time)
>>               regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
>>
>> +     /*
>> +      * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
>> +      * it is mandatory to set the right value in specific register
>> +      * (offset:0x474) as per the hardware IP specification.
>> +      */
>> +     if (dev->flags & AMD_NON_INTR_MODE)
>> +             regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
> 
> This confuses me - this patch is about adding support for DesignWare IP
> that does not generate interrupts but here code is enabling an
> interrupt. I guess it's for UCSI but should above code then go to a
> driver handling that IP?

That's true, This patch is regarding DesignWare IP. However, interrupt enablement for
UCSI has to be performed from the I2C master driver as AMD_UCSI_INTR_REG is part of this
DesignWare IP specification. Hence, we feel this should not be part of the UCSI driver.
Please suggest if you have any alternate thoughts.
> 
>> +static int i2c_dw_check_stopbit(struct dw_i2c_dev *i2cd)
> ...
>> +static int i2c_dw_status(struct dw_i2c_dev *i2cd)
> ...
>> +static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
> ...
>> +{
>> +     struct dw_i2c_dev *i2cd = i2c_get_adapdata(adap);
> 
> For uniformity I'd use struct dw_i2c_dev *dev name instead of *i2cd
> since that what driver uses currently in other places.

Got your point, it will be addressed in v3.
> 
>> @@ -461,6 +587,13 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>       dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
>>
>>       pm_runtime_get_sync(dev->dev);
>> +     /*
>> +      * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
>> +      * As it is polling based transfer mechanism, which does not support
>> +      * interrupt based functionalities of existing DesignWare driver.
>> +      */
>> +     if (dev->flags & AMD_NON_INTR_MODE)
>> +             return amd_i2c_dw_master_xfer(adap, msgs, num);
>>
> Does runtime PM go out of sync here?

Thanks for pointing out this, It will be also addressed in v3.
> 
> Jarkko

Thanks,
Sanket
