Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFE73B28F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 11:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388100AbfFJJxv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 05:53:51 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55889 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387974AbfFJJxv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 05:53:51 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id DEF528027F; Mon, 10 Jun 2019 11:53:38 +0200 (CEST)
Date:   Mon, 10 Jun 2019 11:53:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] leds: is31fl319x: simplify getting the adapter of a
 client
Message-ID: <20190610095348.GA29684@amd>
References: <20190610095157.11814-1-wsa+renesas@sang-engineering.com>
 <20190610095157.11814-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20190610095157.11814-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-06-10 11:51:55, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
>=20
> Reported-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Please apply to your subsystem tree.

Acked-by: Pavel Machek <pavel@ucw.cz>

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz+KKwACgkQMOfwapXb+vLTDACeLh3LBPe0OtMmh6/d9lcEm/L1
IK8AnArpxLmha0PgB5wvKjGRD1A7eL7P
=b2/m
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
