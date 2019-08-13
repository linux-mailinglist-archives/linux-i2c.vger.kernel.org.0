Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119B08B1EE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 10:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfHMICl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 04:02:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44239 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfHMICk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 04:02:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so2131552pfc.11;
        Tue, 13 Aug 2019 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k/6wKTc53OC0UoKco+IHEoMX3rwe81VTNIAepCWXh/w=;
        b=tj4sQol176Upm6T0xavK0OYlwKCkQiO0Eylg00C+Q2aEkT3zNyzepErrKnXAhBNOA9
         XTbASJ6cNDSu/hJ0jSzAUKlHkxt7MOcylyDIYU33ZiS6PBYdsFvHmbGR31IvpyqPRNEu
         ZanywJH3P+DPqb51mWZVLvTP4A+WzXCpJakQaN6s1CQ7Tz4g+I6QnvBxZqLCrl3Wpy+b
         RE08m+1+h4nZon8iRKlqeDdmwePZHsbDnHe5GBe5N21roExt5GjBO/odnO+ErpFq9MJx
         zbKlxKTizUwtMIDVD6bUqPReIR5GyMFPXBGa7mkk9p6nflVcIUSzl3deZQ1kJASAzUjc
         Z3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=k/6wKTc53OC0UoKco+IHEoMX3rwe81VTNIAepCWXh/w=;
        b=JC2Z0AtVX/p3m3jCFrtmYQRpsF9XlmVSD7WBdDz+qxE+3D1Q+bZxgrukjFtyWAaWAU
         Tj+Bl/S5lDjqFUnz21chiI7ofj5pWyiIQi9mFfGj/nouXcrzVOAi2GJT4PRWL/YhciDa
         wCNsRsFb/qoE2vykzuMtdfl8/aAIHvTDhS7Z1D/kMc5YWGDuPvLpcV5CPmay819C4wNJ
         R/cwafxQscuScdyW08K+CKorc9mv2QKAtPc/jkUPWcUMA+xJeI5Aj7S7/B/eRg1O5Fdi
         KowEIVf10rDDLXBf6ziX7B5Z/+bi5vXk+H9m5HpNKLbIz82YRIx/0wqNCDpmuGzjdv0J
         ne9w==
X-Gm-Message-State: APjAAAW7iMrsY20QAogjMtQBNBngUo4wRzxYJVitUD8+/1mpvIBJHdbm
        EAAnPmd/bZXy47xXLxutMOKyrKum
X-Google-Smtp-Source: APXvYqzg+LpLRDxEnrzIayn33qIS4rLLIS+1xej7SVfd8zkZpsH/hvU8xhpaYTXutpa7glcZBqPZdw==
X-Received: by 2002:a65:690f:: with SMTP id s15mr32542467pgq.432.1565683359926;
        Tue, 13 Aug 2019 01:02:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14sm35410531pgu.8.2019.08.13.01.02.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 01:02:38 -0700 (PDT)
Date:   Tue, 13 Aug 2019 01:02:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v2 3/4] hwmon/ltc2990: Add platform_data support
Message-ID: <20190813080237.GA29986@roeck-us.net>
References: <20190812235237.21797-1-max@enpas.org>
 <20190812235237.21797-3-max@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812235237.21797-3-max@enpas.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 13, 2019 at 01:52:36AM +0200, Max Staudt wrote:
> This allows code using i2c_new_device() to specify a measurement mode.
> 
> Signed-off-by: Max Staudt <max@enpas.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/hwmon/ltc2990.c               |  9 +++++++++
>  include/linux/platform_data/ltc2990.h | 11 +++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 include/linux/platform_data/ltc2990.h
> 
> diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> index f9431ad43..f19b9c50c 100644
> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -14,6 +14,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/ltc2990.h>
>  
>  #define LTC2990_STATUS	0x00
>  #define LTC2990_CONTROL	0x01
> @@ -206,6 +207,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>  	int ret;
>  	struct device *hwmon_dev;
>  	struct ltc2990_data *data;
> +	struct ltc2990_platform_data *pdata = dev_get_platdata(&i2c->dev);
>  	struct device_node *of_node = i2c->dev.of_node;
>  
>  	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> @@ -227,6 +229,13 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>  		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
>  		    data->mode[1] & ~LTC2990_MODE1_MASK)
>  			return -EINVAL;
> +	} else if (pdata) {
> +		data->mode[0] = pdata->meas_mode[0];
> +		data->mode[1] = pdata->meas_mode[1];
> +
> +		if (data->mode[0] & ~LTC2990_MODE0_MASK ||
> +		    data->mode[1] & ~LTC2990_MODE1_MASK)
> +			return -EINVAL;

I would prefer if the driver was modified to accept device
properties, and if those were set using the appropriate
fwnode function. Any reason for not doing that ?

Thanks,
Guenter
