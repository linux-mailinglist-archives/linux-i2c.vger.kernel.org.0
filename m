Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEF366D31F
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 00:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbjAPX0c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 18:26:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235539AbjAPX0M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 18:26:12 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A027D39BA0;
        Mon, 16 Jan 2023 15:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg+d1+bSNrGM1HaI86vsrYxQVRRe3RYu14WDumDQRAC4NvJWKP2fP8GDIL7WV3pmAjErjM1QLwX37NirLFRqMZBT4Tnv1lrK7cI+wWiaacGkv2mAVNiP9rDp80x+UO2JvRWczIOn8/yhiPfD0aCJulFzoxU/1H/xBUVOyM5svjhVb9BqRzlqIef6WVHrzk3YlZ3L5RPVorLHM4KgPyzdkRoLNPjqlXwW7dX1+1cn1XbS9vTuvmRPXgOsrc1tzBZ7qshUmKJlFI65n4//QXX8pHVfKnt3gsQz74QUcrKzumrDqNzhn4oX17VeuZr4CZvVvNYLq9SKl0R3Pv3veNegCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+OTizSbLUBLD0ULI2bb6Iseo0k2CqB+XTNaqhrbpHI=;
 b=lUJzfqmOFkh2XmsS8F2lVaeLaplEWP66p+Rigo7oOdUX+W5SWaSyoCxHafogxpT5kwjSU/MtAzFdy+VLZ5qeNa/gXvanuKIoHt+P0P+IaalzrKdOLZn4eZG/U0jYR1Fmk1OvbXa4ciyYd211qfCGjIuZkwhqq4RkS6h/Hhb6YTQYQcgnEG5GSk4aCm42ZI4YESygqMdXqvyZuG6HNzfAyJrFE1db+NaP4DX3FHghpoTYHFJicG3u3JEr9wLm1igrnzzs2ztbGGdBKqVCSTnKFapX8vT6G3xaagUezhNaGr4klAmHxqNmdrjZP+wQpOOHBNivxjxDcUf/Lfl2NMHdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+OTizSbLUBLD0ULI2bb6Iseo0k2CqB+XTNaqhrbpHI=;
 b=jA1M9ZB0MrfIANwVMdfBxwRdQZSY6JqyxP1a6O5TpDaPRIXdRkLy/x7uNJowhEyB9s9Izd7h+w3HhuowJjNBrdk2cyYSowoou0oRbp+W/Junk2fj8K9JVyI+bFmlRYnyknT7KVe4H4cTnFl1tMxbVARJbKff7hfjuX8ye8Senl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAVPR02MB9889.eurprd02.prod.outlook.com (2603:10a6:102:311::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 23:15:11 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%4]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 23:15:11 +0000
