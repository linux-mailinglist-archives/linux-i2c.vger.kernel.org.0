Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE76FA73DD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 21:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfICTpE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 15:45:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38302 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfICTpE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 15:45:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id d10so5190639pgo.5;
        Tue, 03 Sep 2019 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0HJ26q274yfFUxN/rroX+4JQvPYL2ewq9OiwcW+uRuw=;
        b=Qz0J8r4oFdvQg/dAAM1QCZCGRCVSvFYnglOc6l7CxmpCB7gRRw5K35YC9ZIBo6urqQ
         l7waJyKm7IIpQ2+1jrwyvxcKZDBzKBzIIr+VEheJ/oj5MxC4l5TYko3xdozWVHt7xCyZ
         iRHvsZWeA+d9AcIT4F5Pr4ho3VSqDiqD5Lfn8vEUMFOWjctsQGmtB9URxBeO9xcjX4IZ
         9xqPrbrxSJZZ8s6cM4aI6eEwzcrG2BAEALXbeNC7pDAd/3FVNbgxRK1sXDmlbXVHUpW6
         ACKDtniAnTBAT1lvx0Or9A6eRl62SEyAdtvqh3SIjauh5Plt0UmGRUkYqHfOhg38Bn3/
         X64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0HJ26q274yfFUxN/rroX+4JQvPYL2ewq9OiwcW+uRuw=;
        b=Jg+wjVrexATCnOXJlCncOAT84N64CxeE+H4bbA03wzcI9qmfzIde7g9eAYFNN7Ipog
         Rdio9b9rn46O03IilxQ/kvlgaLDguFegnK3gOStl0GFQ5fxEproxw+GqK0FyKvhhmRZq
         FS2KOiYrr0OEtK2XZmZldhshx3Jv+KZvdpdTZyg1ko6+7unaQIuHYxF7rzII4ezxkcLI
         UB884zF2uwwoH6l6pHhRUnKQmR90Jo42i4xuPPtQ+DnW3FfXM2wsjEoFKnu9AH1kLo+B
         Dxn3b3ftCXGgSk5b27PXraO7aWYMkVHceTYEXe3aDngHHtWu8lxx8rcwX9p8GIeKhnWw
         NuOg==
X-Gm-Message-State: APjAAAXSLhkYrWhUGVyiNF8w+tQYvxI3h9VIiFTA8seS4TmhOTwKvcdc
        skxN3zy0/S3kcxV1ARCIBGU=
X-Google-Smtp-Source: APXvYqxyryJcHkFNROieNWtJumnnoeWeMUdMWu8tXA0GfFAglnu4D54Rkj6WwuvV/N+3/Y2Ws02EEA==
X-Received: by 2002:a63:7887:: with SMTP id t129mr32041977pgc.309.1567539903272;
        Tue, 03 Sep 2019 12:45:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d16sm23501330pfd.81.2019.09.03.12.45.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 12:45:02 -0700 (PDT)
Date:   Tue, 3 Sep 2019 12:45:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 2/3] hwmon: w83792d: convert to use
 devm_i2c_new_dummy_device
Message-ID: <20190903194501.GA32299@roeck-us.net>
References: <20190903181256.13450-1-wsa+renesas@sang-engineering.com>
 <20190903181256.13450-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903181256.13450-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 03, 2019 at 08:12:55PM +0200, Wolfram Sang wrote:
> And simplify the error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83792d.c | 32 +++++++++-----------------------
>  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
> index da8a6d62aa23..7fc8a1160c8f 100644
> --- a/drivers/hwmon/w83792d.c
> +++ b/drivers/hwmon/w83792d.c
> @@ -924,7 +924,7 @@ store_sf2_level(struct device *dev, struct device_attribute *attr,
>  static int
>  w83792d_detect_subclients(struct i2c_client *new_client)
>  {
> -	int i, id, err;
> +	int i, id;
>  	int address = new_client->addr;
>  	u8 val;
>  	struct i2c_adapter *adapter = new_client->adapter;
> @@ -938,8 +938,7 @@ w83792d_detect_subclients(struct i2c_client *new_client)
>  				dev_err(&new_client->dev,
>  					"invalid subclient address %d; must be 0x48-0x4f\n",
>  					force_subclients[i]);
> -				err = -ENODEV;
> -				goto ERROR_SC_0;
> +				return -ENODEV;
>  			}
>  		}
>  		w83792d_write_value(new_client, W83792D_REG_I2C_SUBADDR,
> @@ -949,28 +948,21 @@ w83792d_detect_subclients(struct i2c_client *new_client)
>  
>  	val = w83792d_read_value(new_client, W83792D_REG_I2C_SUBADDR);
>  	if (!(val & 0x08))
> -		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
> +		data->lm75[0] = devm_i2c_new_dummy_device(&new_client->dev, adapter,
> +							  0x48 + (val & 0x7));
>  	if (!(val & 0x80)) {
> -		if ((data->lm75[0] != NULL) &&
> +		if (!IS_ERR(data->lm75[0]) &&
>  			((val & 0x7) == ((val >> 4) & 0x7))) {
>  			dev_err(&new_client->dev,
>  				"duplicate addresses 0x%x, use force_subclient\n",
>  				data->lm75[0]->addr);
> -			err = -ENODEV;
> -			goto ERROR_SC_1;
> +			return -ENODEV;
>  		}
> -		data->lm75[1] = i2c_new_dummy(adapter,
> -					      0x48 + ((val >> 4) & 0x7));
> +		data->lm75[1] = devm_i2c_new_dummy_device(&new_client->dev, adapter,
> +							  0x48 + ((val >> 4) & 0x7));
>  	}
>  
>  	return 0;
> -
> -/* Undo inits in case of errors */
> -
> -ERROR_SC_1:
> -	i2c_unregister_device(data->lm75[0]);
> -ERROR_SC_0:
> -	return err;
>  }
>  
>  static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, show_in, NULL, 0);
> @@ -1396,7 +1388,7 @@ w83792d_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	/* Register sysfs hooks */
>  	err = sysfs_create_group(&dev->kobj, &w83792d_group);
>  	if (err)
> -		goto exit_i2c_unregister;
> +		return err;
>  
>  	/*
>  	 * Read GPIO enable register to check if pins for fan 4,5 are used as
> @@ -1441,9 +1433,6 @@ w83792d_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	sysfs_remove_group(&dev->kobj, &w83792d_group);
>  	for (i = 0; i < ARRAY_SIZE(w83792d_group_fan); i++)
>  		sysfs_remove_group(&dev->kobj, &w83792d_group_fan[i]);
> -exit_i2c_unregister:
> -	i2c_unregister_device(data->lm75[0]);
> -	i2c_unregister_device(data->lm75[1]);
>  	return err;
>  }
>  
> @@ -1459,9 +1448,6 @@ w83792d_remove(struct i2c_client *client)
>  		sysfs_remove_group(&client->dev.kobj,
>  				   &w83792d_group_fan[i]);
>  
> -	i2c_unregister_device(data->lm75[0]);
> -	i2c_unregister_device(data->lm75[1]);
> -
>  	return 0;
>  }
>  
> -- 
> 2.20.1
> 
