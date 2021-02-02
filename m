Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E10F30CBBB
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 20:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhBBTdo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 14:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbhBBN5I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 08:57:08 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1D3C0613D6
        for <linux-i2c@vger.kernel.org>; Tue,  2 Feb 2021 05:56:27 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l6w82-0000fW-TE; Tue, 02 Feb 2021 14:54:02 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l6w7u-0006bW-5D; Tue, 02 Feb 2021 14:53:54 +0100
Date:   Tue, 2 Feb 2021 14:53:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux+pull@armlinux.org.uk>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
        alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
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
Subject: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ofqcafd7fzy3m7fk"
Content-Disposition: inline
In-Reply-To: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ofqcafd7fzy3m7fk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-void

for you to fetch changes up to f170b59fedd733b92f58c4d7c8357fbf7601d623:

  amba: Make use of bus_type functions (2021-02-02 14:26:02 +0100)

I expect this tag to be merged by Russell King as amba maintainer and by
Mathieu Poirier (or Greg Kroah-Hartman?) for coresight as there are some
pending conflicting changes. These are not hard to resolve but also
non-trivial. Tell me if you need assistance for resolving, also if it's onl=
y a
second pair of eyes to judge your resolution.

Best regards,
Uwe

----------------------------------------------------------------
Tag for adaptions to struct amba_driver::remove changing prototype

----------------------------------------------------------------
Uwe Kleine-K=F6nig (5):
      amba: Fix resource leak for drivers without .remove
      amba: reorder functions
      vfio: platform: simplify device removal
      amba: Make the remove callback return void
      amba: Make use of bus_type functions

 drivers/amba/bus.c                                 | 234 +++++++++++++++++=
++++++++++++++++------------------------------
 drivers/char/hw_random/nomadik-rng.c               |   3 +-
 drivers/dma/pl330.c                                |   3 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   4 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |   4 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |   4 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   4 +-
 drivers/input/serio/ambakmi.c                      |   3 +-
 drivers/memory/pl172.c                             |   4 +-
 drivers/memory/pl353-smc.c                         |   4 +-
 drivers/mmc/host/mmci.c                            |   4 +-
 drivers/rtc/rtc-pl030.c                            |   4 +-
 drivers/rtc/rtc-pl031.c                            |   4 +-
 drivers/spi/spi-pl022.c                            |   5 +-
 drivers/tty/serial/amba-pl010.c                    |   4 +-
 drivers/tty/serial/amba-pl011.c                    |   3 +-
 drivers/vfio/platform/vfio_amba.c                  |  15 ++--
 drivers/video/fbdev/amba-clcd.c                    |   4 +-
 drivers/watchdog/sp805_wdt.c                       |   4 +-
 include/linux/amba/bus.h                           |   2 +-
 sound/arm/aaci.c                                   |   4 +-
 30 files changed, 157 insertions(+), 198 deletions(-)



--ofqcafd7fzy3m7fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAZWWsACgkQwfwUeK3K
7AnMhQgAhyeAx45pa3ebR9ymvzFG1Knp32GwFPlyLYw03yZzLsNR5n+d0kvDNZ1l
vNIrU0g5WSS1SUWhs+m3WDRIcTlCHcgc3yoCKltLSNWiPXie9G9BZ0815b0gomXY
eBSKiHZg/Ie8WhIspQcl0IA0P/2nOmTXF8qJx3CFow5WowriUutdf7n1ycTDq86a
18Xpf2lW+esLut8MHM/98aHJUl6Jkj5PYfQfjgORIXKwNmNDltuK6lwvUU+pw+Vr
0bDYXdXlaKLkNtSYYHSbDrKALiQccxhXYPg404KZV3FIHpOxKlq6im8hsFHWOOlu
n9j2wq/tpGso23vYKdErmsE3GDncuQ==
=P/zp
-----END PGP SIGNATURE-----

--ofqcafd7fzy3m7fk--
