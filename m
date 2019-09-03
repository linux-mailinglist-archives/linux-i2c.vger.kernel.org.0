Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D05A73D8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 21:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfICToS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 15:44:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36835 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfICToS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 15:44:18 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so9751537pgm.3;
        Tue, 03 Sep 2019 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g85VjW2VEZ7qoUCqv/eamyotIzmaYNLwCmvfJLidphU=;
        b=HjkLxmEiFiPd52tM2vhY08oz60NVQPc9HhGFC5JQQaPfQD5w3Id5ZR/qlXx+2pxQW+
         prONZVpVm0K2Q5zKN2RcvzWz2LlusYlwpb1veFl/bFRn+Vxxo/3qwELTzMkgZh6YU+oC
         LQA8HUk+aMlRszXHnIniD38uB9pRfWuQMzsOKM/7kLMvkkyvARXcSJ4tMvrmgG+sJG2h
         5LEXxQt7sOc28YLfTloS+fY7Rqr6aA7TuntDm61zgdLQbjWf1J+bFRs0K6uW88wvYN/C
         THhE6iUuBSkIFNaDgUvZh12Sc1OqqpHxtvm0uhqK12VCRuuKd/oMywU05Q7V0KaXHA9f
         r0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=g85VjW2VEZ7qoUCqv/eamyotIzmaYNLwCmvfJLidphU=;
        b=tKM8+Cph/mGmfVgumUIk76+x1tdH4HAUc12DIpfkZ6XVgHbMswBlKnhE9B3q3Id2dv
         kff34BG85e4idH7CIt5HK9XVN4pXSA2uwOdQwOXI6Sc8sixTH4LSCoGnr24Sd463Iyla
         /DtDy+HB2ml8hv3q9NSzCcCpQ5MCBjGBP5bqvcRo6GSfklbiHTpZfEkIXvWBkMFNl4Li
         4iys5CjxcbpIFXrSEoCPEYnRbdSYsP4aVfvzGi5zME3cf9D0n1Mt6MPB/shpnAj9odtL
         lBgn82lqsuXO3i41RHpXr8yjhXhZLAj83yMSpNLLEuNoZo8Qf1VCAEdm8GRXm1V+d5vn
         W5RA==
X-Gm-Message-State: APjAAAVBCv6IjE9l9Nfco0cw2pPOdy7/B/y1JmkSlgGhtIZd6YoGcVh7
        B5ORYaL/uI29mZ6mxq8bsk8=
X-Google-Smtp-Source: APXvYqwMoUmXre6QnkZWgjntpS13JxWYN18oOC9S5ecBMdXEzWvO0pvybTn4P1y0MeJlu3tfEVcJEA==
X-Received: by 2002:a65:4189:: with SMTP id a9mr30909671pgq.399.1567539857566;
        Tue, 03 Sep 2019 12:44:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z4sm18990367pfg.166.2019.09.03.12.44.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 12:44:16 -0700 (PDT)
Date:   Tue, 3 Sep 2019 12:44:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Marc Hulsman <m.hulsman@tudelft.nl>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/3] hwmon: w83791d: convert to use
 devm_i2c_new_dummy_device
Message-ID: <20190903194415.GA32494@roeck-us.net>
References: <20190903181256.13450-1-wsa+renesas@sang-engineering.com>
 <20190903181256.13450-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903181256.13450-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 03, 2019 at 08:12:54PM +0200, Wolfram Sang wrote:
> And simplify the error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83791d.c | 32 +++++++++-----------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
> index 050ad4201691..aad8d4da5802 100644
> --- a/drivers/hwmon/w83791d.c
> +++ b/drivers/hwmon/w83791d.c
> @@ -1260,7 +1260,7 @@ static int w83791d_detect_subclients(struct i2c_client *client)
>  	struct i2c_adapter *adapter = client->adapter;
>  	struct w83791d_data *data = i2c_get_clientdata(client);
>  	int address = client->addr;
> -	int i, id, err;
> +	int i, id;
>  	u8 val;
>  
>  	id = i2c_adapter_id(adapter);
> @@ -1272,8 +1272,7 @@ static int w83791d_detect_subclients(struct i2c_client *client)
>  					"invalid subclient "
>  					"address %d; must be 0x48-0x4f\n",
>  					force_subclients[i]);
> -				err = -ENODEV;
> -				goto error_sc_0;
> +				return -ENODEV;
>  			}
>  		}
>  		w83791d_write(client, W83791D_REG_I2C_SUBADDR,
> @@ -1283,29 +1282,22 @@ static int w83791d_detect_subclients(struct i2c_client *client)
>  
>  	val = w83791d_read(client, W83791D_REG_I2C_SUBADDR);
>  	if (!(val & 0x08))
> -		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
> +		data->lm75[0] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  0x48 + (val & 0x7));
>  	if (!(val & 0x80)) {
> -		if ((data->lm75[0] != NULL) &&
> +		if (!IS_ERR(data->lm75[0]) &&
>  				((val & 0x7) == ((val >> 4) & 0x7))) {
>  			dev_err(&client->dev,
>  				"duplicate addresses 0x%x, "
>  				"use force_subclient\n",
>  				data->lm75[0]->addr);
> -			err = -ENODEV;
> -			goto error_sc_1;
> +			return -ENODEV;
>  		}
> -		data->lm75[1] = i2c_new_dummy(adapter,
> -					      0x48 + ((val >> 4) & 0x7));
> +		data->lm75[1] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  0x48 + ((val >> 4) & 0x7));
>  	}
>  
>  	return 0;
> -
> -/* Undo inits in case of errors */
> -
> -error_sc_1:
> -	i2c_unregister_device(data->lm75[0]);
> -error_sc_0:
> -	return err;
>  }
>  
>  
> @@ -1394,7 +1386,7 @@ static int w83791d_probe(struct i2c_client *client,
>  	/* Register sysfs hooks */
>  	err = sysfs_create_group(&client->dev.kobj, &w83791d_group);
>  	if (err)
> -		goto error3;
> +		return err;
>  
>  	/* Check if pins of fan/pwm 4-5 are in use as GPIO */
>  	has_fanpwm45 = w83791d_read(client, W83791D_REG_GPIO) & 0x10;
> @@ -1419,9 +1411,6 @@ static int w83791d_probe(struct i2c_client *client,
>  		sysfs_remove_group(&client->dev.kobj, &w83791d_group_fanpwm45);
>  error4:
>  	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
> -error3:
> -	i2c_unregister_device(data->lm75[0]);
> -	i2c_unregister_device(data->lm75[1]);
>  	return err;
>  }
>  
> @@ -1432,9 +1421,6 @@ static int w83791d_remove(struct i2c_client *client)
>  	hwmon_device_unregister(data->hwmon_dev);
>  	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
>  
> -	i2c_unregister_device(data->lm75[0]);
> -	i2c_unregister_device(data->lm75[1]);
> -
>  	return 0;
>  }
>  
