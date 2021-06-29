Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7F73B718A
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 13:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhF2LvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 07:51:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:34830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232724AbhF2LvN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 07:51:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26DCC61D23;
        Tue, 29 Jun 2021 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624967325;
        bh=F6+8DEUDRgQ8px260MOF5Gzv5rBY1SIRaS88R6jEyCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LCXjf4H4yOk3q0HSRv8xYxAJ8h+XsBRnVpk02td2SDmGlWumHfSKgIlEMJJEesszS
         6TXXXLCg3JC4JqDWuGU7wJowpo7SRhsti+9hPg7m7wTe7Vn/UXCYqBuuPorZZ6hbAr
         uf7iIXxygV+yutRXUK6lhfLYE+slbPT4lUUID9Au1SjhMzGr4sH//CqFvZIL6+48TZ
         FuFdaMtJj+isc72q2cRazFvgdAqYvVZAkGKnr4cEGWlBTngWlOgvYCuKq8MJFtOzKY
         kxFCjkkGEgqM2rt6dgd9tt+De/0G/GWIubkm9FqoDx1KJim1ZX5pxdLZ8ZL8wgTRXD
         6ZfmqEztXtgUQ==
Date:   Tue, 29 Jun 2021 13:48:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNsImlDN19zXRDO1@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
        loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
 <20210629105649.nt63mxtiy6u7de3g@vireshk-i7>
 <YNr/2E/T4FRjLOgy@ninjato>
 <20210629111630.badum3mtumcujbyk@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2NUNxijQCUO6OTHP"
Content-Disposition: inline
In-Reply-To: <20210629111630.badum3mtumcujbyk@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2NUNxijQCUO6OTHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Obviously, I don't know much about the specs and their wording. Still I
> > wonder if we can't call it a zero length transfer?
>=20
> Maybe that.

I'd prefer it.

> > This is allowed by
> > the I2C standard and SMBus has even a proper name for it (SMBUS_QUICK).
> > From my point of view, I would not say it is device specific because
> > devices are expected to ACK such a message.
>=20
> Actually we should skip the last line from my diff, i.e. completely
> drop "and result for such a request is I2C device specific".

Sounds good.

> The device (host in virtio spec terminology) still needs to return
> success/failure as it does for other requests. Nothing special here.

Ack.


--2NUNxijQCUO6OTHP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDbCJYACgkQFA3kzBSg
KbbW8BAAsq+m8PYVjLol2Bl88/uwq+wQriAFwSj35UISp/uiVClJAokC9pPHqdwB
JFehttLuSQk7F7znOXvNMauGFiCqbNO2fwfEhqHSBPCcm6kouj0LscE9GxvYYCf4
7LC9WmA2DWJlkTcutZqdhWnUSekihMCpoPBVMG4VoQmKuFaucbRBWA/hlGSYEn/j
LXwJkNSvoTDScYUtHiX5CzQCq4m7ejCJ9ytsxvfu6gFpCO7UYwpvAqXr9RaulJns
7dg6JkNQX0Mpzwnn0uRcHW08KP7c//LDJH0V4kwZMZI8KSpgiRIfqlZJdSHDInRt
CTZLMu0Lk/q/Nr49SteaXy40KH/emyqkSQVt36xPcXeyTZcKLuuMX02hl+aviwuG
jBn1xIFaQuxBfGkFqfeZ3l/F91xzc902YyeXYVFZi98znVKttMZMY2z2lKMrwSQf
YfAPWfLVtYv/FHYoMwOiOq7CIlzVknk2Tu5a1WtUcjbEXHED/OrU7wN8tr1ymTXz
OxKFd1DjwX+iPVmBULxaU//JkkN0loKc2bE8pRWR59TpT84vkg0DvdHr2D4wAVLM
jr5qZ1J1sknWq22ILbrcLw80LOizpOFoFE5+Pelz9DDyKG7p/qJ7geXJxWPXaExR
osMWrF9lQ3EcUZ7Y58fLjViMxrdOemVzaxCnzgy6Wj4zfjqjIlI=
=tZM2
-----END PGP SIGNATURE-----

--2NUNxijQCUO6OTHP--
