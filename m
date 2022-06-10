Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307E1546EAE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 22:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350581AbiFJUvU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 16:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347573AbiFJUvR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 16:51:17 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60138.outbound.protection.outlook.com [40.107.6.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2221C23BE7;
        Fri, 10 Jun 2022 13:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMYbLSYjgOx1/nykR3L+SyqTBAGQkkjBnuoWjxjiqniJ9WHjYG/csZ8X1IFFJ4Xa9kD4SXm+opNfFLD4ymEcnykuwrg4I64X8bxVYFhot54KUnUJtlV9359xNvqOuzbzE8QdUIJ11v0RU2oPadcGzzT9IRUVH/qd5TamXaCoddo+cXIobOlqQPRgytLnctgjK8V2HHDEvwtdE/CLQgpMX86nci+Xlg3hT8ztMzrCti9HYwKjzAIPZQgIw5nDG9mZDXz2uIOS8+SkYRMEgS34jrD02W9jm+L4GD8EJ2O4Hgj2iRWJn170BRMJqSut03rXfO8QE8hUT/C4BAXVWi1M6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m50EomMS4QPyQmTV6C2UG8cM5BgZkexzaaCjXWHtyc4=;
 b=m/XMO7EFglAIFtwyNx+XsqKmY5BcadCaCoF9Ih2wDJmJDKlfLWN0OnY3UXZqBRKkUdV5RMLhTM5cNGuW34n42EVDGUlX63wEbfmcIE/pOETVogHHCZ9RC7RUMzplWrV+jVfrTeoCXqjOh82kH2rFSAgXdngjOrjjF8sPEVLmEh9VY+iVLl+YtuKR3F+2aOvIhg8qPSO5uZOPOyy7j/mlGKm6BHHUaahFjmFL6lq8fzWFb17LgyNUQuILQ7gs9ql8f6V8uTeI5MlPzc//9lVYg4oP5bFf/JhzjgCU6QLpafO1wRuSVEFWe7jUWyo8b+M2sxsNB/JR0MJ8aPOHuxzaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m50EomMS4QPyQmTV6C2UG8cM5BgZkexzaaCjXWHtyc4=;
 b=O07PuvjqQPjCovoq8dlMJ9zG9rpKrt0QiiicS2Fs9zX03VYoumwJJG/Vx+Q/dgW+mMw4EMP9eqZ0vvDI48mlnbRB5Xr9DWsCd9rTNiUqQdPlPN0XEmmscEhlRW8PS2Ilnx71n111lV7JZpxwoTZV4V9CqqaNMcBBesC+wa3RR2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB7817.eurprd02.prod.outlook.com (2603:10a6:10:332::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 20:51:11 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde%4]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 20:51:11 +0000
Message-ID: <38dedc92-62a2-7365-6fda-95d6404be749@axentia.se>
Date:   Fri, 10 Jun 2022 22:51:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Content-Language: sv
To:     Codrin.Ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org, wsa@kernel.org,
        kamel.bouhara@bootlin.com
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::23) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a963a99-22fe-4d7b-c02b-08da4b22f394
X-MS-TrafficTypeDiagnostic: DB9PR02MB7817:EE_
X-Microsoft-Antispam-PRVS: <DB9PR02MB7817CE6E3012121DD99333DDBCA69@DB9PR02MB7817.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RS9u0aEmDztEKpv/5beFXiwrEbBsip8Cu/9TwRv5Py5xWLmZgXND44ce/jdN8FhS2YHmRjw1H/zWEp/tXusqXF23llDQmZlwAg0QalUChknCQ6Qyzt0ybUYmM7p7fAj+rhzoEarjCZR7VgR3wF1mTUvozLUaLBm2nMXhDUlC0jCyeR6pUiN3Ol0ZZROM81+UWTvGS4WrkJJlhc+vSz8DrY+hMCjGbC08KT/reiLsnZCbqCMyAo8i7YllDhntLM7xMms8+hv2L8LFcULyt8Rx3zqpYUmNZWyGayPgRQ/FUYXIG1UbyslrIFPF3nqF7UTpUjPSSVHFOiPjFLuQNfHQlwjLbYJ8IRy/TCR6CUxgj8TKl/SnS32gwfnCplk/T2dALM6tQ214q9Et2XqW+huvD2M7S4HqVR2vqSslYKe5iY3tplVXoyItYZzYSy4GsEYynq3XPs69mbQr05SsuGpHCcgZU+lLG5l3h03FTdZv3OIy9pBtzLB8Vje2w5+BrqKIXz/55wpeeyizgy4+RwVrKbwQN0oMlHTSDieicKGUfEZVNiYo9h/03gcJRgMvZX8/r5/jM79uOdUCtBG9xCzgz5ZBj/R88DaSPh0x+YyCARcHDPBPxpzAjfBeLdbCMjs/wmuNBpcghw4KhvLH4XMzvDRNyOVnUi16fL73m/31iDBkNIPXJnvtgSmufMQjI0S8U14IAsdcePcHRAv1pK21zAKASEKuAWXxnbSaLNEZgQa5V+hZTPRLEnmRhiFtw/o9JutVC7ywXnBmT2DnFlqsojceTxGjFo7OvA/SBf9HLniYyqP9jTJBOm3HCbuE6E2P
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(39840400004)(83380400001)(6666004)(186003)(2906002)(36756003)(316002)(31686004)(38100700002)(53546011)(2616005)(86362001)(6506007)(41300700001)(31696002)(26005)(966005)(6486002)(7416002)(5660300002)(66946007)(66556008)(66476007)(4326008)(508600001)(8676002)(6512007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ynh1eWlJejJZcVoyNDZSRzFWN01YV0tUVnVmU1Y5RFg2VjAyTzRBSERFdk81?=
 =?utf-8?B?b0w0dE5Tck01NzI5TzRSWGpZYVArWHl5aWVYN3BCWEJIREI0L0plWnV2U2FO?=
 =?utf-8?B?bGpIbUV6T2NwRmszd2p1Z3c4L2ptSjVJQ2RsMC9BNVNPWGdkbnJYNnQxYTYz?=
 =?utf-8?B?SGhHMjAvTkNTNzd6QTV4K3hGV0NlVGJKQmhOblhQeHNTRWVzNVhmVXpFZXNx?=
 =?utf-8?B?eDJ5UCtuaUVSeDNva0Rzenp2UXJSa2tNS0c0RDRBZlZKQmVlT21USDZYRFZj?=
 =?utf-8?B?T0g2ZWx0ek1ld2NlRGNqb1doTXdvdWNEWVUzMzN4OGhFdlNaTUN4Vmk3VTky?=
 =?utf-8?B?aUd1L2lKYjRVWU0zSGcvRnZhVER4VFF3bVkwaFQ4WDRoOWlxd1pZM3FIUEFC?=
 =?utf-8?B?VWZDZi9NNXFISW84Qk5mK2hERi90bEZWNEFFTk9ZT01zd1BWUXRvK0RqdW13?=
 =?utf-8?B?Vzc4a0lkQVo0SFFDN3BjelVGUlJkb2JSMHlkTG82bjE0NWRUdzFtem1qVEdi?=
 =?utf-8?B?NHIzWE4yeVRSYkdoN1hMR3JCZnlHNmd5dWJkdVJuTGdQdlIzS0RlenJTa2lO?=
 =?utf-8?B?cmhFNms5K1QyditPRkJuMmxJZ0M4Qlh6N1M4bndGZTdoUkNwOGR5TUhEMGxV?=
 =?utf-8?B?SnpDNU1lb21hV3QxNVFuTElXd29kRnRjSEJyTTBEM3phUGpmL3M2UU9QR3Rn?=
 =?utf-8?B?QTM3blIwZzlOMjlib2pEYXNxK1huNExLQ05hZG8ySWQrWThscTBiby94UzRL?=
 =?utf-8?B?TndzZWx1T20vOWowNTJobXBtVWNSbG5LVnNLTlNpNVYzZzBnL2VoUmtGaEpL?=
 =?utf-8?B?ejh0dXEyMDh2RXZrc0FPenp2azhpQ2J2a1g5L0xjakQ1K1JhQUVMZzFGZjhX?=
 =?utf-8?B?cjhCYVVFTjZOU2plUnR3RWl2MVQxSWhGdXFYbmIyNFpFOWZ5ZUZKazJYVXN0?=
 =?utf-8?B?WjFTU1lscTNYczJVMCtqZ1dBeGZWU0phUUFIa3RkTDhVMkVYOGlLOUVZNTc0?=
 =?utf-8?B?NVp1dTlJc2pESEdnNEpNSXk4c2cyMWJjNjlVb0RPT3dnSzl2YWpjcW5VRzJT?=
 =?utf-8?B?M3NCYkNkakY2b3RlSnQ1YUVSOUFVYmRrSkRCaUpKakppdzQ5Zy9OTXFMS1JE?=
 =?utf-8?B?QkFYNWJVUlc3V3BSRDhUSzBQUHVWa2VZeTQvUVU2b0NvN3dtWGltQnFBdUxX?=
 =?utf-8?B?bnBCVTNHcWkzTm1LTnBMd0FoODZJRHR0NUZBSzlQY2UyRWJhRXRhSC9DcnZn?=
 =?utf-8?B?UUR0RkJJOFJqNDJHZjk4OEh1SkppVUR2TVpUcEdQSTJDbEh4Z2trRjRNRlM5?=
 =?utf-8?B?Mml2dEcwSjNhSWhBZktyUDliVEw3MDRhWHR1d1crUEFWZHg0ZXlnZjF4UEty?=
 =?utf-8?B?RGZCRENranB6MzgrT3R0dnh4L3RNYTFDSjNISUJNYXFxdDdzNWthYlRjNGVr?=
 =?utf-8?B?T1dHeGdwdCt2QzF0bkRYeFpNZEtXUjhIanpMMWhWUUkvalBkYkpQaVRWTkdp?=
 =?utf-8?B?b05oSUxnUzB6clU5SGZSay9wYTdsbDdIbEZGSU5wVlJyZU9WSG1rSFdXMWh3?=
 =?utf-8?B?YTRNQlhYK1VpQmpjMnJmYWRGbFNOQzdQV0NXWkthcE1LWDlFUHVKVTJxMjQ5?=
 =?utf-8?B?aE85ZUN2TER2M21VYVJ6NnI1NUJMckttSGV6ZEVKMmlhZEM5VW0vUFlZZjBE?=
 =?utf-8?B?YStVNEdOTDJlbjA0ajZqTHczeEhOcEU2UlZVWUtKT3d6QTZQK2tKSU1KZnhN?=
 =?utf-8?B?SDQrNElqK3ZjNzNzck4veFVTeGJDenRYWHZVYTF5MXhPQU1TajZHT2JUZjBp?=
 =?utf-8?B?ckgxOU9vTzdKZy9tWUs1MytTdzRSdjdXTXRiMUhuYWt2MENZZUtBOXd2SCtw?=
 =?utf-8?B?Q1JjNnU0VGNoQ3NDbEErUGh6Q1ViMTdBOHJMNmVwaFRuQ2JUblJzQzR5Zksw?=
 =?utf-8?B?SGc5d0ZLT0hVUDNQUEtHK2QwQlUyNk1uT3FXM2tWck1NbEdoYktyYjJySWNE?=
 =?utf-8?B?RDdiS1dmSElUNUkvRFlkTS95WVFmOEZxZW9tZWRsazRudUxvN0tVVElzNElr?=
 =?utf-8?B?U0NyLzZSb0xNeUg3OFFDdERhUHUyT1ExNEljMjBIdFZWbjRldFpTdzg3bkQ0?=
 =?utf-8?B?RnBZOGNES2lsRDZ2K0lnM2RYSTFKUGNvaDU4R01kemtwQ25tVUprbWJWbWpj?=
 =?utf-8?B?c201TG1LS25GTkwxRWh5bk9qeWRHak5CYVVXOUg0emlSOXFwZTVid3RnQjhh?=
 =?utf-8?B?b3BVMU9yZGJWVWIwWDlqbEZybVJLallnQkROVXZTYWp3aHkzVGs1UnZLd0dM?=
 =?utf-8?B?U3Zua2crZFRxWnJIaVJvUktPNDMzTjEyRWJ4UnQ5Q0lOR1UwSXRKdz09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a963a99-22fe-4d7b-c02b-08da4b22f394
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 20:51:11.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNDd6qpJtMYxH7Oq93J6QnwfXJYYGqva+KtiE49W+mRh5cygZe22dQpx1ZSZ+cN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7817
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-06-10 at 09:35, Codrin.Ciubotariu@microchip.com wrote:
> On 09.06.2022 17:28, Peter Rosin wrote:
>> Hi!
> 
> Hi Peter,
> 
>>
>> I have not actually bisected this issue but reverting the effects of
>> patch a4bd8da893a3 ("ARM: dts: at91: sama5d3: add i2c gpio pinctrl")
>> makes the problem go away.
>>
>> I.e. I need something like this in my dts
>>
>> &i2c2 {
>>          status = "okay";
>>
>>          pinctrl-names = "default";
>>          /delete-property/ pinctrl-1;
>>          /delete-property/ sda-gpios;
>>          /delete-property/ scl-gpios;
>>
>>          eeprom@50 {
>>                  compatible = "st,24c64", "atmel,24c64";
>>                  reg = <0x50>;
>>                  wp-gpios = <&filter_gpio 7 GPIO_ACTIVE_HIGH>;
>>          };
>> };
>>
>> for multi-page eeprom writes to not time out (a page is 32 bytes on this
>> eeprom).
>>
>> For reference, the current defaults for this SoC/I2C-bus, that I modify,
>> are:
>>
>>          pinctrl-names = "default", "gpio";
>>          pinctrl-0 = <&pinctrl_i2c2>;
>>          pinctrl-1 = <&pinctrl_i2c2_gpio>;
>>          sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
>>          scl-gpios = <&pioA 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>
>> I suspect that the underlying reason is that the bus recovery takes
>> too long and that the at24 eeprom driver gives up prematurely. I doubt
>> that this is chip specific, but I don't know that.
>>
>> I can work around the issue in user space with by writing in 4 byte
>> chunks, like so
>>
>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom obs=4
>>
>> but that is really ugly and gets slow too, about 20 seconds to program
>> the full 8kB eeprom. With the above in my dts it takes a second or
>> so (a bit more with dynamic debug active).
>>
>>
>> If I run
>>
>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom
>>
>> with a source.file of 8kB and the upstream dts properties in place, I can
>> collect the following debug output from at24, i2c-core and i2c-at91:
>>
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@0 --> 0 (-23170)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> -121 (-23169)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> 0 (-23168)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> -121 (-23168)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> 0 (-23167)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -121 (-23167)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23155)
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23143)
>>
>> And then there is no more action. I.e. only a couple of 32 byte pages
>> are written.
>>
>> With the above mentioned dts override in place I instead get this, which is
>> a lot more sensible:
>>
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@0 --> 0 (753629)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> -121 (753629)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> 0 (753630)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> -121 (753630)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> 0 (753631)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> -121 (753631)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> 0 (753632)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> -121 (753632)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> 0 (753633)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> -121 (753633)
>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> 0 (753634)
>> ... snip ...
>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> -121 (753883)
>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> 0 (753884)
>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> -121 (753884)
>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> 0 (753885)
> 
> could you please apply this patch-set [1] and let us know if it 
> addresses your issue?
> 
> Thanks and best regards,
> Codrin
> 
> https://patchwork.ozlabs.org/project/linux-i2c/list/?series=255408

That series does indeed help! I'll reply with a tested-by etc on the
first two patches, I can't test patch 3/3 with my sama5d3 board...

Thank you very much!

Cheers,
Peter
