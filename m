Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B72610F5F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 13:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiJ1LHy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 07:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiJ1LHx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 07:07:53 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D271D0D69;
        Fri, 28 Oct 2022 04:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ1zvcIkYBt9w5C9Zy4OvltiR3Gmc1Qav8Y7Kg1s3+r3uXlZ1KU8VdzH+2Rtk9PMQLRFy4Ipto2xJAGct9chj2ejn+YAQwwsvWeP/r+wDYRDoAvTB7hffNzRgc+QnY+RhsB6fM/A8dTM5uiFUYvK3Js+pEOP7yLAiltUxQWvcOkb6wuoU3PcaDgkxw0ad28NurNprppxB1aDZOqyya1iQbnBO1uT1z80jcjxD9lMJlJKOIx7omM6eDqiRWvZ4MCXCdXEl8F+5eJHpnrwOEVntVdcjcNMFCnDy0BtS6E91h7w01I4vgWRVu/plGEGKFDPo23IRI416hnTeS7d8O4gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lApyejVqt6hHtcvALQK1W3KoOuUJgix1T0U4LEADEic=;
 b=V7mHueBbs+fA1tZHFSBfL7X0KBdaERm2e4XBNi+DgwKotCmdsVhHvUDvJUYzBelsyU/M+i81AofGeYXMxV3raV/cZSIN5p3uHRcEsaZsU4pztYlUZsS1ghQ61BNAf9Gei8ZeYxpvu/pNldl3HBjUXAuZbJoO+jUQ2lH5hOoBVrMLFwylDQf5TeRAH4y+hRbp82HdcUeeXx7j9pKZIhGUecIVbDo+dw1yBn55STzcNdbCMnayQYzDHZDwG/1Xan/TLIMzZ+zO5K0XMTnjNEdjkFkbvjA0bj8ZexUKk9/6E/u8O8E1UWa/mj0Ooe7gUa8m2tHc1H9gi5EgCz7QMHCmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lApyejVqt6hHtcvALQK1W3KoOuUJgix1T0U4LEADEic=;
 b=lC6Tccdf6jGfzu3OZqO+J3zfx6oZTjWTnh05Q9B2zOTfPVl6EJlaCHpjSUafP1mJb0kkFkiYu3eBAUUwJZS0VwLJU78wuKi1j9tSz2mr0UTEqPKA2zhV4lZflOmt4tY/sd/qqyteMVzmiK44J4x2FEqE9HQ4Yb3ei900fSPGG5L82I8m7zdEDnv5w1EdQjXpBn2tvs3oHdJjFfnQLbumTqVRH9mV3dVkHOkDhVhhEpzSTZeE5cneVgB6kqwr1sKZwa2+XFhKw0b6q1g0DfVA2rpkAoGKjgReA5Nx6yzbYObnhPARQ/97SUVKHRdpScinuQnTW8GpzCSFRO4hQnPJQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 28 Oct
 2022 11:07:48 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:07:47 +0000
Message-ID: <8194796b-9845-cd02-a542-0bc0d66b4617@nvidia.com>
Date:   Fri, 28 Oct 2022 12:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wayne Chang <waynec@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
 <20221024145446.GA1763588-robh@kernel.org>
 <52ae737e-eb4f-9eb7-8b79-d58251062276@nvidia.com>
 <f5d2c979-a61c-e0d4-7a08-5b6f5b38dffb@linaro.org>
 <c8039494-9fb7-c72e-a852-8bde13c0a61d@nvidia.com>
