Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46285230850
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 13:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgG1LD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 07:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgG1LD6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 07:03:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81825C061794;
        Tue, 28 Jul 2020 04:03:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f5so20634392ljj.10;
        Tue, 28 Jul 2020 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jX6sjTJPEr15dOzF7TYKeW7hD2/3KOKGSVAXq2cMBEc=;
        b=d13uPu0+A8NFdVShzGvgGo4igAAaBdTaVAmAtFt4WF3hQWPCzgOZa3msY075ut5XaJ
         k8eWcH8d33j3q9R5BTwumU5UEfPfG5MTo6ELaMCYTqMjNlWtwJloALgvmhwktj4sniV8
         e++cuzk30jO7afhKJycMTVt00m3AUpWl4YGo4Av4UjOXJyE+zRFn2qXnSJ0GsbX/2uQd
         MKsWo4z2zGaowAA5XbZi69CFjkNvsCB2sbxIbEzvdoHPKd16q+8t7TjVPRZBHICf4yz2
         296srKHU3RreyC48COtmJUgeAjyVGp1ojNLE/2Y4AIH5NH6CsIEwAXQXpqYgFpmMi3a4
         MlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jX6sjTJPEr15dOzF7TYKeW7hD2/3KOKGSVAXq2cMBEc=;
        b=KXQfqZX/5M6K2GnUEIog1q4URisQFVSNogKqQv3w06XIJm6eSSAT5PFAE392l5SK8b
         2VVNFmLPid/5yyMXNg/Fa/LIan5+ySrW0Fhz1CXh2R21ZWsxMnPgCAvrKIg/QLbCknDr
         7olXKFAAhbJfvVEVnncweW6KxSYD21N/Dfpm/gnPtJE6e8sDhMbyqTHc0JblaWd07ZYJ
         Ny3fqwDyTYWT/5Go+DA0SoN+0P3Pjp01lTa/hNH6/hKuh01kO+eR0ncWd5arVosY+DNO
         MtB5yEG8bLal/uzUUB7QRZMXgF03FSj5OG/ngoRsBQBeAZLIrc0s+tOyin5BDlsXvDaB
         PIuQ==
X-Gm-Message-State: AOAM533mVQ7sgNXN2zS8T7NULMRtBBGY4SVdas3qYaVzefYQ2ajEfPYx
        C8llCZulo4OhVc7dzA5tob99udjS
X-Google-Smtp-Source: ABdhPJy21QLY/yVjHkncbE+RD0wsgXFjz+XHQdbpbJEUed+zywipzYvk8mjCf8LoQO76elRFDDdGzg==
X-Received: by 2002:a2e:7308:: with SMTP id o8mr5524141ljc.414.1595934235729;
        Tue, 28 Jul 2020 04:03:55 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id k25sm2905238ljk.87.2020.07.28.04.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 04:03:55 -0700 (PDT)
Subject: Re: [RFC PATCH v5 12/14] gpu: host1x: mipi: Keep MIPI clock enabled
 till calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b21e3227-d0d8-5b4a-ae69-aa29551a22c3@gmail.com>
Date:   Tue, 28 Jul 2020 14:03:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595883452-17343-13-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.07.2020 23:57, Sowjanya Komatineni пишет:
> With the split of MIPI calibration into tegra_mipi_calibrate() and
> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
> is done.
> 
> So, this patch skips disabling MIPI clock after triggering start of
> calibration and disables it only after waiting for done status from
> the calibration logic.
> 
> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
> with their usage.
> 
> As MIPI clock is left enabled and in case of any failures with CSI input
> streaming tegra_mipi_finish_calibration() will not get invoked.
> So added new API tegra_mipi_cancel_calibration() which disables MIPI clock
> and consumer drivers can call this in such cases.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c |  4 ++--
>  drivers/gpu/host1x/mipi.c   | 19 ++++++++++---------
>  include/linux/host1x.h      |  5 +++--
>  3 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 3820e8d..a7864e9 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -694,11 +694,11 @@ static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
>  		DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
>  	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
>  
> -	err = tegra_mipi_calibrate(dsi->mipi);
> +	err = tegra_mipi_start_calibration(dsi->mipi);
>  	if (err < 0)
>  		return err;
>  
> -	return tegra_mipi_wait(dsi->mipi);
> +	return tegra_mipi_finish_calibration(dsi->mipi);
>  }
>  
>  static void tegra_dsi_set_timeout(struct tegra_dsi *dsi, unsigned long bclk,
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e606464..b15ab6e 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -293,17 +293,19 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev)
>  }
>  EXPORT_SYMBOL(tegra_mipi_disable);
>  
> -int tegra_mipi_wait(struct tegra_mipi_device *device)
> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device)
> +{

Doesn't MIPI_CAL need to be reset here?

> +	clk_disable(device->mipi->clk);
> +}
> +EXPORT_SYMBOL(tegra_mipi_cancel_calibration);
> +
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
>  {
>  	struct tegra_mipi *mipi = device->mipi;
>  	void __iomem *status_reg = mipi->regs + (MIPI_CAL_STATUS << 2);
>  	u32 value;
>  	int err;
>  
> -	err = clk_enable(device->mipi->clk);
> -	if (err < 0)
> -		return err;
> -
>  	mutex_lock(&device->mipi->lock);
>  
>  	err = readl_relaxed_poll_timeout(status_reg, value,
> @@ -315,9 +317,9 @@ int tegra_mipi_wait(struct tegra_mipi_device *device)
>  
>  	return err;
>  }
> -EXPORT_SYMBOL(tegra_mipi_wait);
> +EXPORT_SYMBOL(tegra_mipi_finish_calibration);
>  
> -int tegra_mipi_calibrate(struct tegra_mipi_device *device)
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>  {
>  	const struct tegra_mipi_soc *soc = device->mipi->soc;
>  	unsigned int i;
> @@ -382,11 +384,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>  	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);

This function sets MIPI_CAL_CLKEN_OVR bit, does it mean that MIPI clock
becomes always-ON?

I don't see where MIPI_CAL_CLKEN_OVR is unset.

>  	mutex_unlock(&device->mipi->lock);
> -	clk_disable(device->mipi->clk);
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(tegra_mipi_calibrate);
> +EXPORT_SYMBOL(tegra_mipi_start_calibration);
>  
>  static const struct tegra_mipi_pad tegra114_mipi_pads[] = {
>  	{ .data = MIPI_CAL_CONFIG_CSIA },
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 20c885d..b490dda 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -333,7 +333,8 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
>  void tegra_mipi_free(struct tegra_mipi_device *device);
>  int tegra_mipi_enable(struct tegra_mipi_device *device);
>  int tegra_mipi_disable(struct tegra_mipi_device *device);
> -int tegra_mipi_calibrate(struct tegra_mipi_device *device);
> -int tegra_mipi_wait(struct tegra_mipi_device *device);
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> +void tegra_mipi_cancel_calibration(struct tegra_mipi_device *device);
>  
>  #endif
> 

