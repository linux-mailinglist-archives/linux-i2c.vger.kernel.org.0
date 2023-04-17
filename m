Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64A56E5114
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 21:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjDQTjK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 15:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjDQTjJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 15:39:09 -0400
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F63310E9
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 12:39:07 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id oUgqpy4f7UFiioUgqpX4DT; Mon, 17 Apr 2023 21:39:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1681760345;
        bh=F/YIqpSQGmGDrXmQHIauTWUgFZL0Yuz6Zcdq3f0UZpc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=WBMDQupd9bUgDSI7GBIJvXEk/NhwLtss/5E7U0iwvQVShCwZHgT2dmDvHjkWIjvsm
         XjKJ3f3eRtO/on1DSmApB+GfO+sqTsTC2YYihHch54Fvjk7TducUscjWynw1wf+RwU
         sTmtBN/kcVwS/lRJRO8OHRgr2q3xHjg9dgUbeTXZhktCX1F18gw8JSRcIbyHBoLTz9
         XxiNtpKUcImCGidJ5FXjYiSfVTC5LdiZiq3FIB6UgOyV0gABGQLnoj1EQVCtXrBHzc
         vjKYqI842JfI5v6+jE+tWAgHGVd6I/SjNwtEem0ne+JJIf+s/wh82zK3qLlbUAzDrt
         eiLDoO9rEzRVg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Apr 2023 21:39:05 +0200
X-ME-IP: 86.243.2.178
Message-ID: <543e86ff-c8bf-231d-9dc8-8852d69ed422@wanadoo.fr>
Date:   Mon, 17 Apr 2023 21:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 4/4] i2c: muxes: pca954x: Add regulator support
Content-Language: fr
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230417104801.808972-1-patrick.rudolph@9elements.com>
 <20230417104801.808972-5-patrick.rudolph@9elements.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230417104801.808972-5-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 17/04/2023 à 12:48, Patrick Rudolph a écrit :
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>   drivers/i2c/muxes/i2c-mux-pca954x.c | 29 ++++++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 39f313658b18..42f467dc7995 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -49,6 +49,7 @@
>   #include <linux/module.h>
>   #include <linux/pm.h>
>   #include <linux/property.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <dt-bindings/mux/mux.h>
> @@ -101,6 +102,7 @@ struct pca954x {
>   	struct irq_domain *irq;
>   	unsigned int irq_mask;
>   	raw_spinlock_t lock;
> +	struct regulator *supply;
>   };
>   
>   /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
> @@ -440,6 +442,8 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
>   	struct pca954x *data = i2c_mux_priv(muxc);
>   	int c, irq;
>   
> +	regulator_disable(data->supply);
> +
>   	if (data->irq) {
>   		for (c = 0; c < data->chip->nchans; c++) {
>   			irq = irq_find_mapping(data->irq, c);
> @@ -492,10 +496,23 @@ static int pca954x_probe(struct i2c_client *client)
>   	i2c_set_clientdata(client, muxc);
>   	data->client = client;
>   
> +	data->supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(data->supply))
> +		return dev_err_probe(dev, PTR_ERR(data->supply),
> +				"Failed to request regulator\n");
> +
> +	ret = regulator_enable(data->supply);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable vdd supply: %d\n", ret);
> +		return ret;

Should there be another version:

Nit: return dev_err_probe... for consistancy?

> +	}
> +
>   	/* Reset the mux if a reset GPIO is specified. */
>   	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return PTR_ERR(gpio);
> +	if (IS_ERR(gpio)) {
> +		ret = PTR_ERR(gpio);
> +		goto fail_cleanup;
> +	}
>   	if (gpio) {
>   		udelay(1);
>   		gpiod_set_value_cansleep(gpio, 0);
> @@ -512,7 +529,7 @@ static int pca954x_probe(struct i2c_client *client)
>   
>   		ret = i2c_get_device_id(client, &id);
>   		if (ret && ret != -EOPNOTSUPP)
> -			return ret;
> +			goto fail_cleanup;
>   
>   		if (!ret &&
>   		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
> @@ -520,7 +537,8 @@ static int pca954x_probe(struct i2c_client *client)
>   			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
>   				 id.manufacturer_id, id.part_id,
>   				 id.die_revision);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto fail_cleanup;
>   		}
>   	}
>   
> @@ -539,7 +557,8 @@ static int pca954x_probe(struct i2c_client *client)
>   	ret = pca954x_init(client, data);
>   	if (ret < 0) {
>   		dev_warn(dev, "probe failed\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto fail_cleanup;
>   	}
>   
>   	ret = pca954x_irq_setup(muxc);

