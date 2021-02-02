Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB2B30C152
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 15:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhBBOUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 09:20:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:51458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231624AbhBBORv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Feb 2021 09:17:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2821F64DD5;
        Tue,  2 Feb 2021 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612274769;
        bh=ucOE/Mmv9i2CWEnQ7wz77HidV63/GBxg2zd12rEmpdc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mtk8Q3WRW8e4rAGIMqVSBpBvOYwFo0HFhgAeLGXuNjXjEG35zPmakj7dmP3Hp3Xxb
         nLQvz66M8T/SeJkpoklGcHv/kplvfAQlGnleUXc+nPaJbcAYzR2bE146XmrkoL8bC8
         WACPjj7XeQXWdVU5Y4Gh/La16odwgfVrinCkNWdA=
Date:   Tue, 2 Feb 2021 15:06:05 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux+pull@armlinux.org.uk>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
        alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-input@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
        linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
        kernel@pengutronix.de, Leo Yan <leo.yan@linaro.org>,
        dmaengine@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        Jiri Slaby <jirislaby@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <YBlcTXlxemmC2lgr@kroah.com>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 02, 2021 at 02:53:50PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> the following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-void
> 
> for you to fetch changes up to f170b59fedd733b92f58c4d7c8357fbf7601d623:
> 
>   amba: Make use of bus_type functions (2021-02-02 14:26:02 +0100)
> 
> I expect this tag to be merged by Russell King as amba maintainer and by
> Mathieu Poirier (or Greg Kroah-Hartman?) for coresight as there are some
> pending conflicting changes. These are not hard to resolve but also
> non-trivial. Tell me if you need assistance for resolving, also if it's only a
> second pair of eyes to judge your resolution.
> 
> Best regards,
> Uwe
> 
> ----------------------------------------------------------------
> Tag for adaptions to struct amba_driver::remove changing prototype
> 
> ----------------------------------------------------------------
> Uwe Kleine-König (5):
>       amba: Fix resource leak for drivers without .remove
>       amba: reorder functions
>       vfio: platform: simplify device removal
>       amba: Make the remove callback return void
>       amba: Make use of bus_type functions
> 
>  drivers/amba/bus.c                                 | 234 +++++++++++++++++++++++++++++++++------------------------------
>  drivers/char/hw_random/nomadik-rng.c               |   3 +-
>  drivers/dma/pl330.c                                |   3 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                  |   4 +-
>  drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |   4 +-
>  drivers/hwtracing/coresight/coresight-cti-core.c   |   4 +-
>  drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
>  drivers/hwtracing/coresight/coresight-etm3x-core.c |   4 +-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c |   4 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
>  drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |   4 +-
>  drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
>  drivers/i2c/busses/i2c-nomadik.c                   |   4 +-
>  drivers/input/serio/ambakmi.c                      |   3 +-
>  drivers/memory/pl172.c                             |   4 +-
>  drivers/memory/pl353-smc.c                         |   4 +-
>  drivers/mmc/host/mmci.c                            |   4 +-
>  drivers/rtc/rtc-pl030.c                            |   4 +-
>  drivers/rtc/rtc-pl031.c                            |   4 +-
>  drivers/spi/spi-pl022.c                            |   5 +-
>  drivers/tty/serial/amba-pl010.c                    |   4 +-
>  drivers/tty/serial/amba-pl011.c                    |   3 +-
>  drivers/vfio/platform/vfio_amba.c                  |  15 ++--
>  drivers/video/fbdev/amba-clcd.c                    |   4 +-
>  drivers/watchdog/sp805_wdt.c                       |   4 +-
>  include/linux/amba/bus.h                           |   2 +-
>  sound/arm/aaci.c                                   |   4 +-
>  30 files changed, 157 insertions(+), 198 deletions(-)
> 
> 


I'm glad to take this through my char/misc tree, as that's where the
other coresight changes flow through.  So if no one else objects, I will
do so...

thanks,

greg k-h
