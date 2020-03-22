Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1D218E5D7
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 02:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgCVBkF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Mar 2020 21:40:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43976 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgCVBkF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Mar 2020 21:40:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id n20so7465485lfl.10;
        Sat, 21 Mar 2020 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rh41HaJLEukHlz9L4bxl8YXEU6CfzBjQTvMTQdRv0XI=;
        b=A2itsDePqsyV9qrFuNgM0lFfYTDt2HciDl+SeWHWoG607WDTZ3NKOEUj/LTyHKoS+F
         jFFmmFNqd0YbjegQ+LKYjVOQKfcM5GoRKu265mMTGz6umdE3CuB8CrKPhuoASZ2cVcMK
         NZ+FFeRq6MKgqt2sVoZfOVSyd6y/SfQpSZ3O/EBWT0z7ObJtLbZjsjQhuwx+a3ok8cvR
         Osr5594oaONix/PQH9CT9YwG2GnIvd/m1XCP/crl3iomVlAnueyIdosEFK3tA4BaMgRS
         5ryZ9AzidUx62wkuDP3GbMsVN4VLA0W9vmL7sxvmhU7dvwJmRzz8umctuAvYyPmbNXOR
         yQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rh41HaJLEukHlz9L4bxl8YXEU6CfzBjQTvMTQdRv0XI=;
        b=bqynzamJ15fhHPCOEVSSJPGSIKUcQawmAlnmITm/U4WK6gXLa/R0UCFkRNaO18uDRb
         sgEIwByTfCjAuqgd1GcK0Z/KcQBwAc3S/vxkDIUQ+oSKAkxq3Pc5NTOOFqFN5EkMMNdM
         3OYcOWI+a93UBegeZmcQKFGmzckVEJiV0cR+nwb6FQzTDZPgm0xdupb7pBDRWGB0k1RU
         6DrXKq7k2JZjrCNjNyMHB9bcnLWb6klF1nBBihSZBySmQWP85ZZBhz5iPIm9/iNMfHif
         4PiHFGKYoU+L2Hpq6ezTEGHW6ZIgvx2p4Yc9S5SFOx4/0xGOtmR2o71oSyaCEooyeYbH
         eUDQ==
X-Gm-Message-State: ANhLgQ0MNLjkTIkofcaWwETvze7MjFugwU2FCaDmglWzMF7ibEtqE23K
        E2oG+/4+2mgUcFC+C+aUc8xoBSsy
X-Google-Smtp-Source: ADFU+vuZuozUWQV6BLICwAKo1+jI/TEjXwD9hBKtQ5v8aWyvrI6KABdk5u6lFT+g2Nofdvdv+/5hhA==
X-Received: by 2002:ac2:5092:: with SMTP id f18mr1773895lfm.162.1584841200457;
        Sat, 21 Mar 2020 18:40:00 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id d20sm6016843lfl.53.2020.03.21.18.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2020 18:39:59 -0700 (PDT)
Subject: Re: [PATCH v2] i2c: at91: support atomic write xfer
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Stefan Lengfeld <contact@stefanchrist.eu>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6466e066d7cbad20cb6a334ad8e37cdcf521c492.1584822011.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c789352c-5517-1fd9-980d-f8f6c2017901@gmail.com>
Date:   Sun, 22 Mar 2020 04:39:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6466e066d7cbad20cb6a334ad8e37cdcf521c492.1584822011.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

22.03.2020 00:03, Michał Mirosław пишет:
> Implement basic support for atomic write - enough to get a simple
> write to PMIC on shutdown. Only for chips having ALT_CMD register,
> eg. SAMA5D2.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
> v2: remove runtime-PM usage
>     switch to readl*poll*atomic() for transfer completion wait
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 69 +++++++++++++++++++++++++++-
>  1 file changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index ba6fbb9c7390..d9226207157a 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -21,6 +21,7 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -709,6 +710,69 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
>  	return ret;
>  }
>  
> +static int at91_twi_xfer_atomic(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
> +{
> +	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
> +	unsigned long timeout;
> +	struct pinctrl *pins;
> +	__u32 stat;
> +	int ret;
> +
> +	/* FIXME: only single write request supported to 7-bit addr */
> +	if (num != 1)
> +		return -EOPNOTSUPP;
> +	if (msg->flags & I2C_M_RD)
> +		return -EOPNOTSUPP;
> +	if (msg->flags & I2C_M_TEN)
> +		return -EOPNOTSUPP;
> +	if (msg->len > dev->fifo_size && msg->len > 1)
> +		return -EOPNOTSUPP;
> +	if (!dev->pdata->has_alt_cmd)
> +		return -EOPNOTSUPP;
> +
> +	pins = pinctrl_get_select_default(&adap->dev);
> +
> +	ret = clk_prepare_enable(twi_dev->clk);

Hello Michał,

Please see comments to the clk_prepare_enable() and clk_prepare().

/* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
static inline int clk_prepare_enable(struct clk *clk)
...
 * clk_prepare may sleep, which differentiates it from clk_enable.

