Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C95305CE9
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Jan 2021 14:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313604AbhAZWic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 17:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395457AbhAZTZ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jan 2021 14:25:27 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FC5C061574;
        Tue, 26 Jan 2021 11:24:47 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id k8so17353135otr.8;
        Tue, 26 Jan 2021 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=D1ltTrh6GrF621pynXjIu633fPh/vCcW4NA4RWi0JI8=;
        b=BQcvX/vQcepwH9xkYrXWBsXyP8EzoUQrPHntu3FzocQDFkWdoHdRmOqDmBMUzF6Vt6
         +4I/ggUiEP0uSbmhNSv9l689w0NEYu9+/U4Ku6pddmk+FFimlLFKLEyx8kBde2EzWFpN
         mKDZydMe8+bvT308qklZD6bLxSIVhjvVPOjsC+4yyMjzYCO43amUZCqiWhsjYXTk2Z16
         9TGuNPUaLBDga0oZC8QANu2kLQ2IOqpUwCVhZlDpYV0zc9+8fspZjfp/8jqfJK1F8Ulm
         zAVdGK42Q4bBXtvVNcAlWHedmlHtXl9GEqV+cfMqJcm4E7yFkd39JqQJ0lUqFaiY1RtY
         SeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=D1ltTrh6GrF621pynXjIu633fPh/vCcW4NA4RWi0JI8=;
        b=R/ZghvJX5JVsEzxg6K49kDykgs0bPHLhTK8AMwxEQPnvqoO80m/qiHkTDE11xEXQHg
         wXGwiL9D5MaJQlmW/q0txHenRk5Ks7Ksc1u96MdPERO7i/Uw0IKCX6KrSEBhGDzHk7Ao
         dA1ddIerRI1sDpkTJ2kwCH+dllL5AziqlO3EzsY1MQroRDFZvJ8Klv8keaawOhSsgMGG
         GFaOMZjXrFNq2Z9VCPZlxakOlL1NmWfrySyqYQz1Gg0TxkllbqVGc/qXB8zAXOc83541
         MYvf5xaIHMqheu3kbCFggGrULyX94FGDu3rsBOFoxrjmR08D45A0cmI9hzTOXLihkgmL
         fYtg==
X-Gm-Message-State: AOAM532gHDiCos7fMZT6HqvyhZB5fqgT9pmZmuWhcuTGi5u9l56mG4/9
        Qn1wnVv1ByEtdJ+wwWTbPVI=
X-Google-Smtp-Source: ABdhPJztb/3InwKiBBmxTEbYz5EWr2nHE2g3SB5DNkH/uYrp0J/4XMeexHk4NVLAcP5G/37TRay4lQ==
X-Received: by 2002:a9d:1d04:: with SMTP id m4mr4855021otm.142.1611689086737;
        Tue, 26 Jan 2021 11:24:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d17sm4307875otk.3.2021.01.26.11.24.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 11:24:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 26 Jan 2021 11:24:43 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        dri-devel@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 4/5] amba: Make the remove callback return void
