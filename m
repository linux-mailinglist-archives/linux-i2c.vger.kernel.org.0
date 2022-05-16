Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED2E527EF4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 09:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbiEPH5f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 03:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbiEPH5f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 03:57:35 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10124.outbound.protection.outlook.com [40.107.1.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E83EDF52;
        Mon, 16 May 2022 00:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNXDuuQbGpGChOhj9cDdIT37qBKqKY9KIguy2Zqo8KxEqN5p5thx2ttvvmlH3c0rocrpFbnW5PC1eJD5UIZ8FeSZxUOgIh4QjNzJK5D5Jalvh4+NM55vLwTQ5k0rP6HV0n5gHC6QIsyj4OYsr6LgcFzUMpwf5Ayw9cpRSAAxMJtYeQd5i/sor/YeO3jcxI2fEgqryaPcM7LQ00yoSLvJej6BMjoWr50UDfaEK/FesdTxGL+mNfdLodIQk2nQs+SMSACBv4lkLAzPEJzJUyBPQp4plWMJ1Y8Ux24ZMkH5HNoxmnn/bBjhjUhNRTOx3h7AU17cE4mMCiSCCfXn5a/XeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki9WpyuLfaT95UZh2w9SoTuS4dOD8CuOkUEvRX1vDQY=;
 b=HbtOSqvb4bgoOvNRYtpQX1z/VH/S94xSLttT6NZGJP0CHcui0kbB6ZwUDVfDScVwcjtq3NeY99WlQ0mnGfgMQ1xv2VayAhPrnXekYRwC/6ahx/vQB1ATKBQCAK4fMQpDgNy+8f/gc4EP1DpIi3+xSD2DfBjaDQ9SMaedeJatDyx3V626nxcuQ75EanmmWnnoTELWF5sPUQr7lW+jsygk1VKfxJMIUAapz6dsN6vDRx9GF55L9OISrlVCMg3Thw11VJrCRmU4nlSukFeZ0gWbKNaf23t/0Fm6l6XOZ5NqtUIgQayCdHXbrJK1D4mTC2yEIsO//o97GJ8zRIj9a4DEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki9WpyuLfaT95UZh2w9SoTuS4dOD8CuOkUEvRX1vDQY=;
 b=N3o/NfXnixwtywaqN5VzBEkA9qtBmsDwervtU9N8pSbyXbg/Z29s5oP9eQK0EPGJIWWJ/eRwhLaSeRtMc4vreDvhvw7Cv7EZW354EoRmqCZ/zHPfcOiN+LLFqIYuNEFqbsoyVLWvYVUJmaqJBj6COxbclLbecNmvnuKkAOAZD0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VE1PR02MB5680.eurprd02.prod.outlook.com (2603:10a6:803:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 07:57:26 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 07:57:26 +0000
Message-ID: <7ab1f387-3670-4b49-211d-3ff9a7c3d40b@axentia.se>
Date:   Mon, 16 May 2022 09:57:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, luca@lucacressoli.net
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
 <Yn+8CJ3j2SY2+Mq+@shikoro>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <Yn+8CJ3j2SY2+Mq+@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0048.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::29) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 324eaffc-dc94-4a7d-0a2b-08da3711b7e8
X-MS-TrafficTypeDiagnostic: VE1PR02MB5680:EE_
X-Microsoft-Antispam-PRVS: <VE1PR02MB56801DD089E52E4154B8C372BCCF9@VE1PR02MB5680.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OJ0bG5hK2Jl+FwlgTDywYK74hj+D1dFhRsmP4fWiM7SLFCIm1/zPXArxc34rKWcIeJa3E1RevA2H1vdjilzvTFsd0xtUU1J8PPd/rPFxuT5jTByUjSw5WuymavzUU+cv5jgn4GEMRhDGn0LsNWdRVGgPQsX0eJyjrc4SzP4LdaakD/35fioWOUZ2/AHgau2fADqrm7CM82q8m5qQX9esVGnWZw/RmuWNyZmyJVXhEexVF8tvAS6YXAKwSrCju6+Qs5jsgwbuwUfJEWIuJcpZfJ00MjPfHCv6267l7x7I6F7B4bzB2CX91WCOH632rl0P4P82OTYFOEA3epd1iwz7SZJYHSJ2dTlG2/OQyjBXpOdws9v3xDEXdl3qrhw0SXlAzRNeuKT3eGyS1VEplfR+z7nrCiAbW5gxfyZMjgNX8iPx/mcTnxcUQB9NMw31cnG3ueyEql9cbccHQtwdV+HjUosOZ2wTNSQ5D7IvUR4IiMEFG9oUiNMcr3zwwYZWN8IZ2ngoyuCZINwG2+BewICyIvAbMT5plBGsgCyQMKe+GYtWPlO2RTvJXNsnsahpvr41H6Q/RhNNEAUdjnqagBLZNl3uKXy/29VIzbpCHzoBsKym6p+mCzbFvzOIQMYwvp02O94Np14MJireTozsip750bEaIKHAUkv5ToFRIk95vejc9MfpNt8VKzvIdhddRJLcGdzlu22kUVw7gR0IOvzIkCU/abXg2uAPn2h4ql+QWnj3kV+QYJOhYmNvgDUBgNFg9pNKWEht+Knuhe8Y2zVyuXW5/wxO2uXk/x0dLkG2WWsgey3rSt86SJHbyVBM96dG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(39830400003)(376002)(366004)(136003)(346002)(396003)(186003)(2616005)(8676002)(5660300002)(26005)(6512007)(316002)(66476007)(6486002)(6506007)(966005)(8936002)(508600001)(2906002)(38100700002)(86362001)(36756003)(66556008)(66946007)(41300700001)(31696002)(83380400001)(31686004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REtWV1NIL0pZMmFZbG9JWVZMY1Brd0xGYkpsSGhJVk9BTWZwYnEzQUxWT1Fr?=
 =?utf-8?B?MXJHU2s3MUV2V250YWxWWEN4OFFzSmRTS0RxZEtsaEdXMTQrMXZTbmRKM25R?=
 =?utf-8?B?VFJJd0E3RWF2WEU2S29ULzZtS0U5Q3JiclZGNVNRb0w2aU9VSDA0UDJBVGps?=
 =?utf-8?B?WStxVEFvN05lZ2VOeVg0VTYrZXlENTB3UDhaRXhBSHBHcUR4elk0bFhPQmpS?=
 =?utf-8?B?eXZHRXJBdWJkY3dBKzgwbTN6YUFnZzJaUXpvOHB4V0xkWUVZaU9PUytSeE5C?=
 =?utf-8?B?Z0ZvbWlKeTRiN01Ea0RKSWhDOGxTVzdtK3BTTWVEeFdOTVlrMU5wWlpNaE80?=
 =?utf-8?B?NFFsNGFjRlBDazN0N2xoT1JLSUtweTRLV004NDAxQWswMHJNZkp1cHA1dDc2?=
 =?utf-8?B?dllXbkNVUk1keUlMNEZrU0k2YWxCVW9xWVR3aGhHbHRadGtDZEk3Vll2dFVQ?=
 =?utf-8?B?VWdhUVAyUllHOFhFNTF4SjRRaTVuTkRyUVpMTnJBU2F2ajc1QldTWFhkd2hB?=
 =?utf-8?B?VUphNlg5aHJCOGJtcUVCMW1hQyswaWwvSTNEMTNGT1hHdC94VVVWdmFCeTMw?=
 =?utf-8?B?SkhySUZuSUtxQ2pIUC9YdENkelNXalZJSjNra3phWUdWSzZmREFlVmsrU2lF?=
 =?utf-8?B?VmJ4dnBTQm1aVExVYzRXMWc0RzZXenJaNUkwZ201L0wxN0JPMEZsK0I2Y2JV?=
 =?utf-8?B?azZTWUNtNGFVNm1iYW85RWV1OWZUcVBDQXJiU1RndXJyVFZRMFNzQkY5UDBD?=
 =?utf-8?B?Rm9NVkVTTTVZR2J6V0tFWC9jbTZYRlloUmozTjFpdnpXcGdTVG84ditMMGhZ?=
 =?utf-8?B?VCtGVE1BS0x5OEIwWUJqNWVCcFZEakZZU2FXM3VIS083VlVsZmVQcTliOWlX?=
 =?utf-8?B?eDZJMHBUNVlkTFJrUnBXTk1ocjhRdFRnM1hLSHJ5czdVNldkbEhGSXExNzAw?=
 =?utf-8?B?by81aHI2d250UkVjZFVIY0p2SGFZWEN0WVZWZW5WZnRXY1V3a1lqa2w0VmtB?=
 =?utf-8?B?QkxERFRhS3J1QWNtWFRoYVc4cmFIcjJNMXpGTFpXVEtqbm51ZVY4V2YyZWhn?=
 =?utf-8?B?T0lvR3ZJY21sNjVtTUppY1hEK29UR0RTRHpUZm9hdzh1QkhxdlZBcWFEelJP?=
 =?utf-8?B?RGQwRzk2YVBsTllyQ2l5TWxpTVNOdkxkeis3dVcwcWphUjYzQjRqWThTdnZC?=
 =?utf-8?B?c0VQd2ZGL0ZnOVhhWWZ2am5UNWEyK016MUVJSTlKUGt2N3Z1SGpBOU9yZ3px?=
 =?utf-8?B?R3Q1Q0k3OHRYbDlpSy8xSU1ZWkpWbmdJUm1sQ20vaFJUa0h3VHpXenVkSmdN?=
 =?utf-8?B?RW0ybjVuaURzYWRReUdQR1JLbkowdGpjeEVncUZWdzVrVnJKT3pJSEc2WDdi?=
 =?utf-8?B?NVBjcmROWk45dS9KNGhhVUtpbXh1T3cybjZDOFQ3Y0R4dTR5Njk2bXptQTB6?=
 =?utf-8?B?a1grZzRVajFNS25ZRHZ4RjZRUm5KQlFZcTFnYTI1ajAxYzN6N2tUUEFNanQr?=
 =?utf-8?B?WVMxUDFNZ3dlRzU0bVRZYTZ1cFdsY2RlMFBHcVJacHk3UUF6N3V1ZHNweWJX?=
 =?utf-8?B?YmpOdnhWamhPRUlVbGU4T1RWRnVsVThXY005QUNuRnRHdTlES2NKaGppUDZi?=
 =?utf-8?B?TGN4YkNRK3ExdFlsZUw3T0RxeDBHaHRJRHlPVnBjaCtLOHFaenFQMzBXL2di?=
 =?utf-8?B?WFlYZ3ZlM1hOUlJsK2JlcXMrMGtNZVMvV2hIaW5BMmRtQ2o3UHdWQnF2dzZ5?=
 =?utf-8?B?ejI4U05NNHpERnR4QU8ycmIxZGhsZXhQbXFrZFBYdjNlcTZBZDYrd3NNTlVU?=
 =?utf-8?B?K2JtT2RQNVYvSjFqVjBYTXJIT3BqOGJnUHprVXRWdnVmYU9hYjl4N2Mycmdl?=
 =?utf-8?B?NjYyRUFoVEx4cEdBNGwxM1RSVEltaCszQ0NXRi9LdHg4MXFSNFVnZ2ZtSHhO?=
 =?utf-8?B?d0ltTmxvSHYraGxKWEkvbUcycTZQVlpRb0J3Y0JmTENoWnpBa0g3S2ZMV28x?=
 =?utf-8?B?ZVVTbXg0SFNvZk1mcDAxT2YrelIvQkJNY2crR1RNckxnU09CMVZlbStVVXcy?=
 =?utf-8?B?cWxCOFV6TWh3aTFxUlVvWkRWYjBCdEFLUU92dEpkNEtab21pYWI3a3EwRUVN?=
 =?utf-8?B?cUZuVGJMQWdVZy9INnZMSEJyVTRmTnlVYzNXOWd5clVSamZ1VW9MZ01YRE9j?=
 =?utf-8?B?ZUw4NENORDdzYjZYN3BvNFp6eDlZbzFQSFlyVEJ6OFdSMGJsL2VscVI1L0dy?=
 =?utf-8?B?Vk5RV1hnRjY1NnAxVGJSNGxWVnN2U3lzd2ZvSzNJZFZqVVRITUxPUUNHUjFY?=
 =?utf-8?B?OXBHOG8zT2JPOFpOcTVYWHMzYXh5L3N2L0RhYVV0eDBKQ3VJTUNBdz09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 324eaffc-dc94-4a7d-0a2b-08da3711b7e8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 07:57:26.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWNZsW3FZbGVEBOf8Ot4zH94X/DWDg2LmA2i8sCS+xCVKp35M3EaYKWL+ClYqO5C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR02MB5680
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-05-14 at 16:26, Wolfram Sang wrote:
> On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
>> When drivers with ->detect callbacks are loaded, the I2C core does a
>> bunch of transactions to try to probe for these devices, regardless of
>> whether they are specified in the devicetree or not.  (This only happens
>> on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
>> is the case for generic drivers like i2c-gpio.)
>>
>> These kinds of transactions are unnecessary on systems where the
>> devicetree specifies all the devices on the I2C bus, so add a property
>> to indicate that the devicetree description of the hardware is complete
>> and thus allow this discovery to be disabled.
> 
> Hmm, I don't think the name is fitting. "no-detect" is the desired
> behaviour but a proper description is more like "bus-complete" or
> something?
> 
> That aside, I am not sure we should handle this at DT level. Maybe we
> should better change the GPIO driver to not populate a class if we have
> a firmware node?

We also have the somewhat related address translation case (which I
still need to look at). [Adding Luca to Cc]

https://lore.kernel.org/lkml/20220206115939.3091265-1-luca@lucaceresoli.net/

If a bus is "bus-complete", then address translation could use
any unused address instead of from an explicit list of addresses.
I.e. the "i2c-alias-pool" in the binding in patch 4/6 of that
series could be made optional if the bus is "bus-complete".

Not sure how much value there is in that?

Cheers,
Peter
