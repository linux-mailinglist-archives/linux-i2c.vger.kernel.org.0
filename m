Return-Path: <linux-i2c+bounces-11833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0322DAF96FB
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148D5160261
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF99E2F3C0C;
	Fri,  4 Jul 2025 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ziC6Hxfi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298B12D94BD
	for <linux-i2c@vger.kernel.org>; Fri,  4 Jul 2025 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643470; cv=none; b=EdYxBQDm8oqwDBKf6j7GVmpUhelO50ry27E4s5UhBssikH/wYIkd0BEAHG2YfIRhZwqhu0izBtp/84qlBGgMd8wagiA/tjzeBp7iigNrFJYqRZhBiXuz2gZAeyZuWpIZEeOsfudjiaOKGAvn1DLNUROiwmnb+aKMIwrbo1qWlF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643470; c=relaxed/simple;
	bh=AqCAt1wI7tAF5McZIeuIhOgu1S/knglyj60+bdPhkbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcBcZHTm9frs9U3nc6VEYmlBnhdw5SKikK8v1GngnLgaAf1XdDjaRw8+Ax4PqbFsp4fT6uRGmig58dk6dPHYeQ7z1sDOV0kIPrzY+iNfaPFyDPrrfCmqem5HEbF6gAa3udN4kU32Q9Kx3lnU8ZN+nz9MJeNsSQUL3kVyW0xyGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ziC6Hxfi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313f68bc519so936314a91.0
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jul 2025 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643466; x=1752248266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfUDmHeepnt8bgi+nNBa1jZtXWQ+k/4Kcm7pPkbYwkQ=;
        b=ziC6HxfiLCtBqhZc6qt3dRh9L9ae72vgX1Ji1xziuE7879XZZFlH1Ev6cUvMZVzBZ1
         O92b/dh2zytrc+ZXGOcAoPQH1g8mVBtafQttlkHaGoy1frvu4PF2TWOYe3ObJ04hAHVg
         bboZhbngbVsriRB8rKU33i1Tw0TkTdaWTD02QE9f8QOjLx8kYvv+e3N+H7vp6E7T+fo/
         mfUkLX3ryWGvVzsFCbWeXs06y/klclfuBaUCuduiEXNHbtF1cV9s4SS60QxgVaHohdB6
         d/cp57q63oet12DVmfw7+gKkxEa2Pypkx/e4lGeu7kSm9iYte7J3PMTwlWgdT5qFCUkN
         RSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643466; x=1752248266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfUDmHeepnt8bgi+nNBa1jZtXWQ+k/4Kcm7pPkbYwkQ=;
        b=Mek/vCkTGptkaJ9NMjjoD9SoEn14Ziahq5RCoaARfl3WTSiP5TvuwlynEhPpsF+Vty
         ahG3MYA0ybaOrJcUpChROSYLjgNXkoVFyveFxTxgi07kw0M+NbaXLTpmqxoXMQBor2x+
         vBDz+rSqkyvSdb3CqXNqC3c9JahYQ05UKSOROJvu1JNri0otIQnP/LlD00f5Z7AIQwo/
         66CIygcV2hqMapXgcWzIfgK0u4l/qdeG3OYBhRtn+CnDVj5AhjmpezoprXW1o8ZSFxwN
         Qzhl1OnKQPMXxepXMmKxTHBqJQcPXozn7UxwmDZ3u7zZhZO1xoPb+7fTwR0LUundPULA
         5RSA==
X-Forwarded-Encrypted: i=1; AJvYcCWIJ/Mn6F6Al/uX5piBY4fBdwlR7Oi3ZX2owjtTx+7NZotH0ImcC6TtUg1AmjcPwLG4bzbzrQ3sZik=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh2HVBRqyuzTmCgKtAP9jYHy9YrRRVQtHVYoM2fhqMuf45E8jP
	uqXjt+BbkDvRa0KKlcOG7Sw0rSmU6YkParGNwM83eN2+g4owIlbt30D8+eFkw3nFXjA=
