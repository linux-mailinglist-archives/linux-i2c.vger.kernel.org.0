Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADA34E528C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 13:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243426AbiCWMzi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 08:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbiCWMzh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 08:55:37 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2098.outbound.protection.outlook.com [40.107.20.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFB513F1C;
        Wed, 23 Mar 2022 05:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNLcTkRtxlC7rUB55AnZEwZr6cKfd0zIIIQGbRtaUmYYADlkVhr6atReuvsUHHXYj/0m75cVoig0u05wGxo7dI9Z89ADaJkHuwWhWG4As2xCSGEOyn/4GSKki0h0WgTursntQ2ehfz8kxuhBMcS6xKogyGvdMCwuLZvXn4aUeCN855Fc1+b9blcGp4Bc0958/RlCrxnjmKsAxbx+u3NTW+sJOOanEJAW0uBapArDOElg74yp5e/WpLk8d452IdXPxQu+Wf25qiZgrNYlFwCfi7BFJlzZbX28TJrtIa/s689DItqIsf1D3QN5TN0u914GPGLZgcX7KTzhG8C6mJVsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ic+qa52ur2cadCOrpRm7VMem10hEsNw0iuPxhkcA3k=;
 b=V4VFHBqRP0DWGK3lMpxiMo8NnOkJf8pb+vXvGJBas8/tIF5kOGsx/1qrulExop7lYfY98JcgrgAlV6pebGaG+0OdEVuNO7zgarsuk9pJAKpMu+aZV79/Rjjv4A3TZs9HpQx6CXFId4qXe52RDD0qevyr8NGkOiGY79lDxNt5Ct5fmp3QlsfzieES02pH8Ku9C+0T7E6PIfSaMlQiitfYfmnGxJ+dgwQ55C0RyrsErNru0FSUbMSDHrHghcXLMnPVz8pHC28Mx2iZKvwXQvEx3FdCEhMpEd9r0HBJNuv2/WL8CMcCoCyucL8cvIylRWbDZTfULCamHvsYzbASLPMctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ic+qa52ur2cadCOrpRm7VMem10hEsNw0iuPxhkcA3k=;
 b=Qi0g1zlMB5alxf+XZgLT8tqpU/K8CU3NClDetUaUqBfoOjhMtmk1Th6fipiCHQZ6TugKxvBuMNnagLUvy8h3aPRwMrRV1prF9sxPW002q6G3daQBnS1QboOZZY02C5ZmwxMPFs5ERyfu+N1tKzyPpg2bN0fORCvL0g80rX/XBKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM9PR02MB7484.eurprd02.prod.outlook.com (2603:10a6:20b:433::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 12:54:04 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::cc:370f:ef33:4de3%3]) with mapi id 15.20.5102.017; Wed, 23 Mar 2022
 12:54:04 +0000
Message-ID: <b2740ed3-22f3-d11f-2bdd-d0a2d29bcc4f@axentia.se>
Date:   Wed, 23 Mar 2022 13:54:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v6 2/3] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
 <20220216074613.235725-3-patrick.rudolph@9elements.com>
 <5658941a-bf81-4ecf-3317-82d2a8244021@axentia.se>
 <CALNFmy0vADcLGcNCCGtPhsXXRCxV549Q5vhdv9v0YQ+HjZOhNQ@mail.gmail.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <CALNFmy0vADcLGcNCCGtPhsXXRCxV549Q5vhdv9v0YQ+HjZOhNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0067.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::32) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8d81734-d604-4965-21ac-08da0ccc358c
