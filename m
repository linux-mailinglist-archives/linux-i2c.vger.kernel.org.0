Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E65733111F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 15:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhCHOm3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 09:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCHOmQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 09:42:16 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DCAC06174A
        for <linux-i2c@vger.kernel.org>; Mon,  8 Mar 2021 06:42:15 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id j2so11708584wrx.9
        for <linux-i2c@vger.kernel.org>; Mon, 08 Mar 2021 06:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IKhnAr1aDOX/E7GaNu6uYF5BElO5xj7SSBceI5ChmKw=;
        b=Pkk1REvbaAaRzOF2+2CItHGnaVbVd8DHg1jKS8tsgB47h0OGh8Q2UUVhozAgaT74Al
         FMINooAselxQr+s9cNKVBJgbsYQ/izXe+zkCyZYRcFM90QQ0cVdufuVkazZxevpNe6oV
         PK1PdUFV/QVq9E34jpYn2X9Tr5njZX3bqqa9YBp9C6A/W0vglRjV4sUMMPmhoVAui7p8
         q6MoNzGaahcL2UAcAZ6GpaW3MgxhZ3Hb8BaizRaE+rp5cuZ3s4le4MsCqeAJtkN6g+0h
         C7n02JotqXGTh5givPP25d5Kh9fUUJSUnmODC7RZXVk4MChZAGoEo+yE47DyQBm9K/9Y
         VuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IKhnAr1aDOX/E7GaNu6uYF5BElO5xj7SSBceI5ChmKw=;
        b=HstwxEXDvTHKs71TR9aRtiE10WW4e7hh8dPbNBJMmO141oWRNnnVUXhf4IGSD5oruv
         GGN/ZUb6v9dk+9ccLBeN6HnpMHZSCJFSklGP4ZRBa0rudpHDiB4xK0VE94Fg+4WhYsaV
         eiO41/em82yEkTKiro6hv0lHJ09t8shMZjpQRKWes/xwx7DNfKp42tlc01PZJ6BHhpev
         K6HMRVxS+7D0L+ZemYrdh7zXuw70umyM6kUlq1g5obFtMt30ED2lRGTJMNzWWkhrKpNk
         rWXhPkB3cf6aGlxJkzUEVvL0HFSkjzklYXM3emHwvhCeh8xjKXPSy3esn0BBs2UStcCI
         FTjA==
X-Gm-Message-State: AOAM532IUMlAdTcP5sTPqmBD9KhF3P/agw9Q+VvDb9oQET0ldiujdqPi
        kGREjhmWe5vAOhiuqVVdbxVqSw==
X-Google-Smtp-Source: ABdhPJzarmxGnnZD4SnHCU5j7tm+uijYL6rtQ0UoLMKMXFDrd5J4LmXHyTZ6L+AMYL2jUvd3IDMhzw==
X-Received: by 2002:a05:6000:24b:: with SMTP id m11mr23377016wrz.393.1615214534625;
        Mon, 08 Mar 2021 06:42:14 -0800 (PST)
Received: from dell ([91.110.221.130])
        by smtp.gmail.com with ESMTPSA id x11sm10231617wmi.3.2021.03.08.06.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:42:14 -0800 (PST)
Date:   Mon, 8 Mar 2021 14:42:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Adam.Thomson.Opensource@diasemi.com, stwiss.opensource@diasemi.com,
        marek.vasut@gmail.com, tingquan.ruan@cn.bosch.com,
        hubert.streidl@de.bosch.com, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210308144211.GK4931@dell>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210208152758.13093-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Feb 2021, Mark Jonas wrote:

> From: Hubert Streidl <hubert.streidl@de.bosch.com>
> 
> By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> means the PMIC will automatically reset the interface when the clock
> signal ceases for more than the SMBus timeout of 35 ms.
> 
> If the I2C driver / device is not capable of creating atomic I2C
> transactions, a context change can cause a ceasing of the clock signal.
> This can happen if for example a real-time thread is scheduled. Then
> the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> a write message could end up in the wrong register. This could cause
> unpredictable system behavior.
> 
> The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> interface. This mode does not reset the interface when the clock
> signal ceases. Thus the problem depicted above does not occur.
> 
> This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> reasonably be assumed that the bus cannot obey SMBus timings if
> this functionality is set. SMBus commands most probably are emulated
> in this case which is prone to the latency issue described above.
> 
> This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> otherwise enables the SMBus mode for a native SMBus controller
> which doesn't have I2C_FUNC_I2C set.
> 
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
> Changes in v4:
>   - Remove logging of selected 2-wire bus mode.
> 
> Changes in v3:
>   - busmode now contains the correct bit DA9063_TWOWIRE_TO
> 
> Changes in v2:
>   - Implement proposal by Adam Thomson and Wolfram Sang to check for
>     functionality I2C_FUNC_I2C instead of introducing a new DT property.
> 
>  drivers/mfd/da9063-i2c.c             | 11 +++++++++++
>  include/linux/mfd/da9063/registers.h |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 3781d0bb7786..9450c95a3741 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -355,6 +355,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>  			    const struct i2c_device_id *id)
>  {
>  	struct da9063 *da9063;
> +	unsigned int busmode;
>  	int ret;
>  
>  	da9063 = devm_kzalloc(&i2c->dev, sizeof(struct da9063), GFP_KERNEL);
> @@ -442,6 +443,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> +	busmode = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C) ?
> +		      0 : DA9063_TWOWIRE_TO;

Nit: I find ternaries like this tend to complicate matters and
harm readability rather than the converse.

> +	ret = regmap_update_bits(da9063->regmap, DA9063_REG_CONFIG_J,
> +	      DA9063_TWOWIRE_TO, busmode);
> +	if (ret < 0) {
> +		dev_err(da9063->dev, "Failed to set 2-wire bus mode.\n");
> +		return -EIO;
> +	}

I'm a little confused by this.  It's likely just me, but I would still
like some clarification.

So you write to the TWOWIRE register despite whether I2C is operable
not, which I guess is fine.

But what if I2C is disabled and the update fails.  You seem to complain
to the user that a failure occurred and return an error even if the
configuration is invalid in the first place.

Would it not be better to encapsulate the update inside the
functionality check?

>  	return da9063_device_init(da9063, i2c->irq);
>  }
>  
> diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
> index 1dbabf1b3cb8..6e0f66a2e727 100644
> --- a/include/linux/mfd/da9063/registers.h
> +++ b/include/linux/mfd/da9063/registers.h
> @@ -1037,6 +1037,9 @@
>  #define		DA9063_NONKEY_PIN_AUTODOWN	0x02
>  #define		DA9063_NONKEY_PIN_AUTOFLPRT	0x03
>  
> +/* DA9063_REG_CONFIG_J (addr=0x10F) */
> +#define DA9063_TWOWIRE_TO			0x40
> +
>  /* DA9063_REG_MON_REG_5 (addr=0x116) */
>  #define DA9063_MON_A8_IDX_MASK			0x07
>  #define		DA9063_MON_A8_IDX_NONE		0x00

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
