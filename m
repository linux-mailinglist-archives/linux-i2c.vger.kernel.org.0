Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC838630E94
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 12:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbiKSL6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 06:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbiKSL6r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 06:58:47 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A682D1CC;
        Sat, 19 Nov 2022 03:58:45 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k19so9795572lji.2;
        Sat, 19 Nov 2022 03:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6O0Y9v0TrqS6nrnEzvGxEtHiJGdtBCc5Y4xyUIT84xo=;
        b=oKcvwiazioO/gnib4kEvXR2zw/3r+xXF+G1WYlEDf3aCXY2DlG4SYJ0BwhoiEeykhX
         7Kxy3mHvT3paoR/+qTe+AgpZRlzhiWBDuVG/mszCOpF/QklOxo8c5nGFpX7C7fMkaV+y
         JAK2J1fDcBo1wROsrhDnwv742occBRZ6ukE6NBCc68C7v0YI9PNIhvSGv/cPxxSnH0aB
         VdKAnDDfF/cQo0Jh3Dq7jQ+LiTtNDhj9j1pU31ZEhD6i3L5Vc/CPVMIJbSfXFlBV6clz
         fHACPptt2NEAtOCRTujbHP5IwpWjcSuJptPpR/2V1Guvi5rHobFruMJHMQFNxhHYhDmm
         O0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0Y9v0TrqS6nrnEzvGxEtHiJGdtBCc5Y4xyUIT84xo=;
        b=g8eR+w6IVsRefm5/wC8LwAT4zc/QCrxZ9Cd9gPp2tguK/mluFCvNGKPKFhc55AFRo3
         8napSBmwFCLTNL7UdRszlrAYP7MOr8qyAGzE/mmZHBF+5JIuUusKjhoDcPQ+zbsLkCkX
         zbYuCU/f56Y4TYXzsIPorGpGOw4XKARryaMck9KeRfbp0Vu3cPLlgfaVCk5XKrydtGjZ
         CSXfbqcfzm9wSlFLmYcZVewRJ+5Dy9PSNd6q5MfHULK2MulTwKzeIofFBkKskzShXsVS
         Z4KlzxfaMUMI8O6OFAIvWhPxjyyTqdX+lbFvpJ4P6js8B0o0nw239epEFz8S4mY4dV63
         wKhQ==
X-Gm-Message-State: ANoB5pll8Bf+yb9Jc3FzgkSnm5MaWdkfrWw11/jBhcFh7QvEw0GgYTHC
        K5QaQoHkrnczROPaevpljL0=
X-Google-Smtp-Source: AA0mqf6c0Khk25bUZhVkS7tdcpAUGB/R0KOc5BZHKT1yEPT05dqjmvHtEW4LjPOaeIsaV51TBDNrzw==
X-Received: by 2002:a05:651c:1115:b0:276:813a:10c2 with SMTP id e21-20020a05651c111500b00276813a10c2mr3770370ljo.295.1668859123454;
        Sat, 19 Nov 2022 03:58:43 -0800 (PST)
Received: from ?IPV6:2001:14ba:16f3:4a00::7? (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
        by smtp.gmail.com with ESMTPSA id p7-20020a2eb7c7000000b002770e531535sm880011ljo.55.2022.11.19.03.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 03:58:42 -0800 (PST)
Message-ID: <4c5b0723-db0c-0e94-e261-2e61183e92b2@gmail.com>
Date:   Sat, 19 Nov 2022 13:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 454/606] mfd: rohm-bd718x7: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-455-uwe@kleine-koenig.org>
Content-Language: en-US
From:   Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20221118224540.619276-455-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/19/22 00:43, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/mfd/rohm-bd718x7.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index bfd81f78beae..3c766cb15a24 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -127,8 +127,7 @@ static int bd718xx_init_press_duration(struct regmap *regmap,
>   	return 0;
>   }
>   
> -static int bd718xx_i2c_probe(struct i2c_client *i2c,
> -			    const struct i2c_device_id *id)
> +static int bd718xx_i2c_probe(struct i2c_client *i2c)
>   {
>   	struct regmap *regmap;
>   	struct regmap_irq_chip_data *irq_data;
> @@ -215,7 +214,7 @@ static struct i2c_driver bd718xx_i2c_driver = {
>   		.name = "rohm-bd718x7",
>   		.of_match_table = bd718xx_of_match,
>   	},
> -	.probe = bd718xx_i2c_probe,
> +	.probe_new = bd718xx_i2c_probe,
>   };
>   
>   static int __init bd718xx_i2c_init(void)

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

