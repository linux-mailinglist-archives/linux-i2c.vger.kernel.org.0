Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE42722E363
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 01:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgGZXxU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 19:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGZXxU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 19:53:20 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B324AC0619D2;
        Sun, 26 Jul 2020 16:53:19 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so15246804ljg.13;
        Sun, 26 Jul 2020 16:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xya1crPAvabm4ZnUZh/8AvcD2qUs7vG1wb2IuEfvQCc=;
        b=Pbtdxeg5nz2BWNdsnEvrYqqurgj2O+aFvF8ETVVCw9tUI9XpjhbDo05ZYrz9rTpc4L
         F0EZvQQ34PpHp1bCBZXkbeNvM4C9XloU2Lpc8DmaC2aiRKgfNu0gqeBnyew/CbJvzxpt
         w2LBkI4BDIXZJKNXRgiK78ZCXAc4BPWcMu6XGRTswcbC7q/m6mqks4i5XJXvGpzFmF55
         y7/5Z7EOjgUG4k20cUYoFTX4dWdrmtmA1ziBYZlrust4/VyeNsg1GMW0EgCdiKBufB0o
         4ikzPsIyqPDZiEF84ks5jtNgTKCTSAu2b7r8VhjQrAS0hTOjBBMrUANuTdfjGA5Pk79x
         8I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xya1crPAvabm4ZnUZh/8AvcD2qUs7vG1wb2IuEfvQCc=;
        b=t2scnLK2NLTeZysyrtuc03Adr1fYvUfkMuP7lZGis0hW5pbWKBKOaxD4xkos5E7Vh2
         w3h0ZUoB1NjUUZCHZgWaCqoRCiR4D/OPzF8sLsngQRtMSx6GJIoy0rxbY4z8Lg2LZjnT
         TVhb6fqO6pGZkDcBf/ZnqBOb9Vmw3F/lNguKTRSMrHk86+bfVzAlLlZiDHd8THkGCkT1
         sFxswTrrQuln/LpwHvl8iIn3jQggz9cOCkhWVuMKyu0BHbhmxC5LORBHLX8FAnTmi1LI
         XAP0lRyP6A0gneYsUXy+CGho4Z9n/JJEay5/3ShdA7eV/YEulX7/J8knxeT033RXVu22
         Wc9Q==
X-Gm-Message-State: AOAM533j18xncDw172Q+XPxr4Hlr70y/rk+cgT7H34KDbbzj2uCqhhrv
        52tkv2anLmjQs8qNc2Q/73+Nziy6
X-Google-Smtp-Source: ABdhPJzEwcvldZabMAs9qaKuQfiVMBGqe9DUiUIEgRaLv+HGXrW+ng2xIau22W6osHLhoFBeausVyw==
X-Received: by 2002:a2e:3202:: with SMTP id y2mr9336796ljy.465.1595807597842;
        Sun, 26 Jul 2020 16:53:17 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id b9sm2631760lfi.88.2020.07.26.16.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 16:53:17 -0700 (PDT)
Subject: Re: [RFC PATCH v4 04/14] i2c: tegra: Fix runtime resume to re-init VI
 I2C
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <1595548272-9809-5-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d427f421-3c20-2aa3-b719-638be6aeca1d@gmail.com>
Date:   Mon, 27 Jul 2020 02:53:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595548272-9809-5-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.07.2020 02:51, Sowjanya Komatineni пишет:
> VI I2C is on host1x bus and is part of VE power domain.
> 
> During suspend/resume VE power domain goes through power off/on.
> 
> So, controller reset followed by i2c re-initialization is required
> after the domain power up.
> 
> This patch fixes it.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 7b93c45..1bf3666 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -293,6 +293,8 @@ struct tegra_i2c_dev {
>  	bool is_curr_atomic_xfer;
>  };
>  
> +static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit);
> +
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  		       unsigned long reg)
>  {
> @@ -675,8 +677,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  		goto disable_slow_clk;
>  	}
>  
> +	/*
> +	 * VI I2C device is attached to VE power domain which goes through
> +	 * power ON/OFF during PM runtime resume/suspend. So, controller
> +	 * should go through reset and need to re-initialize after power
> +	 * domain ON.
> +	 */
> +	if (i2c_dev->is_vi) {
> +		ret = tegra_i2c_init(i2c_dev, true);
> +		if (ret)
> +			goto disable_div_clk;
> +	}
> +
>  	return 0;
>  
> +disable_div_clk:
> +	clk_disable(i2c_dev->div_clk);
>  disable_slow_clk:
>  	clk_disable(i2c_dev->slow_clk);
>  disable_fast_clk:
> 

This look okay, but isn't RPM usage a bit too expensive for VI? Maybe
RPM autodelay needs to be set for the I2C driver?

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