Message-ID: <20210126192443.GA31936@roeck-us.net>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 26, 2021 at 05:58:34PM +0100, Uwe Kleine-König wrote:
> All amba drivers return 0 in their remove callback. Together with the
> driver core ignoring the return value anyhow, it doesn't make sense to
> return a value here.
> 
> Change the remove prototype to return void, which makes it explicit that
> returning an error value doesn't work as expected. This simplifies changing
> the core remove callback to return void, too.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # for drivers/memory
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/amba/bus.c                                 | 5 ++---
>  drivers/char/hw_random/nomadik-rng.c               | 3 +--
>  drivers/dma/pl330.c                                | 3 +--
>  drivers/gpu/drm/pl111/pl111_drv.c                  | 4 +---
>  drivers/hwtracing/coresight/coresight-catu.c       | 3 +--
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  | 4 +---
>  drivers/hwtracing/coresight/coresight-cti-core.c   | 4 +---
>  drivers/hwtracing/coresight/coresight-etb10.c      | 4 +---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 4 +---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +---
>  drivers/hwtracing/coresight/coresight-funnel.c     | 4 ++--
>  drivers/hwtracing/coresight/coresight-replicator.c | 4 ++--
>  drivers/hwtracing/coresight/coresight-stm.c        | 4 +---
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 4 +---
>  drivers/hwtracing/coresight/coresight-tpiu.c       | 4 +---
>  drivers/i2c/busses/i2c-nomadik.c                   | 4 +---
>  drivers/input/serio/ambakmi.c                      | 3 +--
>  drivers/memory/pl172.c                             | 4 +---
>  drivers/memory/pl353-smc.c                         | 4 +---
>  drivers/mmc/host/mmci.c                            | 4 +---
>  drivers/rtc/rtc-pl030.c                            | 4 +---
>  drivers/rtc/rtc-pl031.c                            | 4 +---
>  drivers/spi/spi-pl022.c                            | 5 ++---
>  drivers/tty/serial/amba-pl010.c                    | 4 +---
>  drivers/tty/serial/amba-pl011.c                    | 3 +--
>  drivers/vfio/platform/vfio_amba.c                  | 3 +--
>  drivers/video/fbdev/amba-clcd.c                    | 4 +---
>  drivers/watchdog/sp805_wdt.c                       | 4 +---
>  include/linux/amba/bus.h                           | 2 +-
>  sound/arm/aaci.c                                   | 4 +---
>  30 files changed, 34 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
> index 8c4a42df47c6..48b5d4b4e889 100644
> --- a/drivers/amba/bus.c
> +++ b/drivers/amba/bus.c
> @@ -300,11 +300,10 @@ static int amba_remove(struct device *dev)
>  {
>  	struct amba_device *pcdev = to_amba_device(dev);
>  	struct amba_driver *drv = to_amba_driver(dev->driver);
> -	int ret = 0;
>  
>  	pm_runtime_get_sync(dev);
>  	if (drv->remove)
> -		ret = drv->remove(pcdev);
> +		drv->remove(pcdev);
>  	pm_runtime_put_noidle(dev);
>  
>  	/* Undo the runtime PM settings in amba_probe() */
> @@ -315,7 +314,7 @@ static int amba_remove(struct device *dev)
>  	amba_put_disable_pclk(pcdev);
>  	dev_pm_domain_detach(dev, true);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void amba_shutdown(struct device *dev)
> diff --git a/drivers/char/hw_random/nomadik-rng.c b/drivers/char/hw_random/nomadik-rng.c
> index b0ded41eb865..67947a19aa22 100644
> --- a/drivers/char/hw_random/nomadik-rng.c
> +++ b/drivers/char/hw_random/nomadik-rng.c
> @@ -69,11 +69,10 @@ static int nmk_rng_probe(struct amba_device *dev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int nmk_rng_remove(struct amba_device *dev)
> +static void nmk_rng_remove(struct amba_device *dev)
>  {
>  	amba_release_regions(dev);
>  	clk_disable(rng_clk);
> -	return 0;
>  }
>  
>  static const struct amba_id nmk_rng_ids[] = {
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index bc0f66af0f11..fd8d2bc3be9f 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -3195,7 +3195,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int pl330_remove(struct amba_device *adev)
> +static void pl330_remove(struct amba_device *adev)
>  {
>  	struct pl330_dmac *pl330 = amba_get_drvdata(adev);
>  	struct dma_pl330_chan *pch, *_p;
> @@ -3235,7 +3235,6 @@ static int pl330_remove(struct amba_device *adev)
>  
>  	if (pl330->rstc)
>  		reset_control_assert(pl330->rstc);
> -	return 0;
>  }
>  
>  static const struct amba_id pl330_ids[] = {
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 40e6708fbbe2..1fb5eacefd2d 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -320,7 +320,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
>  	return ret;
>  }
>  
> -static int pl111_amba_remove(struct amba_device *amba_dev)
> +static void pl111_amba_remove(struct amba_device *amba_dev)
>  {
>  	struct device *dev = &amba_dev->dev;
>  	struct drm_device *drm = amba_get_drvdata(amba_dev);
> @@ -331,8 +331,6 @@ static int pl111_amba_remove(struct amba_device *amba_dev)
>  		drm_panel_bridge_remove(priv->bridge);
>  	drm_dev_put(drm);
>  	of_reserved_mem_device_release(dev);
> -
> -	return 0;
>  }
>  
>  /*
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index a61313f320bd..8e19e8cdcce5 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -567,12 +567,11 @@ static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int catu_remove(struct amba_device *adev)
> +static void catu_remove(struct amba_device *adev)
>  {
>  	struct catu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
>  	coresight_unregister(drvdata->csdev);
> -	return 0;
>  }
>  
>  static struct amba_id catu_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index e1d232411d8d..2dcf13de751f 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -627,7 +627,7 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int debug_remove(struct amba_device *adev)
> +static void debug_remove(struct amba_device *adev)
>  {
>  	struct device *dev = &adev->dev;
>  	struct debug_drvdata *drvdata = amba_get_drvdata(adev);
> @@ -642,8 +642,6 @@ static int debug_remove(struct amba_device *adev)
>  
>  	if (!--debug_count)
>  		debug_func_exit();
> -
> -	return 0;
>  }
>  
>  static const struct amba_cs_uci_id uci_id_debug[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 61dbc1afd8da..30e48809ba00 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -836,7 +836,7 @@ static void cti_device_release(struct device *dev)
>  	if (drvdata->csdev_release)
>  		drvdata->csdev_release(dev);
>  }
> -static int cti_remove(struct amba_device *adev)
> +static void cti_remove(struct amba_device *adev)
>  {
>  	struct cti_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
> @@ -845,8 +845,6 @@ static int cti_remove(struct amba_device *adev)
>  	mutex_unlock(&ect_mutex);
>  
>  	coresight_unregister(drvdata->csdev);
> -
> -	return 0;
>  }
>  
>  static int cti_probe(struct amba_device *adev, const struct amba_id *id)
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 0cf6f0b947b6..51c801c05e5c 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -803,7 +803,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int etb_remove(struct amba_device *adev)
> +static void etb_remove(struct amba_device *adev)
>  {
>  	struct etb_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
> @@ -814,8 +814,6 @@ static int etb_remove(struct amba_device *adev)
>  	 */
>  	misc_deregister(&drvdata->miscdev);
>  	coresight_unregister(drvdata->csdev);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 5bf5a5a4ce6d..683a69e88efd 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -909,7 +909,7 @@ static void clear_etmdrvdata(void *info)
>  	etmdrvdata[cpu] = NULL;
>  }
>  
> -static int etm_remove(struct amba_device *adev)
> +static void etm_remove(struct amba_device *adev)
>  {
>  	struct etm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
> @@ -932,8 +932,6 @@ static int etm_remove(struct amba_device *adev)
>  	cpus_read_unlock();
>  
>  	coresight_unregister(drvdata->csdev);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index b20b6ff17cf6..82787cba537d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1680,7 +1680,7 @@ static void clear_etmdrvdata(void *info)
>  	etmdrvdata[cpu] = NULL;
>  }
>  
> -static int etm4_remove(struct amba_device *adev)
> +static void etm4_remove(struct amba_device *adev)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
> @@ -1703,8 +1703,6 @@ static int etm4_remove(struct amba_device *adev)
>  	cpus_read_unlock();
>  
>  	coresight_unregister(drvdata->csdev);
> -
> -	return 0;
>  }
>  
>  static const struct amba_id etm4_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 071c723227db..01f8f9285168 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -370,9 +370,9 @@ static int dynamic_funnel_probe(struct amba_device *adev,
>  	return funnel_probe(&adev->dev, &adev->res);
>  }
>  
> -static int dynamic_funnel_remove(struct amba_device *adev)
> +static void dynamic_funnel_remove(struct amba_device *adev)
>  {
> -	return funnel_remove(&adev->dev);
> +	funnel_remove(&adev->dev);
>  }
>  
>  static const struct amba_id dynamic_funnel_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 7e2a2b7f503f..34fc2f6f3ea9 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -388,9 +388,9 @@ static int dynamic_replicator_probe(struct amba_device *adev,
>  	return replicator_probe(&adev->dev, &adev->res);
>  }
>  
> -static int dynamic_replicator_remove(struct amba_device *adev)
> +static void dynamic_replicator_remove(struct amba_device *adev)
>  {
> -	return replicator_remove(&adev->dev);
> +	replicator_remove(&adev->dev);
>  }
>  
>  static const struct amba_id dynamic_replicator_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 99791773f682..423df0d30d9c 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -951,15 +951,13 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int stm_remove(struct amba_device *adev)
> +static void stm_remove(struct amba_device *adev)
>  {
>  	struct stm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
>  	coresight_unregister(drvdata->csdev);
>  
>  	stm_unregister_device(&drvdata->stm);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 8169dff5a9f6..e29b3914fc0f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -559,7 +559,7 @@ static void tmc_shutdown(struct amba_device *adev)
>  	spin_unlock_irqrestore(&drvdata->spinlock, flags);
>  }
>  
> -static int tmc_remove(struct amba_device *adev)
> +static void tmc_remove(struct amba_device *adev)
>  {
>  	struct tmc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
> @@ -570,8 +570,6 @@ static int tmc_remove(struct amba_device *adev)
>  	 */
>  	misc_deregister(&drvdata->miscdev);
>  	coresight_unregister(drvdata->csdev);
> -
> -	return 0;
>  }
>  
>  static const struct amba_id tmc_ids[] = {
> diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
> index d5dfee9ee556..f77c4b0ea4aa 100644
> --- a/drivers/hwtracing/coresight/coresight-tpiu.c
> +++ b/drivers/hwtracing/coresight/coresight-tpiu.c
> @@ -173,13 +173,11 @@ static int tpiu_probe(struct amba_device *adev, const struct amba_id *id)
>  	return PTR_ERR(drvdata->csdev);
>  }
>  
> -static int tpiu_remove(struct amba_device *adev)
> +static void tpiu_remove(struct amba_device *adev)
>  {
>  	struct tpiu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>  
>  	coresight_unregister(drvdata->csdev);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
> index d4b1b0865f67..a3363b20f168 100644
> --- a/drivers/i2c/busses/i2c-nomadik.c
> +++ b/drivers/i2c/busses/i2c-nomadik.c
> @@ -1055,7 +1055,7 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int nmk_i2c_remove(struct amba_device *adev)
> +static void nmk_i2c_remove(struct amba_device *adev)
>  {
>  	struct resource *res = &adev->res;
>  	struct nmk_i2c_dev *dev = amba_get_drvdata(adev);
> @@ -1068,8 +1068,6 @@ static int nmk_i2c_remove(struct amba_device *adev)
>  	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
>  	clk_disable_unprepare(dev->clk);
>  	release_mem_region(res->start, resource_size(res));
> -
> -	return 0;
>  }
>  
>  static struct i2c_vendor_data vendor_stn8815 = {
> diff --git a/drivers/input/serio/ambakmi.c b/drivers/input/serio/ambakmi.c
> index ecdeca147ed7..4408245b61d2 100644
> --- a/drivers/input/serio/ambakmi.c
> +++ b/drivers/input/serio/ambakmi.c
> @@ -159,7 +159,7 @@ static int amba_kmi_probe(struct amba_device *dev,
>  	return ret;
>  }
>  
> -static int amba_kmi_remove(struct amba_device *dev)
> +static void amba_kmi_remove(struct amba_device *dev)
>  {
>  	struct amba_kmi_port *kmi = amba_get_drvdata(dev);
>  
> @@ -168,7 +168,6 @@ static int amba_kmi_remove(struct amba_device *dev)
>  	iounmap(kmi->base);
>  	kfree(kmi);
>  	amba_release_regions(dev);
> -	return 0;
>  }
>  
>  static int __maybe_unused amba_kmi_resume(struct device *dev)
> diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
> index 575fadbffa30..9eb8cc7de494 100644
> --- a/drivers/memory/pl172.c
> +++ b/drivers/memory/pl172.c
> @@ -273,14 +273,12 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int pl172_remove(struct amba_device *adev)
> +static void pl172_remove(struct amba_device *adev)
>  {
>  	struct pl172_data *pl172 = amba_get_drvdata(adev);
>  
>  	clk_disable_unprepare(pl172->clk);
>  	amba_release_regions(adev);
> -
> -	return 0;
>  }
>  
>  static const struct amba_id pl172_ids[] = {
> diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
> index 73bd3023202f..3b5b1045edd9 100644
> --- a/drivers/memory/pl353-smc.c
> +++ b/drivers/memory/pl353-smc.c
> @@ -426,14 +426,12 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
>  	return err;
>  }
>  
> -static int pl353_smc_remove(struct amba_device *adev)
> +static void pl353_smc_remove(struct amba_device *adev)
>  {
>  	struct pl353_smc_data *pl353_smc = amba_get_drvdata(adev);
>  
>  	clk_disable_unprepare(pl353_smc->memclk);
>  	clk_disable_unprepare(pl353_smc->aclk);
> -
> -	return 0;
>  }
>  
>  static const struct amba_id pl353_ids[] = {
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index b5a41a7ce165..32f52d070bbd 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2195,7 +2195,7 @@ static int mmci_probe(struct amba_device *dev,
>  	return ret;
>  }
>  
> -static int mmci_remove(struct amba_device *dev)
> +static void mmci_remove(struct amba_device *dev)
>  {
>  	struct mmc_host *mmc = amba_get_drvdata(dev);
>  
> @@ -2223,8 +2223,6 @@ static int mmci_remove(struct amba_device *dev)
>  		clk_disable_unprepare(host->clk);
>  		mmc_free_host(mmc);
>  	}
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
> index 5a880516f3e8..39038c0754ee 100644
> --- a/drivers/rtc/rtc-pl030.c
> +++ b/drivers/rtc/rtc-pl030.c
> @@ -137,7 +137,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int pl030_remove(struct amba_device *dev)
> +static void pl030_remove(struct amba_device *dev)
>  {
>  	struct pl030_rtc *rtc = amba_get_drvdata(dev);
>  
> @@ -146,8 +146,6 @@ static int pl030_remove(struct amba_device *dev)
>  	free_irq(dev->irq[0], rtc);
>  	iounmap(rtc->base);
>  	amba_release_regions(dev);
> -
> -	return 0;
>  }
>  
>  static struct amba_id pl030_ids[] = {
> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
> index 224bbf096262..620c8dc33647 100644
> --- a/drivers/rtc/rtc-pl031.c
> +++ b/drivers/rtc/rtc-pl031.c
> @@ -280,7 +280,7 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>  	return 0;
>  }
>  
> -static int pl031_remove(struct amba_device *adev)
> +static void pl031_remove(struct amba_device *adev)
>  {
>  	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
>  
> @@ -289,8 +289,6 @@ static int pl031_remove(struct amba_device *adev)
>  	if (adev->irq[0])
>  		free_irq(adev->irq[0], ldata);
>  	amba_release_regions(adev);
> -
> -	return 0;
>  }
>  
>  static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
> diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
> index d1776fea287e..fd74ddfbb686 100644
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@ -2314,13 +2314,13 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
>  	return status;
>  }
>  
> -static int
> +static void
>  pl022_remove(struct amba_device *adev)
>  {
>  	struct pl022 *pl022 = amba_get_drvdata(adev);
>  
>  	if (!pl022)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * undo pm_runtime_put() in probe.  I assume that we're not
> @@ -2335,7 +2335,6 @@ pl022_remove(struct amba_device *adev)
>  	clk_disable_unprepare(pl022->clk);
>  	amba_release_regions(adev);
>  	tasklet_disable(&pl022->pump_transfers);
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/tty/serial/amba-pl010.c b/drivers/tty/serial/amba-pl010.c
> index 3284f34e9dfe..3f96edfe569c 100644
> --- a/drivers/tty/serial/amba-pl010.c
> +++ b/drivers/tty/serial/amba-pl010.c
> @@ -754,7 +754,7 @@ static int pl010_probe(struct amba_device *dev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int pl010_remove(struct amba_device *dev)
> +static void pl010_remove(struct amba_device *dev)
>  {
>  	struct uart_amba_port *uap = amba_get_drvdata(dev);
>  	int i;
> @@ -770,8 +770,6 @@ static int pl010_remove(struct amba_device *dev)
>  
>  	if (!busy)
>  		uart_unregister_driver(&amba_reg);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index c255476cce28..4ead0c9048a8 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -2679,13 +2679,12 @@ static int pl011_probe(struct amba_device *dev, const struct amba_id *id)
>  	return pl011_register_port(uap);
>  }
>  
> -static int pl011_remove(struct amba_device *dev)
> +static void pl011_remove(struct amba_device *dev)
>  {
>  	struct uart_amba_port *uap = amba_get_drvdata(dev);
>  
>  	uart_remove_one_port(&amba_reg, &uap->port);
>  	pl011_unregister_port(uap);
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index 7b3ebf1558e1..3626c2150101 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -71,14 +71,13 @@ static int vfio_amba_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int vfio_amba_remove(struct amba_device *adev)
> +static void vfio_amba_remove(struct amba_device *adev)
>  {
>  	struct vfio_platform_device *vdev =
>  		vfio_platform_remove_common(&adev->dev);
>  
>  	kfree(vdev->name);
>  	kfree(vdev);
> -	return 0;
>  }
>  
>  static const struct amba_id pl330_ids[] = {
> diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
> index b7682de412d8..33595cc4778e 100644
> --- a/drivers/video/fbdev/amba-clcd.c
> +++ b/drivers/video/fbdev/amba-clcd.c
> @@ -925,7 +925,7 @@ static int clcdfb_probe(struct amba_device *dev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int clcdfb_remove(struct amba_device *dev)
> +static void clcdfb_remove(struct amba_device *dev)
>  {
>  	struct clcd_fb *fb = amba_get_drvdata(dev);
>  
> @@ -942,8 +942,6 @@ static int clcdfb_remove(struct amba_device *dev)
>  	kfree(fb);
>  
>  	amba_release_regions(dev);
> -
> -	return 0;
>  }
>  
>  static const struct amba_id clcdfb_id_table[] = {
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 958dc32a708f..58a00e1ab23b 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -305,14 +305,12 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
>  	return ret;
>  }
>  
> -static int sp805_wdt_remove(struct amba_device *adev)
> +static void sp805_wdt_remove(struct amba_device *adev)
>  {
>  	struct sp805_wdt *wdt = amba_get_drvdata(adev);
>  
>  	watchdog_unregister_device(&wdt->wdd);
>  	watchdog_set_drvdata(&wdt->wdd, NULL);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused sp805_wdt_suspend(struct device *dev)
> diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
> index 0bbfd647f5c6..6cc93ab5b809 100644
> --- a/include/linux/amba/bus.h
> +++ b/include/linux/amba/bus.h
> @@ -76,7 +76,7 @@ struct amba_device {
>  struct amba_driver {
>  	struct device_driver	drv;
>  	int			(*probe)(struct amba_device *, const struct amba_id *);
> -	int			(*remove)(struct amba_device *);
> +	void			(*remove)(struct amba_device *);
>  	void			(*shutdown)(struct amba_device *);
>  	const struct amba_id	*id_table;
>  };
> diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
> index a0996c47e58f..b326a5f5f0d5 100644
> --- a/sound/arm/aaci.c
> +++ b/sound/arm/aaci.c
> @@ -1055,7 +1055,7 @@ static int aaci_probe(struct amba_device *dev,
>  	return ret;
>  }
>  
> -static int aaci_remove(struct amba_device *dev)
> +static void aaci_remove(struct amba_device *dev)
>  {
>  	struct snd_card *card = amba_get_drvdata(dev);
>  
> @@ -1066,8 +1066,6 @@ static int aaci_remove(struct amba_device *dev)
>  		snd_card_free(card);
>  		amba_release_regions(dev);
>  	}
> -
> -	return 0;
>  }
>  
>  static struct amba_id aaci_ids[] = {
> -- 
> 2.29.2
> 
