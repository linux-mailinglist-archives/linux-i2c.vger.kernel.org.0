Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD65575DBC8
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 12:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjGVKvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 06:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjGVKvP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 06:51:15 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2105.outbound.protection.outlook.com [40.107.104.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807E830F1;
        Sat, 22 Jul 2023 03:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEHjYqYDYOyj36j6Pj5rBE0yafYZfcrh3b/QvGjzFpKrtlF1H2F5FwwU+zk0KyIMbH4NTUr4kYu9jCM1VkddANyukkt/MXuyYKS9LyXDtsLqcN24bOOehj2xJetQ+FEfCOaD2D1eEV9IU00k4chAEo3FEdjvfL/dzseTdEbSW4cVjgqlniKBs5w0U/74rz/VpMgNWTOMFxxj+0EqvcwjRkc72Uq2zHRS1KApDomQW5OVA9XhdRqTUuZ5oxpclPnbB31U2YL3YhtNeTNVOk7rcY56Cbl368Q3yrZtHwLRzf6n1lFHKzbz4IyfeYvzScR3pWHcDZA0xUm5kSiUjiJDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arVk/+InM2ZbSgPYUsFG5gT1WvqxnuajvAxONpA4y84=;
 b=RN6RQtntocyadrgK+x2MpUApq6zEdFzuGo/G6yVrepJKMblNnDLVlZ+HhbHbqzo/GOyun/OcTi32SBP8RSdTjYsV5lHVR0ZsWWUCPtqstnCELB+i1tjryexayMttgB8z/YFEDqCLrtpVrSWVNjLugwDLeKzEMzy7RV5BetjLcFzWNYk9M/Ai7y7xFaQwqKqK5PN67RkLNyEddLjwKXfEzhtuPHfp5ozmL5hzZanw8ewS70vWchhOj7GJdE2V5OhgVxhpZzyRLoFpiUlgXDLyDTmSm+Vef97UxvhHH71kr8XhI3eIz2xTA4qMAeJ6X+5CJi5DH92OBhpiqWAOVYlVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arVk/+InM2ZbSgPYUsFG5gT1WvqxnuajvAxONpA4y84=;
 b=L+UNBOWH0WeYYJi2OlQG5BwlfNdiI1kxb1RKBN1HPP62Z01sxfBT7b2Fv06jnitsNw3XMdxNT8sjMMuDzG7/XATwwd9jVN8IcsStW68wtOp06Hlrl5bWrvQmrGqP7qMXfwKcF+MZQ6POqCOWxshQHzolpoYftd4of9hsf/TLS+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by GV1PR02MB8540.eurprd02.prod.outlook.com (2603:10a6:150:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.12; Sat, 22 Jul
 2023 10:51:06 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::2a6d:c845:6c5:2aad]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::2a6d:c845:6c5:2aad%4]) with mapi id 15.20.6631.017; Sat, 22 Jul 2023
 10:51:06 +0000
Message-ID: <9e900507-bdc3-21af-4ee0-017c193d5c8c@axentia.se>
Date:   Sat, 22 Jul 2023 12:50:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] dt-bindings: i2c: arb-gpio-challange: convert to DT
 schema
