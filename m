Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5152304C3F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jan 2021 23:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbhAZWhm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jan 2021 17:37:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:37158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388864AbhAZRbZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 Jan 2021 12:31:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D541121919;
        Tue, 26 Jan 2021 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611682245;
        bh=p9tGPF9ccd/d++aM4n9LyAfYAIV1RaM4Dz9iiSI4D3c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=upI/kMhl7eE4+5uUph8S2tnMemQz5UbOopsKlNTDclqyTUBBILQcZKMXkwORHX8Yq
         cJWujimFLxD3PUXP3Q6R5vs2zcoQMtooqvBAs2SfrBJr86tAjNEuPYdfB5MvusQjhA
         rfnXzeJTXEVfQT42qqoxlu/1tgXRz2T+JTiZP73bnjiQwVao3xvBwc5M7G4UXf469U
         VF6liyETyFxIuLw+hAqs6DjITpSX4hILsnFHO/EYiFxk0F2hgX4ucJit2xkGTa6SJ/
         LEzImN7uvO2sCqNSCL4qH0V6E+R6lLaPerEq4KlBRAb7BizMVwvcu+25e7achCvt2Z
         DlVP64TyyHfRA==
Date:   Tue, 26 Jan 2021 23:00:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
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
        Guenter Roeck <linux@roeck-us.net>,
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
Message-ID: <20210126173040.GY2771@vkoul-mobl>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26-01-21, 17:58, Uwe Kleine-König wrote:
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
> ---
>  drivers/amba/bus.c                                 | 5 ++---
>  drivers/char/hw_random/nomadik-rng.c               | 3 +--
>  drivers/dma/pl330.c                                | 3 +--

For dmaengine:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
