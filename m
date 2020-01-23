Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A46146696
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 12:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbgAWLTa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 06:19:30 -0500
Received: from sauhun.de ([88.99.104.3]:52288 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729240AbgAWLT3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 06:19:29 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id 6D73C2C00DA;
        Thu, 23 Jan 2020 12:19:27 +0100 (CET)
Date:   Thu, 23 Jan 2020 12:19:27 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200123111927.GH1105@ninjato>
References: <20191213134417.222720-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline
In-Reply-To: <20191213134417.222720-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 02:44:17PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Depending on the board design, the I2C controllers found on Tegra SoCs
> may require pinmuxing in order to function. This is done as part of the
> driver's runtime suspend/resume operations. However, the PM core does
> not allow devices to go into runtime suspend during system sleep to
> avoid potential races with the suspend/resume of their parents.
>=20
> As a result of this, when Tegra SoCs resume from system suspend, their
> I2C controllers may have lost the pinmux state in hardware, whereas the
> pinctrl subsystem is not aware of this. To fix this, make sure that if
> the I2C controller is not runtime suspended, the runtime suspend code is
> still executed in order to disable the module clock (which we don't need
> to be enabled during sleep) and set the pinmux to the idle state.
>=20
> Conversely, make sure that the I2C controller is properly resumed when
> waking up from sleep so that pinmux settings are properly restored.
>=20
> This fixes a bug seen with DDC transactions to an HDMI monitor timing
> out when resuming from system suspend.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Do we still need this after I applied "[PATCH v5 0/8] NVIDIA Tegra I2C
driver fixes and improvements" ?


--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pgT4ACgkQFA3kzBSg
KbYorg//bjTFQloGcIUrKE3jkos9WC0qW9VoPPS2vVkoEIrwXvIVy7IvNjzYaPTy
ES56UjWsK4/FjZrcrluprZ4GdrwApmSKLzmfXHrY6Z4TTxBQQRg01G6eN4iNMasP
PX/sbometIjhCYepFZytajnqQxa7MP8MsCitE/dwTkEEE66DbsXmvOeuNSywtuvV
M/nmgDGd3Lbg7RgjoJjQNs0QmFF0eIOeA18o1K9k46n8mzlEl0QaOf5D9k5NnnHL
RSw0Hxek6ZQKf8/g29JUgB5uNmUg7lPz0F1/xpgXmXTRO53Murq/QAmWJmoy9nwf
bkCSdIAQjZMEI69B984Mz8t84NnYTLLFDLFU+Xw6CrAqVp07jjy2vu+iQLO6zjXj
73AX40xGJcMps61Zp1oN5R0suS9Ly2DbBH99WKZOi4oVKQXdivl5qROrODn/rgpS
AZy6khg6TmWeSJuWN9PEdUqbRRld/WoX1N6SzydG4b2PXyFHauEfdEa2XLcGSuTj
yhIbH4KBfLtBU6gyincrK/xsZJqzLSsY2NNfWzVDVhZLpgKqM9DRb599BPc4rGpO
KApFZs1aIs25VHsrTdgCFgyg9mTvqMTUABIBJQiU+HXeVNGRsNU3vHTXvNtwNFLT
8XzZd7Bs0lfdZY3TMm8Sg9j3t6E3JbtClgINmGHePt71lKXXGLE=
=AblB
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
