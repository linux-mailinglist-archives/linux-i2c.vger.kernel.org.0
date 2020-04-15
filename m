Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B0E1A976A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895062AbgDOIsy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895059AbgDOIst (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:48:49 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D643FC061A0F
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 01:48:47 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d17so11188501wrg.11
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EV5cZQCkbQanB0lPQS10XkYLf15qJlxPNzHeKA7zsLw=;
        b=WEm8jhqdU1woAxVuZBEqvWaqlQkGFqXgT0EEeizN/GYrDU8HzSam3p5Bh0bKFdPIUV
         3E3T9OEkaeu2Lq6dG5A2NxKCHa/dRd7m6cYtQC6DU+grEEb9y1YcSXKqCwHA6VuVeb5a
         xOk7Lf6NIj7aQF6KYpKp1Juxn/bCnifH//THfrr0HVIiTaEfVGaupdRS554jdY3C/FRa
         94KD8mtj5A5WJlxMl36ainFivi0yCJ8l7ZdwWNHKx0nvq9sgBaa+oFU0IhZmYktEhu++
         k05ptqfH8j3mLQbrbM1h/2CieyAjHdYIME2g9eQyH4fJ++zhwNb/Htd5j8YT/n8DZ5AW
         0JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EV5cZQCkbQanB0lPQS10XkYLf15qJlxPNzHeKA7zsLw=;
        b=VxWJkMENcnjyrdvxoI02eCvqO92iCHVtPZaNDwc90LyKUAGFBMuIi8GhQ9g3nLDhFt
         qv4q+OxoCmN8874LCSshaWYC87DJQKP7ZIGJC0qeQkB7mG5aI4qAf5Fn9v4StWxYexJ/
         7/398eYGuPPDJVff0j+yedaOyzopwbaOp3+EvHaiGALkfaUMe0NHnpaZLieelwXE9Liv
         3WgYbDEsdRQ4qwcrFhu82fjbzl5IyMVBv6OazxGndbbGKQFI9yMc2O9DNtKxT6+D2FQy
         4O73LOHzc+9gsK42CH3c4dmfb56GfVX48ozc3HhD70WJzeycz7EHm5YPq6pB4H84osq/
         yoAQ==
X-Gm-Message-State: AGi0PubleegDEuYnzErEcGiWHEajK7HidESzYjnEtDu6ycVWrr8D0cSs
        oA4rv6R07wceSskb5RSJ5xyf2Q==
X-Google-Smtp-Source: APiQypJ1QuWXon39j7rg9O4EUM0G25LnqKPwxKa/minvpBY5w+Ttpn13mJtxU3cCUWEm65PHXRdisg==
X-Received: by 2002:a5d:6645:: with SMTP id f5mr29429303wrw.280.1586940526517;
        Wed, 15 Apr 2020 01:48:46 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id i25sm21874124wml.43.2020.04.15.01.48.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 01:48:45 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <74aa4084-588f-1b6f-2256-44588c48edf6@bingham.xyz>
Date:   Wed, 15 Apr 2020 09:48:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 18/03/2020 15:00, Wolfram Sang wrote:
> Sometimes, we have unknown devices in a system and still want to block
> their address. For that, we allow DT nodes with only a 'reg' property.
> These devices will be bound to the "dummy" driver but with the name
> "reserved". That way, we can distinguish them and even hand them over to
> the "dummy" driver later when they are really requested using
> i2c_new_ancillary_device().

Oh how I long to be able to give these 'identifiable names' within the
system, but that will probably mess up all the driver matching and
binding, so would be quite tricky perhaps.

But I like the ability to distinguish the two different types.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 2 --
>  Documentation/devicetree/bindings/i2c/i2c.txt        | 4 +++-
>  drivers/i2c/i2c-core-base.c                          | 1 +
>  drivers/i2c/i2c-core-of.c                            | 8 +++-----
>  drivers/i2c/i2c-core.h                               | 1 +
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 6b25a80ae8d3..fc8ea27934b3 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -50,7 +50,6 @@ Examples:
>  		reg-io-width = <1>;	/* 8 bit read/write */
>  
>  		dummy@60 {
> -			compatible = "dummy";
>  			reg = <0x60>;
>  		};
>  	};
> @@ -68,7 +67,6 @@ or
>  		reg-io-width = <1>;	/* 8 bit read/write */
>  
>  		dummy@60 {
> -			compatible = "dummy";
>  			reg = <0x60>;
>  		};
>  	};
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index 9a53df4243c6..989b315e09dc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -21,7 +21,9 @@ flags can be attached to the address. I2C_TEN_BIT_ADDRESS is used to mark a 10
>  bit address. It is needed to avoid the ambiguity between e.g. a 7 bit address
>  of 0x50 and a 10 bit address of 0x050 which, in theory, can be on the same bus.
>  Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
> -be devices ourselves.
> +be devices ourselves. The 'reg' property of a child is required. The
> +'compatible' property is not. Empty 'compatible' child entries can be used to
> +describe unknown devices or addresses which shall be blocked for other reasons.
>  
>  Optional properties
>  -------------------
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 3d7b8a00a7d9..84464e439df5 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -854,6 +854,7 @@ EXPORT_SYMBOL_GPL(i2c_unregister_device);
>  
>  static const struct i2c_device_id dummy_id[] = {
>  	{ I2C_DUMMY_DRV_NAME, 0 },
> +	{ I2C_RESERVED_DRV_NAME, 0 },
>  	{ },
>  };
>  
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 6787c1f71483..d8d111ad6c85 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -27,17 +27,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>  
>  	memset(info, 0, sizeof(*info));
>  
> -	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0) {
> -		dev_err(dev, "of_i2c: modalias failure on %pOF\n", node);
> -		return -EINVAL;
> -	}
> -
>  	ret = of_property_read_u32(node, "reg", &addr);
>  	if (ret) {
>  		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
>  		return ret;
>  	}
>  
> +	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
> +		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
> +
>  	if (addr & I2C_TEN_BIT_ADDRESS) {
>  		addr &= ~I2C_TEN_BIT_ADDRESS;
>  		info->flags |= I2C_CLIENT_TEN;
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index fb89fabf84d3..77b3a925ed95 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -23,6 +23,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>  			       unsigned int num_resources);
>  
>  #define I2C_DUMMY_DRV_NAME "dummy"
> +#define I2C_RESERVED_DRV_NAME "reserved"
>  
>  /*
>   * We only allow atomic transfers for very late communication, e.g. to send
> 

