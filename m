Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3B322E35B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 01:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgGZXlH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 19:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgGZXlH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 19:41:07 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC13C0619D2;
        Sun, 26 Jul 2020 16:41:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g6so2639887ljn.11;
        Sun, 26 Jul 2020 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ecxPWrBs9TCorcs/R4NgnSoLr6MDOrVmbQkX687XH/8=;
        b=eL55qYni4370tAsaMGs9hq+VDhWq3l02y4qWpmdF6Z+gd814nSyH2NuDduhZjm16f9
         gpjlCmq8IQApbDJue7TA0gJtnC4kUFa+LMox5KkCdMr6nhIOoKKTh18YZJjLLuksgdBx
         z5PJv3KISkdE3oPyLrU+qcfQ4PgI88c3oVLvoC8cAAjS4Raww7H6gS9dupiHLKiHBtze
         h1GaRGTJIeX+6OEYBtkhksfKAmttFpM/+pv/i0YKAfu2cTZXOX/G9LQQ9nR14MkGmWAN
         DcQJD6M55GSx4jNIf1wnLOIDYg7MRc3TuznyB3RukQ7NsjaDKsmRdGTSi/V1AHWGSpcT
         G4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ecxPWrBs9TCorcs/R4NgnSoLr6MDOrVmbQkX687XH/8=;
        b=jAqmgdzvqdnoRoh/Sf1RyOXcsV+Sox2Zb7OW2YDFQpRXNlKcA9Wl+tlh7gxJI5hiI+
         jZGvHdW65zx9u/x2DkmikTiL8wAjVE+UbX1jegoKrj1IUvZgRfsOSmcognR992lSg4Gj
         16NWt3WSp4CHzhbrMj2IeIgk0pjgTIRWaiL4OY0iI7TKKwmym/aLDVHOvISefCD5Wxgx
         OU3nDMunuwvDcRQsfTidRun2t5M3+BqRROFpKaLxXLyo2WpHCFpnkLbULrKybOyopPWt
         JfpvQ+dARQqjZ4FBbXYHbCIy0aiSzBVEcIqb/rr+yr6JhzJH50kpbqeGo+G0noSYMyBn
         +rSg==
X-Gm-Message-State: AOAM533nMnp4rjrJDxy4ods/UhqXwVwZAjRI6gH5wFwPQAzUhELgeRsA
        oY8QHPLtfpGJlLo10ZMx/V/N7mZP
X-Google-Smtp-Source: ABdhPJzdj3t4AAp0nSXdz6prkWPAhC/OR7iu3v2qO2Fd7wR5wKq/1LJV7+IYs29+i8+ujdcGE40HbQ==
X-Received: by 2002:a2e:9591:: with SMTP id w17mr9135846ljh.390.1595806864991;
        Sun, 26 Jul 2020 16:41:04 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id v26sm1620363lji.65.2020.07.26.16.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 16:41:04 -0700 (PDT)
Subject: Re: [RFC PATCH v4 03/14] i2c: tegra: Fix the error path in
 tegra_i2c_runtime_resume
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <1595548272-9809-4-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4a9f448b-d7d2-d44a-3e68-cfdb331b8847@gmail.com>
Date:   Mon, 27 Jul 2020 02:41:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595548272-9809-4-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.07.2020 02:51, Sowjanya Komatineni пишет:
> tegra_i2c_runtime_resume does not disable prior enabled clocks
> properly.
> 
> This patch fixes it.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c91307b9..7b93c45 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -665,18 +665,23 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  	ret = clk_enable(i2c_dev->slow_clk);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to enable slow clock: %d\n", ret);
> -		return ret;
> +		goto disable_fast_clk;
>  	}
>  
>  	ret = clk_enable(i2c_dev->div_clk);
>  	if (ret < 0) {
>  		dev_err(i2c_dev->dev,
>  			"Enabling div clk failed, err %d\n", ret);
> -		clk_disable(i2c_dev->fast_clk);
> -		return ret;
> +		goto disable_slow_clk;
>  	}
>  
>  	return 0;
> +
> +disable_slow_clk:
> +	clk_disable(i2c_dev->slow_clk);
> +disable_fast_clk:
> +	clk_disable(i2c_dev->fast_clk);
> +	return ret;
>  }
>  
>  static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
> 
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
