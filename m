Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2822930F8C8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Feb 2021 17:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238173AbhBDQ5i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Feb 2021 11:57:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:53616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237780AbhBDQ5e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Feb 2021 11:57:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3066164F47;
        Thu,  4 Feb 2021 16:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612457813;
        bh=05Tu6gC1988yql3jwqZ8bSalZpjvaviDpH2tuIfYvRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V/2phKRBrdShTJynlnGGMW3l9x/SW1hWhKF8xex4OBeo3mDEeK0o2kKM2vS0bAe4F
         Wdi0g4ASLrOIJhcENuzivXIyn+HAG/m8sXtb1YJRFkCDu6LHLMMfsvATC2CS2VT9DI
         IeA8zLWPa9FQgRD8cqb7Rt1bnqdVVBXlJNczgsbo=
Date:   Thu, 4 Feb 2021 17:56:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
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
Message-ID: <YBwnUrQqlAz2LDPI@kroah.com>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
 <YBlcTXlxemmC2lgr@kroah.com>
 <20210204165224.GA1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204165224.GA1463@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 04, 2021 at 04:52:24PM +0000, Russell King - ARM Linux admin wrote:
> On Tue, Feb 02, 2021 at 03:06:05PM +0100, Greg Kroah-Hartman wrote:
> > I'm glad to take this through my char/misc tree, as that's where the
> > other coresight changes flow through.  So if no one else objects, I will
> > do so...
> 
> Greg, did you end up pulling this after all? If not, Uwe produced a v2.
> I haven't merged v2 yet as I don't know what you've done.

I thought you merged this?

Did you take v1?

I am totally lost here...

thanks,

greg k-h
