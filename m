Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4695F85FE
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Oct 2022 18:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJHQHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Oct 2022 12:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJHQHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Oct 2022 12:07:20 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84673DF13;
        Sat,  8 Oct 2022 09:07:18 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id p5so8798521ljc.13;
        Sat, 08 Oct 2022 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0N63sBfYbQ4IqLEp4sJ/2Jp1eqaNK7T4OvQMkYPXA0=;
        b=D0qoTCGGEtoBmAVhE7GQxh2SReMtsZ3I+DW6q9fUsKC+Enr941Zzu84fPxfPixeHSN
         cCM/iAnEPfTGQQ22tMQbTjJuOfgbIeXKCztbJ5rJORnps4DilxKcXB0zQ0bZogy9bSqo
         bGY+EVWeU1hWhIO5XzRklt7mji/CwTUB8F5HI/MUxmdHHZalVIew8sdSMio4pdhrdz9s
         LnisJUARt4xBBzrX3R/H0EljM59MLRIo9ctfjQAa6WPszW64ln3jHG6VGiZJE1uA1+tV
         UMiwZ2N/6HHUxAgDJ+vpR8FfGwikQEpSfFeih5FkpOrOrn0iXOHkzeP6rVuwyHurPc2X
         NJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0N63sBfYbQ4IqLEp4sJ/2Jp1eqaNK7T4OvQMkYPXA0=;
        b=PyKEV++xwoq+BoFZcifF2Ip6trcu1lEcHU/j7A9rIT/AhLefmh70fs1Ez4IPG0eNo/
         VNp+g2G3EamXtiHGJzCFSTvBGccK/u0vZmCeZ+BUPMri6S5/hlCwNJkI/xVRCK47MHqf
         xMxrzrAwp1E3Wx36/lgfjSaXktXgN4fI2IOrUmdAoSBX3rejdBjju3aMew5DiucuoeTs
         iSkz+V5d5NyoZZoFPPiPV1eAgG3ZUtCagkryZbRSktoStamnMM0l/LED3QjC4s5g4yj4
         5qAQHxBSkF/Bzf4WOpLrS+63NkjywhRxWzPOqvVyYK181lssTXI83POVB/OvHSkB6+d5
         PPnA==
X-Gm-Message-State: ACrzQf3Wpw853cwbDcfjRfdNQ8SjnIb4DLTplLN7NL8cfBgINwCJxbXP
        1JqmbFzfjVLgjWOnyf4NM0g=
X-Google-Smtp-Source: AMsMyM4fjtCZiN+ykmEf4ZZI/RJolYDdqNq3EZzr/SkEqPNrNnfmuZv5kH0JwR5IRxBafZz6boMqAQ==
X-Received: by 2002:a2e:9181:0:b0:26e:91d8:5796 with SMTP id f1-20020a2e9181000000b0026e91d85796mr158462ljg.398.1665245236284;
        Sat, 08 Oct 2022 09:07:16 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id u1-20020a2e9f01000000b0026dfd1fb1aesm777910ljk.25.2022.10.08.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 09:07:15 -0700 (PDT)
Date:   Sat, 8 Oct 2022 19:07:13 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v9 4/4] i2c: muxes: pca954x: Add regulator support
Message-ID: <20221008160713.2io5awbmeakiuou3@mobilestation>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-5-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007075354.568752-5-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 07, 2022 at 09:53:53AM +0200, Patrick Rudolph wrote:
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 34 ++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 992976fa6798..857a4ec387be 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -49,6 +49,7 @@
>  #include <linux/module.h>
>  #include <linux/pm.h>
>  #include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <dt-bindings/mux/mux.h>
> @@ -133,6 +134,7 @@ struct pca954x {
>  	struct irq_domain *irq;
>  	unsigned int irq_mask;
>  	raw_spinlock_t lock;
> +	struct regulator *supply;
>  };
>  
>  /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
> @@ -473,6 +475,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
>  	struct pca954x *data = i2c_mux_priv(muxc);
>  	int c, irq;
>  

> +	if (!IS_ERR_OR_NULL(data->supply))

First of all AFAICS the data->supply pointer will never be null on the
pca954x_cleanup() invocations in your current implementation. So
IS_ERR() would be enough here. Second in the next comment I'll suggest
to you to implement the optional regulator semantic, which implies
initializing the data->supply pointer with NULL if the get-regulator
function returns -ENODEV. That shall look easier than the IS_ERR()
macro. So checking the data->supply pointer for being not-null would
be enough here.

> +		regulator_disable(data->supply);
> +
>  	if (data->irq) {
>  		for (c = 0; c < data->chip->nchans; c++) {
>  			irq = irq_find_mapping(data->irq, c);
> @@ -531,15 +536,32 @@ static int pca954x_probe(struct i2c_client *client,
>  			     pca954x_select_chan, pca954x_deselect_mux);
>  	if (!muxc)
>  		return -ENOMEM;

> +

unrelated change...

>  	data = i2c_mux_priv(muxc);
>  
>  	i2c_set_clientdata(client, muxc);
>  	data->client = client;
>  

> +	data->supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(data->supply)) {

Judging by the DT-bindings the power-supply is supposed to be
optional. Isn't it?  AFAICS from the _regulator_get() semantic if no
vdd-supply is specified and a regulator request method with the
non-optional semantic is called an ugly warning will be printed to the
system log. Most of the users of the driver don't have the
power-supply specified for the device. You don't want to have their
logs polluted with the false warning, do you? If so you should use
the devm_regulator_get_optional() method here. If it returns the
-ENODEV error just overwrite the data->supply with NULL. In case of
any other error halt the device probe procedure.

> +		ret = PTR_ERR(data->supply);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to request regulator: %d\n", ret);
> +		return ret;

dev_err_probe() ?

-Sergey

> +	}
> +
> +	ret = regulator_enable(data->supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* Reset the mux if a reset GPIO is specified. */
>  	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return PTR_ERR(gpio);
> +	if (IS_ERR(gpio)) {
> +		ret = PTR_ERR(gpio);
> +		goto fail_cleanup;
> +	}
>  	if (gpio) {
>  		udelay(1);
>  		gpiod_set_value_cansleep(gpio, 0);
> @@ -556,7 +578,7 @@ static int pca954x_probe(struct i2c_client *client,
>  
>  		ret = i2c_get_device_id(client, &id);
>  		if (ret && ret != -EOPNOTSUPP)
> -			return ret;
> +			goto fail_cleanup;
>  
>  		if (!ret &&
>  		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
> @@ -564,7 +586,8 @@ static int pca954x_probe(struct i2c_client *client,
>  			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
>  				 id.manufacturer_id, id.part_id,
>  				 id.die_revision);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto fail_cleanup;
>  		}
>  	}
>  
> @@ -583,7 +606,8 @@ static int pca954x_probe(struct i2c_client *client,
>  	ret = pca954x_init(client, data);
>  	if (ret < 0) {
>  		dev_warn(dev, "probe failed\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto fail_cleanup;
>  	}
>  
>  	ret = pca954x_irq_setup(muxc);
> -- 
> 2.37.3
> 