X-Gm-Gg: ASbGncsM9C+TOpQBbRoOT4E887Af8C5FV68OU5eY/rw5Wk/Pwkb9t/qsIz9+TIE+God
	z4LLTYBuHn+XG3XMwMJZkxGP49yYBjth6utJ4CUWbUw2CnWUBiwf93WlhjoYndHZ0LTATtuRNUT
	b3bKpkQkIgs2wTbPZSvfw5Ie9jzLfTREYrqaqf7wgyLswb+WTOqJYyFWmXsls2iXexxiphIVU8e
	Y3UBOU0BlWKCSwHyd+sci9RhkTIj8XGYTd5A7T3juxBrCNYEleP1EdbdllKgdQQxLD5Z+uUzXWp
	LXIjQ2j1sgX5xeGC+gPlP4Z8KUQsbHtpSJuHbRJMhatRPkkQFF++oh6G2xBo/TpStA==
X-Google-Smtp-Source: AGHT+IFPI2zhve4aVtUtekaO97BS+JFBRK74WkSk2tLAhK9T3VoR5MF+THO0XUOGjGGiMHNpLBAJwA==
X-Received: by 2002:a17:90a:d604:b0:312:1143:cf8c with SMTP id 98e67ed59e1d1-31aadd86742mr4003854a91.16.1751643466282;
        Fri, 04 Jul 2025 08:37:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ebf3:da99:de93:f600])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cb7e88esm5358629a91.0.2025.07.04.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:37:45 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:37:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux@armlinux.org.uk, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	rafael@kernel.org, dakr@kernel.org, len.brown@intel.com,
	pavel@kernel.org, andersson@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org, vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	broonie@kernel.org, robh@kernel.org, jirislaby@kernel.org,
	saravanak@google.com, jic23@kernel.org, dmitry.torokhov@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	bhelgaas@google.com, geert@linux-m68k.org,
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 1/3] PM: domains: Add flags to specify power on
 attach/detach
Message-ID: <aGf1Rjy7WLEuNGme@p14s>
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
 <20250703112708.1621607-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703112708.1621607-2-claudiu.beznea.uj@bp.renesas.com>

