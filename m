Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F5470893
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 20:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfGVS3L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 14:29:11 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38031 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfGVS3K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jul 2019 14:29:10 -0400
Received: by mail-pl1-f195.google.com with SMTP id az7so19521773plb.5;
        Mon, 22 Jul 2019 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CgLso7wg/n5mvTltOdlePC8HRWHW/pb6Dm2YlkFggU0=;
        b=Hnn/4QnM6mEZ7DymuKl5WfL9uvJKGhXBLXxlARWVVfnpHIezbDzvDi2QLEagA7PoWm
         dBDpHgkofgPzofwa72tXzw8O5HI/2CcRYx6vy2/K4UoUJ3RiN8fg8jIsvZZTHzz2yzhM
         5Iw6YvSVuJEB0ZvrXMM7LnoKaoaGnnzj/TTp/FBSdR+FRyg/AJIYilsGEPwZBvvG9Mvi
         9h3Y4B27dWw1j1Ec+S8icbg1jhe+hQgzuhsT8DZhsTrqW6wWrYYp4J/4UJFYVnkzN1QW
         NL6q9hBNG3ThRNma4INTm71vKxUbiG8xVcfazMEgIsDd5T/Rh4YC7IFl5k8+Oa/hhdUj
         dqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=CgLso7wg/n5mvTltOdlePC8HRWHW/pb6Dm2YlkFggU0=;
        b=HfsyTM9/1M3X9GDl+UJUPulo+XsS/puvk9KZPYSPAMRRFU3IDy1lQp3UHNwvfuqFsL
         OWVLa+dargrUOw7qyEbWbm9LPfuw2qUncCNTkkEH7uzx2LS3tegwzSj4k8W1RRmp9/mw
         AwxBJDNo0Fym5/R+dOnmRmNYN0MrbM1ZC8vYyi5WmMppYDU88DvAMwGn0GDgz6JNwI/h
         OYwRN8OQqI4j9711tWVnll5nBDcpp16QfC8VV3jgy9juFUll31iHWimkOvVG1gYJjawz
         VGuQkLiRm6fAQaU6IOQHl1xkuxdmkqTIEkJUON555dTfP/yUm3OmekfSmTQ0sf5PvzSw
         /uHA==
X-Gm-Message-State: APjAAAXHUb/m1p6r4ONarAFrrovCbsVW7QQVbiuYQlEHcf3fNyI6gC/r
        7/qQJO+Ix7H9adthbiXV1kPoPehM
X-Google-Smtp-Source: APXvYqxAj6rNc3sJLjKGthaS4k4zkIVSq605Sp7sZLQWPaiythj0NWc5k7hSux9BVkLdxpIfdF9IdQ==
X-Received: by 2002:a17:902:b28b:: with SMTP id u11mr73256494plr.11.1563820150125;
        Mon, 22 Jul 2019 11:29:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b16sm62760306pfo.54.2019.07.22.11.29.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:29:09 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:29:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: smm665: convert to i2c_new_dummy_device
Message-ID: <20190722182908.GA16788@roeck-us.net>
References: <20190722172611.3797-1-wsa+renesas@sang-engineering.com>
 <20190722172611.3797-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722172611.3797-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 07:26:09PM +0200, Wolfram Sang wrote:
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
>  drivers/hwmon/smm665.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
> index d8c91c2cb8cf..6eff14fe395d 100644
> --- a/drivers/hwmon/smm665.c
> +++ b/drivers/hwmon/smm665.c
> @@ -586,10 +586,10 @@ static int smm665_probe(struct i2c_client *client,
>  
>  	data->client = client;
>  	data->type = id->driver_data;
> -	data->cmdreg = i2c_new_dummy(adapter, (client->addr & ~SMM665_REGMASK)
> +	data->cmdreg = i2c_new_dummy_device(adapter, (client->addr & ~SMM665_REGMASK)
>  				     | SMM665_CMDREG_BASE);
> -	if (!data->cmdreg)
> -		return -ENOMEM;
> +	if (IS_ERR(data->cmdreg))
> +		return PTR_ERR(data->cmdreg);
>  
>  	switch (data->type) {
>  	case smm465:
