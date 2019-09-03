Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7BA73EC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 21:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfICTqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 15:46:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35068 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfICTqg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 15:46:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so9765834pgv.2;
        Tue, 03 Sep 2019 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=igmg6AwfGYbAp3MYYh4Kk1p8kAHB/xsXsNHr4nn4ius=;
        b=F+5mHo0Pc7wnq15LIJvJIQhoNZSBBx0k7UKN/GWlOYX6SiT5NSARfjS+20qm8DAiwQ
         Nja+QjRQCT0Y3r5yxoXNjObBW75vUPa/AizhaAyD8fu3HnSV7HfuPErQqNTPhiStKhRC
         GXtvBQ3Ux0FNL/klbVHk3QqZHt1jlRnbRGXjGoOcNbnWT/I4rsoBqLrMeATw6NPrAELp
         YZnvCNsN2sCumcv6io1UtHFvyPR4U4/jZ+7tiCCkqe6OIymoLNFOTHO89Bk4C1W1WZU4
         PKlT0wsaogeaQ/A0EyJtS6Af9k+hAEAzuo2rKz+0nU/gI+CSkROmWzSdAGvZ3YFC//aW
         KggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=igmg6AwfGYbAp3MYYh4Kk1p8kAHB/xsXsNHr4nn4ius=;
        b=IL7gSAvne1KqEv+YiI5zIdjoiAigSkXXn7/8D2Bs3YJMOYlmEZ2Bu+VBGCHy0DxoX+
         3xgRm9r2xiKS50nKJwP73/VJfp44fNS09GPMUUN/5urzlz1moY9ubExpXRKn8hEWVuxi
         FD3vUP0gaQ5K/Gl92oVRRNeEsSixTp7WG50Klo0/i6LM+S2wd63SfF9t8BUcsS0A+wez
         zswbDTOrRO2u5UWf+vEWlrw/8jjsRHCmMX3E29QztpYmr9Ff8ih4kTwuURAwlAVjaR94
         iouwMtsNSwbbFeqavram99OXDyGzB7w63gVeJcNvLe9OyQjbASCzWjNGUMJZOh2iPhXs
         LzIg==
X-Gm-Message-State: APjAAAV8VW3+RmTczYDj0kDTDCkb/JGB0XkTaQVuO6buQ67V7zWA8rxD
        k9rR9Gf1yABKTIP5DF3Oi2M=
X-Google-Smtp-Source: APXvYqz/z1n6VqRkLqpP+JOl2WoAy7bUZcayG7Qzi21C1gIKdqgyDS1yRSB/5vrBmOM0cmx5lGt+4g==
X-Received: by 2002:a63:2744:: with SMTP id n65mr31585095pgn.277.1567539995164;
        Tue, 03 Sep 2019 12:46:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s5sm343566pjo.26.2019.09.03.12.46.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 12:46:34 -0700 (PDT)
Date:   Tue, 3 Sep 2019 12:46:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Rudolf Marek <r.marek@assembler.cz>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 3/3] hwmon: w83793d: convert to use
 devm_i2c_new_dummy_device
Message-ID: <20190903194633.GB32299@roeck-us.net>
References: <20190903181256.13450-1-wsa+renesas@sang-engineering.com>
 <20190903181256.13450-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903181256.13450-4-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 03, 2019 at 08:12:56PM +0200, Wolfram Sang wrote:
> And simplify the error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83793.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index 46f5dfec8d0a..9df48b70c70c 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -1551,9 +1551,6 @@ static int w83793_remove(struct i2c_client *client)
>  	for (i = 0; i < ARRAY_SIZE(w83793_temp); i++)
>  		device_remove_file(dev, &w83793_temp[i].dev_attr);
>  
> -	i2c_unregister_device(data->lm75[0]);
> -	i2c_unregister_device(data->lm75[1]);
> -
>  	/* Decrease data reference counter */
>  	mutex_lock(&watchdog_data_mutex);
>  	kref_put(&data->kref, w83793_release_resources);
> @@ -1565,7 +1562,7 @@ static int w83793_remove(struct i2c_client *client)
>  static int
>  w83793_detect_subclients(struct i2c_client *client)
>  {
> -	int i, id, err;
> +	int i, id;
>  	int address = client->addr;
>  	u8 tmp;
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -1580,8 +1577,7 @@ w83793_detect_subclients(struct i2c_client *client)
>  					"invalid subclient "
>  					"address %d; must be 0x48-0x4f\n",
>  					force_subclients[i]);
> -				err = -EINVAL;
> -				goto ERROR_SC_0;
> +				return -EINVAL;
>  			}
>  		}
>  		w83793_write_value(client, W83793_REG_I2C_SUBADDR,
> @@ -1591,28 +1587,21 @@ w83793_detect_subclients(struct i2c_client *client)
>  
>  	tmp = w83793_read_value(client, W83793_REG_I2C_SUBADDR);
>  	if (!(tmp & 0x08))
> -		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (tmp & 0x7));
> +		data->lm75[0] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  0x48 + (tmp & 0x7));
>  	if (!(tmp & 0x80)) {
> -		if ((data->lm75[0] != NULL)
> +		if (!IS_ERR(data->lm75[0])
>  		    && ((tmp & 0x7) == ((tmp >> 4) & 0x7))) {
>  			dev_err(&client->dev,
>  				"duplicate addresses 0x%x, "
>  				"use force_subclients\n", data->lm75[0]->addr);
> -			err = -ENODEV;
> -			goto ERROR_SC_1;
> +			return -ENODEV;
>  		}
> -		data->lm75[1] = i2c_new_dummy(adapter,
> -					      0x48 + ((tmp >> 4) & 0x7));
> +		data->lm75[1] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  0x48 + ((tmp >> 4) & 0x7));
>  	}
>  
>  	return 0;
> -
> -	/* Undo inits in case of errors */
> -
> -ERROR_SC_1:
> -	i2c_unregister_device(data->lm75[0]);
> -ERROR_SC_0:
> -	return err;
>  }
>  
>  /* Return 0 if detection is successful, -ENODEV otherwise */
> @@ -1945,9 +1934,6 @@ static int w83793_probe(struct i2c_client *client,
>  
>  	for (i = 0; i < ARRAY_SIZE(w83793_temp); i++)
>  		device_remove_file(dev, &w83793_temp[i].dev_attr);
> -
> -	i2c_unregister_device(data->lm75[0]);
> -	i2c_unregister_device(data->lm75[1]);
>  free_mem:
>  	kfree(data);
>  exit:
> -- 
> 2.20.1
> 
