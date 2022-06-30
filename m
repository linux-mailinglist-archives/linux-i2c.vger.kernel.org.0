Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585FD561374
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 09:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbiF3Hoj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 03:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbiF3Hoi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 03:44:38 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2110.outbound.protection.outlook.com [40.107.20.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2797831F;
        Thu, 30 Jun 2022 00:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY2Nssa/wjUaSFR7x8pBETm3EyQE4JuaQWcPNI7Ln1UhkitTBAaSz+HLY6+TSbhOr2mv6DrHY2ODLvHDbWSIl85Vu9MBei0QA49nYgI2tafc+zKnWibyopMxrjBgDt91mW5Iq7MZCLmkOEXx7vkyq/RVXCN2fHsQY+s4JnXJCKelRg50PMFQ7dvNYZHCC5DZ5J+bNIxELYWEXsVJpz9IqsxWIqXF13F37+FYiHaXfjhXjNciTU1EIHxWkIK/fPGMNbH3TizGs/ubNPW4INmnaWXyIvF8H1yy4ETWfftxvjyLOpP+hI89Az/TuQqAxwX3kUlvFoWxQbrzaHb5rPaxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGnLTaY8fE7hwjQhvTntfrnVf6s/PiS9faHqyaBVmFc=;
 b=QmYnFZzjcuZyqyWRff/eQ6JlwLxYe+EqaImY10LZ8sz+/c1tVc7T6g+8LphsBtNCuzmsxaJXIN/i0fR0M49a/pDxWGoJtJpex/X0OL2jfNqoDiF/VS63wU40e/SsmpmNdBnRBtzNXZvn56ajU5Dx5av1Ahj0k6g9pBR4tEMJM6li34PnI/YCsx7o2hE9sGy50NXHo2XcRD22pv9GFbNdeJUYXbjrSZ6P4mCFGVPQpat+R1+3x2ZG/n+NwnGVI6kMqwz6M4wgM23eTNS7/kWZCW2mIDE2Dm97oJZsx++pOxE0D/q9gA4PcSwmf9BPShrwWzSc+BIDSh+ytT+MOi31DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGnLTaY8fE7hwjQhvTntfrnVf6s/PiS9faHqyaBVmFc=;
 b=HZfGZMpSjEhXPWnKgOrtd1BdlTtNHbixLka4B+dGBjAM+FeSnlGeIaGRlpx2cMHXmLIOHa18He6nQ4Abz3ZUZOn1OJEpQxuvFGVAvPgD+tlckLxKT5KtLQGjpN5gBuqTdrksLuY+nk2Oote/3UQuiXHuBrH+0TbnIQlwvco22mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB7PR02MB5370.eurprd02.prod.outlook.com (2603:10a6:10:34::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 07:44:33 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45%4]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 07:44:33 +0000
Message-ID: <3503471d-2d5e-572b-39e7-d715a909749d@axentia.se>
Date:   Thu, 30 Jun 2022 09:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Content-Language: en-US
From:   Peter Rosin <peda@axentia.se>
To:     Codrin.Ciubotariu@microchip.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org, wsa@kernel.org,
        kamel.bouhara@bootlin.com
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <38dedc92-62a2-7365-6fda-95d6404be749@axentia.se>
In-Reply-To: <38dedc92-62a2-7365-6fda-95d6404be749@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::31) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e8067b8-4be6-4ee3-0060-08da5a6c5fa2
X-MS-TrafficTypeDiagnostic: DB7PR02MB5370:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzpz9anhlZHTgkZs6sEVMbDFtaZDetrplMsK7nStnGdZCqGJS5HaYgDagZUiqiU5M+DyWcQzn9cVWHbILkwMNT16H/V6rt8f2U18hs4uQVPlqNCQycu+4fxvlUJsHi2lkJoqw+2rWzyr5dF6korM23RUjp3xBznr9ouhfsx0cfN7lCmgIjHESNAyZPKVwM8kokvPscuctnfWGr8gL/2Xd3XRAvrz66MYV44hJnCBOfyazDqEvZuyP9AwCLcwPB9z+2ye0yHQ4aImbZdAApSzrHWofF8+vUPRsYNtkaLrrSVI3bnXE2q1qb7XhwjK+Hs6hk3ncd9BBjC2kN6ZVte62TPnfR0HdJpwtiw7C/bScANTAk0CHhFQZo+dHFKDDTB5CAPFOxdD0iJlqxWQpDopuufyAr0eTJUV7sKDGxYlpBN6e9EL6bH3mcjRkJjcmaKD8gqFIRtDNJAEMdabNJpfrJ5hdtuFTsFJslN2dm+RJl5kv/oIKv/LQOqK7SwAbzpV1fTmSNgMH49gRF8XrwdSKIKFCATM8VOYA/6ByA5+mhbwiPfdoRy7ZuSdU0HLgmsmBSiMZAjgEEzWF3h9XKfblJ8AubeXlrwUhdaWv9oxdTxxvmKK2MENGD6QIAiBuX/Txlhlee7qQQspHPaJnNR5T58jpt1HPoTIDTjilAYbmFZrOky1Pc92mZGPYe/0yZ+p/rQVAVxK7lDYFOyALP2jzz75fGkGgOX9IfzRRYt05NqKopYMDUF3Q0fCcwmGEK6vNNnCGJcm35gW0lgvKafsJfxzRSo1Py+5rfSz/7JvhYz8UoQ0OQ+y3sifvTrvWvesluXOJaYDQ4/on0Ylpms+gcnR0l/9wvA1LHunSIjHaV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39830400003)(66476007)(66556008)(8676002)(36756003)(4326008)(7416002)(66946007)(83380400001)(5660300002)(8936002)(6486002)(30864003)(966005)(31686004)(316002)(478600001)(2906002)(41300700001)(6512007)(26005)(2616005)(53546011)(6506007)(186003)(31696002)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TktIU0oxWUFvRXl0eS9uSm9YNlBuRlpiT3lqWmpGOFMxRGRvZXhOMVY0LzF4?=
 =?utf-8?B?bVMxUWczMkcxNDBjTDhlVXZSMkM2dWJEMWFvN3FZWmxoL3R5NC9Kd1hwYy9k?=
 =?utf-8?B?RFp0a2VGRWZuY3VqdlZpNm1ndzdRdjZNSTZRQi9UcS9BaUdmQ25HNG9wMnNQ?=
 =?utf-8?B?M3A0SjBHQ1ZsWVIzaWRCU1Rzei96bVBHSHJPTWhDaHNDZXN2by8zNDZFM0hn?=
 =?utf-8?B?VVpiM3Nta0pQWG8ranF6TkNuMkp0ZXBJaVBoTWZHSHJJVUJuQ25sZk05QmFn?=
 =?utf-8?B?Qk92bjhOZEVObElydHRJTlRWdXc0dTEzaHk2RUVKUDdzUGFPQ1RiODRMZVU5?=
 =?utf-8?B?ZGZ5bEIvbVdZNy81ZUl6MWo1WjdrZFFvemtrNmN3dDl2MG1kTDEvQ2xkWFM3?=
 =?utf-8?B?ZU5xT0dZR3VMbElCaDFEWFJIbjVtZ29XWUlsT1RyZ3JLV21kSmgrdnZMVzNs?=
 =?utf-8?B?czhnMWJIaFQ1QmZRR2g1SGp3aHI2eHN1KzA3azlPUjRlWUxXMXNGdGUyVFNk?=
 =?utf-8?B?d2poMmxzU2lCeVZiV1FqaDFweFFmRCtvODZnVUtWYVllRUZUc2psaHg0bDZY?=
 =?utf-8?B?Mmd5c0FwNS8wZy9xK2Q4VFVZZ2lNYVk1WmpPeVRaNlF0Z1RPSCs3eHpwRTQr?=
 =?utf-8?B?cGpQRWRkQkNha3Z1bExkMHF1dVRBc2kxS1JUVVZCL0R1S2NxckpsaWdlUmpP?=
 =?utf-8?B?TTZzcERBSVNKTXJvTG90OG44NVZOZFM1VjJjRG9qZU8yb3Jrb1dqdUJqQW5j?=
 =?utf-8?B?VU1OckRrMmUwNzBZbThXUmc4bHdDTVlNa2VDMTEvbU8rcnFTamxBaXRKV0g2?=
 =?utf-8?B?UGNYYUR4VHZHZXFnemhhTE95aGxqbk5rWDByV3hkTC92REVVTU54b1lnTDMw?=
 =?utf-8?B?WlJRZEowYnMrOC9Lbk5MaDFwWTA5MHczdkQ3OWhkdE9VaXI3Zlhkbk8xNnVI?=
 =?utf-8?B?dDk5Q2pRVTJEbEpoY245Z1BhYmErV2lGaDQ0bUlzbDlJcnFGUXNBSWhnVHc2?=
 =?utf-8?B?Wkk0U2JHYyt4QkZzL1lnVFVMZHAydENYbTlnUHMzTmhCR2RCQ0ZZVlNnOGgr?=
 =?utf-8?B?ZjRGaldFSGZScXhKWUgrQWg0TTA5K3JwVS9HS0NESVFvMnNiSDlzaDJ3b25B?=
 =?utf-8?B?V2J1ZmNsRS9XaTNYazUzbjMrR1RnNnNTWkRuSW4zdXd4MjFUZHp1NkhrY3cz?=
 =?utf-8?B?UWlaTTFoZU9VOWhOckRZbzkybTNDcUZvb0pCVGVPZkY4VmpiVERmWnRLVU9i?=
 =?utf-8?B?TWVFRUNwY0tCZFJJK1VOVHVTbWRjUmhPWGVJVVp4RWdrK2NpSUh4eXFmRzdz?=
 =?utf-8?B?ZFg3ejJ1ZHpZZnBtMHpRVkxqRlZYTXB6VGF5RnMzcmRDWHNTS1p1N09odTVT?=
 =?utf-8?B?QjJGcFlmcW9scE1DeUs4dkhQdW1EN3hqR0prbzVQbzhXT0NpNTVRcjVYNXM5?=
 =?utf-8?B?WTJXeUphVFpBaGdFa0t2VXVvTmJCR1VwMGZlSmRyODIvNXVYblJza0RjNUlM?=
 =?utf-8?B?Um1hNHBCY2FYMGR4U3lBNW1pcUpKaEN0ckRBbWNjakcyNUFVWENVUlFBa2Uv?=
 =?utf-8?B?enpNdkxGSExDekU0VzM0MExORjFFQy9NTlFZZmdiaFZMRHFiTTMvQldXM3FR?=
 =?utf-8?B?N1BHaTJTa2NEaUpENDY5RXIxVFRsYWM2VDd6NEdwblY5NzZXMEpIMzJrYUh2?=
 =?utf-8?B?QWVmanZlY3ZnMVdaaCtYRFRKUnVQaVpxZENZU0NoMGk4WVNrYjYwejA5Vlhp?=
 =?utf-8?B?TVNZNE9DM3dVdnBzK0dBNEt0b0JsT3VyQmlWNmhwSC85bExDZ0JDT1FUaGFC?=
 =?utf-8?B?eGpiY0JkYW5Kb1JUdytVemUzV0dmYjVLVlpoU0piZHJEYTBHdnNQcGpxck1Q?=
 =?utf-8?B?cmt0RzgrK1VhVjlReFFFYWVpcS9iWGpwN1pNTkZ1SnFtMmc2Zmc2WU1icGg2?=
 =?utf-8?B?VjNuZnl1SDRlTjl3eno1djJtbDY1QVRMQUZ6Q0U4b3lzcU1Bd0RZSURLMWxC?=
 =?utf-8?B?ZDVJZERCaWVEbFJWaFlSYWJHOGlPMG5zZ3V2TDIxeU1YODRBbCttTk1yZjdh?=
 =?utf-8?B?QlBRci9VMEY4aDE0WElRNlc4WXVESEl1NldDSUJmbGJWVG9RdWNwcUs3aFJY?=
 =?utf-8?Q?QVxnyrYOFFYQgbnH3zN80vmeZ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8067b8-4be6-4ee3-0060-08da5a6c5fa2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 07:44:33.6266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dv6QusGoNIsDkd9TfJxJNwYbsrHIfoh7qLJGUIjgeHBXOedQjRfUhGcufuWvNM1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5370
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi again.

