Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442C366B809
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 08:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbjAPHSg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 02:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjAPHSf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 02:18:35 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7977859E2;
        Sun, 15 Jan 2023 23:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rha2+VznpfSLyh2XtBYAf+QLu44y8gk1PQe3+tXzwjqsaP11zZj8YfYcUc8HuoQj8Jkjzbpd26ohEqfR2VJWcWtEMhJzIeVYcHWqGAESB5+Qubo51o4CV4/W16Pf4FLVRIsac62PxsDlwD35Ik2/7SCBJhkRZXoyhgqJ2W1S6lCgmGUs6l8ypTFoPy+ZP3wg5jO9Z8mz7mbqZJaTBlaj7XYfeZccqXbxtSLxkPI3qQ15iMFDQIDFVr04F+Z+JuFd1af5skMrfI6VLwOhY12GCLG8sVn5K1vVd6rNLPqzBZ60hWBimDo/poLf8blKHuPOw2RrI4uHMUOk4492Gz40Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZDphaCna5TW/MDWmJZTA4xrL4sa2pUPK2K9rFF8Pvk=;
 b=nkeKN2KtbW4fDTW/XZFGCZWhc+azxNlc0cutd0PkForQIh8Z68qEi5xyqqDsirEvkGrHx6HDpTxbx87N0PXpi80Z64sUk+IaN2R6wIpegRa5dZ/uaFCxxT41tRd0wRol1GuAGsinCWBz1nPYgdJKeKG1KVxm/qDe8ecNoQoJ+sSTznB+wS8HsY/6VrhpwE959aBss6v0dWszuzGduhFU8KNi76e+1VRnc2JS0Tt1GZcEfs7Tvz0pRdCZzUCWel5cqBXNfzR2EuKRGscSPVYQzB9Og8jKlv2TXvEL2QjQwugEWZnJz7DKiy6AB48a78JYUyNBxldkxKIThWMztyHSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZDphaCna5TW/MDWmJZTA4xrL4sa2pUPK2K9rFF8Pvk=;
 b=RfYS8PUvbrFFXbj2ReEOzDWg1DPtEneZHtfuJdpCuzAF1uLuC6d1sS+Fm19Hxt7oGc4xdzLWRBLKKsw6h7eSLfxZpVNlglim9LPeR0FmEdrOsMiGu55wNwF3+EgCIQ3NdsyPZwDtfBJSwtYfVtg1weRQ8PpaOCNy4IS1KQ3KJUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DU0PR02MB9679.eurprd02.prod.outlook.com (2603:10a6:10:42d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 07:18:31 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%4]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 07:18:31 +0000