Message-ID: <622398fd-fb68-fc88-ffc7-23e1abfe48fb@axentia.se>
Date:   Tue, 17 Jan 2023 00:15:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] i2c: gpio: support write-only sda
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
 <af12825d-76b1-e1b8-216e-03761b265a6e@gmail.com>
 <a0fda216-e022-1f18-4b79-bfcc51983713@axentia.se>
 <6051bc58-4262-964b-ac92-25d263bd439d@gmail.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <6051bc58-4262-964b-ac92-25d263bd439d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000000F7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:25) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAVPR02MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a641af6-8686-4757-d0a9-08daf81783d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iz8eagZhA50WJVKMDiV5N4XI8qbfdEGjtYFnqa+8yDs8U6p+D7XwDm25FpHIb/rT66mbRtzppoCot0FN762xUJ4Gfmav6X4DXMrB1oAxGb47jyOSQBtKpZL70fcrCkXbxSrvxnqsyPmiP8q8A/hihuaArPwyHlTW5gXzm2DxVbfNubzbz4/7M4QOjFtYhmq3aM+cWnCjtA/nyRG2Ce0wv0g1LlCkBzoEwRePqCbEnb5Jrkupp+PYxk7fe7XN83S5y0G/okiPHAiy3BAgXbciJPe8Iy5o9FI+XYKIhTrGQ5+JnixxsTnpsdPZ9MD/AE8ey/l/lCY63o6XOp+HxpO89UQTszB08VadS2S/7YUzP+IhS0hXbs8N1fyM2uyQ1V/qFEb4B1jDSGdIlUKTJf31O80HCuiu9pJuZv98u0/W4/G87jvRJGPZMFBOFZRjsIotO24/JwqhkshMQLOzUNhee5L4pSijlW0E8ujL4j9eJ0b7ee7W7O7xZJYPDJvZ7L9iGrOzRXfliqwd9KfuZHbILWr5H01oczsNkhs52Lm9eSppg6c4dUCuL1vg8Ik7tyYhKlhitpNQJh/mQspj7CKDOYb3JaopbSaJpVWSDTOTFKMQjMAluTRQ17wIoo023Sk12wlKzTN9rfWvFxig0EBNwsGQFPcLGyDDQdB7yDUu4hWAoDsqGf1cqxLS/8intoE0yneT4xCHOQp4adobc16AlRUJnytuEq8TBQ+RQbCwsrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(346002)(39840400004)(136003)(451199015)(6486002)(478600001)(41300700001)(6512007)(38100700002)(31696002)(86362001)(316002)(110136005)(54906003)(2616005)(66476007)(66556008)(186003)(66946007)(26005)(53546011)(4326008)(5660300002)(6506007)(36756003)(2906002)(6666004)(31686004)(8936002)(83380400001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlCb0tDUU1JdjBCTlRFc2EvSzVXZHNvYk1lRU82UlBVRi93c1BnamlQdlNX?=
 =?utf-8?B?ckgwZXBVUjZ5cGZHMEV4WW9JNkxtcG9SR2wyMngxMlpvYmJzamRSK3ZnRkls?=
 =?utf-8?B?Tmg5SldsSURzdEJSZTVLclhXSDlOOFZrd2VBVnZidktWaDlDejVUYU1CNGdR?=
 =?utf-8?B?cEZ2Vjc5Vk9KSkV1M0hKQkVFNThlNEFCay81c3pyejFlS2ZPWmgyYWNtWno5?=
 =?utf-8?B?WC9nOFo3Q2hKeUpWZFdyL2ZwUTFVTXBVaEpWWkc2N0lBVWtCWXcreHJKU2ph?=
 =?utf-8?B?WS94Ny9ncXMyVDJ2M0NtTW91THJoOGlnenE0K01wYzIxQnJiSkc4ZUttVEQy?=
 =?utf-8?B?Q1FvMERncjhJakJEU0ZuWEJ4MXdQMTlPcG9XTEJTUytZS3Q2WkpLME9NeUhH?=
 =?utf-8?B?Z1lCVWlSVi9iV0lhQzFTOFM4ZlFuZTV1V1NOR3R5dVFVc1NKdTQ2b2JtY2NU?=
 =?utf-8?B?TEcxOStxQWlKSlV0Rms4Wk1MRURjd3RBSkdCNFBWcjVxR1ROQWFOUW4wYU1X?=
 =?utf-8?B?a0hZUXM3bk1jV2JCK3FOazM4R3dqTnFHQmNjM2pOZHdxNW5tanJaN3NQajN4?=
 =?utf-8?B?T2NhS0xhaHkvYUduTmFmRnUzZ1RteTRUeXBnQnpzMXZicis4cTM4d1JPNU1Z?=
 =?utf-8?B?dXdRVWJBaEt6YU9kUndiaFVKSXZKbjdyMG5LbTVaeUdtSnBFcWx3cUNOSUFC?=
 =?utf-8?B?T2V3d0tvVU9ZOEtDeURuS0tISXM2OVZKSUpDWEROQmZzRzN0cVo2elRuUitD?=
 =?utf-8?B?RXVvNXRSMVJJNS9KZ01iYm0yZ3VmSTRxcWxpSDI2dS9OcFdzS2ZTb1FLTGFi?=
 =?utf-8?B?TjJBYkhxVkFjL2FaalRiTTRMTzdXemVCdXJmWnhKOUt4a2JDYTFnVzM2WGRa?=
 =?utf-8?B?dmhUc0tJWjJqWm9PRUZpa1hYdjg0bGdYWDZiamF6cFpaa2w3VlhJWjlTL0xN?=
 =?utf-8?B?RFY5QVdNendwMG8zQUdxRzE2Z0xPZDlySWpTd0pIajZvTWhNaGpsRGtQUXEy?=
 =?utf-8?B?Q2pZK0xQTXBrVmo0enNQRHNrNTJISm5xOUtUMXVkVUZPSkk3ek5Sb3Y1YlJq?=
 =?utf-8?B?Sm5obXB0bm9UMWN1M1J5ZlYvK3ZSNnZtWTZmWm92andTWWc4MVF3R1FFalov?=
 =?utf-8?B?WDkyTGZMaEpOM0FHWnFNMGQzbktvQ3E5WW9HNktZZ3RoMVFjMG1qVzFVWTBi?=
 =?utf-8?B?OE5URzdRNHowMXE5ZDFiMjQ1ZklvN3B1QzJnWGhlY2pNeTNwVDlWbFVUMWJ2?=
 =?utf-8?B?ckw0S01XeXhBRDExU0x5TWx3TnRLdjhaZFphUmRKY1NoOEVOdm1XcVFEMFda?=
 =?utf-8?B?MTIzcmdwVE1VUjNoR05UcUM2bjhsWHBxajBmaW91UjcvZGNEUGVaOGV2Tm9L?=
 =?utf-8?B?UWN5L3J5OWhKQmUyMENLaEM3UVlnaEJMSWJQYzl6NG5iaTltWm8wL1NVMXkw?=
 =?utf-8?B?WllJTlNPVkZ4eEFxM3VmeFVlM0xTeUJjeUdBN0xxUmZuNzR6MEsvd0wrdzlU?=
 =?utf-8?B?bTdVbVFsMFVudzV0emIzMmcrUUpPUTdITUQwTnYyK2ZxMnA3WG1mRHEwdVNz?=
 =?utf-8?B?d1ZkOUkxaG4rZFdKWEtBcEVuc1RoZWRLY3phVWpRaVpXREsrZzBMdnNzMlRE?=
 =?utf-8?B?WDdqVWxNaVNJcGxJTHczYjliTEd4UkhRSUFmME9vUTU3OFVkTHh1MnZvUldu?=
 =?utf-8?B?REFYejNXZEdyQ0VocjBFeHdXdHhMZ0M3eHoxeDUwVmpYQnlNOVVpcnRGZHMv?=
 =?utf-8?B?Vzd4Sy9zVkNHU0I1bWdPcU9JVnREcjR4aUhzZ1lhYzZmV213NjlFd0x0d1pW?=
 =?utf-8?B?R1RobFdiV1YwZFhRY2hLZnpvWkp6RGp3dENxZGJLUk8xcmMrNEhoUTg1NnpR?=
 =?utf-8?B?V3VsMkkybWlXVHFVcXJRZG1YTUI4OEVrbHhrcCtrMFIyeFJNM2l3aitDcndR?=
 =?utf-8?B?MFIxS3NsV3ZMeTZsSEVuN2xQUmwyK05rMzBvYzJjQlRDdlArblorTWNMT2d5?=
 =?utf-8?B?dGYyNVZRYngxQ09VS1N0ZndLZnNTLzk2UWhwZVFxMzhuc1J1cXNkT2dYTE9a?=
 =?utf-8?B?K3ZqSjRkeVB3aGdFT2U5MlB0NDc4alJmYm5jcTN6aFZneVRkeHAwdWMrZkk1?=
 =?utf-8?Q?nJnKGLysKAbIXPJgA22AzR6bz?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a641af6-8686-4757-d0a9-08daf81783d5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 23:15:10.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 854G1+ihdycLfrVl48Jnpxy9VqghCdZk9VCTvoQs/niNzuJdHEtUDR0L7i3RzuG4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9889
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-01-16 at 22:59, Heiner Kallweit wrote:
> On 16.01.2023 08:18, Peter Rosin wrote:
>> Hi!
>>
>> 2023-01-15 at 11:18, Heiner Kallweit wrote:
>>> There are slave devices that understand I2C but have read-only
>>> SDA and SCL. Examples are FD650 7-segment LED controller and
>>> its derivatives. Typical board designs don't even have a
>>> pull-up for both pins. Therefore don't enforce open-drain
>>> if SDA and SCL both are unidirectional. This patch makes
>>> i2c-gpio usable with such devices, based on new DT property
>>> i2c-gpio,sda-output-only.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>> v3:
>>> - improve description of attribute sda_is_output_only
>>> ---
>>>  drivers/i2c/busses/i2c-gpio.c          | 14 +++++++++++---
>>>  include/linux/platform_data/i2c-gpio.h |  3 +++
>>>  2 files changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
>>> index 0e4385a9b..ea108d7e4 100644
>>> --- a/drivers/i2c/busses/i2c-gpio.c
>>> +++ b/drivers/i2c/busses/i2c-gpio.c
>>> @@ -316,6 +316,8 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>>>  		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
>>>  	pdata->scl_is_output_only =
>>>  		of_property_read_bool(np, "i2c-gpio,scl-output-only");
>>> +	pdata->sda_is_output_only =
>>> +		of_property_read_bool(np, "i2c-gpio,sda-output-only");
>>>  }
>>>  
>>>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
>>> @@ -363,6 +365,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>>  	struct device *dev = &pdev->dev;
>>>  	struct device_node *np = dev->of_node;
>>>  	enum gpiod_flags gflags;
>>> +	bool sda_scl_output_only;
>>>  	int ret;
>>>  
>>>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> @@ -391,8 +394,12 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>>  	 * marking these lines to be handled as open drain, and we should just
>>>  	 * handle them as we handle any other output. Else we enforce open
>>>  	 * drain as this is required for an I2C bus.
>>> +	 * If SCL/SDA both are write-only, then this indicates I2C-like slaves
>>> +	 * with read-only SCL/SDA. Such slaves don't need open-drain, and partially
>>> +	 * don't even work with open-drain.
>>>  	 */
>>> -	if (pdata->sda_is_open_drain)
>>> +	sda_scl_output_only = pdata->sda_is_output_only && pdata->scl_is_output_only;
>>> +	if (pdata->sda_is_open_drain || sda_scl_output_only)
>>
>> I have not looked closely, but I see no strong reason to tie the SCL
>> output-only property to the flags of SDA?
>>
> 
> Maybe I best start with explaining my use case. It's about a slave device that has
> read-only SDA/SCL and is connected to SDA/SCL GPIO's w/o pull-up resistor.
> If the GPIO's are configured as open-drain the slave device doesn't work.
> Maybe the slave device SDA/SCL pins have an internal pull-low, I don't know.
> So I have to ensure that GPIOD_OUT_HIGH is used for both GPIO's.
> 
> I have some doubt that it's safe to use the following. The master may pull SCL
> high whilst a clock stretching capable slave pulls SCL low.
> 
> if (pdata->scl_is_open_drain || pdata->scl_is_output_only)
> 	gflags = GPIOD_OUT_HIGH;
> else
> 	gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
> 
> I could use the i2c-gpio,scl-open-drain property that does what I need,
> but just by chance and it would be misleading to (mis-)use it.
> 
> Maybe add a property i2c-gpio,scl-no-pullup that de-facto is an alias for
> i2c-gpio,scl-open-drain?
> 
> My patch was based on the assumption that if both, SDA and SCL, are write-only,
> then only slaves with read-only SDA/SCL are attached.
> I can't imagine a meaningful setup where this assumption isn't true.

