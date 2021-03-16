Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEAB33CE8A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 08:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhCPHWR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 03:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhCPHVr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 03:21:47 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4805BC06174A
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 00:21:47 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p19so561939wmq.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Mar 2021 00:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3PC4L/ElKOxjRdktmch4SpZkUtmQpCd/z4zTr/LSIf0=;
        b=dmH4uVYmL9aJZFOiQxa1fPH8t4BIGG879xw4oi2VAdngKyAF4rV8HldmACFGuWZrTz
         Ok6tcbNiiEANHgyYotM2KoASgWrtFjhlc+InLx/v93IwDNZhRP3Ru2gVC7hNhG58A/Ah
         peB46rKLF0udJrXH56zJrU16OqFtYDi4awYmDAt6VfJdgf00n+Jkyz77OsIi29QGdn3S
         ofzfNuHXwIo1jNxqytt8nNs2HlejZJK4DuwVCNNH6lVm/5BqpqSDLY+qZFNKd+1Ail7X
         yXVy9uGmrXyy8n8KbamcpEJjkN0xnniPc2VHwsRpWsUgUCoa4hJKA3ytpd00kq6Ts3RW
         NjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3PC4L/ElKOxjRdktmch4SpZkUtmQpCd/z4zTr/LSIf0=;
        b=XNUfyKh9lG+cmBoe9fEoMTVT8UjyiqubE0/LE2Jvec9SpSwEUPxPk688lt/4Um/Fyy
         fxp5bHX5uiwPN0GkcCfMQeAyAx7qWJnbcUX7acf7Q0AIya/WBv/e2SPNYu/CufDdQhPw
         Uqmy0YHZPTOH7KlbJj2AE2WvxdXHQIdiRdpiMqaQrFWBop4jvJjy9vpC7NJUZa4KFEMk
         /tMRs4NNqB/kgJE+Ko3jjZwGP0TG6hnHf1Frhzgq0HQ3xaDWT8QtDvBVMH7B/TDVOE4n
         pNoj0EkI172wpYfBl0gmRkTkpkKmEs7mGgXZz7Xw/TjQ+8+ZO6PrX8ZPkbJVWJi61JHp
         dZ1g==
X-Gm-Message-State: AOAM531YKEIrh1rx7M1A/JR+hF+zivssx8bMhEpjSBlTjSODkeOsgpgg
        fp06aYP/61/bHZHHL/ahTihdupn3uoReSA==
X-Google-Smtp-Source: ABdhPJz5cQmfQ4Ehxs4LnAG/W0t/jtMCZLitLYsh7qfZESNmRG8HctRVeDDGKCMarxLEo3bvJfb6cA==
X-Received: by 2002:a05:600c:290a:: with SMTP id i10mr3240122wmd.91.1615879306045;
        Tue, 16 Mar 2021 00:21:46 -0700 (PDT)
Received: from dell ([91.110.221.243])
        by smtp.gmail.com with ESMTPSA id t8sm20888097wrr.10.2021.03.16.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 00:21:45 -0700 (PDT)
Date:   Tue, 16 Mar 2021 07:21:43 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Jonas <mark.jonas@de.bosch.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Adam.Thomson.Opensource@diasemi.com, stwiss.opensource@diasemi.com,
        marek.vasut@gmail.com, tingquan.ruan@cn.bosch.com,
        hubert.streidl@de.bosch.com, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v5] mfd: da9063: Support SMBus and I2C mode
Message-ID: <20210316072143.GA701493@dell>
References: <20210315160903.799426-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210315160903.799426-1-mark.jonas@de.bosch.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 15 Mar 2021, Mark Jonas wrote:

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
> otherwise keeps the default SMBus mode.
> 
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
>  drivers/mfd/da9063-i2c.c             | 10 ++++++++++
>  include/linux/mfd/da9063/registers.h |  3 +++
>  2 files changed, 13 insertions(+)

Code looks good to me now, thanks.

However, this doesn't look like it would pass checkpatch.

Have you tried to build with W=1 and checkpatch?

> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 3781d0bb7786..e8a022e697c5 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -442,6 +442,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> +	/* If SMBus is not available and only I2C is possible, enter I2C mode */
> +	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
> +		ret = regmap_clear_bits(da9063->regmap, DA9063_REG_CONFIG_J,
> +			  DA9063_TWOWIRE_TO);
> +		if (ret < 0) {
> +			dev_err(da9063->dev, "Failed to set Two-Wire Bus Mode.\n");
> +			return -EIO;
> +		}
> +	}
> +
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
