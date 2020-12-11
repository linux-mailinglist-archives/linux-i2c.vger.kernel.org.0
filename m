Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1BA2D78C8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 16:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406459AbgLKPFq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 10:05:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:34256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406547AbgLKPFN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Dec 2020 10:05:13 -0500
Date:   Fri, 11 Dec 2020 15:44:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607697876;
        bh=MHXtPIev4oLetMfhIs4NBVGMSr9NoVqJEjMkNmVy8tc=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhrHHm8jZ5A+2lQUOQka5k4CvFLN2rcb7dlIDTdFh9Ng2Sv/EW2HNMVAH8rnXKEUv
         7MpcqLoUOa9a/sCn3aur8+OK+F3q+To6yQGqRxty6RD+8+e9fGP3lGeHZiSUnnv3p1
         Ch3mM5JFHq3CC8IqP4TclAvRnkkDXjNotm8liu8vcFl05AAAqRGjIdMdBiB1wC6ZA+
         vkVed3cwdYrTBOMu+mNT6TZVQSbcoZDL2yId5mBUmVDvztL9fXva9UDS9GqNTFa4uZ
         eXgl/wOKB2Lp7JXFwHjhnw9LwdC5mlMvPkFkZSOaLW51OAD+leiweH0wjLe7tIKn1z
         EG4zuY3jwrjJA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] i2c: Warn when device removing fails
Message-ID: <20201211144429.GA1990@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
References: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 08:23:30AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of struct bus_type::remove. So
> warn if there is an error that went unnoticed before and return 0
> unconditionally in i2c_device_remove().
>=20
> This prepares changing struct bus_type::remove to return void.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/ThckACgkQFA3kzBSg
KbZAtw/+LrlUvMTH5q+YtMKb0q2IieaGzI2sEC4nityLrhyVUxaLjUMWb06MaWEX
clLpOPeVb/kOQe+814c7sEKtpLGXErj4BW04j7qRd9th1LK2+rv9sYxaMR0snLn/
VYDkqYRsfyTA3jVznUr+aFe1e6uqqPg7MWgV9jFZSfPd4Bh02I83hqZgCghHqtiR
ZxCEpAVwv5Tt1BP5dESVSBMmOUqKG2Y1oftVmE2IGezLFkS+QbytkNqw+gcngC+z
676R4/1RoSwFXNWVlCeQP2gOYYie87ybFDM/zZvvp/cr/5UfQHs5/nX9nP4+GO6l
CEAgmSa8ZXBFWcyAC6EntROCeZAQNPe13e8q0gzYa5dCYE6nw41dmdGzLgwv3J49
fGs8ZT7YDVIjqMTLDsE7FxCllnXi25fIdqWwHCJA9Kxsa3YFC3TuC7MrIMNEwUsM
69OGhNChFJKsFGFRFr+REVsrV283DN5BPlHiZFsrF1iR41Cf6FcgoB63jcmcTam8
fxhrcdN3xsRy9/1C7IqmoP1+BZUNuw1JVpJNbZU0IoMDAwqcG0czB/JRe/m7affX
Hq3zAtd0DdvzOZNbIcjGCu3tPUUyoIexvaFQby/6FU0YNwz7ucEau14i/DujpaQ+
+YghOb6jb7p+uAfD+TYYo9/PFReriUN0n2Vf5sDPqEywXx67X6g=
=LGzm
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
