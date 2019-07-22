Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7AC70889
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 20:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbfGVS2R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 14:28:17 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43434 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727619AbfGVS2R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jul 2019 14:28:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so17780038pfg.10;
        Mon, 22 Jul 2019 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wd8ObT4DxPPZRnnnuH6ifTnv93ZXwiFPQo0O7f50tws=;
        b=WDSJbCYucvcIcyjyZSLpKLJ14/eSxhg6f1rBl8kBIsYxCxr/GUM971gVq3RqTrFyHW
         D8IYNYO+V4zJ95yJo8aO97lYyGZW8brSelXjmQLaeYpZXfyi3GYNCo/Y8aham/+uI9dr
         elVYH3/jJA48LKvmp3FShI9XGfkY7igmbNs8zTjbD/XW6P26tf6+MlWtrHYO5kBwAHHM
         D6C/Urk08620rvoW5wxRHGckzUDQgP+9E6t9A8a0jlkDGIkU8wiTFbGj2ja5d77Qd4hz
         +BK21gm6TIO1hCIsAN8htOQii62pjBKsrADoOZSPfYIznlbU0KQ/tA20bHePoBtZZddY
         f9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wd8ObT4DxPPZRnnnuH6ifTnv93ZXwiFPQo0O7f50tws=;
        b=QCDuVet5LloYJNH37hs85JngMMnIxvRBwUOin8Gr/XAPfLrSWVpOmHzP0bxz2vhT3R
         eLIioMLPBVgDwNXi68rVldzhafjUiE0f01eyBs8+xpH/BFa0yRwMkkUTPrJ1WbSNmXlL
         xmzbdIyj5Q03o2JFf4rUgX3oEl2nYx99LDpIOziIB5pY9Gt5lHiIqc239BNEJ6acmkni
         W6jusJGcDyKe0HcDQXTxz1D/oWMk4yiJGaZ88KTuHPz4hgINUw7gbGZMedNTM0sHHT47
         h31ygbyDdHqBgPsmh8hVV7QtV+0jHDuiOGU3mJu7eG0GcEPo4ZEnvPLqzQAgGRBLvsM3
         aV2g==
X-Gm-Message-State: APjAAAVyyRZkEIwH2HkBUwDFeYjhQmdrByQM5odWfuLF7dFJUfSpZ71A
        lo8+RIZVRxbKVQTQyF4XndSi+5q2
X-Google-Smtp-Source: APXvYqzifbu00NyTEoCfMkVltkJS9/qPGnFoa/tkqzugrbpI4n5AklJL5xyvtmf//atdPHYS3lcFvA==
X-Received: by 2002:a63:4823:: with SMTP id v35mr45450468pga.138.1563820096563;
        Mon, 22 Jul 2019 11:28:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14sm39880013pfn.53.2019.07.22.11.28.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:28:16 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:28:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: asb100: convert to i2c_new_dummy_device
Message-ID: <20190722182815.GA16669@roeck-us.net>
References: <20190722172611.3797-1-wsa+renesas@sang-engineering.com>
 <20190722172611.3797-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722172611.3797-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 07:26:08PM +0200, Wolfram Sang wrote:
> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/hwmon/asb100.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/asb100.c b/drivers/hwmon/asb100.c
> index c9fa84b25678..4c609e23a4ef 100644
> --- a/drivers/hwmon/asb100.c
> +++ b/drivers/hwmon/asb100.c
> @@ -706,21 +706,21 @@ static int asb100_detect_subclients(struct i2c_client *client)
>  		goto ERROR_SC_2;
>  	}
>  
> -	data->lm75[0] = i2c_new_dummy(adapter, sc_addr[0]);
> -	if (!data->lm75[0]) {
> +	data->lm75[0] = i2c_new_dummy_device(adapter, sc_addr[0]);
> +	if (IS_ERR(data->lm75[0])) {
>  		dev_err(&client->dev,
>  			"subclient %d registration at address 0x%x failed.\n",
>  			1, sc_addr[0]);
> -		err = -ENOMEM;
> +		err = PTR_ERR(data->lm75[0]);
>  		goto ERROR_SC_2;
>  	}
>  
> -	data->lm75[1] = i2c_new_dummy(adapter, sc_addr[1]);
> -	if (!data->lm75[1]) {
> +	data->lm75[1] = i2c_new_dummy_device(adapter, sc_addr[1]);
> +	if (IS_ERR(data->lm75[1])) {
>  		dev_err(&client->dev,
>  			"subclient %d registration at address 0x%x failed.\n",
>  			2, sc_addr[1]);
> -		err = -ENOMEM;
> +		err = PTR_ERR(data->lm75[1]);
>  		goto ERROR_SC_3;
>  	}
>  
