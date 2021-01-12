Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE642F39DB
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 20:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392732AbhALTRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 14:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbhALTRv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 14:17:51 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8895C061794;
        Tue, 12 Jan 2021 11:17:10 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o19so5078319lfo.1;
        Tue, 12 Jan 2021 11:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tdyl1nJFWlJ5Uf4xKLaR5/ndXVsHFCYxJ4Cs1ADYvpM=;
        b=ldPwNixv4j13/3G9+PpwBfhXJWS55kiUywvY9eSSgg3V4TeCTF202vfWW/XVWOhFZK
         er/JOiZKpPfb2sORMv545wh5tDPKrJIiBau34Dqb8inBq81rv6RF3mPzSrEAYHw0wwKX
         O5E9h9gySgXaBoNac+MgYwJGpqaews/bsVjkizKNtBQWNDUKTBagFigpHwIkOdYGv/9q
         jBwn1DyzQlYDP/mOpu+21d+H2+a83sJ18JWjnDid9t32PCTmMfeTEC49yzhOqAk8RpTg
         ClgaGdhWrbGhZnMMeBym00dNU0f4e/b+QLabmUPuaruUkUH+OE0IpkVc0Rx6y5cby88+
         8kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tdyl1nJFWlJ5Uf4xKLaR5/ndXVsHFCYxJ4Cs1ADYvpM=;
        b=e40K2yiB0AXy5tLF/Ev3ujVGHfg/5D4FYFDLkIozEbs+Z0tvNxlR3iPaLuWZ4DyNoH
         GW4dqUORbzTA/nV09i7z00LUfAvOhdhpVO75UsNOSy5qcshuM6YLuWgwDNUtbuVd1XyF
         D/0X7HwQnUKglxC1yVCv38wWgnSPSECvaaIpoCK9afyJL46pAuAKSWYFKWjAdE084Mgi
         zwJu3IoC9PPjCb0Kcl/fvSi8NZetIu3e8O8BZtqZFm85FaEYSMbAhTdznQubgui30X2V
         79LXhLDtv+7KTHY1LFESCVPtiq0gZgK/tF1ZIOFm3bf/C1dC5OsnPm8usFgpjsrparuN
         63fQ==
X-Gm-Message-State: AOAM530PGbZ8X5s7YVqYUwe7oWC3f6j7XFTg4oq3h/xzLqPe1yR0d8ED
        BZSR3KgjxMEf7latI5REibX1XwUvS0I=
X-Google-Smtp-Source: ABdhPJwP+BbKwe2WvWStkTwGwf5KpAXYVwSLKugZNpMG3XSiaNnauALcPTobW+2Y4zHMPwhrZ53CXg==
X-Received: by 2002:a19:b4d:: with SMTP id 74mr183901lfl.162.1610479029197;
        Tue, 12 Jan 2021 11:17:09 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id j12sm498818lfc.99.2021.01.12.11.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 11:17:08 -0800 (PST)
Subject: Re: [PATCH v3] i2c: tegra: Create i2c_writesl_vi() to use with VI I2C
 for filling TX FIFO
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, wsa@the-dreams.de
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
 <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7858911f-4a37-a578-45ed-7522d06d735c@gmail.com>
Date:   Tue, 12 Jan 2021 22:17:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1610478161-4877-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

12.01.2021 22:02, Sowjanya Komatineni пишет:
> VI I2C controller has known hardware bug where immediate multiple
> writes to TX_FIFO register gets stuck.
> 
> Recommended software work around is to read I2C register after
> each write to TX_FIFO register to flush out the data.
> 
> This patch implements this work around for VI I2C controller.

You could have kept Thierry's ack since it was given to the fix in
general. No need to make v4.

> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 6f08c0c..4a27782 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -326,6 +326,8 @@ static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
>  	/* read back register to make sure that register writes completed */
>  	if (reg != I2C_TX_FIFO)
>  		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +	else if (i2c_dev->is_vi)
> +		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
>  }
>  
>  static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
> @@ -339,6 +341,21 @@ static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
>  	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
>  
> +static void i2c_writesl_vi(struct tegra_i2c_dev *i2c_dev, void *data,
> +			   unsigned int reg, unsigned int len)
> +{
> +	u32 *data32 = data;
> +
> +	/*
> +	 * VI I2C controller has known hardware bug where writes get stuck
> +	 * when immediate multiple writes happen to TX_FIFO register.
> +	 * Recommended software work around is to read I2C register after
> +	 * each write to TX_FIFO register to flush out the data.
> +	 */
> +	while (len--)
> +		i2c_writel(i2c_dev, *data32++, reg);
> +}
> +
>  static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>  		       unsigned int reg, unsigned int len)
>  {
> @@ -811,7 +828,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		i2c_dev->msg_buf_remaining = buf_remaining;
>  		i2c_dev->msg_buf = buf + words_to_transfer * BYTES_PER_FIFO_WORD;
>  
> -		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> +		if (i2c_dev->is_vi)
> +			i2c_writesl_vi(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
> +		else
> +			i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>  
>  		buf += words_to_transfer * BYTES_PER_FIFO_WORD;
>  	}
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