X-MS-TrafficTypeDiagnostic: AM9PR02MB7484:EE_
X-Microsoft-Antispam-PRVS: <AM9PR02MB748408799F0D33F1609FE4B2BC189@AM9PR02MB7484.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h6YHnPsGHZX1BTJm9NKn+qBrNu5NNy6gn8bRf8qs7A0nrze2A8t3KQkDbmLNZY78GZ0o6UEC/lBmoFI8iQDOFchiwpnV796eYJ6qoIMhHbWHkac3Q4iL8krSVMLHLRasRJkf1yxSrFxlotaNUH/OnUlZZ2wYUkGgpr/npkQKFqpfBLCioxhep+3Ib0VmcnVjQTNW0fBBkExFazwCGLYDN4e2dDAovKg/GwoKpRFB//JrvWoRTb/s6CmZaPdQC23v5MmLaFbZQgZO51a+ytpsaVgMPR4dQv7Kz1yXXsosncHax6ceol4smxhsmF2/uStI4ruAtarNvN/njZKvkAPCzTwiG6fzhS6QnGbNfloBmf5eg899PufYNlI9EDOodLChdkxfVnJGV10RRZYqMOORLl6aySzSQFtgXRXhPkANryBl/7GcxrzUPofiDkR1YqOYLcwcQCBV/yqBvNpCkZbUzoWARIFwChda79R8t4yzCHxmiqmPFMBWbRZB6O1xJbZsi/0u2cteWe2bexWlmN23xdbEGVomdhZyxY4RUtFrbLNsuHwGfuZFtFtluxh5vwij+nqr6ikrXoCnPF5CwbONGo/9XuGrC3qzNIc1z1kMS6IpxVZUOuTnzQLFUMg7N8A59FM69alq2Hq7cg00Pn8ViKt/PMm+6npvGVxvU94lwgkMOBwkj+XZODBvHf5QAlJ4OhCBihUWbkycR5ePeIdvqo3ZPrghX0rx4m978u39SIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(376002)(396003)(366004)(346002)(39830400003)(2906002)(6486002)(2616005)(6916009)(316002)(31696002)(5660300002)(86362001)(8936002)(6666004)(36756003)(38100700002)(8676002)(66476007)(186003)(31686004)(66946007)(4326008)(66556008)(26005)(6506007)(53546011)(6512007)(36916002)(83380400001)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzBPS084WGVuZFMxOXY1WVI4eU9JdGlQOWZSbVpLSVVtV2tXQ1gxZUJ4dWhk?=
 =?utf-8?B?dUJESXdZaUpmb1p4OGdBazRNcEhoQlhjZzFWRkdCd1ArL2xvVTZ2U0dTcTVx?=
 =?utf-8?B?bFVFRHlFb2J4dDNWeWp4a1NkNFJrbWpOMGFqcHpHKzZGVVNrQjBua3YvcVJh?=
 =?utf-8?B?bnBPeFlEWVFTa2tqNXhFTzFqY21FRXRFWEVHUGZQK1ZPd2xVallCYnJua0kv?=
 =?utf-8?B?VUlvcU0zZHJ2Y1VvSno0OEh6dVh0dXF4eHAyUEFkdWtLeitRTnh4TDdPTU94?=
 =?utf-8?B?Y3k5Y3FlcFdnbEpzSElvZEdGWlIzdU9TaitrbEhJMVJyRDJjdU1YWnRaaTI3?=
 =?utf-8?B?S0k0eUgxVVE4SXAzdDJtcDlVa2ZKWEZHUWQ2enpqcnRiVlJGd05LaldjZ29t?=
 =?utf-8?B?aVUwVGtnbmZtdzJZU0RaVUg4c1VqS2RwYXRJZzVJZGVwTzg2T3daNU9PcTRh?=
 =?utf-8?B?bTZraGtTZS9Ud2tOcE1SLy90dEtSNytwS0FWOU8xZGhWRWREdTVjRWY2eHMy?=
 =?utf-8?B?cFNYWjhxa252VUxtYmhGSkFPYW9hTHNrUks0QWFOb0gyU09TSkNBeXBCdDFV?=
 =?utf-8?B?eHNRSDdLcFFLa0NuaXpLdy9RTlpzTTRwSlFDT0xoNTd0aHc1ZXFjaDI5cGVr?=
 =?utf-8?B?eVN0RTJFQ0EyZmNsZlR4WTZVMFZnVk1NV1BaK1pZM01FZysvK05IZ3gzOW9j?=
 =?utf-8?B?cUt4V2VnZVJXdnIwa3FWeDNIQWdsczFBVFJWeDdQdGhWL1NjQUV6ZmQ0cTVk?=
 =?utf-8?B?YjJ1Y1dnOFBOT1FIM1ExQTE1cm9ZNkRIWXU3V2xYeEFZUWZoSFladHZRYTlD?=
 =?utf-8?B?bzlhdVNMczVNalpJeGo4R2I0RWx1aC9RaFFVUGl3c1RBem8zZDRsZ3ArL05W?=
 =?utf-8?B?Mjk3NjRFZkVsellKY1hTMm0yaTl4T1RZd3BGbTV2ZkFsQU54S1FyZGpVL2Fl?=
 =?utf-8?B?OUNEMDhLVUQxTXc1M0JBazJ5VCt2OHBBcElEYm1meHBZVEFoQ096ZmM5MU1o?=
 =?utf-8?B?RXFTcWRDZmdLMmpRZXRmUEVCWWp1RjhGK3lqakZ0cG1VaWdTZGJ3WG50dDV3?=
 =?utf-8?B?Zjk4bVMzbStzTUdzeXVCNTdFNHFmcHRPMEJra0NGVnZ0RHlFMTdZTmVSamRs?=
 =?utf-8?B?WnYrQVdrdExSalJ5WmZoSVRMVm92UFVJMlFUdG10WnN2aUE0V05UVFZXR0xC?=
 =?utf-8?B?WUl0R1N4bCt5cy9JcVJIYUgwNXZhWFVxZURMbnZiZmZDTzRBcTM1M0h1MTR0?=
 =?utf-8?B?TTF6cGxQaTFTNWNBYVVmS0Q0dXQrMkhZUW43dnBHdUZtOXhVdHRsWmIyME9B?=
 =?utf-8?B?NHdXM1BmWW1SQmp1VGVRa0pMU29IMVJVd3Y2dTRlMk1SaG1qcVVRdm01RVFq?=
 =?utf-8?B?Y3NEb2xYZGdUbk0xbHlma05RWGtqWG5jNDRCS2dPNGNjY3JoVW9QeFNkdXVo?=
 =?utf-8?B?SVp0LzEvSjBqbjdOMHcwczRSZWpnbkVRcUZGU1JBSzd3NGFNWEIvMitKMzJi?=
 =?utf-8?B?RkswVTZkMmNjTnZKS3Y2bkE2NThXbWdWQkgybUpPS05uV0lHTGdQeExyYjRH?=
 =?utf-8?B?YmpIa2hmbkd5VWErYVJweER4V3RaaXM5MHMzUVpDbDRxNzZORWtBcGtoSnl3?=
 =?utf-8?B?YzUvY3U4N1hzcHVYNjB3UXprQWFOK3p4OGk5QWZtNUxpdk10RGNoelk3ZTFu?=
 =?utf-8?B?M0tMVzlJN1pLOVZTdXBzZW8xZElHT2krMXFFYTFGamdCQStXalpOdzZCWm5s?=
 =?utf-8?B?RlFWTCtORVAxNDJxTHQrOGRBOTJrNVQyZThEZUE3R2xsTTBCVnUrdE5lN2Ix?=
 =?utf-8?B?YnRBNXZXV0VsRG1yNFNMSkhNZTk3emlUZmljSUxocldQaWtadmJJOXFNYm9X?=
 =?utf-8?B?WUdrbWkzcnhqSEFmZkVBek5qRXNYdldhYS9VbDI5SFp5a1d0SndRRWRFZCtE?=
 =?utf-8?Q?KDtPBXO5jCX9QrnpLaI8FgVSvElbAIjh?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d81734-d604-4965-21ac-08da0ccc358c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 12:54:03.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxU+ulPlp4JR7YQyjc41f3W9tZDaRsA3McPtx5bczb8TGG5cz88mfw65UXoWbMXf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7484
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022-03-23 13:41, Patrick Rudolph wrote:
> Hi Peter,
> thanks for the review.
> The MAX7358 has indeed the same registers as the MAX7357, but they
> need to be "unlocked" by sending a magic sequence first.
> As this isn't implemented by the driver it behaves like the MAX7356
> with a single register.
> The additional registers can be hidden again by setting a bit in the
> config space.
> Which wording would you prefer to describe this feature?

