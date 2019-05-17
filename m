Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2916821505
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 10:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfEQICi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 04:02:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51437 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbfEQICi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 04:02:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id c77so4492051wmd.1
        for <linux-i2c@vger.kernel.org>; Fri, 17 May 2019 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ksquared.org.uk; s=google;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DZX9uNmZCwgTpRURtm/48UgMpIJ+OdlOFXegM/dZ5eU=;
        b=LeCbdvCjvztkc24RPNS0WF7GUM64n7PRxerZvw2jczBa9Z+BOFIq0eIgJt7t39CG36
         AkeoBr0X8MunFvlpNgEZvUgyou/3DMGxWBZexULdVuVMTiCTlw0blU2VjY8133j5bYQ5
         xZt/B25SPSrfOAQCY9Uu3+pH3Wj+zb021s+wc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DZX9uNmZCwgTpRURtm/48UgMpIJ+OdlOFXegM/dZ5eU=;
        b=XgLMEDU8OdIWx3Cxe0/x7mzJ46UJfisSXuYxr23DltZVMHC/5AsZyLbY8zJWAq8iIg
         OSIopz2D0wRws8FG7YhecPIy9lXXCz+oYO+oaxYqpfwdIioU8HHrwrZjdnALGrWR7xWk
         dA/R1uY3vJ4sb8ZvE0a5KTD5Rd3gKdMTERGSJ+T5GR4qDeRhUjINgbGzrutSNZeYdnFI
         h6IkaKiD13Vqlv98GP2vmgd50TfJiOcRUuZOL31MZSyQ2TYVwXuEemIPlLBcPyafO6LC
         QUs/olY2sD8EaS/eYsxoW+E0UIR65JtrWNWHZq+feBEpuV14GmjNYXUgscVBsq015oG9
         F0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DZX9uNmZCwgTpRURtm/48UgMpIJ+OdlOFXegM/dZ5eU=;
        b=R4wM8skuTMotgLvaLecBahvLb9twnCr6DzXwLZ8Lyj5xLQCpPM77CcVXH8zmV/joKe
         0mIlw2zuv3ZbmdtNWybgLMKcYk+Sc8zKrvugcKeWyNoxia2RG8eh91EA3ahSUBnC9p8G
         h33U/00Pp1V4x3M2PRMcPwgK6R9DVjk+S2P2uOWJcTNAV0NxgzDXH0JiE4y5ID7lqwDt
         A+5iBu26mLep3EBfoYdsiOBhXHKtme/MMIocvGEnB7YDaYwluFFEQ7uIu4EBStCrDELj
         HtUxJMH0OSphUn4dEwf68BjzkOKREzxKEkB2i2m1dcDNteXcAPeQyqY81yfmetQ1v8ex
         WutA==
X-Gm-Message-State: APjAAAV7jjPlSHJ6TY4UyAktyH2oehXzZvxA8VTIZjU0oe7K7NGMvQqK
        CAzA/a/BcPGrkUUx9YDIqUTuSg==
X-Google-Smtp-Source: APXvYqx+hhRQdSzPlLdFq8GFU176vuA9uwinNK/Lw3QEpdZ74cKvGwBNxqCcvdkFUveH8FDLP6WNsw==
X-Received: by 2002:a1c:c582:: with SMTP id v124mr1218059wmf.111.1558080154381;
        Fri, 17 May 2019 01:02:34 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id a11sm7922283wrx.31.2019.05.17.01.02.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 01:02:33 -0700 (PDT)