Message-ID: <a0fda216-e022-1f18-4b79-bfcc51983713@axentia.se>
Date:   Mon, 16 Jan 2023 08:18:29 +0100
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
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <af12825d-76b1-e1b8-216e-03761b265a6e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013EE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::1b) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DU0PR02MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: d290c4d2-f5c8-497f-a80f-08daf791def6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEySaFpow8Lev1RVsIda+SjPoFrqHLXPJjfpOvQZJmiChOfAzuiBZLopAi+KIh2d6RIkpVQmKng97KHYxI4XzvdUdRn61ncQQMPbgkfny+UUDwqlO63hPSf8Fb6dfU3hfHsJTRof/Ghh9JDeAlhE5gPPvYgpQx3Yd2DdlcwgYeDPwHXsXO8H090Jb6CNdOBrzOarS3t6ynj0IdBuP3+VcsCtIZhQTeLWIS0F1TOeZvqXkzD7n2/hTcRKfxS3HLcA5bsGmoCVIJ9tQDWMOovS3S3H7uZs84o8l+QOg+OK07Mku4feKzazJWz6qSiVnfb3Ca7ZgGt66/LHTMSawruZp1GgF88ktJE8qyvsPQgSnbdsnOfdO5ySSnrmpoMOfdHNgHz5YUooq7tp6clzcVBUTMb+BwZnAVGOw6W3SrA6yQ9wJskOoSD0lovR8U5QsHQYYes8B9UBhVtv3OPzWuyUoROgHXXWCQcvCn98Y1IKuj/WEbvPG+oO1rYA33FlHZtePAdXBpbB8W5/2NhcusEUBtKsAH8NiVfSw3mnYdYkLC5LPrYfNocp4wh0y9+4RpgxfJ4dLwkZL1CKNQ3Er1x9+BA3iJ9WqAHU+ELgmA/6d6ufet0jexJYu9HDoskmRvnR8RFOOsvvv8TWoeb47Zu6mVtP7IH6Ibj9kRR52occuZemX4dWwkuXBvBSW3a6SbY3bO8Nt3GV8TgDmdfb//CefhdqTrjsWyMm0CCY0ndN7fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(39830400003)(346002)(451199015)(2906002)(316002)(110136005)(54906003)(26005)(36756003)(2616005)(38100700002)(83380400001)(5660300002)(6486002)(31696002)(6506007)(6512007)(86362001)(478600001)(186003)(8676002)(31686004)(66946007)(66476007)(8936002)(66556008)(4326008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZPU1dPOFkzZjBKZjFVUkJTUU41NXFQSmluUUV0NXpJdWptQlUremNlUU9y?=
 =?utf-8?B?WU1RS3A3b3hoN2JWeTdZNlJYcHNyYS9sa0pQRmFIc3JlVUJNNTBmRFdDbkI2?=
 =?utf-8?B?VDZXOFRWYUNzS25GZUVvRTlncThocXFOWlowNk1FQmF3RlViUnhncUdlcjVu?=
 =?utf-8?B?RlhRcEpRbDdQL3RTR1ZWNlNDb29ZanVEbTR1dkNwSlFnWnBPUWRHMDNjOFFN?=
 =?utf-8?B?OXFhTlA1SElyWGRxVWNwQnJZSTBrcjZhSWVKTGFpU1VLQjVtelBPaFVJOGxy?=
 =?utf-8?B?TmlHaTlvK0U4U1pCYVlVR3l3dXBrcnI1V1JTZWNaQS9mWVU4YVkrVFdWUDN3?=
 =?utf-8?B?Z2xEdGpZQ0ZDUWVzTEVsZTc0NTk2UVFQMVpBbnNtam16ejEweTg4L0tLUkZN?=
 =?utf-8?B?UmZ6bGxlVUdVRHJORHRVR1lUbmhRTEF4QkpIcTlOc2ZlUUk4TWxNL1Y1dmZq?=
 =?utf-8?B?VmdKbE9hcnM5SFRnZGphaFlBSzNDNDJqWHJ0N1l1b1AzZXdrUG9QTTUxUHNU?=
 =?utf-8?B?R1FsTnZLekdNaDF2V0FBUkJkc2JBQ3hNNDBCejlOaDNSclpnK3ZVQjdRWWYv?=
 =?utf-8?B?c3VJTmx4Nm4xODQ4VDBHbnpoeUk0TzcrTlBlK3V6TE5FS2ZqMk9RclhQb2Vj?=
 =?utf-8?B?U2VMY2dNTDJUVzNhaWk2VnFsY0gyVVhreEsxejNaSm12cmY4OWkvRWc4a0Zx?=
 =?utf-8?B?UUxJVE92THd1L2hCY3QvMGNkemdybi9iM3h5UHFwUFRKaDU2YTNtRFo4THYz?=
 =?utf-8?B?STNVZWIxd1B5ZFdEWHRhSEhPY2hXdVBKZVkwdlRRZ0tNbmMzSG8xNjVSYVIy?=
 =?utf-8?B?aElWN0ZuK0NzbnQ0eXZRRW9sdnl2M2RZYzViT2pvYXluMWdtb25aSmxXVEEy?=
 =?utf-8?B?aEJEN3Q2RVBCZkFkeTV3eCtSR2RoYUkwMkxUUmFScnpra3FaYUdwRmdGSm5m?=
 =?utf-8?B?R1IyektVRkM2SE9WRlVoNThoL3IzT0Y0dVRHVVIyNUo4cUhhZGh6U2RUMHE4?=
 =?utf-8?B?UFRCd3IrZkhLTnFaT0l0dnAyU0pXVmE0bTc5NDU0OUZacnduVG9XdWQ1bkZM?=
 =?utf-8?B?ZVU1dUI5cURYRWU5d0FkUXBjeFA0ZTJraG1peHY4Nk13a0ZhdWJzYVkwQXdx?=
 =?utf-8?B?SHpuc25xTEZvREY1VXc2MFJ2eWt0TFBkVWlIa1BVNTVsanpTWWdCd29BcHNX?=
 =?utf-8?B?Y295YTVVRnFWekpHR3ZVc3RRakJ6RTdxZUg3ZGhKZkN4K0Z2NUorcWJuZ0d1?=
 =?utf-8?B?d1FGWnFoRC93VXBpUkpaeXEvR3hmUm1jYVVNSVBLQXQ1YkVpVk5kT3lYMHlJ?=
 =?utf-8?B?ajdyODVDMlNJOXdoaWNHNThicTJNWFBnWEwrMWRGbytncVU3ejVPekhLT3JN?=
 =?utf-8?B?dHRncmdxSUtYYUwwcCtVN2htR2IvS1pvaG1IdmYyNWlqbjJpRnFXekxvR2JW?=
 =?utf-8?B?S0E4dUVzWEs5SVJpdjNXZ3R4TjNjRW9mcjdpZTI2dGJMVEJlNm90Nzd3bEJq?=
 =?utf-8?B?bnBMUzFCeXoyZzhwRndVRXFaTzZNVlRYWGh5dmVrV2N2MGlXcTFYM1B1NEZ1?=
 =?utf-8?B?aWMzZDQ1RHUxR1ROMkZlejhBNkQwR2R2eWdHVGVxVk9Nd3cvVjlQRnl6WERH?=
 =?utf-8?B?MkFIUVpUWTdKRnhzbmZhNWNXQjlXTWlnMXZkQXdWYldrUEpuNzlwK1oxU2ZR?=
 =?utf-8?B?Vk5pZFAyZG1SK29KMzVmbkR2N2hUVUFyYXpFZXU0MnJSa3NkM0NOY3VQYTdS?=
 =?utf-8?B?MUUxaURPZU9sNSt1TTBKZWM0aHFXVkNHb09rdGw0VlBwVjlRRUt0U3hISnht?=
 =?utf-8?B?Y1l1NVo1bURMT05oaUZtMVMxcnRTakRpL3lFZWlBbi9oMUhZV1hzR3lqY1NB?=
 =?utf-8?B?cjlFMlZLLzFWN0dBTlpkbE1hRGtoZTRUdmVPcG9rVnA0WGZNVGhuNnA4TGZE?=
 =?utf-8?B?OTVhSnBzYmx4L2RBY2lOVnFwVWIyajMrWGpIaERqS3NNdnlmd1NEaDV3ejJN?=
 =?utf-8?B?MHdLNmFyV09Tb3ZhUFQ0K0hiSVFKcFdLcElYb0U1OEM4WGpLcythazVtYVkv?=
 =?utf-8?B?VmFDbmpuZldaQ0JXOGZNMFZsdVpHaXcyUWZEbjAvQStwTDBPSy95R1RITlJN?=
 =?utf-8?Q?8SHkO6BKihLjVyjenaP3Y/JCR?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d290c4d2-f5c8-497f-a80f-08daf791def6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 07:18:31.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdNy1uuW5jNa0g+qv9XZza85GKa4s/9mMh495bHwInpM7I/4NoGKVj2PMHGYdfCB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9679
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-01-15 at 11:18, Heiner Kallweit wrote:
> There are slave devices that understand I2C but have read-only
> SDA and SCL. Examples are FD650 7-segment LED controller and
> its derivatives. Typical board designs don't even have a
> pull-up for both pins. Therefore don't enforce open-drain
> if SDA and SCL both are unidirectional. This patch makes
> i2c-gpio usable with such devices, based on new DT property
> i2c-gpio,sda-output-only.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v3:
> - improve description of attribute sda_is_output_only
> ---
>  drivers/i2c/busses/i2c-gpio.c          | 14 +++++++++++---
>  include/linux/platform_data/i2c-gpio.h |  3 +++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index 0e4385a9b..ea108d7e4 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -316,6 +316,8 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>  		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
>  	pdata->scl_is_output_only =
>  		of_property_read_bool(np, "i2c-gpio,scl-output-only");
> +	pdata->sda_is_output_only =
> +		of_property_read_bool(np, "i2c-gpio,sda-output-only");
>  }
>  
>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
> @@ -363,6 +365,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	enum gpiod_flags gflags;
> +	bool sda_scl_output_only;
>  	int ret;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -391,8 +394,12 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	 * marking these lines to be handled as open drain, and we should just
>  	 * handle them as we handle any other output. Else we enforce open
>  	 * drain as this is required for an I2C bus.
> +	 * If SCL/SDA both are write-only, then this indicates I2C-like slaves
> +	 * with read-only SCL/SDA. Such slaves don't need open-drain, and partially
> +	 * don't even work with open-drain.
>  	 */
> -	if (pdata->sda_is_open_drain)
> +	sda_scl_output_only = pdata->sda_is_output_only && pdata->scl_is_output_only;
> +	if (pdata->sda_is_open_drain || sda_scl_output_only)

