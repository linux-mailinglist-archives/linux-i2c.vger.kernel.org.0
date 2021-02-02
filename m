Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAAB30BC65
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 11:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhBBKvk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 05:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBBKvj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 05:51:39 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DB0C061573;
        Tue,  2 Feb 2021 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QUFoL1M4pevTeMyLwnDogHEMlQrHMZssskb6wG1LFcA=; b=wg2o6QP/gHbhqBuIhn1RZoUGj
        2iHotGU7ufXkLAWPw4UwYFPNHzUu8ddsLF6ZH7DAZK9ibPxZPao37pY3QUiSj2kNvPg18QoU3RIbp
        SB9YdTsgzRp09KPTWE899TVtBN6b7+9uCVpM084z3RB+393ttTKlzy9IbXmuACxRaE7AQP1axErmx
        9bdLyqL5Tzp+2AR1s8H8Ra8HKPn+VaEgvK7MKLCh/WvBYIcLxWRrMqhYn6+wAR7lOhqYiExSBYnla
        2ZSGKUuSlOCD0mvUg9A5mz9A1bzzWPt0jeQ/XhpyrV3IGp6JHZ9fsbmIMsvJ8Mev9a6w8QLTZD9/a
        CRpSMItzA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38176)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1l6tFN-0004FH-LS; Tue, 02 Feb 2021 10:49:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1l6tFE-0002yZ-0J; Tue, 02 Feb 2021 10:49:16 +0000
Date:   Tue, 2 Feb 2021 10:49:15 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Matt Mackall <mpm@selenic.com>,
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
        Guenter Roeck <linux@roeck-us.net>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig.org@pengutronix.de>,
        Mike Leach <mike.leach@linaro.org>,
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
Subject: Re: [PATCH v3 0/5] amba: minor fix and various cleanups
Message-ID: <20210202104915.GK1463@shell.armlinux.org.uk>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 26, 2021 at 05:58:30PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig.org@pengutronix.de
> 
> Hello,
> 
> Changes since v2 sent with Message-Id:
> 20201124133139.3072124-1-uwe@kleine-koenig.org:
> 
>  - Rebase to v5.11-rc1 (which resulted in a few conflicts in
>    drivers/hwtracing).
>  - Add various Acks.
>  - Send to more maintainers directly (which I think is one of the
>    reasons why there are so few Acks).
> 
> For my taste patch 4 needs some more acks (drivers/char/hw_random,
> drivers/dma, drivers/gpu/drm/pl111, drivers/i2c, drivers/mmc,
> drivers/vfio, drivers/watchdog and sound/arm have no maintainer feedback
> yet).
> 
> My suggestion is to let this series go in via Russell King (who cares
> for amba). Once enough Acks are there I can also provide a tag for
> merging into different trees. Just tell me if you prefer this solution.
> 
> Would be great if this could make it for v5.12, but I'm aware it's
> already late in the v5.11 cycle so it might have to wait for v5.13.

I think you need to have a 6th patch which moves the
probe/remove/shutdown methods into the bus_type - if you're setting
them for every struct device_driver, then there's no point doing that
and they may as well be in the bus_type.

Apart from that, it looks good.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
