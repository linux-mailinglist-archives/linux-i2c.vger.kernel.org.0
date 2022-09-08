Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB845B1FEA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 16:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbiIHOA2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 10:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiIHN74 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 09:59:56 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2124.outbound.protection.outlook.com [40.107.22.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB12A114A61;
        Thu,  8 Sep 2022 06:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUAxGkV0QP4LPF4oAqtpCANzZXaTG2BNRyZHeawnCV6Oei6EM+2/MUFY5/XX1kFjveYc4gGH1USeLQU8DDoZoxi9wbrjBG8sYMI8DdAJpEInirgQ1Xv1UO5qTD+3eYzB5TXmfASVbBu9m6m7XRfM+8mYB2eJMfrSoGKG7EWAFuBFi3fZlwd9QPq8x4as7HrAufhQyJQAh0YtF0hP/DKQTIpibrqd+6Xg4jv9kSI5d/8kcDc2Z3WCragl4PQ7aZ07Q2j2UU43y6ll0FSjRRcigYXLSr/cBCogUdE8UN1K0B8+BJv73IUZ8DDM21RbCZ/Xy+cjND8AKaUsJ1wQiIVPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tStOBjTcpl5Hulh7e4gavb7/7SJYX8gp0jZFOo6D5sE=;
 b=m5c/49DY9t2cyDonM4e2ApUzQdGjRuklNE8rQBtxnvDAJCyc6uJsgJFzb8WSuySuobww2D9xEPPaRIkIEFlsSjqIZFqBYzrh9E6uRqsExe2Mwgha89cWgC8Als50g2ntGQuTDCkztA6+/Mqx5eWpN7JAoYgM6b2yQvpnm42ExL/6q2H4Q8YZE3NIAE0t/dgxUbQzOX/qlPJ9LES8v+xAX0b/fcBmcJKs77+x5uTGFRtXSdrJUhmpRUdhJusIBG8bapQTb9/qRF8DPlA+0cPxF2svrTgY4p9rLQx4vdyttNnMK9a9g4WqR2tbL6dEzD40wQbxsPKAf2B/MNvVFGwxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tStOBjTcpl5Hulh7e4gavb7/7SJYX8gp0jZFOo6D5sE=;
 b=Lbt+9d1THJqNGvPqb2/SZ4NO0ECImMn38ClzlLvcZJAWenpca87MQBh42H/CmVY2z6MKNxpMr84X2Geyt4fmHCoK0u6afLmPOWKSg4ImCM2FcAV+ZpLvrrnmRfgq869cpHOlzRml4zdniMK5b+SGtQlJwwj+Yb4GzH3d6/eG95A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DU0PR02MB9295.eurprd02.prod.outlook.com (2603:10a6:10:470::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Thu, 8 Sep
 2022 13:59:12 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 13:59:12 +0000
Message-ID: <2fcfa811-ce5c-9fc8-9837-753299794560@axentia.se>
Date:   Thu, 8 Sep 2022 15:59:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Content-Language: en-US
To:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Codrin.Ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org, wsa@kernel.org,
        kamel.bouhara@bootlin.com
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <38dedc92-62a2-7365-6fda-95d6404be749@axentia.se>
 <3503471d-2d5e-572b-39e7-d715a909749d@axentia.se>
 <5800be99-3569-6edd-5c71-9e6f1498dc3b@leemhuis.info>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <5800be99-3569-6edd-5c71-9e6f1498dc3b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0103.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::8)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb19ef4f-5856-40cd-622c-08da91a24f46
X-MS-TrafficTypeDiagnostic: DU0PR02MB9295:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ycFt3PlywY3nr5wRPvBewzWG6Wz72mmTv71FRzoV1T/wYfpzaeTsYa/HMrAxKf7LQXJR3ow3a+34oILo9OK/+QyBWB3y0e/zRP4ot0DbkAEA2siOhdRX54yr1wQ3aC8fZlBk24REavpu1gu4fV/jgh2abkmiAGJrYBO2PaW4Y8crMSJncIVxTC4TijPzHRZpH7QfhnUH+/5atSH0dnaQe4P6KQa3NcXwb75RM/K+9Cgxzp8dRLnmx0sMCvLVTogidoLTbUp6I1X+TGc6F06pOUQL6cC2XI8prJGBi/7YZjlJRRC9y/ZA8ubz3L0EUTxlT/SE+hHBgjR8nA5RquLGEY3CRUI3S8d6cyHnsnOpZtEkFQMpooJFCww65VnBBEBzvIxBHJ3aeMPV+1jplD2kFVxSfcd6QVA2/H85eaRamNFG/ruQfqeGM3TAQ5E+YFgu1oEKfbDYzAvA5DiUxwhX1dBx9cVf3oFLVA0brGTNMwFJm9A8dub/mom9sG6V5UFbaMj/IYUoTwFvMrx4wcT6wC3UGGKZEo3fCjTCD7U1pjXECokM7lp8GKqo+I74jVC8RfTFvHbfULmSg8u5Vb81rq6iBSKCXKVvf+EHR9okB9qno4Et8aEK4UQoH9fBdXrwnta6JjMMA6IX/aPgw/UniwaHkIi89q8UB6VvrSSzNCs/Swmu2fW9yPRc5SKV1M64T5WidEd0AyNvqDYKWQpqmjdapQGtStxmAVNtB/RgC+wx+qefTmV+5pwomoaurolDOnEq/BTSjCMnuANgSZLsdDJEEO3Z5BPi3L86NN6lqcArcvVqElsfgUmLsx2iuG0k4Itt1S1EAwAWFN586GfhyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(396003)(39840400004)(136003)(186003)(966005)(478600001)(53546011)(83380400001)(6506007)(26005)(6512007)(41300700001)(38100700002)(6486002)(2616005)(8936002)(7416002)(30864003)(5660300002)(8676002)(316002)(86362001)(31686004)(4326008)(66476007)(66556008)(31696002)(66946007)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXlCRCtxa09JRlpoUTg1ODB6blRLdG8rWTYxMzEyMVRSYXRkN0NZQU5BSXQy?=
 =?utf-8?B?SmZVQTk3NjczdkJ4cDJ0cG9XVFQ4UjRMQll0VUNha2tVcW5vQWRySzBuV3J2?=
 =?utf-8?B?SFBwYnM1OGYraFp4YkdFRmpoMnFnWkV1aE15dHR1VjVseDBSN0ZwS3lEaEU1?=
 =?utf-8?B?ZU5vSTBuZzRRYTFIVkNic0VUM1M3SXkvS0VkWTZ4TU15NTh6SjVkcG1XY2ZX?=
 =?utf-8?B?RmZzektrVTREWEgyRHpwa3hGV3FPeDhVcVEzVVZhZ1RxZ1g2VnBuMnQwejRj?=
 =?utf-8?B?cGV4L1JHYmhIcWZ1V280QXpVemFjbFAyTHBVanpvcUhIVDZwUzE2M3RSa1ZB?=
 =?utf-8?B?VWZvVkNhdWZJQXN3SkV2dHExZkY0ZjhBQVJvdzU1c1ErdkNkRnFyYXo3eUsw?=
 =?utf-8?B?S3Y5NFE3bXhiYzFPaFhrK1ZINzIwcm9hMzE3S2tVVm9FbjBzMVdlcFJmS3M2?=
 =?utf-8?B?MjdHRUM4WEFJd3VvRFJPUWxtSnlGNHV0c1ErYlFvaHBnMW5jdzJyL3BLUDZS?=
 =?utf-8?B?VGU3R24yK3RuNFd4cGJqZVB3Y2JURlRiTFJpZ2lZQ2NFMFB4VGRZc3B4S0kw?=
 =?utf-8?B?WGVHWkZVb0JhRDkzRFVONzZLYXRpQVRPTzVvZERJR1EwNjRiYzYrVENyMVdU?=
 =?utf-8?B?NVltdDlLY3ZWbkJ4ZFA4SktvU2EzK0Q5Q0FuT3ZTbEUzU081WkRtYTdoWVVN?=
 =?utf-8?B?Nkc5enZFbWc4VGZVTVJLN1MzWGtnL0JNcUFlazJsQVpCd2tEQjJ3R2pSRlhq?=
 =?utf-8?B?UFdIVXpDcHpQTG8wS1NHQjVaVHN2Vmw2YUlDSCtKNmRCdkQ4cklibVlxb1BC?=
 =?utf-8?B?aWtjdmwvdE5uRGZ4V2lEYTAzdG91OHJzM0huWW1zazRGTUFHS2NxTlJtSDVt?=
 =?utf-8?B?NXh2bThRN2k5eExBVDlrdjNPTHZ3cEdmUG92YWMvcVdLTHVIZXhPc2NEZzRJ?=
 =?utf-8?B?UXpZcTZnbWhSQWJnellLakVoeWZtUVpDcUx5bVE4UXpnQ1RmUVB3NlJ4dGx6?=
 =?utf-8?B?Q3UwS29WRWhSOFVkSFJVZk9Qby8rMloxOTM2ZmE0R2NaTHAvcHVjV0t4YWNE?=
 =?utf-8?B?YWx4WjlNUXJXQ2p4NkFHM3d0VjBPcENab2lZKy9vaklDdGo3YlF6Qm1CcXJt?=
 =?utf-8?B?dW5UTjdZZ2d1VjdZdDRiY2NGYmdzUTBlQjFZT2sxRzJrQmFzZnJKOWhCWFc3?=
 =?utf-8?B?MTNGQ3Q4NEV3RnVyTytyTWFUdVhKajBCQlBpRXkxc2FXeTVRaDVlU2ljU2tu?=
 =?utf-8?B?RkNFam1FOWwzOFh1Zmk3TjAzZUdkdDludnVrRE9icmJnTmZNNVJzMW92KzVy?=
 =?utf-8?B?UDJheVgvdjBRMnZIVERuZ29oc1N2UmpuNjMvOXZQeEkySjlzd050TkdvUDlD?=
 =?utf-8?B?Z283UGpEVnhvRDc1RjBwdnpHdkJxNTNkNXZnME95ZzFob2lOZzI1WStZL0dJ?=
 =?utf-8?B?WklMeitXVDhxbVA3RCsyRFZrOVNxYk1NYThLZUtmSVpYQVdQQWVHbzZmSHpE?=
 =?utf-8?B?Vm1SdU0zSUxqdFZRcWJrR0Q1UndhcDAzQnBuSWpEenE1MmpsTEpLc0tza0VT?=
 =?utf-8?B?Vk11UVpwT2h6OVNMbTBPL0tWZ1Y1MmVmdVlTT1VyWHc0MU1Ibmh6UzYzNE12?=
 =?utf-8?B?SUlWT3Q0TDNWb25QbjlXY3R1NHVJMXJ4QkoyaFBaUlRUVXJabGNBNFZENjl0?=
 =?utf-8?B?eG5oZnZ1TmpsL2wwTHZoa0NsZXovN3pNcllUUHRpNXloYmk3SFVCeHdxNkdC?=
 =?utf-8?B?eWY2VjUxc1ZBVGJncElnUmd5Q3BFL0lldXVnMWpFdHZpTkJBaWVyZ2oyS1Y2?=
 =?utf-8?B?cFNoUHhvek1NWEVMYWUwVFR1V2d4aXE1U2lheW0zVjhnR3VlQ0tibFoxVDFP?=
 =?utf-8?B?Qm9aQWNOdW9vK1pldlI5UmdIMERWNGNpM1FXcy9SNGNkWWsvMW1DRWFKWmdN?=
 =?utf-8?B?SGVBenNuZGhRa1N5am5Kd1VsUmRWNkpMaTMrSitJU3Jlb0FBSEJDUFNXSVVU?=
 =?utf-8?B?M3BMbkNRb3pyZDFHTlR0THBGMEVQK0dSQXlteFBzbExOTy9VVFFENldEVTdS?=
 =?utf-8?B?YTBzV2VaeTg1djZPaDRNWTJoZTd1dXVucjMxcG9USXdRM21XbTJ0VHkrYWk4?=
 =?utf-8?Q?OBpOk4aT8LKd5WSsla4pYCRi/?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: cb19ef4f-5856-40cd-622c-08da91a24f46
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:59:12.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8bsItRrKMHdYD9CLAIoff+PnSqAd6qY2XN/x7GMaNw5iShKcFzOiAZkASwUZKz4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9295
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-09-08 at 14:06, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
> 
> Peter, Codrin, could you help me out here please: I still have the
> regression report from Peter that started this thread in the list of
> tracked issues. From Peter's last msg quoted below it seems the thread
> just faded out without the regression being fixed. Or was it? If not:
> what can we do to finally get this resolved?

No, it is not resolved that I know of. We are only writing during
production, but are working around it by verifying and looping back.
Sometimes it takes surprisingly long for the loop to finish, but
it's not a huge deal. But it is of course not completely satisfying
either...

Reading is never a problem, so post-production behavior is sane.

Cheers,
Peter

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
> 
> On 30.06.22 09:44, Peter Rosin wrote:
>> 2022-06-10 at 22:51, Peter Rosin wrote:
>>> 2022-06-10 at 09:35, Codrin.Ciubotariu@microchip.com wrote:
>>>> On 09.06.2022 17:28, Peter Rosin wrote:
>>>>>
>>>>> I have not actually bisected this issue but reverting the effects of
>>>>> patch a4bd8da893a3 ("ARM: dts: at91: sama5d3: add i2c gpio pinctrl")
>>>>> makes the problem go away.
>>>>>
>>>>> I.e. I need something like this in my dts
>>>>>
>>>>> &i2c2 {
>>>>>          status = "okay";
>>>>>
>>>>>          pinctrl-names = "default";
>>>>>          /delete-property/ pinctrl-1;
>>>>>          /delete-property/ sda-gpios;
>>>>>          /delete-property/ scl-gpios;
>>>>>
>>>>>          eeprom@50 {
>>>>>                  compatible = "st,24c64", "atmel,24c64";
>>>>>                  reg = <0x50>;
>>>>>                  wp-gpios = <&filter_gpio 7 GPIO_ACTIVE_HIGH>;
>>>>>          };
>>>>> };
>>>>>
>>>>> for multi-page eeprom writes to not time out (a page is 32 bytes on this
>>>>> eeprom).
>>>>>
>>>>> For reference, the current defaults for this SoC/I2C-bus, that I modify,
>>>>> are:
>>>>>
>>>>>          pinctrl-names = "default", "gpio";
>>>>>          pinctrl-0 = <&pinctrl_i2c2>;
>>>>>          pinctrl-1 = <&pinctrl_i2c2_gpio>;
>>>>>          sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
>>>>>          scl-gpios = <&pioA 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>>>>
>>>>> I suspect that the underlying reason is that the bus recovery takes
>>>>> too long and that the at24 eeprom driver gives up prematurely. I doubt
>>>>> that this is chip specific, but I don't know that.
>>>>>
>>>>> I can work around the issue in user space with by writing in 4 byte
>>>>> chunks, like so
>>>>>
>>>>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom obs=4
>>>>>
>>>>> but that is really ugly and gets slow too, about 20 seconds to program
>>>>> the full 8kB eeprom. With the above in my dts it takes a second or
>>>>> so (a bit more with dynamic debug active).
>>>>>
>>>>>
>>>>> If I run
>>>>>
>>>>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom
>>>>>
>>>>> with a source.file of 8kB and the upstream dts properties in place, I can
>>>>> collect the following debug output from at24, i2c-core and i2c-at91:
>>>>>
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@0 --> 0 (-23170)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> -121 (-23169)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> 0 (-23168)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> -121 (-23168)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> 0 (-23167)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -121 (-23167)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23155)
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>>>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23143)
>>>>>
>>>>> And then there is no more action. I.e. only a couple of 32 byte pages
>>>>> are written.
>>>>>
>>>>> With the above mentioned dts override in place I instead get this, which is
>>>>> a lot more sensible:
>>>>>
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@0 --> 0 (753629)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> -121 (753629)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> 0 (753630)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> -121 (753630)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> 0 (753631)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> -121 (753631)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> 0 (753632)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> -121 (753632)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> 0 (753633)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> -121 (753633)
>>>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> 0 (753634)
>>>>> ... snip ...
>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> -121 (753883)
>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> 0 (753884)
>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> -121 (753884)
>>>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> 0 (753885)
>>>>
>>>> could you please apply this patch-set [1] and let us know if it 
>>>> addresses your issue?
>>>>
>>>> Thanks and best regards,
>>>> Codrin
>>>>
>>>> https://patchwork.ozlabs.org/project/linux-i2c/list/?series=255408
>>>
>>> That series does indeed help! I'll reply with a tested-by etc on the
>>> first two patches, I can't test patch 3/3 with my sama5d3 board...
>>>
>>> Thank you very much!
>>
>> Since replying to the actual patches do not work for me, I'm writing here
>> instead. Sorry about that. As stated above, it /seems/ to work much better
>> with these patches. But I fooled myself and there is still some remaining
>> trouble. It is not uncommon that the second (32-byte) page in the eeprom
>> is not written correctly for whatever reason. I do not know why it's
>> always the second page that gets corrupted, but this is a bad problem since
>> the failure is completely silent.
>>
>> Cheers,
>> Peter
> 
> #regzbot poke