Content-Language: sv-SE
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
 <20230722095710.17496-2-krzysztof.kozlowski@linaro.org>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230722095710.17496-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0107.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::10) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|GV1PR02MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 319d7a4c-3c10-4667-ee99-08db8aa18cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F0zKFIpVExULpwIIL4k7GJ38+EctB+XIjDCPfD0A9vFnxHTzJL6j2g81YOTRrUtCN3EqGIH8eOB12fo52w3oJFHV7Vq/+t912EYbwzRFc6qQAR2Asn+0sqjawrZXCzHuGXpJRkbt0E4ilfGQUhFy9XyT+SyS1ukDdjMZ7/gJrfvKCrW92zxfGVBqm+d2FJpYbPBHLlB1wEbbHKfnSXuK/4B0JeEZSfnyyTbILGBF2rckO3o+FDmTbRxhgmbElbd6RdkRqv+ip1u6/dXT3msmXEKl/HjgRDOKQtU528jo7Kayr+6lfXoYn6MzIoZqyW5lqIU2U65brHhgeCtbmxmHL4YWCSaCU0Qc0YsH/TBXpc8TyidmfE3Uj07gjbypMEhiGR1rQ80k2yRqGjcbxUy2edRG0kBJD/RfGOOZWTKuYKPcCHWehoq16fjEIS8fJT2epnR0tgeyhDaN0iwP/jJPrQeb1jKAvcmIMDct0CuLNZ51tGTJOolJWgZj0LDZ5dNp7R+uLVNt8rEXSiGgyg9ArXqWuMp8O3hCWG3UTV3dMWBhtnALtKQB7h8ZH78R1qhL1igw30AvvjVU4O/JUAEPfVvWctD4DpLIaZBrlZZ8emoY/psD7q9QErc+wql7nwhW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39830400003)(366004)(136003)(376002)(396003)(451199021)(6506007)(186003)(2616005)(26005)(966005)(6512007)(83380400001)(2906002)(66476007)(316002)(66556008)(30864003)(66946007)(8936002)(5660300002)(8676002)(41300700001)(6666004)(478600001)(110136005)(6486002)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eStXZGVkdVo1N1BqS0xyS1l1R01xUmVCUVViTnR0WkcrbTVSMFUyVUY0M01V?=
 =?utf-8?B?TVNMNXZzTWhvYnhldmFrWno5Kzd6UUNLVnZTTkhPQkRZQ1J3SytRZHpNODlM?=
 =?utf-8?B?Y3Q2ck1EV1A1Zm1FWUd2VWdwSC9OS3ErRzdaRzVmKzJSaUZwWUIvUGE0eWxm?=
 =?utf-8?B?M0JRQ3lrK1FkK3RGQ3dJeFZuRFMyRXRGeUIwTFV1SkNqR1JvaElJRjlsdEJG?=
 =?utf-8?B?Q2d4WHA4TzdjWk81MkM5VHF3N0ZzNnl3NTJMNEF4UFBuQ0tUUWRrK3dCaVVJ?=
 =?utf-8?B?bWkxQ0VuTFBCNFUyWE1MOE0welBTZUliQ1B4M09TdEQxQWNEaVgwbG1BQ29i?=
 =?utf-8?B?RDVDRHA3K1VYTEw5OGR2MWhvQ3VZRkVRRHdwRmtQdExHMkNXR3RLN2FsR3Rs?=
 =?utf-8?B?N3dpTVNvbGdGRzRCOEhIbDNoRU1neUdlTVdyY1MvS2tROERHa3lUbXlJNnBO?=
 =?utf-8?B?a0t0aDQyRC8xQ05oSnRWRmZqaGFNT3RaT3d6UXBuMDcwaThXVUowa0NWVlll?=
 =?utf-8?B?YlBTQkVvWUorR2tBQ1l2NEFadXBTZVRoNHRwSWE4ZjIyUUVJQU9ScTRmdnA4?=
 =?utf-8?B?Z2NKOVpCZWpwbjJWVG5CZ0M3ZUlveU8vWFZ1SXZTazR1aFZDaE1BZE9qTStK?=
 =?utf-8?B?a0poOXlkVVJOemEyVUk5d0hmbWVySlo4UndlSnQ1aURoZE5uTVZJUVJ2WTZD?=
 =?utf-8?B?R0dWQ2p3dUFaSUE2WnJwODFuejhPQWxGVEFzVDltcUY3STdJZGZ1cnBsNzBV?=
 =?utf-8?B?bjNuUUd1RDBWeFQvSnNETjVMeE5rS3JGQkZaNmpnNTdVRFIzZ2ViRGk4aWdt?=
 =?utf-8?B?amFxUGZMMFR1YjQwb2RrT2M5b1c5RlhBMjJVTG5zUnBIUkJURHc3d1ZtQW14?=
 =?utf-8?B?eC9ucll5VGZmTjR3WFZnRnpwVTdpWWFXN2g1ZklyeHRMK1hWNERUYk1aUmFl?=
 =?utf-8?B?SHlnRy9mQ3FMai80a3VIdkhGKzlvb0tVdDYyM0t3c3VzOU1pZEtjV2xPOW1N?=
 =?utf-8?B?Qmd6WjE1NTUvTElRUmRnaHJCUnRYQUM1ckxnQU5FRmJCQS8vVzYyTHZEREM5?=
 =?utf-8?B?cGhjTDNESWdRWUhGNW1LeXJZNzJZK3ZOVHdFNHBacGlKSkZZaVQzSjV1WVJh?=
 =?utf-8?B?T29jdzlsRjJ5S05iTUJrQ2Zob0M0WmRRdzVFeXFNMnFjSlZsU0M4Q0lzeXQ5?=
 =?utf-8?B?cG1LNHozSHp4dmRmdU41T0R4Y0hwRnhubVV5L0wxZzAwTVJueTJ6MFFpYWk1?=
 =?utf-8?B?S2xlTzUvTWFCOGVrVlJOMUllMk1PWVM2OUVJRzVCOFhsRkR3aWptVjl6M25n?=
 =?utf-8?B?TlhraElnSndaSWlHOFY1Nm9JOXY4M3QyYzhDR1JLQURlb01pZGdHS09Ma3pZ?=
 =?utf-8?B?WjQ5Tzc2MDdKd0E3SHlGYzhJaEMzeTFxaWxsK2p2U0lCTnN2WEZOVUlRUUVl?=
 =?utf-8?B?L1ZlNDFRL3F4ZEZOSm9UQ21ZTUVqYjhuQTBZenlxcjlraHVzNmtJeTNwU04z?=
 =?utf-8?B?Y3FHZGJzd2xMTVFtSlRnSDFvZ1lBSnFMejVDdFhmajMvb2FBZi9wcHJreklx?=
 =?utf-8?B?V0NzUVlvUldTK3graXJQSno5OC9SQ1lJVUpGdkhGcExwY2xmSkUzU014ZmJW?=
 =?utf-8?B?ZGlPWC9lTThvR2R2cUFKM0ZFYnlqQ29PZGdTZlM2eXhhQ1lUY3A2VVRtNG4z?=
 =?utf-8?B?akZKcFd6Lzlua0VXSFB3UTFwbE1CMVJqQXVKVkRvYUNicEN5MzVYWldoSVgy?=
 =?utf-8?B?cUx2dzhpTVpZcFRCcDdlTVhORFVuRVpicDk2eU9ocWJsdkdHTE9PQ0d0Z2VW?=
 =?utf-8?B?OUY3RlRqdU9GM0hickd2am5jRjBqV3FNYlRnNzhmUEtiayt0bTFldG1wbFpr?=
 =?utf-8?B?NHBKTWhwSnVXYzVVdXArU0ZCdXJJMEVwYm5Tb0RqWXlLRndRa3IySUFFNVpx?=
 =?utf-8?B?cWtDNmF1NVVyV1BhYTRHa1p3QXNDWThWSjVMSG83d3NYZVFKd2x4N3hBZlMw?=
 =?utf-8?B?eXMyQVd1RVJON1lKOUliTXdwaS8wNmR6bVdzbWc2WFJmb01KaHJKRjhscHNP?=
 =?utf-8?B?bGtBa1pzL2NucTFVd251N2d5ZlN0RFFmREtiRGU1RDMrRjN0ejVVL3RKZ2s3?=
 =?utf-8?Q?XGBmm/EbvKowaWtHZHvnjIALl?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 319d7a4c-3c10-4667-ee99-08db8aa18cd6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2023 10:51:06.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dboSOHETts+Kfmp/UQs96PhWR6Xrnzgb7Qc4M8+cgpQe99LZuTyb8tnq26P257eG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8540
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-07-22 at 11:57, Krzysztof Kozlowski wrote:
> Convert the bindings for GPIO-based I2C Arbitration Using a Challenge &
> Response Mechanism to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Douglas Anderson <dianders@chromium.org>
> 
> ---
> 
> The text of original bindings was written by Doug, so please kindly ack
> if you agree to relicense it from GPL-2 to (GPL-2.0-only OR
> BSD-2-Clause).
> 
> Changes in v2:
> 1. Drop i2c-controller $ref in top-level part, because only children are
>    I2C controllers.
> 2. Add Ack.
> ---
>  .../bindings/i2c/i2c-arb-gpio-challenge.txt   |  82 -----------
>  .../bindings/i2c/i2c-arb-gpio-challenge.yaml  | 135 ++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-arb.txt       |  35 -----
>  3 files changed, 135 insertions(+), 117 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-arb.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
> deleted file mode 100644
> index 548a73cde796..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -GPIO-based I2C Arbitration Using a Challenge & Response Mechanism
> -=================================================================
> -This uses GPIO lines and a challenge & response mechanism to arbitrate who is
> -the master of an I2C bus in a multimaster situation.
> -
> -In many cases using GPIOs to arbitrate is not needed and a design can use
> -the standard I2C multi-master rules.  Using GPIOs is generally useful in
> -the case where there is a device on the bus that has errata and/or bugs
> -that makes standard multimaster mode not feasible.
> -
> -Note that this scheme works well enough but has some downsides:
> -* It is nonstandard (not using standard I2C multimaster)
> -* Having two masters on a bus in general makes it relatively hard to debug
> -  problems (hard to tell if i2c issues were caused by one master, another, or
> -  some device on the bus).
> -
> -
> -Algorithm:
> -
> -All masters on the bus have a 'bus claim' line which is an output that the
> -others can see. These are all active low with pull-ups enabled.  We'll
> -describe these lines as:
> -
> -- OUR_CLAIM: output from us signaling to other hosts that we want the bus
> -- THEIR_CLAIMS: output from others signaling that they want the bus
> -
> -The basic algorithm is to assert your line when you want the bus, then make
> -sure that the other side doesn't want it also.  A detailed explanation is best
> -done with an example.
> -
> -Let's say we want to claim the bus.  We:
> -1. Assert OUR_CLAIM.
> -2. Waits a little bit for the other sides to notice (slew time, say 10
> -   microseconds).
> -3. Check THEIR_CLAIMS.  If none are asserted then the we have the bus and we are
> -   done.
> -4. Otherwise, wait for a few milliseconds and see if THEIR_CLAIMS are released.
> -5. If not, back off, release the claim and wait for a few more milliseconds.
> -6. Go back to 1 (until retry time has expired).
> -
> -
> -Required properties:
> -- compatible: i2c-arb-gpio-challenge
> -- our-claim-gpio: The GPIO that we use to claim the bus.
> -- their-claim-gpios: The GPIOs that the other sides use to claim the bus.
> -  Note that some implementations may only support a single other master.
> -- I2C arbitration bus node. See i2c-arb.txt in this directory.
> -
> -Optional properties:
> -- slew-delay-us: microseconds to wait for a GPIO to go high. Default is 10 us.
> -- wait-retry-us: we'll attempt another claim after this many microseconds.
> -    Default is 3000 us.
> -- wait-free-us: we'll give up after this many microseconds. Default is 50000 us.
> -
> -
> -Example:
> -	i2c@12ca0000 {
> -		compatible = "acme,some-i2c-device";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -	};
> -
> -	i2c-arbitrator {
> -		compatible = "i2c-arb-gpio-challenge";
> -
> -		i2c-parent = <&{/i2c@12CA0000}>;
> -
> -		our-claim-gpio = <&gpf0 3 1>;
> -		their-claim-gpios = <&gpe0 4 1>;
> -		slew-delay-us = <10>;
> -		wait-retry-us = <3000>;
> -		wait-free-us = <50000>;
> -
> -		i2c-arb {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			i2c@52 {
> -				// Normal I2C device
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
> new file mode 100644
> index 000000000000..5bf6ce14c2dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/i2c-arb-gpio-challenge.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO-based I2C Arbitration Using a Challenge & Response Mechanism
> +
> +maintainers:
> +  - Doug Anderson <dianders@chromium.org>
> +  - Peter Rosin <peda@axentia.se>
> +
> +description: |
> +  This uses GPIO lines and a challenge & response mechanism to arbitrate who is
> +  the master of an I2C bus in a multimaster situation.
> +
> +  In many cases using GPIOs to arbitrate is not needed and a design can use the
> +  standard I2C multi-master rules.  Using GPIOs is generally useful in the case
> +  where there is a device on the bus that has errata and/or bugs that makes
> +  standard multimaster mode not feasible.
> +
> +  Note that this scheme works well enough but has some downsides:
> +   * It is nonstandard (not using standard I2C multimaster)
> +   * Having two masters on a bus in general makes it relatively hard to debug
> +     problems (hard to tell if i2c issues were caused by one master, another,
> +     or some device on the bus).
> +
> +  Algorithm:
> +  All masters on the bus have a 'bus claim' line which is an output that the
> +  others can see. These are all active low with pull-ups enabled.  We'll
> +  describe these lines as:
> +   * OUR_CLAIM: output from us signaling to other hosts that we want the bus
> +   * THEIR_CLAIMS: output from others signaling that they want the bus
> +
> +  The basic algorithm is to assert your line when you want the bus, then make
> +  sure that the other side doesn't want it also.  A detailed explanation is
> +  best done with an example.
> +
> +  Let's say we want to claim the bus.  We:
> +  1. Assert OUR_CLAIM.
> +  2. Waits a little bit for the other sides to notice (slew time, say 10
> +     microseconds).
> +  3. Check THEIR_CLAIMS.  If none are asserted then the we have the bus and we
> +     are done.
> +  4. Otherwise, wait for a few milliseconds and see if THEIR_CLAIMS are released.
> +  5. If not, back off, release the claim and wait for a few more milliseconds.
> +  6. Go back to 1 (until retry time has expired).
> +
> +properties:
> +  compatible:
> +    const: i2c-arb-gpio-challenge
> +
> +  i2c-parent:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The I2C bus that this multiplexer's master-side port is connected to.
> +
> +  our-claim-gpios:
> +    maxItems: 1
> +    description:
> +      The GPIO that we use to claim the bus.
> +
> +  slew-delay-us:
> +    default: 10
> +    description:
> +      Time to wait for a GPIO to go high.
> +
> +  their-claim-gpios:
> +    minItems: 1
> +    maxItems: 2

I don't think there should be a max here? There is no reason for not
supporting more than 2 other masters. True, the current Linux driver
happens to only support 1 other master. So if there should be a max,
I guess it should be 1? But that feels like an implementation
detail of the driver. The Linux driver bails out with an error if
there are more than one other master, it's the only thing it does
with that 2nd 'their-claim-goios' ref.

Cheers,
Peter

> +    description:
> +      The GPIOs that the other sides use to claim the bus.  Note that some
> +      implementations may only support a single other master.
> +
> +  wait-free-us:
> +    default: 50000
> +    description:
> +      We'll give up after this many microseconds.
> +
> +  wait-retry-us:
> +    default: 3000
> +    description:
> +      We'll attempt another claim after this many microseconds.
> +
> +  i2c-arb:
> +    type: object
> +    $ref: /schemas/i2c/i2c-controller.yaml
> +    unevaluatedProperties: false
> +    description:
> +      I2C arbitration bus node.
> +
> +required:
> +  - compatible
> +  - i2c-arb
> +  - our-claim-gpios
> +  - their-claim-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c-arbitrator {
> +        compatible = "i2c-arb-gpio-challenge";
> +        i2c-parent = <&i2c_4>;
> +
> +        our-claim-gpios = <&gpf0 3 GPIO_ACTIVE_LOW>;
> +        their-claim-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
> +        slew-delay-us = <10>;
> +        wait-retry-us = <3000>;
> +        wait-free-us = <50000>;
> +
> +        i2c-arb {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            sbs-battery@b {
> +                compatible = "sbs,sbs-battery";
> +                reg = <0xb>;
> +                sbs,poll-retry-count = <1>;
> +            };
> +
> +            embedded-controller@1e {
> +                compatible = "google,cros-ec-i2c";
> +                reg = <0x1e>;
> +                interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-parent = <&gpx1>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&ec_irq>;
> +                wakeup-source;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb.txt b/Documentation/devicetree/bindings/i2c/i2c-arb.txt
> deleted file mode 100644
> index 59abf9277bdc..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-arb.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Common i2c arbitration bus properties.
> -
> -- i2c-arb child node
> -
> -Required properties for the i2c-arb child node:
> -- #address-cells = <1>;
> -- #size-cells = <0>;
> -
> -Optional properties for i2c-arb child node:
> -- Child nodes conforming to i2c bus binding
> -
> -
> -Example :
> -
> -	/*
> -	   An NXP pca9541 I2C bus master selector at address 0x74
> -	   with a NXP pca8574 GPIO expander attached.
> -	 */
> -
> -	arb@74 {
> -		compatible = "nxp,pca9541";
> -		reg = <0x74>;
> -
> -		i2c-arb {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			gpio@38 {
> -				compatible = "nxp,pca8574";
> -				reg = <0x38>;
> -				#gpio-cells = <2>;
> -				gpio-controller;
> -			};
> -		};
> -	};