In-Reply-To: <c8039494-9fb7-c72e-a852-8bde13c0a61d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0467.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::22) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fca6933-bc77-483f-0ddb-08dab8d4a559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQ7VviA+XcIobKl8Ly9omMgTzBgVYY61YiKAezYGgQl1jUUYVTyTdTvwnHrcJiK0V4qmkL119p2sd75Q/EDNBnkhRcN/Dp/sh/6lubGgE1Sdh1yMWCq86OpGQKKqQrk+uwVdqE45af/rzavPytg6IOUcfxlXHIuIEN2T4qPfrBi3Esm0HebVtcjvXyrkRnXLo3zm+8xM9zsa+82DP8H5z57HiAopi9ZrYKV81ro/5GEsyYM12z2OYIisTSQwZGAGvzJT9ZfkmD+1h+lrE+IBEtaXLcN8vs8UHFHllNIWPS6nGn6Vp5Mw0gbSoiubM69dtQvYXmk0ucXbIUKnNc8uBtlBVSKI8+IBSuUGwFX/92W0R1YebA5YEy3NHafMgd9P5U97OhqgodGpkCO8gBB+JeZb1xqCPB/Mzdn4xezdPzM87ZaDYQ0lYY7rEkoI7WYLuxz2fqPYa5isJSCqV3eUivaJ0Lmn/OUc4JW/EpSKEmTigG0oeOd+I6l88PTxw4e6vacbdn5sfuYVVNLWcRyHIoXxLA3r0qB/MuTMTwGy1ob1o1N+Scj0nIn1HFQy9iSawbDhRe06pWjzsIsUBfLoPAoQTP4yWy/vFRbalN6rQz1TcdnMpvuWn96NbuVfycqexNEJqxchq4LFL7zglTAzEeEO2FkouZP9VRGzWOtBqqxpFWC7QTeNnAjmC7Z+tyebcZK6bKzmuFzPQS4A/Qu1GifqjN8kFjWR+safJEyFYKQAH9EXqymLHADOgsbbFh3OxMbSBowxwbzbavuYimsU/OY4sM+5FGhF7jXmPFH0s6clvGZbO2tNT6orJpaWT+oiYj0CcwgtS/VS1ugmG7BLXQbTzjtbHfv8V+dghQF4VKdEsI3KFH77VS0cAz5fGi3f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199015)(4326008)(966005)(8676002)(53546011)(2906002)(41300700001)(66946007)(38100700002)(6666004)(5660300002)(54906003)(6506007)(6486002)(66476007)(110136005)(86362001)(66556008)(316002)(31686004)(36756003)(6512007)(478600001)(2616005)(8936002)(31696002)(7416002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpVVU5NZm4rYXNsTjdIZUZCNktweW5za3h5SDFnQzk1cHp6Ujc3RDk5MUJT?=
 =?utf-8?B?N1hpMEdKTE1lclYyeUNIYTBaREwvS3Fmd2sxcmdRdE1wZzNqR0haUjFTU3pQ?=
 =?utf-8?B?aFVUdGZxZDIybk11K0hUTkcyYnUvOGVGYkl1b0lxTXcrT0lORkFKSXg5NzFk?=
 =?utf-8?B?N2VOSVBUVDFiZTVBb3FocWZ5UllnY1cyWSsrNWh1ZUliM1lyUFNnb1Jzc3Rk?=
 =?utf-8?B?NWFIeGlPc3lZQ1JFZlJVR0pHdU01K0JIbENsTjgxTFcrRmtYZ3FOTGl1ZVMv?=
 =?utf-8?B?QXVheU9qZXhWTjYzYU5wc2d0ZmlxczRuVFE0dHNtcUc1dmplWkk3MFdodTQy?=
 =?utf-8?B?S09teXA1b3M1alVCMncvdFZCRmQxbTViQmpMN0VJWFBKQzUzNUJ6UDgzUmtU?=
 =?utf-8?B?Ylk3WW9oNDdXeFdjOW5zcXJsdDVnaDhUN21xNnVWOWw0MGZxOGhjZWREdVRN?=
 =?utf-8?B?YTRSNC81U1h6cjFLT2FTQmI2aDM3dkhvRzRsV1huNFVsRmJrdlRtRlFWcXcx?=
 =?utf-8?B?ZzNDcmRZaFpGZC90bDl5Zk10WnNLRTVnbmdPZE52VEZQMWp3WCtVejZYZXJO?=
 =?utf-8?B?VDA1MWlyMU5hckF2Vys4MTFZV0RETlBWUDN2cE1mZThSdXpBN2cxZDNTSW9T?=
 =?utf-8?B?d0VIQ1pkTzBZVHVzcDF1MXNrYnZYK1ZYZXp2U0t6ZkRvWUxjaXV2TmhEM0pD?=
 =?utf-8?B?M00veUZ0Q3VOSmY2UDV5ZVMxV1FNMGdmKzNHQ2FUN1I2dHIvSERCSU9DV2Z2?=
 =?utf-8?B?eVZWR1ZTdjZ3MWJVSmFQTktuS09LaEVWTHJVYko4UUM5enVRclU1MUtJZFdu?=
 =?utf-8?B?UVFqaGpVR2VhSm5pY0NRRnF2NURnbWpxSDlTTVp3azhvL0c1WTNwUisxS0do?=
 =?utf-8?B?ZlRhMXdtYlZucCtLbytDd3ExWDl3ZG1TS24zaUtnalBkaXk3aHNWRUFLR2lS?=
 =?utf-8?B?N254OTFBaUdsZENyaDhvWFBYZTRQTzBZRDhwd3V3Yk9TM1FCRmhGQ2grcG1u?=
 =?utf-8?B?bnVOY2pWMnphWVVEZXNLc2thTmdSc1NETklIMllTelJHRjJsVlhGT29Dc2tW?=
 =?utf-8?B?emlOTFdpOTRCZCtRUDd5RmtIak9pYUxUaXRCcGRxYkxpWjN6LzFHUVlVRzhl?=
 =?utf-8?B?YmNoQmF4S3Jsd0hId25uc2EvTjFob2ZXdFdTNUpiNytLd0J5WURaSDY1M2hh?=
 =?utf-8?B?UzlLYzdwL1RRMU5ZQ2QrS2p3UVB6YmQ5aENWMzdZOG9zaG5tOGduUGZFQnli?=
 =?utf-8?B?dElxSEdwMXNBWFlxL3FxQ0ZjdElCVk51dXpwT0FlajlxczRlMFBuNDEzclFl?=
 =?utf-8?B?LzJMQVJqakNwRWF0RFo1enZEb0I1R0tqK25yOHNpSkM0elA3L09Za0MzV214?=
 =?utf-8?B?dVBzMG5FYUJqNkVNa2xYbnp1cy9PSEV1QUhDVW9uVmwwSkxXd3psYjlrZEF4?=
 =?utf-8?B?cEQwZ0VFODR6OWxsUUM4anJoMFBuMU5qSERNSmdqZE05bUtud1lieWV1SUts?=
 =?utf-8?B?MTgrV29MZ29rRXArcmdOUTc2YWNzYlZ0RkhydGsxOWRTWkE1OGF3aENiVXov?=
 =?utf-8?B?NE91M2swdkVLeGl2SWdMSkkxZVdXTGNxNjArZkhPakdTdDFOZjlOWjd1Q1FZ?=
 =?utf-8?B?U2dQUGpQOHBRSlllV3JVU3I4b1V1MVNlTWN4cnZoM0tDUit6VS96OFV0b0ta?=
 =?utf-8?B?cUI1UGNYckhKb3FVOWdSRlpwanNOdGhnOGsxbTNzNzljV1FsYkkyc0g4cklt?=
 =?utf-8?B?Z3VUQkZlR2lsa1h0V2laNXBLc1B2U3ZiMU5NcEM1Um5JWUpmbFkwb3NPTW1u?=
 =?utf-8?B?SXR6UHJ6eVpPdldnV1pFL0dHbzBVS0M5LzBxYldQanpCRFo2TVNaOEUzYld0?=
 =?utf-8?B?MFM1SkZuL3ZaN2dUSzFDb3ZUY0dsZ2tGMnc3QWxXWm9DL2grc0hqMllvZTVT?=
 =?utf-8?B?ZWJoWGJGMkM2ZWsrYXVQUThVOUNPS0xsRXZxY0ZNWmhpT3Y0SHo3UC9LYk5y?=
 =?utf-8?B?dlhXbmFUTHFSaEZVczRxcW9US0ZaWEUzR2ZmQUtERHRzVDFQeThaRUZjOFU2?=
 =?utf-8?B?dmNneWw5UTR1Q0lsQmZHSzdKb2JaRWdCMDVmTHdnQjVyaDBnYjBsbWRZbFJF?=
 =?utf-8?B?UUpNTnE3TTc2elUvdmhSSVdrczluRlgzZmpveWpZZEUva1A5RGNmZ1hOOHdz?=
 =?utf-8?B?L09jS2F6NVdPMFZ4b3lYQ3pWcVhtSm4rWXpHbXZLK3NwR2E0L2pYaWdPYzE5?=
 =?utf-8?B?clcvMVhHR2RZMFNkbW90ZHlKRmtRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fca6933-bc77-483f-0ddb-08dab8d4a559
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:07:47.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8S59g0tsClJqUc3Vqw2JsqmOrGaY0PuB5cDGg3fjSQog5FMnTeohEQc5iGa03Vi8GQbdgVfJjwMn8mjeWCcmrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 28/10/2022 10:25, Jon Hunter wrote:
> 
> On 28/10/2022 03:19, Krzysztof Kozlowski wrote:
>> On 25/10/2022 04:02, Wayne Chang wrote:
>>>
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: xusb_host
>>>>> +      - const: xusb_ss
>>>>
>>>> Drop 'xusb_'.
>>>
>>> The properties are constant and we use the name to get the power domain.
>>>
>>>     tegra->genpd_dev_host = dev_pm_domain_attach_by_name(dev, 
>>> "xusb_host");
>>>
>>>     tegra->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "xusb_ss");
>>>
>>> we might not be able to drop the xusb_
>>
>> These are new bindings, so why do say they are "constant"? New bindings
>> means you did not use them. If you used them before bindings... what can
>> we say? Don't?
> 
> Not exactly. However, what we should do here is convert the legacy 
> binding doc [0] and replace with this one. But yes we are stuck with the 
> 'xusb_host' naming.


Thierry already has a patch to do this [0]. So we should fix that up and 
included in this series.

Jon

[0] 
https://lore.kernel.org/linux-tegra/20211209165339.614498-3-thierry.reding@gmail.com/

-- 
nvpublic
