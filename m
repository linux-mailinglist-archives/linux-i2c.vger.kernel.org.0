Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F402CC17F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 17:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730578AbgLBP7h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:59:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:39322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730580AbgLBP7h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:59:37 -0500
Date:   Wed, 2 Dec 2020 16:58:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606924737;
        bh=NWyCOJe4aLPsdUUH8wcL3UhE+Ex80GuIx4SlaEOS890=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=EiPEdQjpLhVNDv8N3PpwM3VyxQFZV3pD9gFtT+3c3MTZwBsOOrZi0rd2NTTsXr1Ee
         RY+c/u/ABYModmmbtfz8ohPBKOkKtRWswle5jcrIUFDWUDvcewoFOfG6qHWLSJ5uD3
         w4DDDNJl/wTK9SfkjSlzimy9mZ23Z53ddL3OJSLo=
From:   Wolfram Sang <wsa@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: mxs: Remove unneeded platform_device_id
Message-ID: <20201202155854.GE13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org
References: <20201124002849.28397-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline
In-Reply-To: <20201124002849.28397-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 09:28:49PM -0300, Fabio Estevam wrote:
> The i2c-mxs driver only runs on DT-platform and there is no
> need to use the platform_device_id structure to pass the driver
> data.
>=20
> Get rid of it to make the code simpler.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to for-next, thanks!


--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Hub0ACgkQFA3kzBSg
KbZmTw//ST0Ia+Uv83VWhOGXYr3ZTKaCImh7hn9CH+xJal/tXY7/bp62OYNgZe5/
XefsHPYoNBt5asJwBwzX55poqZtWNbHZLOvzirk6fZekb1I3nctQNB5BFv1zkzQj
Oy1TNkxa2VBtvQnLywYDZQM+6FX9+B4lZZs1OWuVJkHOW/kbFjnPwg84j27eIIX4
tu701hC0pI7goG52PHNSa4/5KK/s86gjhyOJwdViLHPXWdoP7ZRkMpVs2GUzReJq
ed8n6XGBgnoxVNVuHdewmEImj4lP/PJuI0uir8rugyLc9npBBz1pjGERuP9VPpuN
X3l/SMFY2/i1RVHZxwRxtaoYf+9PUEkdOhtlRa5kRmkDaepXGCLHS4f2eiaiqWpy
QEsi1HneUIIHw8BO4avu1q/iw10nyZeiVuaTpF9B0I9D7oKYjbmKn9q62kGnM0AV
h3k5J89kdetNC7qaaNsXDhSr/S8UV+yTGdvt4PFHNGaayBy1xzLc9YAlP2xkqc0v
arHhBoFDj7IoIaC9JePJrnSsYtdacF8Og1qxZU84vlmvPanVL6qfkmWSuoK4AgTg
SWx1XHUjqIThqX8Ce1WfSg6gi1Bqt7n6Tim+iaoqZy32NhrIotCCfz2cNiXu1hlV
zC+CLEP+/hQIrfhQPi/BRNZq2t+lYqTqk4Imv/q/uCyp7Y29gqk=
=o3ui
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
