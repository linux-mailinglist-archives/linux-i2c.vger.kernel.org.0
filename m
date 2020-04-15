Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB331A9609
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635779AbgDOIRX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635776AbgDOIRT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:17:19 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE439C061A0C
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 01:17:18 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h26so6588286wrb.7
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=66J/HTT33Uol1SUiWn/L5p3x58zavge/AfZ1s13ycQs=;
        b=HHKT+vbncLLE5ENnysOfThYsQlOABiBtlM9U3S9b5PJ2rdIB0k3EjbVpY3LHhPoVaQ
         N5RWpRm/uhVMzD19pFTSYJxTWS1J3KzGodk30Ufo/3qhfO1+1ssDWFlsAcOFes4mqEvN
         fqaPeNg0ix8/tr9HIEufa3czCVbPcr0MCH7El25hkL5mS7sC+CWjiZGc6TALdvwtluL1
         qXbIWH54v7X7FcKzWBr3baYeapJWCNGQfGq3tAPAR7D3gbD2ZVuZIvCsxgUQ0dH/gd1I
         z0t2WdqpbJPPzzNaMZQi5LDgKQEb01NA4Cv3M04iJayCGjRogp5WAvBGAdQU7A5OozXT
         z0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=66J/HTT33Uol1SUiWn/L5p3x58zavge/AfZ1s13ycQs=;
        b=uACA3C/3wRB+xv9mkZlkPqIXpFv+W0pB2P6EgD+suo7vHIS+yL+iKf00x/aJD1dMxY
         7dnLKVdZYtJIQx2+sDgL9T2Cq44arDZGU/5I40n8cFLikcE+vHRHSgIWsNCj0mpu2egd
         FcW8LsHxhGVifXnuC4B8McLtl86rjQReG6jkor5tdiOTsy2zjjEfvkfO7lXzvHFDsnVs
         7M8CMDMjoLikQOigCtMPefzAdMdpw+fKvHMNK/jkw4LX68JdNno8Y6XAhzPNiFdADtuO
         VQylpBdWR+xrGMAa+1R62uQvx7weDfr7qKVcfEx1mHA6ANcUSUq8jaO+nusy6szGTIaQ
         c6WQ==
X-Gm-Message-State: AGi0PubORpzz4V3MVR1N4diETgk/HcQ7NCc2wWh1fAZ/OZYLykGzMpqd
        aXfGZYAK/qgX1xDnBJHQ/t+8bw==
X-Google-Smtp-Source: APiQypK/AhTJbpx8WrXtnpfEVeAyVY/z/Wlz42tkt4YSkttsVxnPoK6Bo3gTgmzQuJzPDaVQ8QtPmA==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr417179wrv.3.1586938637645;
        Wed, 15 Apr 2020 01:17:17 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id v16sm21796745wml.30.2020.04.15.01.17.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 01:17:16 -0700 (PDT)
Subject: Re: [RFC PATCH v2 4/6] i2c: of: error message unification
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-5-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <7014c94a-bb89-b282-52ee-49b42ab5aac1@bingham.xyz>
Date:   Wed, 15 Apr 2020 09:17:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 18/03/2020 15:00, Wolfram Sang wrote:
> - don't prefix the device if %pOF is provided. That information is
>   enough.
> - move the prefix to pr_fmt
> - change prefix from "of_i2c" to "i2c_of" because the code was moved
>   out of the of-domain long ago
> - drop error string for callers of of_i2c_register_device because it
>   already reports enough (thanks to Tang Bin for the report!)
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/i2c/i2c-core-of.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index 710704cd583e..f2d09ea0d336 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -8,6 +8,8 @@
>   * Copyright (C) 2013, 2018 Wolfram Sang <wsa@the-dreams.de>
>   */
>  
> +#define pr_fmt(fmt) "i2c_of: " fmt
> +
>  #include <dt-bindings/i2c/i2c.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> @@ -28,7 +30,7 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>  
>  	ret = of_property_read_u32(node, "reg", &addr);
>  	if (ret) {
> -		pr_err("of_i2c: invalid reg on %pOF\n", node);
> +		pr_err("invalid reg on %pOF\n", node);
>  		return ret;
>  	}
>  
> @@ -66,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>  	struct i2c_board_info info;
>  	int ret;
>  
> -	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
> +	pr_debug("register %pOF\n", node);
>  
>  	ret = of_i2c_get_board_info(node, &info);
>  	if (ret)
> @@ -74,7 +76,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>  
>  	client = i2c_new_client_device(adap, &info);
>  	if (IS_ERR(client))
> -		dev_err(&adap->dev, "of_i2c: Failure registering %pOF\n", node);
> +		pr_err("failure registering %pOF (%ld)\n", node, PTR_ERR(client));
>  
>  	return client;
>  }
> @@ -88,7 +90,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>  	if (!adap->dev.of_node)
>  		return;
>  
> -	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
> +	dev_dbg(&adap->dev, "walking child nodes\n");
>  
>  	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
>  	if (!bus)
> @@ -99,12 +101,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>  			continue;
>  
>  		client = of_i2c_register_device(adap, node);
> -		if (IS_ERR(client)) {
> -			dev_err(&adap->dev,
> -				 "Failed to create I2C device for %pOF\n",
> -				 node);
> +		if (IS_ERR(client))
>  			of_node_clear_flag(node, OF_POPULATED);
> -		}
>  	}
>  
>  	of_node_put(bus);
> @@ -243,8 +241,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>  
>  		client = of_i2c_register_device(adap, rd->dn);
>  		if (IS_ERR(client)) {
> -			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
> -				 rd->dn);
>  			put_device(&adap->dev);
>  			of_node_clear_flag(rd->dn, OF_POPULATED);
>  			return notifier_from_errno(PTR_ERR(client));
> 

