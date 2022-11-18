Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46D06302A1
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiKRXMY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:12:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiKRXME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:12:04 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCA6E9311;
        Fri, 18 Nov 2022 14:57:09 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id h21so4130352qtu.2;
        Fri, 18 Nov 2022 14:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuUEWwhvDs460kaSXD8B3BhdOEN0zcJH7sO0FvaA4JA=;
        b=ppnTM7oen+dMdKFaKpRH0vfXlECaQB2G9TPPHRNuGe/drA0zkpYTd3/ONuzcXFXVjn
         6GrbY0GvwU2EnoDJfUv6a0deN4WVC/8TgO4pTc1IuZt6zj934Fsxq81CvEOhdl0Ty6Vz
         aLzlUJNiR00To8vM355W0V0Azp+ZhXsG5vtBeMZll4aZuvIvPaZ+XFBGdBs1ZM+CPcky
         vVp3DapkFwrMmQyKO4+bjXEyIjf08p36IIcZ7n5gz60zE651vCVRmdp80u1yi3T7s+OP
         hW2RNGDDqJ1ehqAug/HwC0dPgRIKLoRRoeI/YW25cUlxvN5pLvlAAr6DGTSNcuwUhwoW
         nyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuUEWwhvDs460kaSXD8B3BhdOEN0zcJH7sO0FvaA4JA=;
        b=L8yCBJ+iJ6nvRub57FeIyME+N8fQFL9AbeKCimAcA3Vn202xV2fEmkrzePcPcta6LN
         lwpZJXlCznKiwWLAqdlNxGt9L0XgwIxPlia9QIdPfOokM4Wo6vcASofCi6v72eISFqWt
         cPc3LnR9LN5lmM+ghxupI3ob0RtIAt19vynpoSmmlDoD5Y8Z5sHorjkRWITae/xL9Xsb
         /stBXgUymW8npC2n928cjkawJGheSlnwUMPN1E3TI8uzbzay2a8neAo69QMjR/Dfi08S
         alTIevJrI9pDHYg3SZHe9Ils/mrTBZy6yJEHoPTs47st3XJXV9jRN/t6trKWGrxQ/V2N
         SDuw==
X-Gm-Message-State: ANoB5pkbmge7kA8pGXcOtrY1nri8FX6+GbJd/3k9SI0Iqo1gzb2FBSPv
        k1GlZCxGxXjxKDeanj6+6eAvz2lZyEU=
X-Google-Smtp-Source: AA0mqf4zFLaRRfmp8YTY2g/N3Nwm9ApEukSw8Pq3Al9wmawBwvgJeing3JpTiBQJIVRSMXDwBLq0Aw==
X-Received: by 2002:ac8:7447:0:b0:3a5:75dc:ed0a with SMTP id h7-20020ac87447000000b003a575dced0amr8555376qtr.329.1668812197496;
        Fri, 18 Nov 2022 14:56:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p5-20020ac84605000000b003a55fe9f352sm2676819qtn.64.2022.11.18.14.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:56:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 14:56:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 047/606] i2c: mux: pca9541: Convert to i2c's .probe_new()
Message-ID: <20221118225635.GA686528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-48-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-48-uwe@kleine-koenig.org>
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

On Fri, Nov 18, 2022 at 11:36:21PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/i2c/muxes/i2c-mux-pca9541.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index ea83de78f52d..09d1d9e67e31 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -283,8 +283,7 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
>  /*
>   * I2C init/probing/exit functions
>   */
> -static int pca9541_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int pca9541_probe(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adap = client->adapter;
>  	struct i2c_mux_core *muxc;
> @@ -337,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
>  		   .name = "pca9541",
>  		   .of_match_table = of_match_ptr(pca9541_of_match),
>  		   },
> -	.probe = pca9541_probe,
> +	.probe_new = pca9541_probe,
>  	.remove = pca9541_remove,
>  	.id_table = pca9541_id,
>  };
> -- 
> 2.38.1
> 
