Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B056F5AA52
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 13:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfF2LEa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 07:04:30 -0400
Received: from sauhun.de ([88.99.104.3]:60766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfF2LEa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 07:04:30 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id C2EB63E43C6;
        Sat, 29 Jun 2019 13:04:28 +0200 (CEST)
Date:   Sat, 29 Jun 2019 13:04:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.3
Message-ID: <20190629110428.GB1685@kunai>
References: <20190627143708.10135-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20190627143708.10135-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2019 at 04:37:08PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Hi Wolfram,
>=20
> please pull the following set of updates for at24 for the v5.3 merge wind=
ow.
>=20
> Best regards,
> Bartosz Golaszewski
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
v5.3-updates-for-wolfram
>=20
> for you to fetch changes up to dce91ba39c765b2b90d07c717683abcdd9891592:
>=20
>   eeprom: at24: modify a comment referring to platform data (2019-06-27 1=
5:55:08 +0200)
>=20

Applied to for-next, thanks!


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XRbwACgkQFA3kzBSg
KbbcGRAAlZxwYQ4zscmv/tExQkF4D4RXmSHcwFHDB6VQFbW7v8Hilk5vIHBjGlH8
GkfadMKHiFdTfiTgOs/xdr0e7QfZd9EZPHb2Lpg5q/CwF/tZmTbqiSaVw/toy42K
eDS0wAW0uZ4Z3PsnaAzJJMdqoV1SoVBxuVD9283drzyx1bvgvs6K3/sfK0TWfaNM
BbrAMjiaamDc9q+g2o3pJyr9ew3hTqngsOL/uXpY6l0Xn6TGU9+Hn7yGXxG12E8r
fidkGCg2ar0nTNMdR8vY7DoBn8bue1an/2BqzsvACwTih3s79ieaHAyZnQz81b6k
67rQCgQLtgtgUo60Om/k+uh28XRc+0VmEWq9ITPmcndFNE/hPTBQIf5ahgE+rLWQ
Z3CBSzQzNLzj1anMGIIAf3beM9vfpRGlmheU7vc5nFk82Szhq9wVjkfuagOGyk2H
Akt7xl/Wesc/xzownE3Endr3R7XRyBuZm4p1eCeh0gqLOH1UENL8ZsDDdpbuDXjL
EMNI6Bs6FAlcqyAGfM4Ib7G9dqqtRyYzWesLKhbf9qfpY7r6TxrOMFHAU1C8AGwq
XPiF39PjcI6/52xDVD/rRunm/OTtBKji3tTYGxhjj3jtNQGnnhZIWpZyG5kMTGL9
iT7EysJUQOIjd4+B2KDhOmospHhaPjYCy2WJ0pb3atKm153zFZ8=
=wxXS
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
