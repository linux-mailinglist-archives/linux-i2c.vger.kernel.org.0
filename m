Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9451B1F5588
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 15:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729182AbgFJNOz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 09:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbgFJNOy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 09:14:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250E7C03E96B;
        Wed, 10 Jun 2020 06:14:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c17so2385001lji.11;
        Wed, 10 Jun 2020 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UNoMv6ObyceiFWwH0mO4eRasIpDWoKfsc+bwVl1I/WQ=;
        b=GyBMYKMOt1EDvF46kVMtzNBZaUuOqNMaTLlGlOPEtu/Fiycl6kU6QiugruCwIsCUi2
         UW55/cYih/ZO+g2K94041aSAChSGQSV5tmQwn4khewvcssCfHhIrLe68ZBaYAAhuloHP
         1eN28uEXxwKBNVBSXPErXi+Ppd9cqR+fIDi73hNdPfO73/AGmPrWZxV7XpHVwhNFIGne
         Us2nvT+5UoG/uSlnJhmO4V+Ot2KEUGhsIdojS7ZV0w09n86Pp8aOuwZ5O55ekc+DSw6c
         TdHh0iNmxeHfYu8PtxzffPm+1v9ctNAbCSfrDdekU3/fUxE4MC+wpmSVzd9GAKJfhT7u
         OKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UNoMv6ObyceiFWwH0mO4eRasIpDWoKfsc+bwVl1I/WQ=;
        b=noGbtBM+LsPAFz9/oKx5ri8z9KXnjAK+5RTom+DfKR+HE/vhNMfCUK5cL9ypNiz+Za
         9FxvtP6ATGHn03EcCR4q/hmak5cOr4bBxG+AAYLWUTr3QKL1DlvTbayAy2sAWglHaUQY
         gf3rnwuS5T4KGeiaKgvlEL+4gdopz+1s5/BwRPXB7/6/dqTiah/4DTd8yxg95WJXcuX5
         lAvmdh4/1Kj35PM9fKOmxLJpAYzNkHILcUnSczYyJpCdr8kxuTbEXfqJ7ixa/LExR2L8
         FR2iLpvFsAxRSp4Mt3ZGFR8RajgpsAARxEOLXw4IIZudg9y2M6ZH1hCnR0YwzbE7H8HY
         OSaQ==
X-Gm-Message-State: AOAM533AQSLbZZhP4dqMirOxNHXWfEHiyMSzDwNzmhvKt9j4xUEeUR/N
        PG6+TRvc3r/GkBLqXaSUITe9FNfE
X-Google-Smtp-Source: ABdhPJy2Se4HKECeDeBieJjVL5HYdRqYV64/7lP07ijKUA21F2zhobNjO2Ug05l/y+2CmhdINQUacw==
X-Received: by 2002:a05:651c:118f:: with SMTP id w15mr1783593ljo.211.1591794891947;
        Wed, 10 Jun 2020 06:14:51 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id n1sm4994529ljg.131.2020.06.10.06.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:14:51 -0700 (PDT)
Subject: Re: [RFC PATCH v1 05/18] i2c: tegra: Fix runtime resume to re-init VI
 I2C
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-6-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fcced8cd-d80d-b09c-b657-cb413ec418f9@gmail.com>
Date:   Wed, 10 Jun 2020 16:14:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1591768960-31648-6-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.06.2020 09:02, Sowjanya Komatineni пишет:
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
> index dba38a5..650240d 100644
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
> @@ -679,8 +681,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
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
>  	if (i2c_dev->slow_clk)
>  		clk_disable(i2c_dev->slow_clk);
> 

The clk_disable() can cope with a NULL argument. Won't it be cleaner to
remove the conditions?
