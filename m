Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED67331C701
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 08:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhBPHwj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 16 Feb 2021 02:52:39 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:45170 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhBPHw1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Feb 2021 02:52:27 -0500
Received: by mail-wr1-f51.google.com with SMTP id v7so11793046wrr.12;
        Mon, 15 Feb 2021 23:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0fp86hP8XzCLHuGk3+2XZ6kJDhLEJjnKSzVrThFlsbw=;
        b=E0+ar4XNnAV/eIz6jSNhIFZ5G/j11BtVlYHKH1HwzUVejrKWPDAQbhgF5J5OvEt5mr
         jnjzti5fBTg/5YRZNlgM2YLv1d7F19JB5wdOltymU1MPoF3E2FWqbmuZNuIqE/DlWX/w
         D7O0lvzWiTkuBT0JhkZPH/72y7uAPlVPCkplmH/6CPvI3Ruk+d8yTKl4I/k+ae7woNVF
         NZaR0Gd/oYYHMvUtV+YXLAVCdxHGUS84pfBbtOsF9v2SUrJSoS5VW6Cj8TR90g/Y8C5x
         n+r6uYO4fdOsiKRE4315ryzpAugmzIBbQTfzTC/wPh+Ob0VqU0fZS6aZaNJovhNjbnTn
         xJ8A==
X-Gm-Message-State: AOAM532wl3ZtNCLyEozIn0yBQZozAgwe6U2MRooyvOw7VckuDCrF+POX
        xbQM0JsLaDpAt/fzPXlSi7TEN0r7G1Q=
X-Google-Smtp-Source: ABdhPJxZQplq5hgJFOOHaEpruNZYVmqScKJ3GZnW80JPQlBfh6iYpJ5WdLw/yzzX7xCl9Y6oJpPddQ==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr23497953wrr.198.1613461904568;
        Mon, 15 Feb 2021 23:51:44 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z5sm4677976wrn.8.2021.02.15.23.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 23:51:43 -0800 (PST)
Date:   Tue, 16 Feb 2021 08:51:41 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?M=C3=A5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     kernel@axis.com,
        =?utf-8?Q?M=C3=A5rten?= Lindahl <martenli@axis.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: exynos5: Preserve high speed master code
Message-ID: <20210216075141.o4wjnwmmjze2p3cn@kozik-lap>
References: <20210215190322.22094-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20210215190322.22094-1-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 15, 2021 at 08:03:21PM +0100, Mårten Lindahl wrote:
> From: Mårten Lindahl <martenli@axis.com>
> 
> When the controller starts to send a message with the MASTER_ID field
> set (high speed), the whole I2C_ADDR register is overwritten including
> MASTER_ID as the SLV_ADDR_MAS field is set.

Are you here describing bug in driver or hardware (the controller?)?
Looking at the code, I think the driver, but description got me
confused.

> 
> This patch preserves already written fields in I2C_ADDR when writing
> SLV_ADDR_MAS.
> 
> Signed-off-by: Mårten Lindahl <martenli@axis.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 20a9881a0d6c..f2d04c241299 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -606,6 +606,7 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>  	u32 i2c_ctl;
>  	u32 int_en = 0;
>  	u32 i2c_auto_conf = 0;
> +	u32 i2c_addr = 0;
>  	u32 fifo_ctl;
>  	unsigned long flags;
>  	unsigned short trig_lvl;
> @@ -640,7 +641,12 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>  		int_en |= HSI2C_INT_TX_ALMOSTEMPTY_EN;
>  	}
>  
> -	writel(HSI2C_SLV_ADDR_MAS(i2c->msg->addr), i2c->regs + HSI2C_ADDR);
> +	i2c_addr = HSI2C_SLV_ADDR_MAS(i2c->msg->addr);
> +
> +	if (i2c->op_clock >= I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		i2c_addr |= readl(i2c->regs + HSI2C_ADDR);

Any reason why not "|= MASTER_ID(i2c->adap.nr)" here instead of more
expensive IO read? It's quite important because your current code will
bitwise-or old I2C slave address with a new one... This should break
during tests with multiple I2C slave devices, shouldn't it?

On which HW did you test it?

Best regards,
Krzysztof


> +
> +	writel(i2c_addr, i2c->regs + HSI2C_ADDR);