On Thu, Jul 03, 2025 at 02:27:06PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Calling dev_pm_domain_attach()/dev_pm_domain_detach() in bus driver
> probe/remove functions can affect system behavior when the drivers attached
> to the bus use devres-managed resources. Since devres actions may need to
> access device registers, calling dev_pm_domain_detach() too early, i.e.,
> before these actions complete, can cause failures on some systems. One such
> example is Renesas RZ/G3S SoC-based platforms.
> 
> If the device clocks are managed via PM domains, invoking
> dev_pm_domain_detach() in the bus driver's remove function removes the
> device's clocks from the PM domain, preventing any subsequent
> pm_runtime_resume*() calls from enabling those clocks.
> 
> The second argument of dev_pm_domain_attach() specifies whether the PM
> domain should be powered on during attachment. Likewise, the second
> argument of dev_pm_domain_detach() indicates whether the domain should be
> powered off during detachment.
> 
> Upcoming commits address the issue described above (initially for the
> platform bus only) by deferring the call to dev_pm_domain_detach() until
> after devres_release_all() in device_unbind_cleanup(). The detach_power_off
> field in struct dev_pm_info stores the detach power off info from the
> second argument of dev_pm_domain_attach().
> 
> Because there are cases where the device's PM domain power-on/off behavior
> must be conditional (e.g., in i2c_device_probe()), the patch introduces
> PD_FLAG_ATTACH_POWER_ON and PD_FLAG_DETACH_POWER_OFF flags to be passed to
> dev_pm_domain_attach().
> 
> Finally, dev_pm_domain_attach() and its users are updated to use the newly
> introduced PD_FLAG_ATTACH_POWER_ON and PD_FLAG_DETACH_POWER_OFF macros.
> 
> This is a preparatory commit.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - none; this patch is new
> 
>  drivers/amba/bus.c                       |  4 ++--
>  drivers/base/auxiliary.c                 |  2 +-
>  drivers/base/platform.c                  |  2 +-
>  drivers/base/power/common.c              |  6 +++---
>  drivers/clk/qcom/apcs-sdx55.c            |  2 +-
>  drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
>  drivers/i2c/i2c-core-base.c              |  2 +-
>  drivers/mmc/core/sdio_bus.c              |  2 +-
>  drivers/rpmsg/rpmsg_core.c               |  2 +-

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  drivers/soundwire/bus_type.c             |  2 +-
>  drivers/spi/spi.c                        |  2 +-
>  drivers/tty/serdev/core.c                |  2 +-
>  include/linux/pm_domain.h                | 10 ++++++++--
>  13 files changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 71482d639a6d..74e34a07ef72 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -138,7 +138,7 @@ static int amba_read_periphid(struct amba_device *dev)
>  	void __iomem *tmp;
>  	int i, ret;
>  
> -	ret = dev_pm_domain_attach(&dev->dev, true);
> +	ret = dev_pm_domain_attach(&dev->dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret) {
>  		dev_dbg(&dev->dev, "can't get PM domain: %d\n", ret);
>  		goto err_out;
> @@ -291,7 +291,7 @@ static int amba_probe(struct device *dev)
>  		if (ret < 0)
>  			break;
>  
> -		ret = dev_pm_domain_attach(dev, true);
> +		ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
>  		if (ret)
>  			break;
>  
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index dba7c8e13a53..44cd3f85b659 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -217,7 +217,7 @@ static int auxiliary_bus_probe(struct device *dev)
>  	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
>  	int ret;
>  
> -	ret = dev_pm_domain_attach(dev, true);
> +	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret) {
>  		dev_warn(dev, "Failed to attach to PM Domain : %d\n", ret);
>  		return ret;
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 075ec1d1b73a..df1ec34fdf56 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1396,7 +1396,7 @@ static int platform_probe(struct device *_dev)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = dev_pm_domain_attach(_dev, true);
> +	ret = dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret)
>  		goto out;
>  
> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> index 781968a128ff..fecb85fa85ac 100644
> --- a/drivers/base/power/common.c
> +++ b/drivers/base/power/common.c
> @@ -83,7 +83,7 @@ EXPORT_SYMBOL_GPL(dev_pm_put_subsys_data);
>  /**
>   * dev_pm_domain_attach - Attach a device to its PM domain.
>   * @dev: Device to attach.
> - * @power_on: Used to indicate whether we should power on the device.
> + * @flags: indicate whether we should power on/off the device on attach/detach
>   *
>   * The @dev may only be attached to a single PM domain. By iterating through
>   * the available alternatives we try to find a valid PM domain for the device.
> @@ -100,14 +100,14 @@ EXPORT_SYMBOL_GPL(dev_pm_put_subsys_data);
>   * Returns 0 on successfully attached PM domain, or when it is found that the
>   * device doesn't need a PM domain, else a negative error code.
>   */
> -int dev_pm_domain_attach(struct device *dev, bool power_on)
> +int dev_pm_domain_attach(struct device *dev, u32 flags)
>  {
>  	int ret;
>  
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = acpi_dev_pm_attach(dev, power_on);
> +	ret = acpi_dev_pm_attach(dev, !!(flags & PD_FLAG_ATTACH_POWER_ON));
>  	if (!ret)
>  		ret = genpd_dev_pm_attach(dev);
>  
> diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
> index 3ba01622d8f0..90dd1f1855c2 100644
> --- a/drivers/clk/qcom/apcs-sdx55.c
> +++ b/drivers/clk/qcom/apcs-sdx55.c
> @@ -111,7 +111,7 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
>  	 * driver, there seems to be no better place to do this. So do it here!
>  	 */
>  	cpu_dev = get_cpu_device(0);
> -	ret = dev_pm_domain_attach(cpu_dev, true);
> +	ret = dev_pm_domain_attach(cpu_dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "can't get PM domain: %d\n", ret);
>  		goto err;
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index 7b9afcf48836..2d279e82922f 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -58,7 +58,7 @@ static int dp_aux_ep_probe(struct device *dev)
>  		container_of(aux_ep, struct dp_aux_ep_device_with_data, aux_ep);
>  	int ret;
>  
> -	ret = dev_pm_domain_attach(dev, true);
> +	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to attach to PM Domain\n");
>  
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 2ad2b1838f0f..38eabf1173da 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -573,7 +573,7 @@ static int i2c_device_probe(struct device *dev)
>  		goto err_clear_wakeup_irq;
>  
>  	do_power_on = !i2c_acpi_waive_d0_probe(dev);
> -	status = dev_pm_domain_attach(&client->dev, do_power_on);
> +	status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
>  	if (status)
>  		goto err_clear_wakeup_irq;
>  
> diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
> index b66b637e2d57..656601754966 100644
> --- a/drivers/mmc/core/sdio_bus.c
> +++ b/drivers/mmc/core/sdio_bus.c
> @@ -161,7 +161,7 @@ static int sdio_bus_probe(struct device *dev)
>  	if (!id)
>  		return -ENODEV;
>  
> -	ret = dev_pm_domain_attach(dev, false);
> +	ret = dev_pm_domain_attach(dev, 0);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 6ee36adcbdba..bece5e635ee9 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -479,7 +479,7 @@ static int rpmsg_dev_probe(struct device *dev)
>  	struct rpmsg_endpoint *ept = NULL;
>  	int err;
>  
> -	err = dev_pm_domain_attach(dev, true);
> +	err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (err)
>  		goto out;
>  
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 75d6f16efced..bc1e653080d9 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -101,7 +101,7 @@ static int sdw_drv_probe(struct device *dev)
>  	/*
>  	 * attach to power domain but don't turn on (last arg)
>  	 */
> -	ret = dev_pm_domain_attach(dev, false);
> +	ret = dev_pm_domain_attach(dev, 0);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 1bc0fdbb1bd7..8200b47b2295 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -427,7 +427,7 @@ static int spi_probe(struct device *dev)
>  	if (spi->irq < 0)
>  		spi->irq = 0;
>  
> -	ret = dev_pm_domain_attach(dev, true);
> +	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
> index 0213381fa358..d16c207a1a9b 100644
> --- a/drivers/tty/serdev/core.c
> +++ b/drivers/tty/serdev/core.c
> @@ -399,7 +399,7 @@ static int serdev_drv_probe(struct device *dev)
>  	const struct serdev_device_driver *sdrv = to_serdev_device_driver(dev->driver);
>  	int ret;
>  
> -	ret = dev_pm_domain_attach(dev, true);
> +	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 0b18160901a2..62a35a78ce9b 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -36,10 +36,16 @@
>   *				isn't specified, the index just follows the
>   *				index for the attached PM domain.
>   *
> + * PD_FLAG_ATTACH_POWER_ON:	Power on the domain during attach.
> + *
> + * PD_FLAG_DETACH_POWER_OFF:	Power off the domain during detach.
> + *
>   */
>  #define PD_FLAG_NO_DEV_LINK		BIT(0)
>  #define PD_FLAG_DEV_LINK_ON		BIT(1)
>  #define PD_FLAG_REQUIRED_OPP		BIT(2)
> +#define PD_FLAG_ATTACH_POWER_ON		BIT(3)
> +#define PD_FLAG_DETACH_POWER_OFF	BIT(4)
>  
>  struct dev_pm_domain_attach_data {
>  	const char * const *pd_names;
> @@ -501,7 +507,7 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
>  #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
>  
>  #ifdef CONFIG_PM
> -int dev_pm_domain_attach(struct device *dev, bool power_on);
> +int dev_pm_domain_attach(struct device *dev, u32 flags);
>  struct device *dev_pm_domain_attach_by_id(struct device *dev,
>  					  unsigned int index);
>  struct device *dev_pm_domain_attach_by_name(struct device *dev,
> @@ -518,7 +524,7 @@ int dev_pm_domain_start(struct device *dev);
>  void dev_pm_domain_set(struct device *dev, struct dev_pm_domain *pd);
>  int dev_pm_domain_set_performance_state(struct device *dev, unsigned int state);
>  #else
> -static inline int dev_pm_domain_attach(struct device *dev, bool power_on)
> +static inline int dev_pm_domain_attach(struct device *dev, u32 flags)
>  {
>  	return 0;
>  }
> -- 
> 2.43.0
> 

