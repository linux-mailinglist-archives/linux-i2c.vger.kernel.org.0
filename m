Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C54305384
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Jan 2021 07:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhA0Gv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Jan 2021 01:51:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:41084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231916AbhA0GsF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Jan 2021 01:48:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB692072C;
        Wed, 27 Jan 2021 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611730042;
        bh=SMf/sTVmFizoaTCRhZKOzJIDd9pG2drSndbHjehSYHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eIxDYowELLXJdzjiGwaNPG2hkaUmupGzw2zEemwVvQomvLqzMvseCF/SkUiqZIduO
         Gvf8oKij0ja051ihFnNxn1vEEmr2V7Rezxly/hz1a2DfgLLDiHYVnu7ywJbmKoZ/1n
         jTjUvD1r6r/xOuNkE/io5HVCc6JZfMxpD46Zw0pDJW3S6qcXerAxfVIO9YzZfcx8BZ
         7abmVKMgGR50oOPfV4GFaWENi4Ss/oJanPtz4wNs5YcT6fz7mNssNUbap4x9DqDp7k
         94/V6xmo4VOiVFFF3CTluEAGGxMwLkYC3YD81tj+qqyC0M53/29Mjt0KM9D41YabCf
         I2bnFL90rxHIw==
Date:   Wed, 27 Jan 2021 07:47:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Message-ID: <20210127064715.GA981@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>,
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
        Guenter Roeck <linux@roeck-us.net>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, kvm@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 05:58:34PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> All amba drivers return 0 in their remove callback. Together with the
> driver core ignoring the return value anyhow, it doesn't make sense to
> return a value here.
>=20
> Change the remove prototype to return void, which makes it explicit that
> returning an error value doesn't work as expected. This simplifies changi=
ng
> the core remove callback to return void, too.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # for drivers/memory
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmARDG8ACgkQFA3kzBSg
KbZUgg/+MkBwxjwkME0XbCPEYMUsJ9F6QLP4gXXTqGleAgxMVqSLG5XG/rJgCfPv
BB3X116hBgVOZZBTz+uWxpOSy90WrhLh3HrOb/SGB6hmKn/a0fYdB2/YXhVOXKyN
OlhKbYBl0Ev0PM+m8xV4sr0sQYOn1wOs0NMHoMvmK+TlnCX1GDxHBVuElpNWo8Wj
/nFLnpq9eUGt+i4eAsKoTj/1l8Ak4cOihHe2cRWxVUC3NDRTJBL9HgZwD38wVl5v
u/iwGQG5Zram49KLbGoBFpd60hrifA1X3Cwx2qhwZ+cm/ks3n+NwIQPvpoRyJ8Ny
gK5+QKowfQvOtSP8PFC1QE/u+oLVpYJ4rVT3DmXddPj89l3Peo17VAS08AoPk3hO
McIAFelbN1FmcjCpZ0ELpjCo/G6S1pKx9uAtFLbbMf80CoREU5ucCPzzWbf9unQv
5xhIdK1xkszSC1kGjHABw1zBy/ZAEoy+x3yktPjX2nU1L8Ni/vKjR6+w27G7pspU
WZwk2lkCFEnt8gFnRI4MFhjGagpiyiEfq0QeD1O452zgZimiPvfKjMLnWArfWzF0
25EngNXoizDEZMYZX46drnzfUfIDKBVkCbj1CWcQLFivpp4pj7+7n4D5lJlgwNvE
kqhQNlLLFbibwI0LNt/LqCbC/SggaYOUfYQ8XefoTe0Z6dH/+J0=
=FyXm
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