Perhaps: "exposed at POR" -> "exposed without extra commands"
or something like that. Without the background that the chips
are different like this at POR, the mention of POR is just
confusing...

But why not send this sequence for MAX7358? Then it occurred to me
that I expect the MAX7357 to behave pretty much like any of the
other chips until you touch the enhanced registers. Isn't that the
case? But why is it then needed to touch the enhanced registers at
all?

I suspect you know the answers, so I'm going the lazy route of just
asking instead of looking it up myself, hope that's ok...

Cheers,
Peter

> I'll change it to maxim_enhanced_mode.



> Regards,
> Patrick
> 
> On Sat, Mar 19, 2022 at 3:41 PM Peter Rosin <peda@axentia.se> wrote:
>>
>> Hi!
>>
>> Sorry for the slow review and thanks for your patience...
>>
>> On 2022-02-16 08:46, Patrick Rudolph wrote:
>>> Add support for the following Maxim chips using the existing PCA954x
>>> driver:
>>> - MAX7356
>>> - MAX7357
>>> - MAX7358
>>> - MAX7367
>>> - MAX7368
>>> - MAX7369
>>>
>>> All added Maxim chips behave like the PCA954x, where a single SMBUS byte
>>> write selects up to 8 channels to be bridged to the primary bus.
>>>
>>> The MAX7357 exposes 6 additional registers at Power-On-Reset and is
>>
>> MAX7358 also has the same enhanced mode as the 7357, no?
>>
>> And what do you mean that they are exposed at POR? I can see why they
>> are not exposed /before/ POR, but are they ever /not/ exposed? If they
>> are always exposed when the chip is "alive", then I suggest that the
>> POR wording is dropped, otherwise that the above is reworded to
>> describe when the register are no longer exposed.
>>
>>> configured to:
>>>  - Disabled interrupts on bus locked up detection
>>>  - Enable bus locked-up clearing
>>>  - Disconnect only locked bus instead of all channels
>>>
>>> While the MAX7357/MAX7358 have interrupt support, they don't act as
>>> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
>>> and handle them like the PCA9548.
>>>
>>> Tested using the MAX7357 and verified that the stalled bus is disconnected
>>> while the other channels remain operational.
>>>
>>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>>> ---
>>>  drivers/i2c/muxes/Kconfig           |  4 +-
>>>  drivers/i2c/muxes/i2c-mux-pca954x.c | 92 +++++++++++++++++++++++++++--
>>>  2 files changed, 90 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
>>> index 1708b1a82da2..2ac99d044199 100644
>>> --- a/drivers/i2c/muxes/Kconfig
>>> +++ b/drivers/i2c/muxes/Kconfig
>>> @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
>>>         will be called i2c-mux-pca9541.
>>>
>>>  config I2C_MUX_PCA954x
>>> -     tristate "NXP PCA954x and PCA984x I2C Mux/switches"
>>> +     tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
>>>       depends on GPIOLIB || COMPILE_TEST
>>>       help
>>>         If you say yes here you get support for the NXP PCA954x
>>> -       and PCA984x I2C mux/switch devices.
>>> +       and PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices.
>>
>> and and and... :-) Maybe like this?
>>
>>           If you say yes here you get support for NXP PCA954x/PCA984x
>>           and Maxim MAX735x/MAX736x I2C mux/switch devices.
>>
>>>         This driver can also be built as a module.  If so, the module
>>>         will be called i2c-mux-pca954x.
>>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> index 4ad665757dd8..33b9a6a1fffa 100644
>>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> @@ -4,6 +4,7 @@
>>>   *
>>>   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>>>   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
>>> + * Copyright (c) 2022 Patrick Rudolph <patrick.rudolph@9elements.com>
>>>   *
>>>   * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
>>>   * chips made by NXP Semiconductors.
>>> @@ -11,6 +12,12 @@
>>>   *    PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
>>>   *    PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
>>>   *
>>> + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
>>> + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
>>> + *
>>> + * This includes the:
>>> + *    MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
>>> + *
>>>   * These chips are all controlled via the I2C bus itself, and all have a
>>>   * single 8-bit register. The upstream "parent" bus fans out to two,
>>>   * four, or eight downstream busses or channels; which of these
>>> @@ -50,7 +57,30 @@
>>>
>>>  #define PCA954X_IRQ_OFFSET 4
>>>
>>> +/*
>>> + * MAX7357 exposes 7 registers on POR which allow to configure additional
>>> + * features. Disable interrupts, enable bus locked-up clearing,
>>> + * isolate only the locked channel instead of all channels.
>>
>> Same MAX7358 and POR comments as above.
>>
>> The way I understands things are:
>>
>>  * MAX7357/MAX7358 exposes 7 registers which allow setup of
>>  * enhanced mode features. The first of these registers is the
>>  * switch control register that is present in some form on all
>>  * chips supported by this driver.
>>  * The second register is the configuration register, which allows
>>  * to configure additional features. E.g. disable interrupts,
>>  * enable bus locked-up clearing and isolate only the locked
>>  * channel instead of all channels.
>>  * The remaining 5 registers are left as is by this driver.
>>
>>> + */
>>> +#define MAX7357_CONF_INT_ENABLE                      BIT(0)
>>> +#define MAX7357_CONF_FLUSH_OUT                       BIT(1)
>>> +#define MAX7357_CONF_RELEASE_INT             BIT(2)
>>> +#define MAX7357_CONF_LOCK_UP_CLEAR           BIT(3)
>>> +#define MAX7357_CONF_DISCON_SINGLE_CHAN              BIT(4)
>>> +#define MAX7357_CONF_BUS_LOCKUP_DETECTION    BIT(5)
>>> +#define MAX7357_CONF_ENABLE_BASIC_MODE               BIT(6)
>>> +#define MAX7357_CONF_PRECONNECT_TEST         BIT(7)
>>> +
>>> +#define MAX7357_CONF_DEFAULTS (MAX7357_CONF_FLUSH_OUT | \
>>> +      MAX7357_CONF_DISCON_SINGLE_CHAN)
>>> +
>>>  enum pca_type {
>>> +     max_7367,
>>> +     max_7368,
>>> +     max_7369,
>>> +     max_7356,
>>> +     max_7357,
>>> +     max_7358,
>>>       pca_9540,
>>>       pca_9542,
>>>       pca_9543,
>>> @@ -69,6 +99,7 @@ struct chip_desc {
>>>       u8 nchans;
>>>       u8 enable;      /* used for muxes only */
>>>       u8 has_irq;
>>> +     u8 max7357;
>>
>> Perhaps maxim_enhanced_mode is a better name?
>>
>>>       enum muxtype {
>>>               pca954x_ismux = 0,
>>>               pca954x_isswi
>>> @@ -90,8 +121,42 @@ struct pca954x {
>>>       raw_spinlock_t lock;
>>>  };
>>>
>>> -/* Provide specs for the PCA954x types we know about */
>>> +/* Provide specs for the PCA954x and MAX735x types we know about */
>>>  static const struct chip_desc chips[] = {
>>> +     [max_7356] = {
>>> +             .nchans = 8,
>>> +             .muxtype = pca954x_isswi,
>>> +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>>> +     },
>>> +     [max_7357] = {
>>> +             .nchans = 8,
>>> +             .muxtype = pca954x_isswi,
>>> +             .max7357 = 1,
>>> +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>>> +     },
>>> +     [max_7358] = {
>>> +             .nchans = 8,
>>> +             .muxtype = pca954x_isswi,
>>> +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>>> +     },
>>> +     [max_7367] = {
>>> +             .nchans = 4,
>>> +             .muxtype = pca954x_isswi,
>>> +             .has_irq = 1,
>>> +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>>> +     },
>>> +     [max_7368] = {
>>> +             .nchans = 4,
>>> +             .muxtype = pca954x_isswi,
>>> +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>>> +     },
>>> +     [max_7369] = {
>>> +             .nchans = 4,
>>> +             .enable = 0x4,
>>> +             .muxtype = pca954x_ismux,
>>> +             .has_irq = 1,
>>> +             .id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
>>> +     },
>>>       [pca_9540] = {
>>>               .nchans = 2,
>>>               .enable = 0x4,
>>> @@ -177,6 +242,12 @@ static const struct chip_desc chips[] = {
>>>  };
>>>
>>>  static const struct i2c_device_id pca954x_id[] = {
>>> +     { "max7356", max_7356 },
>>> +     { "max7357", max_7357 },
>>> +     { "max7358", max_7358 },
>>> +     { "max7367", max_7367 },
>>> +     { "max7368", max_7368 },
>>> +     { "max7369", max_7369 },
>>>       { "pca9540", pca_9540 },
>>>       { "pca9542", pca_9542 },
>>>       { "pca9543", pca_9543 },
>>> @@ -194,6 +265,12 @@ static const struct i2c_device_id pca954x_id[] = {
>>>  MODULE_DEVICE_TABLE(i2c, pca954x_id);
>>>
>>>  static const struct of_device_id pca954x_of_match[] = {
>>> +     { .compatible = "maxim,max7356", .data = &chips[max_7356] },
>>> +     { .compatible = "maxim,max7357", .data = &chips[max_7357] },
>>> +     { .compatible = "maxim,max7358", .data = &chips[max_7358] },
>>> +     { .compatible = "maxim,max7367", .data = &chips[max_7367] },
>>> +     { .compatible = "maxim,max7368", .data = &chips[max_7368] },
>>> +     { .compatible = "maxim,max7369", .data = &chips[max_7369] },
>>>       { .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
>>>       { .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
>>>       { .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
>>> @@ -401,9 +478,16 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>>>       else
>>>               data->last_chan = 0; /* Disconnect multiplexer */
>>>
>>> -     ret = i2c_smbus_write_byte(client, data->last_chan);
>>> -     if (ret < 0)
>>> -             data->last_chan = 0;
>>> +     if (data->chip->max7357) {
>>> +             ret = i2c_smbus_write_byte_data(client, data->last_chan,
>>> +                                             MAX7357_CONF_DEFAULTS);
>>> +             if (ret < 0)
>>> +                     data->last_chan = 0;
>>> +     } else {
>>> +             ret = i2c_smbus_write_byte(client, data->last_chan);
>>> +             if (ret < 0)
>>> +                     data->last_chan = 0;
>>> +     }
>>>
>>>       return ret;
>>>  }
>>
>> The actual code is simple enough, and looks good.
>>
>> Cheers,
>> Peter
