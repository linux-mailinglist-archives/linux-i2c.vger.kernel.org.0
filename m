Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CBE1FDA38
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 02:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgFRA1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 20:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbgFRA1l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Jun 2020 20:27:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AE1C06174E;
        Wed, 17 Jun 2020 17:27:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q19so5125939lji.2;
        Wed, 17 Jun 2020 17:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rq/E/19LmZnfaik86wPXedWKtuvz2N6trRDZr1KcBB0=;
        b=oj+wKzcMU4xmQ8YezB0HM2rn2rQs8YMekF0qTjRrXdc2C+dB168pSjp4kZr1ZRX3SL
         r2IyE/SLg9KFXpE2zZF/B7d6WKCDhkwO+Tfx876cxyjnlvmpl109teVTh1lZ/KetbUaC
         3uGtFilcmL61xITYKBbUVgjnJcMDI/iR20EJ4d25SMGLL45etoNCfgErKsFnJvNiCUKV
         vAml4yrP544gUvZRj5BVsJ/ltAwA0UO8R4bPVl7dGH+sc/uI2NnxDWMDrQ9YO3FHUDum
         nM9m3FAMf+NsisMkYEQ5je/BnDC9OThKPcNRSppTsYe+wC6SqQ86j/6qA/wlHr0zFDew
         imvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rq/E/19LmZnfaik86wPXedWKtuvz2N6trRDZr1KcBB0=;
        b=Wlnu+OluA7+GxW0O/qhHVw4KYU/TPRHl53VGzK6N5lW0uf9L8NEhATENK90WE1HBL0
         wCjRDlX+QgoaqHm0PTWGmggJ/XzgfoldY4lBDLZa8MKsqJuTOhZOViAK3/kpaMS5pIzn
         9W0lTNYlC5e4MLhvBklJ97gQBhBtRzgm/TRZyG3qa4XX5nkqzSb33a7c+tEbErTwgD2Q
         EmjnIRaqCKL6F6zdq5QBJxDXY4CM53sXuv71m1PL8jATvKqTmwdPj8qovT6vZV312/lm
         RJcFrnyZyiM2BWMcCTDuAMngFiQywZp3OmuA7ws9Ug6CF9+Ay2YaYAXaloolXqmzmo1Q
         hGyw==
X-Gm-Message-State: AOAM533KaQOan0og1YlAvzj9QviTFz52/yFZHw629bI24PabJ3KidosF
        gpFqxCFbyRDweXx7uT7Tf5Awq9FR
X-Google-Smtp-Source: ABdhPJxwYkNYDNJrwfnlX7YFsBxVWp2WpQw2Bc1wOmh074hF1cO3hSBmpCJDJzKW3LGFMvpMOS9w1g==
X-Received: by 2002:a2e:b615:: with SMTP id r21mr867334ljn.1.1592440059598;
        Wed, 17 Jun 2020 17:27:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id u26sm357818lfq.72.2020.06.17.17.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 17:27:38 -0700 (PDT)
Subject: Re: [RFC PATCH v2 13/18] gpu: host1x: mipi: Update
 tegra_mipi_request() to be node based
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-14-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a0a0a02-0d02-15ae-85de-e752ecdd0ae1@gmail.com>
Date:   Thu, 18 Jun 2020 03:27:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-14-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.06.2020 04:41, Sowjanya Komatineni пишет:
> Tegra CSI driver need a separate MIPI device for each channel as
> calibration of corresponding MIPI pads for each channel should
> happen independently.
> 
> So, this patch updates tegra_mipi_request() API to add a device_node
> pointer argument to allow creating mipi device for specific device
> node rather than a device.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 2 +-
>  drivers/gpu/host1x/mipi.c   | 7 +++++--
>  include/linux/host1x.h      | 3 ++-
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 38beab9..0443589 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->regs))
>  		return PTR_ERR(dsi->regs);
>  
> -	dsi->mipi = tegra_mipi_request(&pdev->dev);
> +	dsi->mipi = tegra_mipi_request(&pdev->dev, NULL);
>  	if (IS_ERR(dsi->mipi))
>  		return PTR_ERR(dsi->mipi);
>  
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e00809d..93b354b 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -206,13 +206,16 @@ static int tegra_mipi_power_down(struct tegra_mipi *mipi)
>  	return 0;
>  }
>  
> -struct tegra_mipi_device *tegra_mipi_request(struct device *device)
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> +					     struct device_node *np)
>  {
> -	struct device_node *np = device->of_node;
>  	struct tegra_mipi_device *dev;
>  	struct of_phandle_args args;
>  	int err;
>  
> +	if (!np)
> +		np = device->of_node;

Will be nicer if DSI panel could pass the device's node directly,
instead of this.
