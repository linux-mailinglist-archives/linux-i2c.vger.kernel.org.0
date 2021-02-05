Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520EA311494
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhBEWIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:44342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232881AbhBEOwM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 09:52:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36E5C64FC9;
        Fri,  5 Feb 2021 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612533851;
        bh=T1jLO24sF0pYkT3lQr2onlwV1fj0AbfnrcXXdUAochg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZOBBDws+/yhmPTxNLP4zonarclKLQMtK4MPPXtDYExmUzHRLjxXcJnfGq14VQa4L
         yZhVB9oNHiU0DzaVx6si8j0aXHMHTj1MM3VS8xDsEeLmU5/b+5mHQBkgW7cT1CQKhX
         bLMDr8tZSM1SipNLwaZFpx+i2Ki4uOTJ99+ziw0o=
Date:   Fri, 5 Feb 2021 15:04:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jaroslav Kysela <perex@perex.cz>,
        Eric Anholt <eric@anholt.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig.org@pengutronix.de>, linux-i2c@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Takashi Iwai <tiwai@suse.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mike Leach <mike.leach@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        alsa-devel@alsa-project.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
        Eric Auger <eric.auger@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Subject: Re: [PATCH] coresight: etm4x: Fix merge resolution for amba rework
Message-ID: <YB1QWFWPennQZmjw@kroah.com>
References: <20210205130848.20009-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210205130848.20009-1-uwe@kleine-koenig.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 05, 2021 at 02:08:47PM +0100, Uwe Kleine-König wrote:
> This was non-trivial to get right because commits
> c23bc382ef0e ("coresight: etm4x: Refactor probing routine") and
> 5214b563588e ("coresight: etm4x: Add support for sysreg only devices")
> changed the code flow considerably. With this change the driver can be
> built again.
> 
> Fixes: 0573d3fa4864 ("Merge branch 'devel-stable' of git://git.armlinux.org.uk/~rmk/linux-arm into char-misc-next")
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Now queued up, thanks!

greg k-h
