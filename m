Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAB23610FCB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 13:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiJ1Le4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 07:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiJ1Lew (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 07:34:52 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51D921E1A;
        Fri, 28 Oct 2022 04:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faeIDUOb5F7+sk/ZZEabfc1iyYgVMSO7y4/Nheefznj6NQAKD101H2hmX4UmFSaQJSX8j2oVCvFuB4RZhhXLdDmhK8A+1OJl21DJvhldESO5cqCWku26Y0+V1QXokzMI5PNbHr+C4Gdg2gLdyFk+9QiDil1Yjje/7L2pw6wHDiCoT06/b4jJwsVecWXvq+7rXVPamM71mWWOeB4E3GNetFXryTx7D+OtcxByopmMY8gaf7mfhhC3Cwjc2R1tZ0QuXs3fiKxEDzhBJsX1uvtcK1AWvt/4IiQM8orHO4NoqP0NPqlQO6qzJIH/kof5PO8OnCwvmM/F0kFzozrApvTcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3aRi6RXwp3xhBI45KkhJjpKzIg61ZpaIBj2sjcm5oo=;
 b=Az46QgxYM3+JgUdA+nMAi8WuLQROt+XzAddg/ZNJRHcedhbcAZauxHSo7NrD8SfvwZp8o0emETp0GNQdjfeSuFACWaa7lKGwi8oIrMyDRHkuu0A9PkX8j8GD1Bc29hRLKVOi1UDQ4CREoXDMUQVg/J38IkAfu/ojhliKd8+EAg6FuaZOtvUXV0mNlQJuzxFgOaWdctkBEF6XDVswAbAnQa5xUGoiyh/7ljRMYgclXB//lJBPEW7Vpjn7O5uOIq5m6JWvej2A9MIeSUimETMYVSxA7qVxBQkBfElWorZyudzuTYXLB7neVv+m4bV1R9wumqdS7Bbl94uS+fW1I1AC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3aRi6RXwp3xhBI45KkhJjpKzIg61ZpaIBj2sjcm5oo=;
 b=TCjAhSxK9dYW4gB6aN1wcjSJ4xXZyBU2FPm/DdUHumTD6z52okiz5urFRScVBoDZ/ySxxcUI0Ewkod0p0eCZ8vh7wr15jhr53DNveCDMNkNHG22/Q/FKX2q08xDCpcsUZAIBg0bgWDswl6Y94nguiiGmwopwCrR5sba9soiqOUEyjr17MUbinpQT9xc+opKbDPfVFytxl+dvx8qJwuExyvrocGjm8J0khpA7vJ2yXSgJ62cnBsDx1/Apk1a20kemDKao8A/I5I8s5A14HCLztZ8SP1jJd5xWE5VlCxFyxILlTrEdunX0rC2KRjcukAA8AqcksTrEpmyZKOmms97YKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4878.namprd12.prod.outlook.com (2603:10b6:5:1b8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Fri, 28 Oct 2022 11:34:49 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:34:49 +0000
Message-ID: <275e6fe5-80a5-e7be-ddbc-ee298dbcb243@nvidia.com>
Date:   Fri, 28 Oct 2022 12:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/11] arm64: tegra: Enable XUSB host and device on Jetson
 AGX Orin
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-5-waynec@nvidia.com>
 <2059dfe5-b084-42a4-7f35-9da9561fc12b@linaro.org>
 <b803bcf9-fc47-5239-ffe9-707925f324de@nvidia.com>
 <5676bcd2-14fc-4e1d-643e-89e575d190c3@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <5676bcd2-14fc-4e1d-643e-89e575d190c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b0735d-74a2-41b8-adfb-08dab8d86bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cnh23kCxHlvnWdvY8/VcGqFaMDMNLloth0EfWREZ/3ptVpsEpbbEgmtRHSQYjLTTu6uS2eJU0FQCWHkyka4fAhn5Vs5dFxorVKJiJa8ucktSdpMMIXF9h7wuGa8VDoc+nsokeQXusoQN5zaa+yAnOyJLAXwqUGI1LLNnmEvjAQOpOwkGI5Etjsiqg49uplDeqOKuAHxPSjb+GAY8iQ/bb5xR7cgFr3qwEWmwdg0vPzkX97DUi+rU2ZcdQbLT1F3XzseXEkPudwbF9KrrLdj8IX2jqx+6is/IqB7GE8e7VvG3QXeRd4CWB/mud1DQP7hjlQ5anElhCz87ZRPwIiZYB91xjyuEEiezB7DTJ3Gpnxx8vYbdC4sk97SS5uzM/8AJG715yPwHj2XVhfd3cE+qqbhJN/I6a00D0n2xVrh6LzluSBG9XmS7uq9S5EfE3KmO6vlHtfLpS9YncA3F7YFsGhP9jMCUhfApmX0aq2BAAdKVAIIm8cUjKJ3iQdCIVEx1hm4CJDGZttBAyktQHGDfbCfpohFR8mGDsBWBcYtvCrtmUBFv4HyT4mT0g/BR7jQg5GBHRgZooF7IgukXOIIbRp2QmYmt0FmhjVye1dlO+swjFCsM1zq9F1wwnub9n7icvRX1C417Heoy8cs8BjARJB7OnjWN9o/zDduYEZaTOMIZe2HPitCX4+gv3GiW3ErdHzOA3xfs0W0XPaFieMOY/yG7NKeJL2W4+LFkJfVLPetwSv6pB8InrCP7o52IfwpeOVjGYTOMAhhioozFr+V8H9sdY+RZdTzzy0DlyvqeJqM2zE2GK6kjxWzj54Pp0Zio
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(6486002)(921005)(478600001)(38100700002)(31696002)(5660300002)(110136005)(66556008)(66476007)(66946007)(8676002)(8936002)(7416002)(4326008)(6636002)(86362001)(2906002)(6506007)(6666004)(186003)(2616005)(31686004)(53546011)(36756003)(6512007)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZExwL1NvOGZtMkxZZkkyNit6T0x5R2JreDlSSHNNaG5ESjNQcHlPNlNjd095?=
 =?utf-8?B?SVV5QkJMRkZoZmJoR3RKNHA3bVJiSTRVYmhPZjN4N1ZTakxYb29yeE1zdWpz?=
 =?utf-8?B?ejJrMUZiQ1lnYldTL1BwSHNrVmtiRUNUa2Z2RXRNUitlR2M5WlZaaWUxODQw?=
 =?utf-8?B?eTZ4dkQ0VUIzL0pHaktiNysvYytQdU0zL1Jvem5Lb2cvMDZDQ2tsRjNkS0dT?=
 =?utf-8?B?b3FKNXByTi85RXdhU3JQLzZhL2xwd0FoMENheTdtMzhLVFV6WkkyNzlQNnJG?=
 =?utf-8?B?U2MyOGFDY0Y5R2VMNnp0S2FkZ1hXM05ua2U3cnpIWTY4VmtOeGZabTE4a2Fp?=
 =?utf-8?B?ZGxnbCtxbTh2L010VnpLVWdSazJzdENoK01CeVF3djF2VzhyV0t1UEtWaWgr?=
 =?utf-8?B?N0pEcngxclVUV0tkTzhLV2lBeVZUQzN1RVZ0S0R2WDNtZWxHWlR4bEtwamZk?=
 =?utf-8?B?TWNvbE1tWC9sQWdMakRtVURiZkVkcFpFTi9xZ2FrUkRZUkZMdzA2ZHBwUGp6?=
 =?utf-8?B?NC8vcFoxUHQ0dDltUEcxTkkzNHcvUEZjcy9hMlJHRWUwL1VvZEJ3eWx1M0Rq?=
 =?utf-8?B?ZCswY20rSEdwTmo5ajdjQW5LbU5QOW11YzRQNEtpbUZlUTE0cldXVU1BajAx?=
 =?utf-8?B?TWcxRlNZb3FhM1FvbjJLMjhuSEtNOXhOOVZsWlltdGtqaWZpWmVSelFWek1k?=
 =?utf-8?B?NStPRzMwbStFdXRSUHVBb2lKaUZNeCtoQVNYQ1BPNkhkTVY1NzVlRWk4OFk5?=
 =?utf-8?B?WUVQa2d0QXY2OHVjd0RQMjdVQjNLbm9BV095YmN5TWlDUm9pemJGemVFWjY1?=
 =?utf-8?B?ZWZsWXA0SDY5SE9zdXVWV09VNFlxRWtnNU9YNThBeFlhcGlBaU9kTGRTa3U0?=
 =?utf-8?B?Vm0rQkZYcU9PbHBoTU91Y0lEdEdROUkxb212UnVuK1FIYzQ4UHlIRFFTNVVV?=
 =?utf-8?B?Si90akJIOUxUT1g0TTFzc09pYVNUaTFmRkgzdDVHWHdOWUNlYkVWTEM5VWEx?=
 =?utf-8?B?MmlVZjM1VU9LeklmV2VzZTMvRWdlQ0lrbzhMcWwybDdsQi9OWnNIR1g1RXl0?=
 =?utf-8?B?MFZxemMwbHg0bytMUFo4ZWtuZTRnN0RDVGxiblFGdGMrRnUwdTNlTEFQKzZD?=
 =?utf-8?B?VEdIdmYxclhQYUN0bmZGTkRNZzRBMWp6ZGZLSFVnUDRwT1JTckdZb2NBd0c5?=
 =?utf-8?B?TFdPRmFxMDRNMnN3UUI5RWkydEVQZkR1U0JOTlFSQm8veDkxZitxanB2ejF5?=
 =?utf-8?B?QTBzMWM3OG9UMDNWOTEybEhCbkszUWVnYlAxV1FXWEJaREZQcHg0QXYxNTNv?=
 =?utf-8?B?OWRmWXFUVGUyV0JlTDF4aXB2Rk5PSWF1MVVtTDRMUmZMYUFxcGZYcGhRL3pl?=
 =?utf-8?B?OHJQbmFwb3o1QXZCelA5cE9iN05TM09lcXErb0VmL3VncWczaEEvcE9hWHZB?=
 =?utf-8?B?MFVlMHkyUzh6SFBTN3JnNWEwWi9EUGFsZ2czRGU3SVByZzBoR09ub1l4N0pV?=
 =?utf-8?B?NWg0dlI1clN6S0VLZ1NrSm9BaU51UjRuSlRHUUVkQlh5OUtTL1lob0hsWFBh?=
 =?utf-8?B?TlNHdVoxd21aZ1RKazIvcklhZjBuR1BvRHpwNjhJQm5YWis3amduSHVpNU9Z?=
 =?utf-8?B?N28vN09xVkVXbjlNZmoya2tFaTVPUFBDeDdXUWNZTVpUcDU1TmdmZk1OSlhD?=
 =?utf-8?B?WjQ2VW0yNmlnbSsvNEtSYlUyVXRhTEJLNU4vY1dHa3BJczN4cTA3U2pWRVhD?=
 =?utf-8?B?Wjl2SGdhSzFIdnpjQVZqekhYczl2akc4T2RrYWg0UWo0UlYwNGJlSzZySEIw?=
 =?utf-8?B?M0xVa1JrZkhRRWxNY2Jlb2M1cTlpTGlWNU1tWXVCczVld3JXbXhxVTYwOUE0?=
 =?utf-8?B?TTRSTkIwaDQrbEM5WisyOEFiaXlyc3RRK01vSXd2ZXR2SW9KNjJtVUZ2RGla?=
 =?utf-8?B?d3NJNjRzd25zTDJaNmt0Vlh4bHc0cWc1RVZVMTVuaW9ER1JPNVhiQnNuWXBh?=
 =?utf-8?B?eis1QUJLejVRTXFxNjlKVlhMMzc5eWlQeVhTbS9Jc0l5aUNia0lzeHFvUkxQ?=
 =?utf-8?B?aWNHMjJ3OE5vWlZyOVFwSzhjTUhKYThMMUZWLy9ocTdjS0pWc0hHbHNNOEM2?=
 =?utf-8?B?M1JpTDFaYXY0bHBzRWl2d1oyekZSYkxsRWlvaFlYTG9lRmZxNTVHbWZNUXBE?=
 =?utf-8?B?ZmN1aU9yYWdIZFJpeFZLMC9TTnh6Qm9UOC83WHpwdnVGWlRiQzlhb2k5T2kr?=
 =?utf-8?B?OGx5MEh4MC9hZSs3ODhMRlRaaUpRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b0735d-74a2-41b8-adfb-08dab8d86bb9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:34:48.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi7jMbQUz8QJ6zENFQqlfxHs+sq2UTQ5WkeyX1PZ+nQY83pIbLbxdi3uIcJyHAT1dFPEyW6C1kauc9/Gd0g3Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4878
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 28/10/2022 12:27, Krzysztof Kozlowski wrote:
> On 28/10/2022 05:33, Jon Hunter wrote:
>>>> +			ucsi_ccg: ucsi_ccg@8 {
>>>
>>> No underscores in node names.
>>>
>>>> +				compatible = "cypress,cypd4226";
>>>> +				cypress,firmware-build = "gn";
>>>> +				interrupt-parent = <&gpio>;
>>>> +				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
>>>> +				reg = <0x08>;
>>>> +				status = "okay";
>>>
>>> The pattern of redefining full path in Tegra is confusing - I have no
>>> clue which of these status=okay are correct which are redundant.
>>>
>>> Do you?
>>
>> I understand you may not like this approach, however, this comment is
>> not really relevant to just this patch, but a general comment. But yes
>> we will ensure that this is correct.
>>
> 
> Just to clarify - this status looks redundant, but I have no way to tell
> for sure...

I see. This is the only place where this device appears. I always forget 
if we are meant to explicitly set status to okay or just omit. 
Personally, I always prefer to be explicit.

Jon

-- 
nvpublic