Subject: Re: [PATCH v8 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Peter Rosin <peda@axentia.se>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
Message-ID: <fbab9ae3-b18d-66db-61f9-6f7195a807e8@bingham.xyz>
Date:   Fri, 17 May 2019 09:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 16/05/2019 22:13, Wolfram Sang wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Currently i2c_new_device and i2c_new_dummy return just NULL in error
> case although they have more error details internally. Therefore move
> the functionality into new functions returning detailed errors and
> add wrappers for compatibility with the current API.
> 
> This allows to use these functions with detailed error codes within
> the i2c core or for API extensions.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


I like the new naming a lot more this time :-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/i2c/i2c-core-base.c | 74 ++++++++++++++++++++++++++++++-------
>  1 file changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9732a81bb7dd..9c38dde73366 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -714,7 +714,7 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
>  }
>  
>  /**
> - * i2c_new_device - instantiate an i2c device
> + * i2c_new_client_device - instantiate an i2c device
>   * @adap: the adapter managing the device
>   * @info: describes one I2C device; bus_num is ignored
>   * Context: can sleep
> @@ -727,17 +727,17 @@ static int i2c_dev_irq_from_resources(const struct resource *resources,
>   * before any i2c_adapter could exist.
>   *
>   * This returns the new i2c client, which may be saved for later use with
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *
> -i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
> +static struct i2c_client *
> +i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
>  {
>  	struct i2c_client	*client;
>  	int			status;
>  
>  	client = kzalloc(sizeof *client, GFP_KERNEL);
>  	if (!client)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	client->adapter = adap;
>  
> @@ -803,7 +803,31 @@ i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
>  		client->name, client->addr, status);
>  out_err_silent:
>  	kfree(client);
> -	return NULL;
> +	return ERR_PTR(status);
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_client_device);
> +
> +/**
> + * i2c_new_device - instantiate an i2c device
> + * @adap: the adapter managing the device
> + * @info: describes one I2C device; bus_num is ignored
> + * Context: can sleep
> + *
> + * This deprecated function has the same functionality as
> + * @i2c_new_client_device, it just returns NULL instead of an ERR_PTR in case of
> + * an error for compatibility with current I2C API. It will be removed once all
> + * users are converted.
> + *
> + * This returns the new i2c client, which may be saved for later use with
> + * i2c_unregister_device(); or NULL to indicate an error.
> + */
> +struct i2c_client *
> +i2c_new_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
> +{
> +	struct i2c_client *ret;
> +
> +	ret = i2c_new_client_device(adap, info);
> +	return IS_ERR(ret) ? NULL : ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_device);
>  
> @@ -854,7 +878,7 @@ static struct i2c_driver dummy_driver = {
>  };
>  
>  /**
> - * i2c_new_dummy - return a new i2c device bound to a dummy driver
> + * i2c_new_dummy_device - return a new i2c device bound to a dummy driver
>   * @adapter: the adapter managing the device
>   * @address: seven bit address to be used
>   * Context: can sleep
> @@ -869,15 +893,39 @@ static struct i2c_driver dummy_driver = {
>   * different driver.
>   *
>   * This returns the new i2c client, which should be saved for later use with
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
> +static struct i2c_client *
> +i2c_new_dummy_device(struct i2c_adapter *adapter, u16 address)
>  {
>  	struct i2c_board_info info = {
>  		I2C_BOARD_INFO("dummy", address),

I wonder if in the future we could find an easy way to propagate a
device name into this 'dummy' info field for dummy devices.

Then it would be much easier to identify all of the rogue dummys that
appear in my system (ok, not rogue - I've put them there - but I've put
in sooo many :D)

Anyway - just musings - not a topic for this patch.

>  	};
>  
> -	return i2c_new_device(adapter, &info);
> +	return i2c_new_client_device(adapter, &info);
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
> +
> +/**
> + * i2c_new_dummy - return a new i2c device bound to a dummy driver
> + * @adapter: the adapter managing the device
> + * @address: seven bit address to be used
> + * Context: can sleep
> + *
> + * This deprecated function has the same functionality as @i2c_new_dummy_device,
> + * it just returns NULL instead of an ERR_PTR in case of an error for
> + * compatibility with current I2C API. It will be removed once all users are
> + * converted.
> + *
> + * This returns the new i2c client, which should be saved for later use with
> + * i2c_unregister_device(); or NULL to indicate an error.
> + */
> +struct i2c_client *i2c_new_dummy(struct i2c_adapter *adapter, u16 address)
> +{
> +	struct i2c_client *ret;
> +
> +	ret = i2c_new_dummy_device(adapter, address);
> +	return IS_ERR(ret) ? NULL : ret;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_dummy);
>  
> @@ -1000,9 +1048,9 @@ i2c_sysfs_new_device(struct device *dev, struct device_attribute *attr,
>  		info.flags |= I2C_CLIENT_SLAVE;
>  	}
>  
> -	client = i2c_new_device(adap, &info);
> -	if (!client)
> -		return -EINVAL;
> +	client = i2c_new_client_device(adap, &info);
> +	if (IS_ERR(client))
> +		return PTR_ERR(client);
>  
>  	/* Keep track of the added device */
>  	mutex_lock(&adap->userspace_clients_lock);
> 

