Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA45C7C5799
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 16:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbjJKO7Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 10:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjJKO7P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 10:59:15 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2129.outbound.protection.outlook.com [40.107.22.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1690A92;
        Wed, 11 Oct 2023 07:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuWo8l1jkoZuJ07tbDGRZHgRjzQqBdJxQwdvTsB6bsIEXWV7bm2TsougqC/VfN4OjKyL7unRYpb0ITIJLaseUsVVMLAJrUwfYJm7schD+o6H35m9MSFse45gltNKkXBQED/8gAoyvBPH9X0oKhM/IoV/F7NwEZ0vt58AqySFrwNUJLG6wNqtnrWPCj7OIQmYh1CrxcpsIu4ynD9bU5LlgOT1r8/FtHl1Ac0N/G6bONr4uLcOEgxeQZKzbUlgMAvW0Z2c/7aqNP6k8ZuLD9lE10Ym/XMwHX5svRhOkAk5CS3NfFhgy+OweFkTEgvsE+OLVy7mvdYWj8C0FIlKCF+kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuAto40Y7hByUQAc+nvsdMF9StIgNHCCZkEW8vc0jnY=;
 b=S6Z5LYXV6kJ0XL//46kGs2CCKiDubx/upoaqX/W8yn0XJJwAse+s5d30c1Cc1xmLRlnAJZgwSD5ogw0ZcBGSxsLMQZ69yQQTzfXusx51zUloBFmSOTeJ+o5eQkAkyneiSzNJ3d53SYJBPqkz3Bf57OkSYdcpkH48ehjsBBW8f3XSHXsSuWdq5F3s+BE8ZsQZDOQ5pTCfz4jkQ0EdrDtLdy5Mr5+VEM2VoniykpJjrihD2mGLR5PS9eACtEZtPDqac0xNwx+IEDRBbSTvmLzx5reUzJR5v22icYn6R7adh96tnrTnlm5/nENV/PqjkiECSPPiEmYmz6wDt0aEy662eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuAto40Y7hByUQAc+nvsdMF9StIgNHCCZkEW8vc0jnY=;
 b=Lk3lfPsfgJvnbvki9my3etMgFsz2XqmURN5pFA3EZqtK6/0mjEzs6reqj/7oEsDUXfBAb9/qbDyt+DEINTzbiHcSGIMdEZjM8eXt5yGixBULEe7VOO0lckZ7BYd3RTJyfcQHXwrHadQYQXWLm+NEuqWdtJlaUL5O2Wtp86dsUxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS2PR02MB8913.eurprd02.prod.outlook.com (2603:10a6:20b:544::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 14:59:10 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 14:59:10 +0000
Message-ID: <b660e39e-24ad-c755-7962-aa56e8cdf4f7@axentia.se>
Date:   Wed, 11 Oct 2023 16:59:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] i2c: mux: gpio: don't fiddle with GPIOLIB internals
Content-Language: sv-SE, en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231011130204.52265-1-brgl@bgdev.pl>
 <20231011130204.52265-4-brgl@bgdev.pl>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231011130204.52265-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0097.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::6)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS2PR02MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: b31ba7f9-7ff8-4218-9724-08dbca6aa004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1e+OmwyaChvQU7rVmnxAQbQ7iReaaEM5MK5RQc4XMyWAifaNfYbimD31tPtckckO/BFWDhVaxitP58R16Qcar5TMjDW5arKBp2f8fHMA+pFE4bbpmq1U3/8aBiuqj6+eoXl5I+0xpb/glqzURZi6tKKzXGQ69+5Fq1VEp1vCfM0xkTD++olpccIcOkZlC3jgtt5bWhAC/TydxZ+n7UuGfMsa+9G7VSqhTwS3YD04f1TGDUf1V7vU+7M/mdMtFJ4oDkIWJCIAQ1+iwI+mhB4k/mr25FKkQGKSoqSUaAdNMwn5JqYquFmM43VesppMfFBvpy8hzzCs4uV2wXmtk+M5xER6nXfGU75j1jnrXIFtNdu8QXSB4MC79PvmXEyiiMsmLzc00bLH8xzGCsMDa29HB2YFHBk8yd4IwNfl8zW9+k/WxPADAI4pDk7EfSPzPDMto55h3GQ2KZGFOKDTYW4EUde3DXWE8ByYPo08+9H5MSSSNs2RSozdf7ETW0suaxeK52+jdX454D+GSvxNhsX2V38YBQOCyVhXo7IkIW1xvFpRv2TJFUKHwHOajaIQYg1umyz7ZiF79MR3cjSJ9ujgzl1vdTj1ZE/m5tUGzcdIVP40v70jW0adC3JSAQwnSktzwX+sITjugxk0P8tBnfPpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(83380400001)(316002)(26005)(2616005)(66556008)(66476007)(110136005)(5660300002)(4326008)(41300700001)(478600001)(6512007)(4001150100001)(6486002)(8936002)(8676002)(6506007)(36756003)(38100700002)(86362001)(31696002)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzRXUmZIUEU0VW1tRGg5UkVIWUpsVjFPZjhtaFB4OGM2K3NuTTFjNjNpOG1y?=
 =?utf-8?B?b3g5dU9icjh1ZDRTUC9tSzl4QUdzcVZEdEhTV2hxeXJ3bVVZM2pXblZOazYw?=
 =?utf-8?B?OEY2bE0xYlVOUU5qaUhMc1BUQk14Y3hFeWpOQVJlNnNQemUxQjlaNVVnSG1S?=
 =?utf-8?B?R1pZTm5NMytVM2U3ZVA2OTFKVHhQU0NIdDEzMksyM3VKT2NYNm5XZ25HZ2do?=
 =?utf-8?B?R2k1QzhBYzcxRUFBWGEzUVE4MXlNeFBtNGhxRm1tVXhScjBXdFVLNmUrdXBK?=
 =?utf-8?B?bVROODE2cHNRVjQwRGl3TEZJa0UyQTBodjR0Ti90NHB3bHUydE1HYmtYeFZX?=
 =?utf-8?B?eE1iSVVKbHg1dVVKUWYrLzJUU2QrV0dDSHZOMStPYjNrWHE4WFNmV0JkWTFz?=
 =?utf-8?B?SHFsbWE4NnFheVo0UXhXTC9sV2JVUXFiWVJUVFNCZ0loY3BaaGtxOEUvQ3Zq?=
 =?utf-8?B?NDYvWkVCeVg1czNkbXlDMlZLQXNSREphWDlIYzl5dHFRRmtLTHJFZkR4M09l?=
 =?utf-8?B?ZWhKWmtpa3dQQnNEak5JQzY2S0YybCtQWDI4MXY5WDVkSGd3L0ZRaXR1NFdL?=
 =?utf-8?B?dCtzTURLUndmTWdwaDQvdURBd1NjdVRuaFFMWDNrM3c5ME5QeHNuOWs1WjVm?=
 =?utf-8?B?Z3lrR1ZhbUpoRWxkeE5FWmlYNUt2ZlNzeW1vSFZxeFVSbjlSRE42dDZIRVc0?=
 =?utf-8?B?dWFrYjBRSkZCZ0t1eTIxR29obHdwbGppS0tsQnBDekxKbkpKdFNRbGhnMkF6?=
 =?utf-8?B?WWRnTnB3Z3lqRk9MVVArUS9nZzFtSUpjTnYxMGVldklHTW44UGJERkhoZStN?=
 =?utf-8?B?b3NucE40WFVQUjgwY25aajBueGVROFd6NVVyMWFkdDZadnJPSnUyc3gvMjE4?=
 =?utf-8?B?ZjRCbFZkUjZWZVp1VW0rMy9nelRad1U2bUJVTks2MDEwdGZwdUltRll6U01o?=
 =?utf-8?B?YkhpTjBDcHRGLzhCdlczRDB5dDRXSE5LSTY0OE91bUpMempOTmVrNXlOZWlE?=
 =?utf-8?B?UDUyMkt5N2VWUlNZcWx0MERoWERLckRnYlhmMVgwOFhsR1RJSWFFUVlnT3My?=
 =?utf-8?B?SHlZMnJMUGpCRnNhY3R5QktpVC9yRFBKSStJWEhqWXVDWXdnN2VoUkViVnVl?=
 =?utf-8?B?bmFvYXg2dGRCd3BpZVNKbThGeFd6MmpQOE45ZFdCWkluL2Rubldod2hPd3dz?=
 =?utf-8?B?dzNtYXRZQVVRdjF3V2Yrc0ozUDd2UlJPdWlPcnc1UGJyRW9La3lMZEpKaWtv?=
 =?utf-8?B?a28zTnlybngwOXZFUGdNQkliVzhPWXBFTEZkS05ldk1zUGFQdWRDVmw4YUQx?=
 =?utf-8?B?dXhsZ2d5cmVRNmh2bDZOOFVFdnU4RGhtQlVPZldQaEVZSHl4MExaVk4yWklR?=
 =?utf-8?B?ajRIMkxkbURaemRxY1o5UHhRR1YyMTROckM2a2NTeTdDbzZBcTlaandSWm1r?=
 =?utf-8?B?MXVodFR3TGlMVU9vTDRvOUlkemIvb0dMMXpQUkNVb2FHbDI1WVdqSmNKQ3Nw?=
 =?utf-8?B?OU42Qm1IODlFM0dpZ1ROREtFTTdxUVpMWjRqckpjTlFvQlNlTFF4ck9zUjV3?=
 =?utf-8?B?YnVlWmVBNE5GRHRxU2VvOW43OUJjaTJwbjUvdVFwQlpZNGhxK2FNbkZOazZX?=
 =?utf-8?B?ZldqRTk5ZVdHN3NiN3BGTkk3WWxUUjIxUnQzNjJkVEFvWVFFQXEzcWdhTEJY?=
 =?utf-8?B?SmJyY0NoVjE5RlpvOWJMTVcxRktsK3FqVHJVcFdZUjNFbEtIUmlQMVJ2L1hv?=
 =?utf-8?B?NlBHclhZdG9oRVdUQnVia1VnQWo4bTBrVmsvWlU0UXc3aUkvdUpiRkp5L281?=
 =?utf-8?B?M2QvTFhXbDJCU0ozNEE0QmRlOWh1WXFiTzdaSTB3L3RLdVpQaHRWZ1ZqWWZL?=
 =?utf-8?B?Y0Evd2lkMUdvSnBXd29EdEM2MGYrM3huYlIrWGoxMmZPdlREek83WnpKN0xZ?=
 =?utf-8?B?SmNTaFlLNnJtWkpJWHBVdUtsNk1jZHQyNzRUVldkQ2J6aGZ0aVRJd1N4U3hU?=
 =?utf-8?B?enZkZFIyb1E3dzIxSXVaNE1LejdNTWpPeHpaMzAvMzhVSUgvckRhSVZJZ2o0?=
 =?utf-8?B?ZllFaWZsS2RDNjlXZUc2dS90cUJ0RXNnTmVJdnRHTFk2amwzR3VxTU9ZNmpw?=
 =?utf-8?Q?NwfVIgSMR4GD7LDQKorLng14J?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b31ba7f9-7ff8-4218-9724-08dbca6aa004
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 14:59:10.4094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFKNu2sjZ7zta0p9LmuS/2hXzqc84YBGhVYDowwsM1dLYJPYAM6ZrLDhuMJw0w8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8913
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-11 at 15:02, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the relevant API functions to retrieve the address of the
> underlying struct device instead of accessing GPIOLIB private structures
> manually.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/i2c/muxes/i2c-mux-gpio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 5d5cbe0130cd..48a872a8196b 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -14,8 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/bits.h>
>  #include <linux/gpio/consumer.h>
> -/* FIXME: stop poking around inside gpiolib */
> -#include "../../gpio/gpiolib.h"
> +#include <linux/gpio/driver.h>
>  
>  struct gpiomux {
>  	struct i2c_mux_gpio_platform_data data;
> @@ -176,7 +175,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  	}
>  
>  	for (i = 0; i < ngpios; i++) {
> -		struct device *gpio_dev;
> +		struct gpio_device *gdev;
> +		struct device *dev;
>  		struct gpio_desc *gpiod;
>  		enum gpiod_flags flag;
>  
> @@ -195,9 +195,9 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  		if (!muxc->mux_locked)
>  			continue;
>  
> -		/* FIXME: find a proper way to access the GPIO device */
> -		gpio_dev = &gpiod->gdev->dev;
> -		muxc->mux_locked = i2c_root_adapter(gpio_dev) == root;
> +		gdev = gpiod_to_gpio_device(gpiod);
> +		dev = gpio_device_to_device(gdev);
> +		muxc->mux_locked = i2c_root_adapter(dev) == root;
>  	}
>  
>  	if (muxc->mux_locked)

Very nice to see that wart gone! The only small question I have
is if these helpers are needed elsewhere, or if a more "direct"
gpiod_to_device() would have been sufficient? That said, I have
zero problem with this new code as-is, and that detail is of
course squarely in gpio-land.

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