I have not looked closely, but I see no strong reason to tie the SCL
output-only property to the flags of SDA?

>  		gflags = GPIOD_OUT_HIGH;
>  	else
>  		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
> @@ -400,7 +407,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->sda))
>  		return PTR_ERR(priv->sda);
>  
> -	if (pdata->scl_is_open_drain)
> +	if (pdata->scl_is_open_drain || sda_scl_output_only)

Same here, why tie the SDA output-only property to the flags of SCL?

Cheers,
Peter

>  		gflags = GPIOD_OUT_HIGH;
>  	else
>  		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
> @@ -418,7 +425,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  
>  	if (!pdata->scl_is_output_only)
>  		bit_data->getscl = i2c_gpio_getscl;
> -	bit_data->getsda = i2c_gpio_getsda;
> +	if (!pdata->sda_is_output_only)
> +		bit_data->getsda = i2c_gpio_getsda;
>  
>  	if (pdata->udelay)
>  		bit_data->udelay = pdata->udelay;
> diff --git a/include/linux/platform_data/i2c-gpio.h b/include/linux/platform_data/i2c-gpio.h
> index a907774fd..e9536c078 100644
> --- a/include/linux/platform_data/i2c-gpio.h
> +++ b/include/linux/platform_data/i2c-gpio.h
> @@ -16,6 +16,8 @@
>   *	isn't actively driven high when setting the output value high.
>   *	gpio_get_value() must return the actual pin state even if the
>   *	pin is configured as an output.
> + * @sda_is_output_only: SDA output drivers can't be turned off.
> + *	This is for clients that can only read SDA/SCL.
>   * @scl_is_open_drain: SCL is set up as open drain. Same requirements
>   *	as for sda_is_open_drain apply.
>   * @scl_is_output_only: SCL output drivers cannot be turned off.
> @@ -24,6 +26,7 @@ struct i2c_gpio_platform_data {
>  	int		udelay;
>  	int		timeout;
>  	unsigned int	sda_is_open_drain:1;
> +	unsigned int	sda_is_output_only:1;
>  	unsigned int	scl_is_open_drain:1;
>  	unsigned int	scl_is_output_only:1;
>  };
