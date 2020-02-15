Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE4B160132
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Feb 2020 00:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgBOXtI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Feb 2020 18:49:08 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41731 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgBOXtI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Feb 2020 18:49:08 -0500
Received: by mail-pg1-f193.google.com with SMTP id 70so7070646pgf.8;
        Sat, 15 Feb 2020 15:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rnC2Ds+EwbzVL/T+AxeZaE34NxC8qW00bQsFdhfFbMs=;
        b=ViFN3ZKP7EUrlmLXFMCv3zw/OdanOJPxP9i4sOmLF+OHeB/Ucu8V/XvHpIeWp6spsE
         kpiURiuSKsbBJe/gBdAiNJgaxNl/JTiQBBF+oqmJxJ4Ju2lCF5sQgFDmtOsWnfDdc9tV
         752Dz218AKcYK39P+F27sKxbBM5hIs9ieEg0rguzwEaBF0n+qkUDmKwyG+dLpHzDTdqA
         BLuMPmUrOUrI2oQRRDFkFeT+c4BZtZRTkbm3O1oKdoR2f4cYKbe6A53zuNZ0txhDI+LD
         Bi80YpLlwk5mgeUstd6xXSyn34F8Rci668ghNl6DSvgqX4tBMNZICjnP8UE6s3T4oqYx
         4nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rnC2Ds+EwbzVL/T+AxeZaE34NxC8qW00bQsFdhfFbMs=;
        b=HSf6QcdEqM3G30B/mMF/34dHsWw1lq4UIKA81rhEE4VRZczII4xka49E+RlpQNVe8x
         g8gDLAvYUHJenBOB1x2nNlHIhpLKcwHQZT32kVUog5+U4uHZUHBhYz3POfXF2ihK/zpx
         JM7nPnLUYIfRUscfRC5uyVCz+bMThZ9OS02/pJuKi21D0czyP5f1M1TxSeN/dffSy3xu
         Zaozm4iL4S+1WdyM9KdVtlQxkkC5drG9hucZAKkfU63Z2AvhEo8wV6wPFxQ7P3Uo0ZDS
         1a7rv2HGIO0YtsZL8iBljjsQ74jPBmMUjvoAkSGZ7Tw6+dpzz40mqSir6m4ZxYNglUyd
         j8aA==
X-Gm-Message-State: APjAAAW0Sbhjlqpw2phCM+rS0WolSou5F91YrtBZWvj067MKfdPyLL5b
        SlbKlOIdXJi7pJXq/+pRLYo=
X-Google-Smtp-Source: APXvYqxaVB+6AvROuLcSyHczDzjlB4ApeodtZQkLUp0pAO678Pj6wSye9jx569CCB3Gix+jv+Yjw6g==
X-Received: by 2002:a65:404d:: with SMTP id h13mr10279431pgp.156.1581810545957;
        Sat, 15 Feb 2020 15:49:05 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id n2sm11639955pfq.50.2020.02.15.15.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:49:05 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:49:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RESEND] input: mouse: convert to i2c_new_scanned_device
Message-ID: <20200215234903.GN183709@dtor-ws>
References: <20200210165902.5250-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210165902.5250-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 10, 2020 at 05:59:02PM +0100, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

> ---
> 
> Build tested only.
> 
>  drivers/input/mouse/psmouse-smbus.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
> index 027efdd2b2ad..27358e543283 100644
> --- a/drivers/input/mouse/psmouse-smbus.c
> +++ b/drivers/input/mouse/psmouse-smbus.c
> @@ -190,6 +190,7 @@ static int psmouse_smbus_create_companion(struct device *dev, void *data)
>  	struct psmouse_smbus_dev *smbdev = data;
>  	unsigned short addr_list[] = { smbdev->board.addr, I2C_CLIENT_END };
>  	struct i2c_adapter *adapter;
> +	struct i2c_client *client;
>  
>  	adapter = i2c_verify_adapter(dev);
>  	if (!adapter)
> @@ -198,12 +199,12 @@ static int psmouse_smbus_create_companion(struct device *dev, void *data)
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_HOST_NOTIFY))
>  		return 0;
>  
> -	smbdev->client = i2c_new_probed_device(adapter, &smbdev->board,
> -					       addr_list, NULL);
> -	if (!smbdev->client)
> +	client = i2c_new_scanned_device(adapter, &smbdev->board, addr_list, NULL);
> +	if (IS_ERR(client))
>  		return 0;
>  
>  	/* We have our(?) device, stop iterating i2c bus. */
> +	smbdev->client = client;
>  	return 1;
>  }
>  
> -- 
> 2.20.1
> 

-- 
Dmitry
