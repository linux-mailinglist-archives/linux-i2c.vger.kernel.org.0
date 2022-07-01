Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1278562C2D
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 09:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbiGAHB6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Jul 2022 03:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbiGAHB5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 03:01:57 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2128.outbound.protection.outlook.com [40.107.21.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1797C675B8;
        Fri,  1 Jul 2022 00:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbqGFW2205wBSNlSy5eXKUgb5Xj1h7ezjBB38rt9mAje6pmkhZPaIjDHtXOfPXRxMt9if/UW58u5YkSQFsm0+CiBsinhmJ5j1oh5VAeGxd+d2S1vE0EQkF3sGGJs6+ayO2f1+IXYJ/tSi2DwDfL48cfmjPTkg2evPBF4wEMXKMHOhhkMPIKdu16La+nKyXLqL0zYED1zGaSldYmG/CD83QrSQ4qix10tx9k1IgxD63YK+iy/XlXw575OJe4XQCr1O4MZfp/wexeSsl8l5PBQlCWaeyHy07Owk3Co2cze0akqkhfInJ75DGfYT7OVppgnk5BobKC88+iXVP8sqx0Y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB+FiTOENfUWn0CU9kzoga2zA54Iy0ofYJTpsQTvXZg=;
 b=Ge8SQDbdemW1xbKHnLeFsT4Ofe2PAubD1kn/WrGjJ3palA5QkXpceEhZJsDX2gL17yrddYb+Mk6R1DUvsYsp4MFKpdyAlvuQxY4kekuV9I0MKw5hIwYimeLVfgVtw4qoemXeTFO0skfKwOC5OWDFcRwbpTS0RQP42QvHYSOFy+F6Oa85dtbmw5/rPXkAq6/dTtF6MyBy6JIyEMaESbO69+dKlt1qEoFdvxUZJVqP/B0bNekJKn0HHPZUFckhRIGxI9dBzSU6LZsCE7vMrjQmIxciPlUM7HbPwYH+pMtPDq2zarWilAsJIKx17oSwaokqJGYT1+zePsRTJ37UnMQpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB+FiTOENfUWn0CU9kzoga2zA54Iy0ofYJTpsQTvXZg=;
 b=wvze3NCxdTpZCCmUsU8/ROoSHWxGBh26iNrBFBP9Yt28W9c3pmPU4ipwEB4klE0eIpop+W+9sAF4itFPPnedsNBHwZS2NToQc+RG4KXsfCrdbq45R+KcZI4acOar/IBMeIhSoIDZWlF1h5ZELtldKXBf6oXbaTJhkhIb054w+g4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by AM6PR07MB5768.eurprd07.prod.outlook.com (2603:10a6:20b:94::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.6; Fri, 1 Jul
 2022 07:01:53 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5417.008; Fri, 1 Jul 2022
 07:01:53 +0000
Message-ID: <1c944d68-a950-1069-40dd-7f5ebdc395f5@nokia.com>
Date:   Fri, 1 Jul 2022 09:01:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Content-Language: en-US
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        Marek Vasut <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@xilinx.com" <git@xilinx.com>,
        "joe@perches.com" <joe@perches.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
 <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
 <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
 <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
 <BY5PR12MB4902D6BAA8D1035BEF022D8E81BA9@BY5PR12MB4902.namprd12.prod.outlook.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <BY5PR12MB4902D6BAA8D1035BEF022D8E81BA9@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0251.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::27) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf0c3f87-a93c-4b35-110c-08da5b2f9220
X-MS-TrafficTypeDiagnostic: AM6PR07MB5768:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6T8Y//fQhqzKFvUFjfb0jAGHS13RUKoJRWbk6TswcaMs++M9yBxG7SqJmETQDYTUiyTydZMs23OhoZUnrXK7pmtogSkb33N+mXXG+YWZsS3eG8x9g6afKp49zgHtRmh6QOmu8YGX2SqwFk0tMUXssmjhDCYj+LAOhXOJUYy3msH+INyH0ybqvisCImaNUcQVaMdnR+LeuG/ZxdO2TW1XsEUdIvm6RJu3Jze8LalzwWTkeT6iR3a28+R/whskvsNG1qYT5opScdckoTF4L0HLm3WwuSTKPWszeP7wusEd3rFwsNjDStSH7kpkIgNgBui1OJ8e2ma0feLY6ew+kpi2AdA/D7FPc8I2lESRGvOrjqaqc6dLYl+3V35JRHOx28meeKlydHV1BrI+blLZGFnbMHq3NeDINAtnZxCJnRVaMFnac4rhVb46ln5xKzwMmMDH7fJme1n0cbYm6yLvAh3sJD23nyphE3amuHxZrgZD4l54LEHX1FUzs8n3tuhLB7xSEPDeyvkG7pjgnzMp6yxN240nNIJW7WgYopTpF9a4CQEb3o7V5nTmjN3FsviBPLOnF5Y+rZxTFIiYW4XD8j2V5Ov8f1eQLaoFxtgmXYoLErWm4WdvunrCnrBLLNe1egRUT0cdc2gk4qtrDKVRpfTIh7E9Lm7KCE5cLdLgICUn8NXydeRB98G1E6TV1C/e8v7J224eg6DZF98aYh8+0itv4ERRLL7veu5w1VPUKuK6TLTUNev4nxPWun5VdxU1BHMrYRbSydYfUUbaEOdM10sKaEXD+3yHP5eotdxdzh9+EPq/bJ4QUyRDJ8Y8Br9tgmtyxL8MWbYAdrfjYAtRiZjLdXRfl9FkATVFic/ev2zaNqUzXestwTr8MlaK4kUQ5u53kIaPRL5JCGXKQvTsfO61g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(26005)(6512007)(8936002)(6506007)(53546011)(5660300002)(44832011)(66476007)(54906003)(66556008)(8676002)(66946007)(110136005)(478600001)(4326008)(6666004)(82960400001)(86362001)(316002)(31696002)(6486002)(186003)(83380400001)(36756003)(38100700002)(31686004)(41300700001)(2616005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVsUktYaUdjQmR4cGo4K1NtamxlbGpBNjdBNFVhWC9jVHpFejl1U1ZDSHJG?=
 =?utf-8?B?bFkwQzljakFzQkpNRWNwNElrcVN5aW53cnRmSFVWNWI2VVZqU0M0UzYxL1pB?=
 =?utf-8?B?NkZUeWljS1ZkM09QbmxYb2t0eUlKcHlGOUFjKy82Zk1aV25FSDRHdEhYTWlm?=
 =?utf-8?B?YXFFZVNMZFpPaUQ4M3MzNnBxN213dkNvNGdNV2xkQVZmbzRQRGdqcHo2VVZw?=
 =?utf-8?B?a2VnMW5VWXNLSkxVNzExWTg3NUJ4QkpGMDdEZmdSQ3NvN25VK0JnRVRkaFpI?=
 =?utf-8?B?Q0tRUDRET29aTDdtUVNMQWVuUlJuLy9yYmdwQTR3L3NKci9hMXdlZDRrKzRx?=
 =?utf-8?B?MVFGcDJ3WGl0OEU2QVpsaEFjN09JdnRpSktmbkhQNlFwOTNDQjRvT2l4dTBZ?=
 =?utf-8?B?d1lnZHo2d3REVHFoa3dVZFpvN1piUlFZN201QlBxL3FWaW1BUjBTYjZVZGNt?=
 =?utf-8?B?bGtkTC9LaHltcHZmT1dMdnZMdEVhMS9abHRMY1JvZ0grZ2dsRTBxTlkvL1l0?=
 =?utf-8?B?ZzN4RklUTW1jVjl3NSsvRzFCTW1ZZER5aTNLWFN1L083blh4aG0zQ3hDblZp?=
 =?utf-8?B?NmdtUHRaZnI0dE9jWjZGQllWTGhtRFRmWUtaR05wR1R0dnlvVFkyL0RBcVpO?=
 =?utf-8?B?RUhDSjBmTGdrVEptb2pyeERwdDVaS1ljSW85S21vODk1MGZRNlRYLzJKYW43?=
 =?utf-8?B?elNZbG1UNTlObEJMWmFGeDd1TWYvS0pUSm1OcUwvNk4vNUFuR3hHZ2h0M0c4?=
 =?utf-8?B?bkNrV2tzN2pCYUNHaTlpUjNaOFVyRXJYZG41Yno2YThaRWZwd3BiZ2Y0R3p0?=
 =?utf-8?B?alAxMTROd0Z3T3hCZ3A1REZVME5ldlVneDNCNGFETDZJSCtVRGY4c0FjSjZr?=
 =?utf-8?B?MENsZ0dsQUwzaEY2UXM1Qjc2KzZoVnUrRmJNRStZMFJ4QWJIU0VzZ05mckhO?=
 =?utf-8?B?WFplc09YeGdIL1RiNm1CRlQ5SHV3NE1tMktZUW5zWk9vZGY4VlRmT0JYVmtM?=
 =?utf-8?B?L3pxTU1lSEhMNGZIdXlmZlpNdHNncGxYUndDTFppQjB2aDQ1RFZiZ2tWcTgy?=
 =?utf-8?B?UzY3biszMklNblVlWEtKSDRwNWNBZEpRek1uRlVEcjRpNmRYbWJVZDkraW54?=
 =?utf-8?B?OFBKcVJIcEdPSzhDcWx1dVgydi8zYnp4TjFzUU5JU05SR2VDMWFiNFc1cTdv?=
 =?utf-8?B?M3JydDVZMGJIQ3Y5aE5EbzR0M1FFWFNXblllOFhsb2xoTjkwNXV5bStQbVV1?=
 =?utf-8?B?OStzSGNYVmsvUFpvcUtXMVorSWVvRHd5ano3V1phd0RsQ1VyOFF4anRuUVUr?=
 =?utf-8?B?d2xJWTkrSnh5SXVUZUpZbmtFZWRTc280MlFWeGdLZHFjS2g0L0NIT2s4Q0tt?=
 =?utf-8?B?aWZZTnFjN3dZdGpPMVVnV3Rvd3ErSTRhU1dKdkJUb1RBMDhweFNONE5mMnFn?=
 =?utf-8?B?QU5NNkJqZDBUN1p6V0VmUEdydStkeklEeWhTeDdiY0F2dk5MUUFDQUNVNG0y?=
 =?utf-8?B?NHE0ZS9SK1V1cWZ3N1JpaG5ETE1KalRPOVFKNG11WjVTUHNTcW1TbTBPT2RH?=
 =?utf-8?B?cWJPa2NzM2FCOWFBYXJGNVdLTklWN0J2b2F2cVcyS0kwMjZWS2xoeHNCaCs2?=
 =?utf-8?B?QVZIcEFzUkJLVFlXS3JPTmVlUm04Q1N0c0ZuYURUSkhZL0dxbHVaRTloeVJn?=
 =?utf-8?B?R0Z2Y2UycEVtbHRwVjhCc0svaTVKeDk4Ty9WdVpTUlU1cUNNNjlqcXRDN0xh?=
 =?utf-8?B?dDArSkZRdWpOd2kvLzZ5VlI0UWVreDIrbU9qVzRoUFc5OTQ0VDJaMC9pTkVq?=
 =?utf-8?B?aHM1LzY1RHVlVURUTC9MSWRrS3hFTWV5SzR2Y2RLc1MzZzdLano4Qy9pSmRv?=
 =?utf-8?B?bmRyN1hmZzA5a1VZcXhWd3ZERVFXSWZxU0pobzN0VkRISlUva3pDM3RMVGh1?=
 =?utf-8?B?QVJNQUFxV1ZBYVFkc1BOZittQVpJMkh3WVFlNjBxYkdBNTZ6dGM2WW5EL2dj?=
 =?utf-8?B?VmppUjdtMlZGT3pZVWxJeUFTblMvOGk3bEhsSTVvdEVNeDJ4UTAzb3FzMHJJ?=
 =?utf-8?B?aytpclVVODllUWdCN1E5MHpMdTBxTnhFelFlQ0VNRDFpcllKcVEwRFRFb3Fq?=
 =?utf-8?B?QW1BWHNvNk1kSFN5QlRGTHY4K3dBZ3dmWnMyMFdqemx2R1V3aFNaMDBkbzZB?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0c3f87-a93c-4b35-110c-08da5b2f9220
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 07:01:51.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6U/sYv8rXTJoZD1md9YA4Y2Ujg0VjsBgYU/GERzEyczShTShLBOQktDGXjLAlswd+DGAP/hgC/99W9PS4xJn8b+kqUde73cgSD80q5H3mQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5768
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


W dniu 30.06.2022 o 10:23, Datta, Shubhrajyoti pisze:
> [AMD Official Use Only - General]
>
> Hi Krzysztof,
>
>> -----Original Message-----
>> From: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> Sent: Wednesday, June 29, 2022 7:40 PM
>> To: Marek Vasut <marex@denx.de>; Raviteja Narayanam
>> <raviteja.narayanam@xilinx.com>; linux-i2c@vger.kernel.org;
>> michal.simek@xilinx.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> git@xilinx.com; joe@perches.com
>> Subject: Re: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for i2c-
>> read
>>
>> [CAUTION: External Email]
>>
>> CAUTION: This message has originated from an External Source. Please use
>> proper judgment and caution when opening attachments, clicking links, or
>> responding to this email.
>>
>>
>> Hi Marek,
>>
>> W dniu 29.06.2022 o 16:05, Marek Vasut pisze:
>>>> [...]
>>>>
>>>> If those two modes only differ in software complexity but we are not
>>>> able to support only the simpler one and we have support for the more
>>>> complicated (standard mode) anyways, we know that standard mode can
>>>> handle or the cases while dynamic mode cannot, we also know that
>>>> dynamic mode is broken on some versions of the core, why do we
>>>> actually keep support for dynamic mode?
>>> If I recall it right, the dynamic mode was supposed to handle
>>> transfers longer than 255 Bytes, which the core cannot do in Standard
>>> mode. It is needed e.g. by Atmel MXT touch controller. I spent a lot
>>> of time debugging the race conditions in the XIIC, which I ultimately
>>> fixed (the patches are upstream), but the long transfers I rather
>>> fixed in the MXT driver instead.
>>>
>>> I also recall there was supposed to be some update for the XIIC core
>>> coming with newer vivado, but I might be wrong about that.
>> It seems to be the other way around - dynamic mode is limited to 255 bytes -
>> when you trigger dynamic mode you first write the address of the slave to
>> the FIFO, then you write the length as one byte so you can't request more
>> than 255 bytes. So *standard* mode is used for those messages. In other
>> words - dynamic mode is the one that is more limited
>> - everything that you can do in dynamic mode you can also do in standard
>> mode. So why don't we use standard mode always for everything?
> However  the current mode is dynamic mode so for less than 255 we can use dynamic mode.(the current behavior will not change)
> Also the dynamic mode  is  nicer on the processor resources. We set the bytes and the controller takes care of
> transferring.
>
> However do not have any strong views open to suggestions.

All I'm saying is that before this patchset, the dynamic mode was used 
in all cases and it made sense - it is easier to work with. But it 
turned out it has its limitations and support for standard mode was 
added with several cases that switch to that mode. The commit message 
suggests that the only difference is in how complicated the code for 
handling them is, does not say why dynamic mode might still be 
preferred. And supporting both of them complicates the code noticeably. 
My understanding now is that the code struggles to use the dynamic mode 
in all cases that it can because that produces less interrupts and so it 
is slightly lighter on resources. So it is a code complication vs 
effectiveness tradeoff. Since this is I2C - a slow bus, I'm not sure it 
is worth it but also don't have strong opinion on that. If nothing else, 
I think it would make sense to update the commit message a little bit to 
better explain why it is worth keeping both modes.

Krzysztof

