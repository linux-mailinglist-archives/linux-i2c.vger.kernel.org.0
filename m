Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEFC1A9D91
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409203AbgDOLpl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:45:41 -0400
Received: from sauhun.de ([88.99.104.3]:53290 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409185AbgDOLpi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:45:38 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id AFE072C1FF1;
        Wed, 15 Apr 2020 13:45:36 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:45:36 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra I2C synchronization correction
Message-ID: <20200415114536.GB910@ninjato>
References: <20200324191217.1829-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20200324191217.1829-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:12:15PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> Recently I found a way to reliably reproduce I2C timeouts that happen due
> to improper synchronizations made by the I2C driver. It's quite easy to
> reproduce the problem when memory is running on a lower freq + there is
> some memory activity + CPU could get busy for a significant time. This
> is the case when KASAN is enabled and CPU is busy while accessing FS via
> NFS. This small series addresses the found problems.
>=20
> Changelog:
>=20
> v2: - The "Better handle case where CPU0 is busy for a long time" patch
>       now preserves the old behavior where completion is checked after
>       disabling the interrupt, preventing potential race-condition of
>       the completion awaiting vs interrupt syncing.
>=20
> Dmitry Osipenko (2):
>   i2c: tegra: Better handle case where CPU0 is busy for a long time
>   i2c: tegra: Synchronize DMA before termination

Patches look good to me. I tend to apply them to for-current instead of
for-next because they are fixing issues. Even a stable tag?


--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W8+AACgkQFA3kzBSg
KbbVLBAApD7mx+QXfeiebrOtz1sVemHBiPDyiGMu++48UzBSAWD9V6/01TcHK6wm
ovJ5euQmL554Drn2nONQReDLuNLvrIG+5zqkGBFHEzpO/o+fad1bTc9daw6WJLja
Pa97wqs5lYZMR9bZxDS5Dm437+7hzHmBEQWJkSRfsHh87l48jzG2ymuN8pJ1bMWB
+n2aXocb8P7LeD1GT3M1rn/2NOFtCwE194RCBsF8Z/fN0FuesRcDmRcZt6Dmd/cZ
3x1Ppuv3v5T4cFrRAXb6ySV9Lbr1EC3yCWtmnXGYs98OiaJ6p8qKL3w+gwNIFKWF
K4lEh/7bMBWeq/CSMX+a4PJBSXsdNHtxClHZOrrAXzxVGVytVKmt/aKbyAV5jHyL
+PKZqbC9LJ1DfAc/CFBNxMfJyj34nYwHbX7tROQK7/3RlO/8nNhBYiabf1ja9f7A
SBrsxuh3wWoVnj1GylB23IrErugxi7ef1szTNGJaGbsTU6xLwmz8eBtOP6lRU/B2
G441mFDbymv+cEBKn+BcB9ejMELSma/vJq97zcMSln/z5CuflX7UazIGKygyyu/d
muJWz3QlakJMwoVlNCgVd9ieAxdC1wudbo0tMj1K2qS/9nYLQmgfPEZe7c00bYb0
UxYu/e6vrHC7LZ80HliOQZ9N1RI9BL0qbIUEXW5cpCVjxIWfZfk=
=ah7+
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
