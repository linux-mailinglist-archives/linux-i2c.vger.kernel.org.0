Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4D246A1E76
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 16:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjBXPXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 10:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjBXPXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 10:23:36 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E6A4ECE;
        Fri, 24 Feb 2023 07:23:22 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id u6so7541562ilk.12;
        Fri, 24 Feb 2023 07:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rZy/qweW4zcxQmO4VUVX7hmf2axyqzaYFYbkuQOeJXc=;
        b=AQxMYv3BZ5p+LQYVbqkVebvPggo55MHonBy7g4jfOc1nQ0O4EH2DbRvDEwkutFmsgH
         FK+q0oNbS/JbXDqe4ZPvwy7J8l/ThOL4YpgkrZ9AYz2fJBA9LvPGpR+pJiWUMPXtIknA
         eXabhYl+4gAsD5ewwvi2F4zs40J7NAcRyk8S+W+O3GMUbC3SSd5ktBO/VTffmPulzdjA
         WoMn/5ilqo5P/smoyY4dbRq5qhKq6cxtEtFT7TI72N5E2mZznZzV6fLV/Wdd7xLVWKYW
         MiT3ZEtPVH6Qkh7SAbD2pYZW2pMr+7dZzRj9Z1tyQ8iscWeq6kORb2UV0NS9s++dSJAn
         9V8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZy/qweW4zcxQmO4VUVX7hmf2axyqzaYFYbkuQOeJXc=;
        b=OrYYBDkTjk+jJ8Sh2e5GH92t7OaWZhP23yyiIIWrrwWCzxu244QwCLiEgTCJNK7eLu
         pmNYnF2kCj4MoMI2GuSk8FR22V+/zF/XOTnWLYAiXRe1Vup4SbhUnGoN7tUDziAPFERG
         1I9+hZQD4E+16UICDpbIF9+Tev47Ax73LoLWp0I4xo0qb5HQLWxr+zid4YorKmxVau8w
         dv9ju2k5BFd3EVofWg5zCKjkC4XmUrcmOoxDEMU9pHrkWma5LG5mjRNVSRmGSPtoUK4Y
         EEnQt6cc6H+K0ujk4EY1Q38Kebh2veRb8wdPnuv1iaMCGcoVEwhlAy7WybK3cQHE30dX
         ihNw==
X-Gm-Message-State: AO0yUKXR2pOvDbMbqvB0lcmEoMUQD+nE+2ckNOTCvpLTlf0lg3PWCINB
        R26bth+uHcL6GD4m7QlVSFxqaanlXKQ=
X-Google-Smtp-Source: AK7set/cciAX4U5TlcM778Z+6ttD77O8PBGjMZOAalDZI/1OZbtlTxUg+715LdzoRNNVUuu2TQSAOg==
X-Received: by 2002:a05:6e02:1bce:b0:315:7354:955d with SMTP id x14-20020a056e021bce00b003157354955dmr15312433ilv.10.1677252201305;
        Fri, 24 Feb 2023 07:23:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t18-20020a92d152000000b003170014ee5bsm1367117ilg.21.2023.02.24.07.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 07:23:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d02984bb-e3fc-7411-41b8-9d1113c0aa69@roeck-us.net>
Date:   Fri, 24 Feb 2023 07:23:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/9] i2c: mux: Convert all drivers to new .probe()
 callback
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
 <20230224120600.1681685-9-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230224120600.1681685-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/24/23 04:05, Uwe Kleine-König wrote:
> Now that .probe() was changed not to get the id parameter, drivers can
> be converted back to that with the eventual goal to drop .probe_new().
> 
> Implement that for the i2c mux drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
>   drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
>   drivers/i2c/muxes/i2c-mux-pca954x.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index 70835825083f..5a03031519be 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -306,7 +306,7 @@ static struct i2c_driver ltc4306_driver = {
>   		.name	= "ltc4306",
>   		.of_match_table = of_match_ptr(ltc4306_of_match),
>   	},
> -	.probe_new	= ltc4306_probe,
> +	.probe		= ltc4306_probe,
>   	.remove		= ltc4306_remove,
>   	.id_table	= ltc4306_id,
>   };
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 09d1d9e67e31..ce0fb69249a8 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -336,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
>   		   .name = "pca9541",
>   		   .of_match_table = of_match_ptr(pca9541_of_match),
>   		   },
> -	.probe_new = pca9541_probe,
> +	.probe = pca9541_probe,
>   	.remove = pca9541_remove,
>   	.id_table = pca9541_id,
>   };
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 3639e6d7304c..0ccee2ae5720 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -554,7 +554,7 @@ static struct i2c_driver pca954x_driver = {
>   		.pm	= &pca954x_pm,
>   		.of_match_table = pca954x_of_match,
>   	},
> -	.probe_new	= pca954x_probe,
> +	.probe		= pca954x_probe,
>   	.remove		= pca954x_remove,
>   	.id_table	= pca954x_id,
>   };

