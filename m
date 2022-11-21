Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385F563199E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 07:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiKUGDu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 01:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiKUGDs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 01:03:48 -0500
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E652A969;
        Sun, 20 Nov 2022 22:03:45 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id ud5so26099093ejc.4;
        Sun, 20 Nov 2022 22:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrEUroFLGMms4IUNW9gKSkJH6zlchlhgsC05r6Ghbj0=;
        b=2xWcxNKEv3xZOOIiDnWQ97pr0azir6gSnOvyaMATx4cWxXtWWFHcanAg1Fk/+ZS6DI
         uxd7Np3P7l6vtFxtfaoGfLE7L/V+2/4OoO9L0IQcSaxUq2Zbb9NQh1qVk9b6cr8AJSnJ
         T5Qm2FNInb4ikKaduwBDFsKv0trVz1fq/Q2sn8F3HrUS7w81R37V9lmgk5s3o1jhbJOC
         EuXT1O1yyclp+GyyFfHwDUBm9zUgeb2nsg92I8Lof7U8HYrtyWZj7/oZEusAcykXfxtf
         xBofNOj4uuqquEFFgh4LX8BGT3zbjGj/txYWK00cebyO0wgR29RI5M6XqWfPF3QMy9CH
         kWRg==
X-Gm-Message-State: ANoB5plvvSsGzVp6RwJqDr9qz9QFoVbUthboKwIKNCrtY3WoURp7Ctsv
        8zAcnbL8F9RDpelEf1RFwfs=
X-Google-Smtp-Source: AA0mqf4JA8chhhZbw8PoEKu1QAZn/NqwrfGXGI13XQnF5h8T2iZGzQoT5QdoD+gZHR2N1C9ApZN7Kg==
X-Received: by 2002:a17:906:22d1:b0:78d:6429:a806 with SMTP id q17-20020a17090622d100b0078d6429a806mr14062816eja.553.1669010623935;
        Sun, 20 Nov 2022 22:03:43 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id o6-20020a056402444600b0046383354bf9sm4723029edb.40.2022.11.20.22.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 22:03:43 -0800 (PST)
Message-ID: <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
Date:   Mon, 21 Nov 2022 07:03:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20221118224540.619276-572-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18. 11. 22, 23:45, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.

I wonder why -- is this a new approach to probe functions? Or is only 
i2c affected? And why? Could you point to the commit introducing and 
describing the change in the i2c core?

> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/tty/serial/sc16is7xx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
> index 39f92eb1e698..8412b25eac86 100644
> --- a/drivers/tty/serial/sc16is7xx.c
> +++ b/drivers/tty/serial/sc16is7xx.c
> @@ -1665,9 +1665,9 @@ MODULE_ALIAS("spi:sc16is7xx");
>   #endif
>   
>   #ifdef CONFIG_SERIAL_SC16IS7XX_I2C
> -static int sc16is7xx_i2c_probe(struct i2c_client *i2c,
> -			       const struct i2c_device_id *id)
> +static int sc16is7xx_i2c_probe(struct i2c_client *i2c)
>   {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
>   	const struct sc16is7xx_devtype *devtype;
>   	struct regmap *regmap;
>   
> @@ -1708,7 +1708,7 @@ static struct i2c_driver sc16is7xx_i2c_uart_driver = {
>   		.name		= SC16IS7XX_NAME,
>   		.of_match_table	= sc16is7xx_dt_ids,
>   	},
> -	.probe		= sc16is7xx_i2c_probe,
> +	.probe_new	= sc16is7xx_i2c_probe,
>   	.remove		= sc16is7xx_i2c_remove,
>   	.id_table	= sc16is7xx_i2c_id_table,
>   };

thanks,
-- 
js

