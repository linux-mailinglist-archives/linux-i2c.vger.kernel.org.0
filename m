Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 988DD16EC95
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 18:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbgBYRgE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 12:36:04 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40248 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgBYRgE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 12:36:04 -0500
Received: by mail-pg1-f194.google.com with SMTP id t24so2823091pgj.7
        for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2020 09:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iHldEMtAQzU2muGznH07ete4KNZDk8elnzzM/Hltz7s=;
        b=JxBv25dzLz6p4j+sj8FmgacTPVkvpIMx5hL6KtUL1e0iT7GeAo/gXXfK+C3EIkaRJS
         zwkPx5XUWo0NgKRUCGoWge9R8E2RQS0d3anVYStJjLiOTkKS2BxARhRvYtnrw9yVKZi0
         wu7iXEDjykykvn4KClf7wISEKv9WWVvKqW4ZKnYPSVaV6JVtPxZ6YjEb3mW4Sd9fYPYs
         /UGNEt9AvrE7t8NJpUBH1FIa1Yo4q7V4nwPwcpkU48eXC4FIJSPpXt+CRnD0tgvA2L24
         tvBMrn89J61CSJ94DvOXMbLb/nF8EA951RokFars0CaUnLO9RAaF/yd0ARglend9MqZt
         jSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=iHldEMtAQzU2muGznH07ete4KNZDk8elnzzM/Hltz7s=;
        b=YEecF2LD10TAA8wj3X2rdfAdSFvdSUqhNoRGOh/eq13B5Os9V8hBdjPVlIGHU+byVG
         dqpsUkbkIj5WkCmW9K/WZZGklXBgObIHIwS5p+h3nEoNbVJM2naHnllFIZe4O9p0zME5
         ju2zY6oUGsoPXo+h7UjTXl66HtNri9bWRlBGnbc2/Uu7Kr6MXbNFL0vpuGN9zio+Ywjx
         eyRuEUjrx3TbYCg0uPHqD3Ukci7zRxR2QSWu+uQWtRyyIvKc7lfHjnJzReXBvnTSdKsY
         u/UdFVHMC0BWJHPlo1yGyaNYAlaccy62I9hdykj9qJptsNEIHV/MVmN99TecJ5wha+KA
         YaOA==
X-Gm-Message-State: APjAAAWnlaPN7U9aGiw1ZbsSGpm7C2DysUcoYQIHTo8BapKEL8aIv0Av
        3qQoj5T6ZMseZHl1JpnjioUv65Pu
X-Google-Smtp-Source: APXvYqzIbEa6pCEHi0U7XxwmoMw7fXlsp35C3RT4xMYtMvrRJBCeMwKlN0PhHawsqTOlVQzoC1a/fA==
X-Received: by 2002:a63:e044:: with SMTP id n4mr57725064pgj.338.1582652163762;
        Tue, 25 Feb 2020 09:36:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z30sm17891293pff.131.2020.02.25.09.36.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:36:02 -0800 (PST)
Date:   Tue, 25 Feb 2020 09:36:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 13/40] i2c: diolan-u2c: Use generic definitions for
 bus frequencies
Message-ID: <20200225173601.GA22093@roeck-us.net>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-13-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224151530.31713-13-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 05:15:03PM +0200, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/i2c/busses/i2c-diolan-u2c.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
> index 382f105e0fe3..9ac79547d30b 100644
> --- a/drivers/i2c/busses/i2c-diolan-u2c.c
> +++ b/drivers/i2c/busses/i2c-diolan-u2c.c
> @@ -64,8 +64,6 @@
>  #define U2C_I2C_SPEED_2KHZ	242	/* 2 kHz, minimum speed */
>  #define U2C_I2C_SPEED(f)	((DIV_ROUND_UP(1000000, (f)) - 10) / 2 + 1)
>  
> -#define U2C_I2C_FREQ_FAST	400000
> -#define U2C_I2C_FREQ_STD	100000
>  #define U2C_I2C_FREQ(s)		(1000000 / (2 * (s - 1) + 10))
>  
>  #define DIOLAN_USB_TIMEOUT	100	/* in ms */
> @@ -87,7 +85,7 @@ struct i2c_diolan_u2c {
>  	int ocount;			/* Number of enqueued messages */
>  };
>  
> -static uint frequency = U2C_I2C_FREQ_STD;	/* I2C clock frequency in Hz */
> +static uint frequency = I2C_STANDARD_MODE_FREQ;	/* I2C clock frequency in Hz */
>  
>  module_param(frequency, uint, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(frequency, "I2C clock frequency in hertz");
> @@ -299,12 +297,12 @@ static int diolan_init(struct i2c_diolan_u2c *dev)
>  {
>  	int speed, ret;
>  
> -	if (frequency >= 200000) {
> +	if (frequency >= 2 * I2C_STANDARD_MODE_FREQ) {
>  		speed = U2C_I2C_SPEED_FAST;
> -		frequency = U2C_I2C_FREQ_FAST;
> -	} else if (frequency >= 100000 || frequency == 0) {
> +		frequency = I2C_FAST_MODE_FREQ;
> +	} else if (frequency >= I2C_STANDARD_MODE_FREQ || frequency == 0) {
>  		speed = U2C_I2C_SPEED_STD;
> -		frequency = U2C_I2C_FREQ_STD;
> +		frequency = I2C_STANDARD_MODE_FREQ;
>  	} else {
>  		speed = U2C_I2C_SPEED(frequency);
>  		if (speed > U2C_I2C_SPEED_2KHZ)
> -- 
> 2.25.0
> 