Oh. I misread the patch, sorry for the confusion. But now that I see that
you avoid open-drain and use push-pull simply because *both* SCL and SDA
are output-only, I have to object to the mixing of these issues. It may
fit your case, but imagine a case where pull-ups are used to provide
a lower voltage level on the I2C bus than what is normal for the master.
That could be useful, even if something is also making SDA/SCL write-
only. Perhaps exactly that low bus level make reading buggy? That case
would perhaps not be possible if the master then pushed SCL and SDA
higher than intended by the pull-ups?

So. Yes, I do agree that i2c-gpio,scl-open-drain and i2c-gpio,sda-open-drain
look very wrong when they are used to get rid of open-drain and am personally
for an alias. i2c-gpio,scl-no-pullup is perhaps not the best name as it
does not describe the hardware, but instead the hardware that isn't there?

IDK, perhaps i2c-gpio,scl-push-pull ? Is that too specific? Are there other
methods to drive a GPIO pin?
Hmm, whatever, I'm ok with i2c-gpio,scl-no-pullup too...

Mixing i2c-gpio,scl-open-drain with whatever new alias should probably be
forbidden even if they trigger the same code in the driver, since it makes
no sense to have neither open-drain AND push-pull, nor open-drain AND
no-pullup.

Cheers,
Peter

>>>  		gflags = GPIOD_OUT_HIGH;
>>>  	else
>>>  		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
>>> @@ -400,7 +407,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>>  	if (IS_ERR(priv->sda))
>>>  		return PTR_ERR(priv->sda);
>>>  
>>> -	if (pdata->scl_is_open_drain)
>>> +	if (pdata->scl_is_open_drain || sda_scl_output_only)
>>
>> Same here, why tie the SDA output-only property to the flags of SCL?
>>
>> Cheers,
>> Peter
>>
>>>  		gflags = GPIOD_OUT_HIGH;
>>>  	else
>>>  		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
>>> @@ -418,7 +425,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>>  
>>>  	if (!pdata->scl_is_output_only)
>>>  		bit_data->getscl = i2c_gpio_getscl;
>>> -	bit_data->getsda = i2c_gpio_getsda;
>>> +	if (!pdata->sda_is_output_only)
>>> +		bit_data->getsda = i2c_gpio_getsda;
>>>  
>>>  	if (pdata->udelay)
>>>  		bit_data->udelay = pdata->udelay;
>>> diff --git a/include/linux/platform_data/i2c-gpio.h b/include/linux/platform_data/i2c-gpio.h
>>> index a907774fd..e9536c078 100644
>>> --- a/include/linux/platform_data/i2c-gpio.h
>>> +++ b/include/linux/platform_data/i2c-gpio.h
>>> @@ -16,6 +16,8 @@
>>>   *	isn't actively driven high when setting the output value high.
>>>   *	gpio_get_value() must return the actual pin state even if the
>>>   *	pin is configured as an output.
>>> + * @sda_is_output_only: SDA output drivers can't be turned off.
>>> + *	This is for clients that can only read SDA/SCL.
>>>   * @scl_is_open_drain: SCL is set up as open drain. Same requirements
>>>   *	as for sda_is_open_drain apply.
>>>   * @scl_is_output_only: SCL output drivers cannot be turned off.
>>> @@ -24,6 +26,7 @@ struct i2c_gpio_platform_data {
>>>  	int		udelay;
>>>  	int		timeout;
>>>  	unsigned int	sda_is_open_drain:1;
>>> +	unsigned int	sda_is_output_only:1;
>>>  	unsigned int	scl_is_open_drain:1;
>>>  	unsigned int	scl_is_output_only:1;
>>>  };
> 
