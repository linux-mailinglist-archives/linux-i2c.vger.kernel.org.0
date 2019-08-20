Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26F0963BA
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 17:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbfHTPHi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 11:07:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41343 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbfHTPHi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 11:07:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id 196so3553394pfz.8;
        Tue, 20 Aug 2019 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DkiWz4/oUykcz3CetsHvj+ZTvSgZaShwRg/roqjAoG4=;
        b=HIXbVJYAVa5CP6gWHuzx0/dC7fVXrTw9zU2MSb9Uljz0aYDrQkF8YZJkyQTfoxoJoO
         xqh2J+CXJbD0MsoWMpdj/lzFwUkvfVJi5jDbhk3Vc9S/caL5/v1OR2L8HjXNeALPawek
         JEZFFPYwgMFfQvnIOk26blf2uCN9jYLeoFjB2rjcSYPJczyWdG10RE8noegOBQTMAWwX
         W6zvFiu+A7iqcdyPDQtFfLm04AGKIyikl+ofJWNCpZ5f4D6HoTqB109VtO0jrzvpJYiF
         R3HMMfJr0C3Iqo62FrfwawgGcv92LvnnrSvYS/4edJZFSQSGu+ODPpd2dhtSP5E6DjvB
         z6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DkiWz4/oUykcz3CetsHvj+ZTvSgZaShwRg/roqjAoG4=;
        b=O6SpVI7Gk7ejOZhag0Y8EJaXi/FoARYkRukd1bPbSmSGtUWN5OD0ULG6X6nqSFP+re
         35+pL1NsAdULn4ZhKXYcSeaQwRrGguKFfUEG7M4eWIpaN49wxyOHJYvNz1ma6jPr2LQO
         QwBoK/cS9P0ALgW+RCbkVADNK68/aONsfSuB/PdljmUKnmgWCD+yeDfBUo9HIdSVZrlV
         VoXbCjq4tJ0SZav/tR5uM0APiHZrlOCCPt5az5sp6Wv4MF1C2jYmKhLLZBupp43At02r
         483BJLC8Ga/1oG04OsF9lyvx2aEBcckZJDmuBuW/om0N5pZAkzIQTi4RUe2l54LfyikS
         mtiA==
X-Gm-Message-State: APjAAAW3u+FPdew4c7wnjYpK2AOM95Y61DhjCYM3LRvzD9jW2/BWClxi
        7NxQCm0VQpi69NJyhcLwdjU=
X-Google-Smtp-Source: APXvYqx2VWYq4vASDoVbLStGzwIfVULSF3O6sguAYmaT68iESPnwHBaAPOSOJ/5iDyDdCQRwrnQSYw==
X-Received: by 2002:a65:5cca:: with SMTP id b10mr25855788pgt.365.1566313656771;
        Tue, 20 Aug 2019 08:07:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k5sm16575860pgo.45.2019.08.20.08.07.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 08:07:36 -0700 (PDT)
Date:   Tue, 20 Aug 2019 08:07:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v5 2/3] hwmon/ltc2990: Generalise DT to fwnode support
Message-ID: <20190820150735.GA12198@roeck-us.net>
References: <20190819121618.16557-1-max@enpas.org>
 <20190819121618.16557-2-max@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819121618.16557-2-max@enpas.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 19, 2019 at 02:16:17PM +0200, Max Staudt wrote:
> ltc2990 will now use device_property_read_u32_array() instead of
> of_property_read_u32_array() - allowing the use of software nodes
> via fwnode_create_software_node().
> 
> This allows code using i2c_new_device() to specify a default
> measurement mode for the LTC2990 via fwnode_create_software_node().
> 
> Signed-off-by: Max Staudt <max@enpas.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2990.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> index f9431ad43..53ff50517 100644
> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -13,7 +13,7 @@
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
>  
>  #define LTC2990_STATUS	0x00
>  #define LTC2990_CONTROL	0x01
> @@ -206,7 +206,6 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>  	int ret;
>  	struct device *hwmon_dev;
>  	struct ltc2990_data *data;
> -	struct device_node *of_node = i2c->dev.of_node;
>  
>  	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>  				     I2C_FUNC_SMBUS_WORD_DATA))
> @@ -218,9 +217,10 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>  
>  	data->i2c = i2c;
>  
> -	if (of_node) {
> -		ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
> -						 data->mode, 2);
> +	if (dev_fwnode(&i2c->dev)) {
> +		ret = device_property_read_u32_array(&i2c->dev,
> +						     "lltc,meas-mode",
> +						     data->mode, 2);
>  		if (ret < 0)
>  			return ret;
>  
