Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3571968333C
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Jan 2023 18:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbjAaRBv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Jan 2023 12:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231809AbjAaRBu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Jan 2023 12:01:50 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3482BEF0;
        Tue, 31 Jan 2023 09:01:43 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id p185so13377730oif.2;
        Tue, 31 Jan 2023 09:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VuP/YfEOykTds1PYcWeBCqILTfcAlIoaKqUZsULOMPI=;
        b=L2IfV6UWBYpAFTGGmROgsvj9ujIsPZAvqgF3nVixYnp5ctN9k0pbc+VGp7GTODVbYU
         WymlzOSDKFhuNZ+bVWIrDE6ZaxbsZStOa4CI4+YF4/Ko8TaA85PvR+4L4cVqelFOfECX
         HWfFPmsHb4pdBlNUFsPFpTiqQGaXJwz6majC82noPkA+3Ob7r1i1UoACLHeuLsCWjgLf
         eXhF7uT+/Qap4Wc0pCfivlcuX5D6ibcNf/m0gn1aRj7yWeyIRkIqTEKjmkxSj2pLOGAk
         fLWhybmSS0/tVLAV1aT3/0HbdKjbZUjdkNPuf3cf7ZhwUt/OXJqa7uCzW3/P2RM3nLJz
         IjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuP/YfEOykTds1PYcWeBCqILTfcAlIoaKqUZsULOMPI=;
        b=2yJHz0Fj6h5/NPBQf2W+U+5t1jlbifBYSYTTP2j7L96mf/mKJpB7mpOh993Q8nJWS4
         ZaaFTgjl7QmxecUP9AEcZo8uJB7+FHa3WtyLsBBW9NvuuqSX24v7bEMZ/SA9AEAUIbZp
         ngxZDnOkcgJfmehPAKGOI98m0JXYYrtcd0/yi9UH2GIXCfzxlXkgrS3kWvITpvect0+P
         9T0yd/WA4qCp1JibCHVIbfurqFI9s1jdMCOt97FyWjbr46k4a9Bp78SV7/m1ZLLFEpFp
         /Wo7nUsPVnN/cdgD755YaORY4PKWYcUc/rIaKfbFiVH82TNwlsyY2y138Rs+C3klTldY
         ljMg==
X-Gm-Message-State: AO0yUKVKQkcGVieHYacCdmqqZaONCCinohqDiTAoBmWfn6pQE8RDiYSP
        fMnDf0MKM2Wu7bHSf4vqdF4=
X-Google-Smtp-Source: AK7set+vVVurcLkcHaL90qHXRpttC9t6grvwsIaipNqSP1lI4aYqDhtDfd1SPFthL8LcDd4yV7A+uw==
X-Received: by 2002:a54:418e:0:b0:378:477c:3e0e with SMTP id 14-20020a54418e000000b00378477c3e0emr4052350oiy.45.1675184503043;
        Tue, 31 Jan 2023 09:01:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g204-20020aca39d5000000b0035a9003b8edsm5897474oia.40.2023.01.31.09.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 09:01:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 31 Jan 2023 09:01:41 -0800
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
Message-ID: <20230131170141.GA3598528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-597-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-597-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
