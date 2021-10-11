Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745014291D7
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 16:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237237AbhJKOdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 10:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241909AbhJKOd1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 10:33:27 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43929C0730D8;
        Mon, 11 Oct 2021 07:19:57 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id z126so10567801oiz.12;
        Mon, 11 Oct 2021 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UbGuAATq8mLj9g7D7Nf8m9hUhR84YLhH9t20OW/RVOE=;
        b=XWdktjJnh0P6lHjIzWWc84inm2wXSNR4cepzAkZunwwAgZlquQrHN8Y5c1+stM0dNM
         UC1WDygiDcc+MyHvuSPOag0Ez0H7ZEVyKQQobWcW9pIwmN8J4fHvL6cuHCSmaYBDCCuj
         xsCCpK8VrgH6vy2peSt3f6ZJb4hboitCtmK94ZigsY2L7p9B3z2ErygniQnsck4BLBt/
         m9IIHYz+/gbR9sO3vOQefhSf5kTEhUwu4A6nVOidoYVoMRHPnR9sVn4z+WPR81Vqgtlg
         LX0rk4zJMudaew2TlF0TbOptKY+RmLKk+HUs7DhB1xVah5Q6ch8Ubq2ZgG7fByERqwUX
         lu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=UbGuAATq8mLj9g7D7Nf8m9hUhR84YLhH9t20OW/RVOE=;
        b=6B8mJBr+1jBbfhlhBRiC1RQcI41NXBItx6WJwpk65px71ZzzqHkGlrdxqpxKzcGw4F
         QNAWwfo6LJdWPomUMZu5dJSWf2J53KIp5TURsJkM3e1DnN7T6nEpvF6oKCy2ddXgnJXj
         4m5JwuJSx4CwUDZXUYk8FlAja098HeKsivWdS6lUd7h58NWdHnVVx1pUmxK5ZqsC6z+w
         ueWZaQpfa7n1qRYVfLhMSmpccl7dY1OlknnPrGMXyYD4Y1c9/cL6u41eBMPChjvnkJwe
         Cmbzb/T6jUCZwBOLsDOS6iM/CfBDGhqFqKoJiXm4tkkLmk2rf7QoKbWL0h+ZVuH5njH+
         o+3Q==
X-Gm-Message-State: AOAM533+XtB+gcH+PWhresU3qnVKuP/C7ou6HDjw5/mJ7Wu3EAqoGs0V
        oG763aahCCD3dYA6aWLIcLI=
X-Google-Smtp-Source: ABdhPJx/7iUyf3S/FbfB1eh7GysE2vnW5Jg+PeQm8Kc898xQZRzpj9qct9Uh/Q9ZPXgigiRDWNvHzA==
X-Received: by 2002:aca:ad45:: with SMTP id w66mr2186046oie.148.1633961996675;
        Mon, 11 Oct 2021 07:19:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bc19sm1585045oob.29.2021.10.11.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 07:19:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 11 Oct 2021 07:19:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, kernel@pengutronix.de,
        linux-hwmon@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 02/13] hwmon: adt7x10: Make adt7x10_remove() return void
Message-ID: <20211011141954.GA1862555@roeck-us.net>
References: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
 <20211011132754.2479853-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211011132754.2479853-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 11, 2021 at 03:27:43PM +0200, Uwe Kleine-König wrote:
> Up to now adt7x10_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.
> 
> Also the return value of i2c and spi remove callbacks is ignored anyway.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7310.c | 3 ++-
>  drivers/hwmon/adt7410.c | 3 ++-
>  drivers/hwmon/adt7x10.c | 3 +--
>  drivers/hwmon/adt7x10.h | 2 +-
>  4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7310.c b/drivers/hwmon/adt7310.c
> index 9fad01191620..c40cac16af68 100644
> --- a/drivers/hwmon/adt7310.c
> +++ b/drivers/hwmon/adt7310.c
> @@ -90,7 +90,8 @@ static int adt7310_spi_probe(struct spi_device *spi)
>  
>  static int adt7310_spi_remove(struct spi_device *spi)
>  {
> -	return adt7x10_remove(&spi->dev, spi->irq);
> +	adt7x10_remove(&spi->dev, spi->irq);
> +	return 0;
>  }
>  
>  static const struct spi_device_id adt7310_id[] = {
> diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
> index 9d80895d0266..973db057427b 100644
> --- a/drivers/hwmon/adt7410.c
> +++ b/drivers/hwmon/adt7410.c
> @@ -50,7 +50,8 @@ static int adt7410_i2c_probe(struct i2c_client *client)
>  
>  static int adt7410_i2c_remove(struct i2c_client *client)
>  {
> -	return adt7x10_remove(&client->dev, client->irq);
> +	adt7x10_remove(&client->dev, client->irq);
> +	return 0;
>  }
>  
>  static const struct i2c_device_id adt7410_ids[] = {
> diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
> index 3f03b4cf5858..e9d33aa78a19 100644
> --- a/drivers/hwmon/adt7x10.c
> +++ b/drivers/hwmon/adt7x10.c
> @@ -444,7 +444,7 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
>  }
>  EXPORT_SYMBOL_GPL(adt7x10_probe);
>  
> -int adt7x10_remove(struct device *dev, int irq)
> +void adt7x10_remove(struct device *dev, int irq)
>  {
>  	struct adt7x10_data *data = dev_get_drvdata(dev);
>  
> @@ -457,7 +457,6 @@ int adt7x10_remove(struct device *dev, int irq)
>  	sysfs_remove_group(&dev->kobj, &adt7x10_group);
>  	if (data->oldconfig != data->config)
>  		adt7x10_write_byte(dev, ADT7X10_CONFIG, data->oldconfig);
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(adt7x10_remove);
>  
> diff --git a/drivers/hwmon/adt7x10.h b/drivers/hwmon/adt7x10.h
> index 21ad15ce3163..a1ae682eb32e 100644
> --- a/drivers/hwmon/adt7x10.h
> +++ b/drivers/hwmon/adt7x10.h
> @@ -26,7 +26,7 @@ struct adt7x10_ops {
>  
>  int adt7x10_probe(struct device *dev, const char *name, int irq,
>  	const struct adt7x10_ops *ops);
> -int adt7x10_remove(struct device *dev, int irq);
> +void adt7x10_remove(struct device *dev, int irq);
>  
>  #ifdef CONFIG_PM_SLEEP
>  extern const struct dev_pm_ops adt7x10_dev_pm_ops;
