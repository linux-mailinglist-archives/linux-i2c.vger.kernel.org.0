Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20CE3DE0F5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Aug 2021 22:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhHBUqT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Aug 2021 16:46:19 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:34530 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbhHBUqQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Aug 2021 16:46:16 -0400
Received: by mail-il1-f174.google.com with SMTP id a14so17693818ila.1;
        Mon, 02 Aug 2021 13:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PwNLwfql2TFidgftm+20PqZGJxrE90FZO8vc6Q4OqWU=;
        b=LgunEat+spKDd4siEU5NRB4gkyMIi6wehkM8irtmZSHEKPvw2JXZ3FSqWKnK9wnf6P
         30kqwSIC3bm3AYJqGccrnoiinnKuGLUC2tXrVkxEn23o1SdT6Htf0i6FcxeamzewrmBA
         /fYTlfRWD2do74PnoGDnk6NN3kJR7zSZG+sTXccLjRmDqWhcWzvr9tVziNNAI4HR2Y+G
         76s/VMZIVQdVKaprjVEwty6R/gc8KWvLlq1M9IFShWbnJuhhQYSOnCNxeJPJoPJdzi/Z
         N5Ekcwl8fVbEqud7vr2+btfF1J7mXIeETVCHdgzWEELTE3Rj9OLsMPWrnG6v4uZVNn1r
         ryIg==
X-Gm-Message-State: AOAM531spAOdrFVC1ADSMAM1vHwGk3vHHfF4FIdCJAK7TePF0H3RzNik
        XFvo0aGf1rL5K4+XArdI1g==
X-Google-Smtp-Source: ABdhPJyKUZPKMxPr44uq64bPWQISlXw3RSM+CNofGBCMC54z+helrxqXvtUGIn8Db0zpdGeL1L7cFg==
X-Received: by 2002:a92:d8d1:: with SMTP id l17mr867040ilo.187.1627937164802;
        Mon, 02 Aug 2021 13:46:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x11sm6293473ilu.3.2021.08.02.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:46:04 -0700 (PDT)
Received: (nullmailer pid 1578674 invoked by uid 1000);
        Mon, 02 Aug 2021 20:46:02 -0000
Date:   Mon, 2 Aug 2021 14:46:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, peda@axentia.se
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
Message-ID: <YQhZimPDbNJk5nbR@robh.at.kernel.org>
References: <20210727160315.15575-1-eajames@linux.ibm.com>
 <20210727160315.15575-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727160315.15575-3-eajames@linux.ibm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
> Some systems connect several PCA954x devices to a single reset GPIO. For
> these devices to get out of reset and probe successfully, each device must
> defer the probe until the GPIO has been hogged. Accomplish this by
> attempting to grab a new "reset-shared-hogged" devicetree property, but
> expect it to fail with EPROBE_DEFER or EBUSY.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 +++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 4ad665757dd8..376b54ffb590 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -434,15 +434,43 @@ static int pca954x_probe(struct i2c_client *client,
>  	i2c_set_clientdata(client, muxc);
>  	data->client = client;
>  
> -	/* Reset the mux if a reset GPIO is specified. */
> -	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return PTR_ERR(gpio);
> -	if (gpio) {
> -		udelay(1);
> -		gpiod_set_value_cansleep(gpio, 0);
> -		/* Give the chip some time to recover. */
> -		udelay(1);
> +	/*
> +	 * Grab the shared, hogged gpio that controls the mux reset. We expect
> +	 * this to fail with either EPROBE_DEFER or EBUSY. The only purpose of
> +	 * trying to get it is to make sure the gpio controller has probed up
> +	 * and hogged the line to take the mux out of reset, meaning that the
> +	 * mux is ready to be probed up. Don't try and set the line any way; in
> +	 * the event we actually successfully get the line (if it wasn't
> +	 * hogged) then we immediately release it, since there is no way to
> +	 * sync up the line between muxes.
> +	 */
> +	gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
> +	if (IS_ERR(gpio)) {
> +		ret = PTR_ERR(gpio);
> +		if (ret != -EBUSY)
> +			return ret;

Why can't you just do this with the existing 'reset-gpios' property? 
What's the usecase where you'd want to fail probe because EBUSY other 
than an error in your DT.

> +	} else {
> +		if (gpio) {
> +			/* This is really a problem since now we don't know the
> +			 * state of the gpio. Log a warning and keep trying to
> +			 * probe the mux just in case it works.
> +			 */
> +			dev_warn(dev, "got hogged reset line, expect error\n");
> +			gpiod_put(gpio);
> +		} else {
> +			/* Reset the mux if a reset GPIO is specified. */
> +			gpio = devm_gpiod_get_optional(dev, "reset",
> +						       GPIOD_OUT_HIGH);
> +			if (IS_ERR(gpio))
> +				return PTR_ERR(gpio);
> +
> +			if (gpio) {
> +				udelay(1);
> +				gpiod_set_value_cansleep(gpio, 0);
> +				/* Give the chip some time to recover. */
> +				udelay(1);
> +			}
> +		}
>  	}
>  
>  	data->chip = device_get_match_data(dev);
> -- 
> 2.27.0
> 
> 
