Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9691E96670
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 18:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729975AbfHTQcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 12:32:33 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38504 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHTQcd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 12:32:33 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so13087272wrr.5
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2019 09:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wzFwBxJwNYVFz8c23UR6EVA4QWVFqmII5gU+JmWuczE=;
        b=UVuz+pt2vpL53mRHNmJ1TU5lEwmqvpAXHYMHYAuJ3MR3nGicW67xSDcxejCOHaChSn
         UxPNWcr4L2TAJk3Xipd3O7/xHpg9t/yJmTmR0/aPF3QIWtv9tg2DqcIQ4EJ3jZm4wsUV
         hFlG7wocFSEg6zjiqAtU5WUmZyezDVH1mXwTQfJwrUzEaePzW4+vK+A9jfOiTJebaG6b
         S+w4UblzXJLp/M4k/NYD40/x7Smfg5Op6MQqThvRO34g37kPVzeRGySFW+FXGMZ5PSQs
         8J19gTKqWWZ3Irun4ynV1p8TuMjnmYBhBDtY/aWQHNSFyJpmyHiQFtj/gueWk1khKcSa
         BmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wzFwBxJwNYVFz8c23UR6EVA4QWVFqmII5gU+JmWuczE=;
        b=trBELxxAcQT7BVeQ9cGBOpyvvh96fozbSH4ieHtlVonPRmPVYUlS78rRKQUK+E4HX+
         BYo7EymvaH9bYeZ4+Ri4gB27k3JU6Ov0VtFCvF2TVQToNuMP2Twlf/h6g84aOAPBIgR9
         6Te8xGvlw02US3md1xm3iz9nuSotOzqoS1YFHTvHy2JlKFYW39PFBd3YYqJ/iBX/bciG
         R22OdsDeIsqZpP7qs5HRa339k0wvyn4arHph7wxqDm/VSAUxrddy7DuByouophrFfPD5
         BefbRUNqzwU07SPHXsxO20V4clzonezuxmKgdFcCurxr9p2ugQoOxKJp2WuOOzJ62kQ3
         rQUA==
X-Gm-Message-State: APjAAAUkk0Sk4zd//tmCU4dzD1ZVxec46G2OjaUrOAM7HkVR3OTI2ncW
        KvOweWtTNchq1uJ4EKd0oSDqsQ==
X-Google-Smtp-Source: APXvYqxZeEQOGmvTSeY3NAXBX2ijAVwVyFh7cjQfFiojdkB4QWK59zEazcrFVniEAzKjEwyVc8J9Qw==
X-Received: by 2002:a05:6000:10cf:: with SMTP id b15mr35124310wrx.180.1566318751477;
        Tue, 20 Aug 2019 09:32:31 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id g12sm20431627wrv.9.2019.08.20.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 09:32:30 -0700 (PDT)
Date:   Tue, 20 Aug 2019 17:32:28 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: backlight: tosa_lcd: drop check because
 i2c_unregister_device() is NULL safe
Message-ID: <20190820163228.xuz7su6psovp6pkp@holly.lan>
References: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820153439.7638-1-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 20, 2019 at 05:34:39PM +0200, Wolfram Sang wrote:
> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> Build tested only, buildbot is happy, too.
> 
> Please apply to your tree.
> 
>  drivers/video/backlight/tosa_lcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
> index 65cb7578776f..29af8e27b6e5 100644
> --- a/drivers/video/backlight/tosa_lcd.c
> +++ b/drivers/video/backlight/tosa_lcd.c
> @@ -222,8 +222,7 @@ static int tosa_lcd_remove(struct spi_device *spi)
>  {
>  	struct tosa_lcd_data *data = spi_get_drvdata(spi);
>  
> -	if (data->i2c)
> -		i2c_unregister_device(data->i2c);
> +	i2c_unregister_device(data->i2c);
>  
>  	tosa_lcd_tg_off(data);
>  
> -- 
> 2.20.1
> 
