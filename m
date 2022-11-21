Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2506322FD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 14:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiKUNCg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 08:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiKUNCJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 08:02:09 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3172B24B;
        Mon, 21 Nov 2022 05:02:08 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id j26so751996qki.10;
        Mon, 21 Nov 2022 05:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nRECzEBKuXfpVjBgQjOUCRx/oDhSHr+NnW7a6vUNh4w=;
        b=jHZfjgI3LB/tpnHxoVUiPi3bLaC4J67KIkO2UIBQJuq07MjfCX3vN6/f8+gwZTDQDS
         e8ZFFw8xBQE2kHGzy6w9jF9C4yM3GfPfFMLlT2NX3kwMZMtuoQUMrXUtAH1dHVrJkXNe
         Ku2HUOZNYOK7fFqp2eZuj5qsbvMlZr1G5UnSZdJJ4TQGr7OlA+gNzyTCw2v6VOi08mMe
         Lk1mT7CDdu9QKDZvNXYAMNhV8rH0D8tOQwYM77GbL4dVZr+4tYf8V3GnN9tNIttw4xkg
         G/xR2zEW56oOHNuO/o5w5Q7/buHTExV8Yw6YowjCPgXVoAykTD9pMvMjnTaO/AM+mYtA
         QJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRECzEBKuXfpVjBgQjOUCRx/oDhSHr+NnW7a6vUNh4w=;
        b=GmV+RYEVMI063L0LMEoHRzVKXDiyz2JtOJ10h9bEsysNJctNx0IGt+UMCPdvosSQbl
         vFlzKRjI2d1Ufqqxn4VbFxzhsTQgV9y9tKlnjk2irs8pj8R+qCOfs1YFJJ6LFT7OP9SQ
         tvQs99pZIE55bEg5PlPbUbSxyA31Bs2tHugFOA3XptKvr8wl887KmyyJO59ulSPbNx1l
         AMgLa1x0INHyBSdj74oDvuk4qF3gZjuYwVOa559xS/PN/jMzDQVFpPIEpfvc60hkK7op
         kCwwZh+hDMIzCKz07L3smeOOLsX+1uVv1jT4RRw/mglY3AgL6H+M8oVM4H6A7ifsJEuN
         Ql2w==
X-Gm-Message-State: ANoB5pm9huZT4Pk3rfkkoSk+oso21U4+bO0IugDuZNXsdfJ8BBE0HuL/
        ixf8vRigeER+e5r6ZiDfvw==
X-Google-Smtp-Source: AA0mqf7HcNiuiMJu1iFhQyn5OQFAglqjdW633GaNRgAaiFNsxAyr3w7yTpq0cBPDW94knKf1PaC3Qw==
X-Received: by 2002:ae9:e605:0:b0:6fa:2522:9c56 with SMTP id z5-20020ae9e605000000b006fa25229c56mr2273316qkf.22.1669035727404;
        Mon, 21 Nov 2022 05:02:07 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id h18-20020a05620a401200b006fa2b1c3c1esm8174419qko.58.2022.11.21.05.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 05:02:06 -0800 (PST)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:f635:bca3:695:bf43])
        by serve.minyard.net (Postfix) with ESMTPSA id 7B2C11800BC;
        Mon, 21 Nov 2022 13:02:05 +0000 (UTC)
Date:   Mon, 21 Nov 2022 07:02:04 -0600
From:   Corey Minyard <minyard@acm.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 605/606] ipmi: ssif_bmc: Convert to i2c's .probe_new()
Message-ID: <Y3t2zHgeMlTRGE0t@minyard.net>
Reply-To: minyard@acm.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-606-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-606-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:39PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.

Thanks, queued for next release.

-corey

> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/char/ipmi/ssif_bmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> index 2d8069386398..caee848261e9 100644
> --- a/drivers/char/ipmi/ssif_bmc.c
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -797,7 +797,7 @@ static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8
>  	return ret;
>  }
>  
> -static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int ssif_bmc_probe(struct i2c_client *client)
>  {
>  	struct ssif_bmc_ctx *ssif_bmc;
>  	int ret;
> @@ -860,7 +860,7 @@ static struct i2c_driver ssif_bmc_driver = {
>  		.name           = DEVICE_NAME,
>  		.of_match_table = ssif_bmc_match,
>  	},
> -	.probe          = ssif_bmc_probe,
> +	.probe_new      = ssif_bmc_probe,
>  	.remove         = ssif_bmc_remove,
>  	.id_table       = ssif_bmc_id,
>  };
> -- 
> 2.38.1
> 
