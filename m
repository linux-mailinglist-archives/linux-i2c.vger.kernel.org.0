Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7EE16AD62
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 18:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbgBXR3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 12:29:17 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38837 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgBXR3R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 12:29:17 -0500
Received: by mail-wr1-f65.google.com with SMTP id e8so11376623wrm.5
        for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2020 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OXnM2pHHZadO4iep0ax68m51bnsYuUuM4flKV/57dGc=;
        b=KMYb3/bw2nzCMsWW9coIYOq2v8S2fai3yvZ5P5k3eEFgNa5QCFyKzj677hkFdRXmqz
         +E0wDyVDKtBmFZq27Ca5np/cs1511c9iNTUNlrDN7CGWU9HlPDTxF0PNl8YRucOBPA6w
         9hwM5haFMVZ/BhKWnnv6K3LzlCD1grKJRX4UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OXnM2pHHZadO4iep0ax68m51bnsYuUuM4flKV/57dGc=;
        b=qYph8WWljVcPA2YEPuMOsuGyvMCLzPeEmT7yYquj1abEoiL7dNC0LiikP4nYWsD7GY
         F3LPv9NmLdFmtGX86q4vOnU2O2jlC5wqYF41UvKowl8UmrT4/qW1WX8R+2J3rAnH4uVW
         iO8C90fxHBMhpgviRV9y1ZSj4pirOQsoTcTCPQW0tQ4pwU9vmoOqwOhw3qpDDZ1xXK/5
         WB9Z2sGLDZ6Re8Z++4C6/qA6FA5Eut2F/bF9ICGvaojje7yoKxnh4d89TE6FG3DJ2h3C
         6eQcWYagdA2jhnQKdSHkysT6d3Br8qls3wyk3CPWTBQBBk/jElyUFvg+cZIK3shcvldg
         qWpQ==
X-Gm-Message-State: APjAAAU2HnafqKI203J88QorxzZWaadYKeNYd9FrEyyyqhF2Ckj7Y19z
        y1gNZiVi8jJojFTRY9tiExcIRg==
X-Google-Smtp-Source: APXvYqzqHfEAHfGn6GN4xNBuPzwzb+clbFdqWMkJLBLKqLtSBSbZAP6uDsoCHUwr4/bryZr0JeGrHw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr64826068wru.87.1582565355451;
        Mon, 24 Feb 2020 09:29:15 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id c9sm69157wmc.47.2020.02.24.09.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 09:29:14 -0800 (PST)
Subject: Re: [PATCH v1 08/40] i2c: bcm-iproc: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-8-andriy.shevchenko@linux.intel.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <ac206455-b557-1699-4f57-b02b99bf86a7@broadcom.com>
Date:   Mon, 24 Feb 2020 09:29:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224151530.31713-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks Andy.

On 2020-02-24 7:14 a.m., Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/i2c/busses/i2c-bcm-iproc.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 30efb7913b2e..627ad88dcf04 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -858,25 +858,25 @@ static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *iproc_i2c)
>   	if (ret < 0) {
>   		dev_info(iproc_i2c->device,
>   			"unable to interpret clock-frequency DT property\n");
> -		bus_speed = 100000;
> +		bus_speed = I2C_STANDARD_MODE_FREQ;
>   	}
>   
> -	if (bus_speed < 100000) {
> +	if (bus_speed < I2C_STANDARD_MODE_FREQ) {
>   		dev_err(iproc_i2c->device, "%d Hz bus speed not supported\n",
>   			bus_speed);
>   		dev_err(iproc_i2c->device,
>   			"valid speeds are 100khz and 400khz\n");
>   		return -EINVAL;
> -	} else if (bus_speed < 400000) {
> -		bus_speed = 100000;
> +	} else if (bus_speed < I2C_FAST_MODE_FREQ) {
> +		bus_speed = I2C_STANDARD_MODE_FREQ;
>   	} else {
> -		bus_speed = 400000;
> +		bus_speed = I2C_FAST_MODE_FREQ;
>   	}
>   
>   	iproc_i2c->bus_speed = bus_speed;
>   	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
>   	val &= ~BIT(TIM_CFG_MODE_400_SHIFT);
> -	val |= (bus_speed == 400000) << TIM_CFG_MODE_400_SHIFT;
> +	val |= (bus_speed == I2C_FAST_MODE_FREQ) << TIM_CFG_MODE_400_SHIFT;
>   	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
>   
>   	dev_info(iproc_i2c->device, "bus set to %u Hz\n", bus_speed);
> @@ -1029,7 +1029,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
>   	/* configure to the desired bus speed */
>   	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
>   	val &= ~BIT(TIM_CFG_MODE_400_SHIFT);
> -	val |= (iproc_i2c->bus_speed == 400000) << TIM_CFG_MODE_400_SHIFT;
> +	val |= (iproc_i2c->bus_speed == I2C_FAST_MODE_FREQ) << TIM_CFG_MODE_400_SHIFT;
>   	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
>   
>   	bcm_iproc_i2c_enable_disable(iproc_i2c, true);

