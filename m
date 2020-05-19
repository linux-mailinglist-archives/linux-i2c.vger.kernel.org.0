Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02A11D9033
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 08:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgESGkj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 02:40:39 -0400
Received: from sauhun.de ([88.99.104.3]:50524 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbgESGki (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 02:40:38 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id C09252C1FA8;
        Tue, 19 May 2020 08:40:36 +0200 (CEST)
Date:   Tue, 19 May 2020 08:40:36 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c for v5.8
Message-ID: <20200519064036.GA1094@ninjato>
References: <20200519063609.GA2141@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20200519063609.GA2141@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 08:36:13AM +0200, Wolfram Sang wrote:
> Linus,
>=20
> here is the pull request which I missed last week. It contains a set of
> driver and core fixes as well as MAINTAINER updates.

Sorry, kernel version in $subject should have been v5.7!

>=20
> Please pull.
>=20
> Thanks,
>=20
>    Wolfram
>=20
>=20
> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314=
fd:
>=20
>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-cur=
rent-fixed
>=20
> for you to fetch changes up to efa7fb4c6c8e4171fd29a5935a9dc7a28e363278:
>=20
>   MAINTAINERS: add maintainer for mediatek i2c controller driver (2020-05=
-15 11:40:54 +0200)
>=20
> ----------------------------------------------------------------
> Alain Volmat (1):
>       i2c: fix missing pm_runtime_put_sync in i2c_device_probe
>=20
> Atsushi Nemoto (1):
>       i2c: altera: Fix race between xfer_msg and isr thread
>=20
> Christophe JAILLET (1):
>       i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_p=
inctrl_probe()'
>=20
> Codrin Ciubotariu (1):
>       i2c: at91: Fix pinmux after devm_gpiod_get() for bus recovery
>=20
> Gustavo A. R. Silva (1):
>       i2c: mux: Replace zero-length array with flexible-array
>=20
> Qii Wang (1):
>       MAINTAINERS: add maintainer for mediatek i2c controller driver
>=20
> Wolfram Sang (2):
>       i2c: use my kernel.org address from now on
>       i2c: algo-pca: update contact email
>=20
>  .mailmap                              |  2 ++
>  MAINTAINERS                           |  9 ++++++++-
>  drivers/i2c/algos/i2c-algo-pca.c      |  2 +-
>  drivers/i2c/busses/i2c-altera.c       | 10 +++++++++-
>  drivers/i2c/busses/i2c-at91-master.c  | 20 +++++++++++++++++---
>  drivers/i2c/i2c-core-base.c           | 24 +++++++++++++++++-------
>  drivers/i2c/i2c-core-of.c             |  2 +-
>  drivers/i2c/muxes/i2c-demux-pinctrl.c |  1 +
>  include/linux/i2c-mux.h               |  2 +-
>  include/linux/i2c.h                   |  2 +-
>  10 files changed, 58 insertions(+), 16 deletions(-)



--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Df2MACgkQFA3kzBSg
Kbargg/+ODFcw24lJoiRjjCzZSTeFGfWpxr8lCBLwWNM/M+X8mUYNXV9Udd1AbjD
L70RCG9zsFkLsWqdMjYy8RHp+T0FmEllC0j0eqeheuDxCIo3meuaE0Axdv1psfK4
j7ZcLhq+leJE5VCpGb61wzyfXGq3gc7hZ6Q9q6u45CIA4g2NktEO7SjzT00gYutp
iVE2lB61YoQTxjhcAjzF60gh9rJyPF0rse6E359I0A2pDuQzwHurEOSalObxrVDg
4EnIHVJ9Q7jZo4rqPIhOsBXXqr2ZNcULdudYWYxGkXzDZODq1+BF8yaJwT41rds2
ow4xFUG1UI1LgTGRRdp1CWBUkm1yxPseN1xZ2yTWI+qWUWUNy/ebynM7KFY2GoHJ
Qh2XCtZLc4jqjJ2r6e6vl42HmsjQqb44ayAw0RuXV2z7wIMTUVypZWpB1o6p8D67
ae/7vQ37SuNeJS46bRsa6O66C9xvW6708xuPTVKNtdqPu2TETuycxeb7Z6wuKnpK
4PMf3xl0/FvoU9SQ7jTOg8Bsbk9juIJWStFurYGdocjYZ4l3Os7zJnHfTip88nWV
qcsIfAN5BcMUS25osZgwfLuf8FZHVudm4flOn+gnHjAiYTBbVO/BG6wZybjz8FjA
Gvi52IgMdVVicFYvvJz3PLwm7cZgZyV9HIlDGeTvjgEI9EY4sAM=
=sFEm
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
