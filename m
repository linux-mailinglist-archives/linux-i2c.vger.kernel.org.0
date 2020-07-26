Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B443422E34F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 01:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgGZXaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 19:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgGZXaJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 19:30:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082ABC0619D2;
        Sun, 26 Jul 2020 16:30:08 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t6so2296565ljk.9;
        Sun, 26 Jul 2020 16:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PAu1KY0p6PHiyFmlvXCLwKle62tn9il6DTEVsfWR1Ao=;
        b=dUH7LahwQFmnVVH3XTbmrGcYfoe4XYGECuxezQr8GlgoUfwLvczCoAE+T9YLD4lrRd
         nX7Qr0c7hc+CJDRQNkOF0YgiuNz9R5ZMc75CHJ+3/T2904Z9ErCkKzqH0wX12r1GIf+p
         +RW3qEiscxNAw9tFjjgMp404PNOynQoweZZC4Qn696swubbbT8Xpr8BgYewZ/dy2GYJ4
         RYsVPrGvXNvCLVsjnUINXiEQ6LrZufmjnnOWIU1WCGHrgTf5x9JepT3ZGu/C5cb2D2iU
         +tQ7bRI5Bl/I/wL7cHOf9kzrxrreAcHfHAKSkGZadjzlRfEQBqB0uNhmM0XjxCroSgWf
         1F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PAu1KY0p6PHiyFmlvXCLwKle62tn9il6DTEVsfWR1Ao=;
        b=oaLgE6NUvp3XXITN/dTE1fIYVJUqFhXtwMCQf9cgh6w1VR2XH84N41uDQ7kLxucWSi
         AhrACj6GUiT1EeaCa7aV9J+hLFk/F9ljB2sAAuRiZABDV0a7plXelll6JE0Xs5BgeYIN
         ekkt5SdkDEVo3VcTc6IkNNwZLEkY4m0M6R6oa/ETGc5fbzlcZOOXGjxDZexuEiaHpTmi
         IaoZRsQ+r8PFH8prDXB29cI2Gb8K7Xu1FfLzVdWIJsW/xJKMbQa+yazFMX04MhuY+u5a
         OLVtxgICfSowzWk+1LQGWP2iVZD749GRDY9dgpnZvUFH77yVHSN7hodvPCCsAUd2pqV9
         GXfw==
X-Gm-Message-State: AOAM532leFWlPHsA5BlXXw7uG7xng3v3Sd42hKXWKwTTGdH+FvYNRZN4
        wZTnT4HidGNdFuX71Fl6M4SPZp6g
X-Google-Smtp-Source: ABdhPJzNNxD84bO09GwYYRcLJmxDb9/vLPRaUQddSIL1G8k8RUQGPO7xemuu+O5l0GACd2kADXL1rw==
X-Received: by 2002:a2e:8702:: with SMTP id m2mr3621248lji.183.1595806206140;
        Sun, 26 Jul 2020 16:30:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id c22sm106679ljk.128.2020.07.26.16.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 16:30:05 -0700 (PDT)
Subject: Re: [RFC PATCH v4 01/14] i2c: tegra: Don't mark VI I2C as IRQ safe
 runtime PM
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <1595548272-9809-2-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56aedefa-fb5d-2251-da71-5cdf0e357576@gmail.com>
Date:   Mon, 27 Jul 2020 02:30:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595548272-9809-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.07.2020 02:50, Sowjanya Komatineni пишет:
> Tegra VI I2C is part of VE power domain and typically used for
> camera usecases.
> 
> VE power domain is not always on and is non-IRQ safe. So, IRQ safe
> device cannot be attached to a non-IRQ safe domain as it prevents
> powering off the PM domain and generic power domain driver will warn.
> 
> Current driver marks all I2C devices as IRQ safe and VI I2C device
> does not require IRQ safe as it will not be used for atomic transfers.
> 
> This patch has fix to make VI I2C as non-IRQ safe.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 1577296..3be1018 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1750,7 +1750,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  		goto unprepare_slow_clk;
>  	}
>  
> -	pm_runtime_irq_safe(&pdev->dev);
> +	/*
> +	 * VI I2C is in VE power domain which is not always on and not
> +	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
> +	 * safe domain as it prevents powering off the PM domain.
> +	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
> +	 * not be used for atomic transfers.
> +	 */
> +	if (!i2c_dev->is_vi)
> +		pm_runtime_irq_safe(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  	if (!pm_runtime_enabled(&pdev->dev)) {
>  		ret = tegra_i2c_runtime_resume(&pdev->dev);
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