2022-06-10 at 22:51, Peter Rosin wrote:
> Hi!
> 
> 2022-06-10 at 09:35, Codrin.Ciubotariu@microchip.com wrote:
>> On 09.06.2022 17:28, Peter Rosin wrote:
>>> Hi!
>>
>> Hi Peter,
>>
>>>
>>> I have not actually bisected this issue but reverting the effects of
>>> patch a4bd8da893a3 ("ARM: dts: at91: sama5d3: add i2c gpio pinctrl")
>>> makes the problem go away.
>>>
>>> I.e. I need something like this in my dts
>>>
>>> &i2c2 {
>>>          status = "okay";
>>>
>>>          pinctrl-names = "default";
>>>          /delete-property/ pinctrl-1;
>>>          /delete-property/ sda-gpios;
>>>          /delete-property/ scl-gpios;
>>>
>>>          eeprom@50 {
>>>                  compatible = "st,24c64", "atmel,24c64";
>>>                  reg = <0x50>;
>>>                  wp-gpios = <&filter_gpio 7 GPIO_ACTIVE_HIGH>;
>>>          };
>>> };
>>>
>>> for multi-page eeprom writes to not time out (a page is 32 bytes on this
>>> eeprom).
>>>
>>> For reference, the current defaults for this SoC/I2C-bus, that I modify,
>>> are:
>>>
>>>          pinctrl-names = "default", "gpio";
>>>          pinctrl-0 = <&pinctrl_i2c2>;
>>>          pinctrl-1 = <&pinctrl_i2c2_gpio>;
>>>          sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
>>>          scl-gpios = <&pioA 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>>>
>>> I suspect that the underlying reason is that the bus recovery takes
>>> too long and that the at24 eeprom driver gives up prematurely. I doubt
>>> that this is chip specific, but I don't know that.
>>>
>>> I can work around the issue in user space with by writing in 4 byte
>>> chunks, like so
>>>
>>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom obs=4
>>>
>>> but that is really ugly and gets slow too, about 20 seconds to program
>>> the full 8kB eeprom. With the above in my dts it takes a second or
>>> so (a bit more with dynamic debug active).
>>>
>>>
>>> If I run
>>>
>>> dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom
>>>
>>> with a source.file of 8kB and the upstream dts properties in place, I can
>>> collect the following debug output from at24, i2c-core and i2c-at91:
>>>
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@0 --> 0 (-23170)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> -121 (-23169)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> 0 (-23168)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> -121 (-23168)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> 0 (-23167)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -121 (-23167)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23155)
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
>>> Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
>>> Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23143)
>>>
>>> And then there is no more action. I.e. only a couple of 32 byte pages
>>> are written.
>>>
>>> With the above mentioned dts override in place I instead get this, which is
>>> a lot more sensible:
>>>
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@0 --> 0 (753629)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> -121 (753629)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> 0 (753630)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> -121 (753630)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> 0 (753631)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> -121 (753631)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> 0 (753632)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> -121 (753632)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> 0 (753633)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> -121 (753633)
>>> Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> 0 (753634)
>>> ... snip ...
>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> -121 (753883)
>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> 0 (753884)
>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> -121 (753884)
>>> Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
>>> Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
>>> Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> 0 (753885)
>>
>> could you please apply this patch-set [1] and let us know if it 
>> addresses your issue?
>>
>> Thanks and best regards,
>> Codrin
>>
>> https://patchwork.ozlabs.org/project/linux-i2c/list/?series=255408
> 
> That series does indeed help! I'll reply with a tested-by etc on the
> first two patches, I can't test patch 3/3 with my sama5d3 board...
> 
> Thank you very much!

Since replying to the actual patches do not work for me, I'm writing here
instead. Sorry about that. As stated above, it /seems/ to work much better
with these patches. But I fooled myself and there is still some remaining
trouble. It is not uncommon that the second (32-byte) page in the eeprom
is not written correctly for whatever reason. I do not know why it's
always the second page that gets corrupted, but this is a bad problem since
the failure is completely silent.

Cheers,
Peter
