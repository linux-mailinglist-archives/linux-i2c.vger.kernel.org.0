Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245A02CC171
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgLBP5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:57:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:38698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgLBP5p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:57:45 -0500
Date:   Wed, 2 Dec 2020 16:57:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606924625;
        bh=qOOgV4EJ8Smm9Rn5nR5+eL+QA2AoOu5WY2iqGchoRSk=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=rDzt8Zoc/OPodAhkC+QTuTZqnU+eUMIZ9S+DWrPTS13sAgzSsf5kpsX3ySdn/DCIM
         UGW7T/Vz0RyhTaOj7AX6InGbAkeUBsSaBBZ4SOb0jO6aJoZQPByS2NbORhFBCncKto
         yq38lzJMe+PmE71UBzTdn1sGQyr2k2z06nfxLgXE=
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] i2c: pca-platform: drop two members from driver data
 that are assigned to only
Message-ID: <20201202155701.GD13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20201123202746.2817480-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline
In-Reply-To: <20201123202746.2817480-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 09:27:46PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> io_base and io_size are assigned to only in .probe() and otherwise unused.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

My very first driver :)

Applied to for-next, thanks!


--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HuU0ACgkQFA3kzBSg
KbZzmRAAlta3u6IjhZO7/jLgc9sgNOUlQhTPItl/eWCjc1c2wLDt1PAZFP0VhUIk
VrNXIA26oQ4remZjWaMldkuq5j5MNkPTyGYO2/0izemMHwxinhZ+kiECyxrCttdu
jaK8VdU+L95wERDwnQBvhbvQspg9SAaYBQ7AG1j7PY1YqGV7xx1zuYZDEg4plzox
FwnwLd+JIOGA8RbnU1O2Y+6EJApeYQJzd/Xf6NraZbSrdxgTNBbTalKig/UQ6oh4
wS3OKmoWkvjcbDifAqIi1hzC14QNTWQ21xy/BTq2dqWI+UxGFHXjU/4UC6528Sv1
5t84TO+bqobtF1KNlZB9aX3mKHxMH95JPLN7SXp3HLT2Tge4o0WDe8IOehRifik/
sLdvz3vHlEfEYLhfQNSd1kekeNAbWzea3RYpkwpByRSSSj+4gUxNXRhnT7lr/iIM
ZsmaM4V/ib0j6RjZPL2bGcY4sYAHn6sOJakfRsg3b2OBGWNeMSeDYYjsE6i1B6qs
+iBS36XilnqsTlVnRLy7SvofP/D2GeoHH15WlYh0KZCcnfCQo+VQom9YxOu0DU5O
TZFH6o3aHmLHvYjuA/ARH1q83XQKTDNdQAOsZt2O9+YqPvECt9VbPeeVGfSq10Ci
JIZyqfMOY14AkMlWgppubJ9WqrMV9jq7UWvgDbH0O41tIaeHKsc=
=7Qg6
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
