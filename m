Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6141D6302C2
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbiKRXPF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:15:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235373AbiKRXNs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:13:48 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E25FCC16B;
        Fri, 18 Nov 2022 14:58:00 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q83so6907184oib.10;
        Fri, 18 Nov 2022 14:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4Lm3gUux2uWGWpQItHMN+0WjzWY3Xh/H6zN/RVdF0U=;
        b=k6AY58F968VLg99H4rvYWyJAcy44GBzpTKNTJ8r86KNBcgtxQTidpZIaf48GwO6qX6
         5t3AMf/IsN2KOEhdkT8XRIxJOXYBH2/TZShycy+q2aoJdCKybot9m6/zl05OMn21uACK
         Kd2tZ8CnVvJ2gAOJYVM96CqfIq2iNZ3FBC3pr/4cf/9Mlz49FUeUJmJIU6wWXG3sMWgQ
         2NWbD0sgScJk/vFVfa7uFJa3ZQhylixWi1wZUg/5gpUl2s2xpD8Ix1dtwqp5L9r5bmeU
         flDdqjCQZUHNeaIqFpvBxobo1Qp1yUz6T/AevBjXSVLt3g62QtvoumjeGSDX8rzQTJZz
         4fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4Lm3gUux2uWGWpQItHMN+0WjzWY3Xh/H6zN/RVdF0U=;
        b=ZeFu49Bq+21FFSQQvh72jGYjZC8eeaIkWblAMqc1h0l3N8zhNFGT/aLJfyG1JWdmW6
         iH9bbzFFnkMuGSrcL8YTWPDYInz/NJ5v7rvZ8ocyfmRe7ZFPAWHjKALo3VxnIZEU/RTD
         OydudqmTwwlacWNaZETCszWS8psO0ThI28NG++n896SHayTBt3yhSQGoMZ06B7Unzytu
         vwCdfXA5jbruydOEP2SGFMkgnPwY+KJUnfQ5Kuc5pngk7W4iJZUuDm8XqAqLBkE8iFL8
         JrHPDjSVd/p7LO73ZU/wLqmebFbWI5by6WUS5e5MwaDC2MF12agDg2ydblfLk6jDC7/A
         0wUw==
X-Gm-Message-State: ANoB5pmfk7T97t7sY/SCf2Rba3mno5GHIeJW2wQJi7G/1thNtSB6mAK0
        3G0v3EiexI/QAy4bzwvNlW8=
X-Google-Smtp-Source: AA0mqf4vsp1hhpoCtYp1uFtj/rOVcQ4uM0UmP/nqP+SYD0fPYZpbVJnViH1Un/hfvaAYp2byjyI5Bw==
X-Received: by 2002:a05:6808:191e:b0:354:d7a7:1597 with SMTP id bf30-20020a056808191e00b00354d7a71597mr4645373oib.52.1668812268921;
        Fri, 18 Nov 2022 14:57:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1-20020a056830108100b006679a03a753sm2080031oto.11.2022.11.18.14.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:57:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 14:57:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 596/606] watchdog: ziirave_wdt: Convert to i2c's
 .probe_new()
Message-ID: <20221118225747.GF686528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-597-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-597-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:30PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index d0e88875443a..21ca08a694ee 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -593,8 +593,7 @@ static int ziirave_wdt_init_duration(struct i2c_client *client)
>  					 reset_duration);
>  }
>  
> -static int ziirave_wdt_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int ziirave_wdt_probe(struct i2c_client *client)
>  {
>  	int ret;
>  	struct ziirave_wdt_data *w_priv;
> @@ -732,7 +731,7 @@ static struct i2c_driver ziirave_wdt_driver = {
>  		.name = "ziirave_wdt",
>  		.of_match_table = zrv_wdt_of_match,
>  	},
> -	.probe = ziirave_wdt_probe,
> +	.probe_new = ziirave_wdt_probe,
>  	.remove = ziirave_wdt_remove,
>  	.id_table = ziirave_wdt_id,
>  };
> -- 
> 2.38.1
> 
