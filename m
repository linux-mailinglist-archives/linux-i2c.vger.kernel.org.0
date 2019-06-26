Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 641CE56A23
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfFZNQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:16:13 -0400
Received: from sauhun.de ([88.99.104.3]:55978 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZNQN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:16:13 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id D42872C0114;
        Wed, 26 Jun 2019 15:16:11 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:16:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Subject: Re: [PATCH v2 1/2] i2c: bcm2835: Move IRQ request after clock code
 in probe
Message-ID: <20190626131611.GD801@ninjato>
References: <20190621105250.19858-1-nh6z@nh6z.net>
 <20190621105250.19858-2-nh6z@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
In-Reply-To: <20190621105250.19858-2-nh6z@nh6z.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 03:52:49AM -0700, Annaliese McDermond wrote:
> If any of the clock code in the probe fails and returns, the IRQ
> will not be freed.  Moving the IRQ request to last allows it to
> be freed on any errors further up in the probe function.  devm_
> calls can apparently not be used because there are some potential
> race conditions that will arise.
>=20
> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
>=20
> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>

Applied to for-next, thanks!


--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TcBsACgkQFA3kzBSg
KbaeQhAAlH5Fv73WNS3Hs724iNcA4HCx+cCQ3SQCuU5Z/VnDG3exwNTaiwW6RsmV
AqMSZyO5B6Pm0Umt5MwzdI9H4dJ2Nf+3HEvUEvqc3fAMbxPguMhf7DhXH29DX89S
5ophbbmY6rD/7WCpjvJPFGvgTXgPpKkt9soqI/DJPfnH/Mpf+7uXMwsJk4jjzTIF
po7L4uxY5fH7+swxzUN+YzpSZ8Ao+Cb99ewXfM53gsuzWQEgZnlGREsTpSyt891f
DKy9SDZ5XVyDl3c+P8UOmpC/PrHc7fTp3szyuW9/GnrcpNh+3edmSSg6d0GoBJ5+
0KK9efwCE/2HRcGNJIUIuI2xgjWnnkd0QZavB1D9MDe16XS5K4m62zUZEbP78BXU
DQPUHgZKa31ZamIRDT6qaJR+e6voPhEsV5hJMwCuKi48LzxM+Sf67C5uYzaf/ive
9PSgOUMZwEliQ7CDW+7+7SlB5KWcTHjRZgz9mbtZ7hP9auFGdtR54Hxi4P4Y6gie
HIiwoRsMHi8AyynqZh4jfCXeJHEevkYdvxEDJND2byqm/BtD2iEOmQNdtbKeTiFq
6ajSpPdf0PBNMY8BarAKuPg4I/HIKtxm4Co8jI+OJ+FwziBE2mTmTZtC6MU8GhrK
BBJogbQMrTmA61902d1JpACGuplHEZ35eD3nAKRG5A0i3CrUGMU=
=8z//
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
