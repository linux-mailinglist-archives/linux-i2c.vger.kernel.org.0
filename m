Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787ED2F6891
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 19:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbhANR61 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 12:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbhANR60 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jan 2021 12:58:26 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B06C0613D3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jan 2021 09:57:29 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id j20so5982547otq.5
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jan 2021 09:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QFPvrxij+GioCFvfCkXO9xrU7Tgj4zJb5jbfcOgiV+8=;
        b=aN9r2QtqgIrFifEGKa8DUuX+2uCAfDdbwKotgaPsUmlpqn1s3865BKVWFfRy50l4vX
         HRJUElnp7aGSUW/Juy+Y/foiBEAPsOf0BPsT5ObFnQH8N4Swh4E6laKFNqECOnuQgww/
         x4NsSfZRrFWyf3KqgbWI9whTZNUrI743Y/j/ov5LhMwjV/IX5lEojCmkYU8d2UTTp62h
         9e2t+asTTptiHbxzmd/u5a4SgZMUlnglf44XFjkNJCUT9F9s3l0muZgWGuxe9Qs5rsw8
         FAYkhORQbP68mFHE/2C9T/90W1ysDgmiKxAFxjpgzb7XPG3OyxRvuJ3DflitfyPc/xxb
         oxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QFPvrxij+GioCFvfCkXO9xrU7Tgj4zJb5jbfcOgiV+8=;
        b=RpikiX+z9Y58pgxGTU5GDIQh/TxRAH0xfKE9oz/o7sXHCq4MwX7oZylAVGNDcMNeOL
         EPxFusmHxjohw3HlpvHG7w/X1lClQHiJr5C50GfNKCH2SwKfQJzEfXbbatwVzrE3Qfr/
         VMaS8+9/h1/B3epzF6ArVY9FvRG2LrSG8Oo4oMJTzbGmkRd56jwSt3+U+S5tho5MJoxJ
         9jdj0hrn/zIaWUha5aDPxIk1dw5U2oiZn7TIBaaPaE4W/yJB+yU1DO4Hom/KhvaBMXU7
         sV+Ul6UidTP1jG3ONYNEXV679eOXNIFHDP2ajWVc/ATAUuLf1mwRXqdifg10sC6kkPHq
         hjqQ==
X-Gm-Message-State: AOAM5306CBR6BxGcYNIk7BuL75ezpdPc7nCnoaAAKzM+4NPJU9gXtyEW
        xnAwmzVjNsqfIMGwgE5MNXUdkg==
X-Google-Smtp-Source: ABdhPJzXcwgwbspDBloCZD4UhhQnroMwVPNwyjjjGJNUSqIWrOWEzVgJyuhYHj7k9fcdO4GuJRoP4w==
X-Received: by 2002:a05:6830:2413:: with SMTP id j19mr5573145ots.251.1610647048752;
        Thu, 14 Jan 2021 09:57:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q18sm1183378ood.35.2021.01.14.09.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:57:28 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:57:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: qup: Introduce SCL/SDA noise rejection
Message-ID: <YACGBnAbHllCdGNw@builder.lan>
References: <20210114174909.399284-1-angelogioacchino.delregno@somainline.org>
 <20210114174909.399284-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114174909.399284-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu 14 Jan 11:49 CST 2021, AngeloGioacchino Del Regno wrote:

> Some I2C devices may be glitchy due to electrical noise coming
> from the device itself or because of possible board design issues.
> To overcome this issue, the QUP's I2C in Qualcomm SoCs supports
> a noise rejection setting for both SCL and SDA lines.
> 
> Introduce a setting for noise rejection through device properties,
> "qcom,noise-reject-sda" and "qcom,noise-reject-scl", which will
> be used to set the level of noise rejection sensitivity.
> If the properties are not specified, noise rejection will not be
> enabled.
> 

This looks reasonable, just some small nits below.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/i2c/busses/i2c-qup.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 5a47915869ae..af51234a60ba 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -8,6 +8,7 @@
>  #include <linux/acpi.h>
>  #include <linux/atomic.h>
>  #include <linux/clk.h>
> +#include <linux/bitfield.h>

If you move this one step up you'll maintain the sort order.

>  #include <linux/delay.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dmapool.h>
> @@ -39,6 +40,8 @@
>  #define QUP_MX_READ_CNT		0x208
>  #define QUP_IN_FIFO_BASE	0x218
>  #define QUP_I2C_CLK_CTL		0x400
> +#define  QUP_I2C_CLK_CTL_SDA_NR	GENMASK(27, 26)
> +#define  QUP_I2C_CLK_CTL_SCL_NR	GENMASK(25, 24)
>  #define QUP_I2C_STATUS		0x404
>  #define QUP_I2C_MASTER_GEN	0x408
>  
> @@ -1663,6 +1666,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  	int ret, fs_div, hs_div;
>  	u32 src_clk_freq = DEFAULT_SRC_CLK;
>  	u32 clk_freq = DEFAULT_CLK_FREQ;
> +	u32 noise_reject_scl = 0, noise_reject_sda = 0;

You shouldn't need to initialize these, device_property_read_u32() won't
return 0 without updating them.

>  	int blocks;
>  	bool is_qup_v1;
>  
> @@ -1860,6 +1864,19 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  		qup->clk_ctl = ((fs_div / 2) << 16) | (hs_div << 8) | (fs_div & 0xff);
>  	}
>  
> +	/* SCL/SDA Noise rejection (optional) */
> +	ret = device_property_read_u32(qup->dev, "qcom,noise-reject-scl",
> +				      &noise_reject_scl);
> +	if (ret == 0)
> +		qup->clk_ctl |= FIELD_PREP(QUP_I2C_CLK_CTL_SCL_NR,
> +					   noise_reject_scl);

I would prefer if you didn't break this line.

> +
> +	ret = device_property_read_u32(qup->dev, "qcom,noise-reject-sda",
> +				      &noise_reject_sda);
> +	if (ret == 0)
> +		qup->clk_ctl |= FIELD_PREP(QUP_I2C_CLK_CTL_SDA_NR,
> +					   noise_reject_sda);

Ditto.

Regards,
Bjorn

> +
>  	/*
>  	 * Time it takes for a byte to be clocked out on the bus.
>  	 * Each byte takes 9 clock cycles (8 bits + 1 ack).
> -- 
> 2.29.2
> 
