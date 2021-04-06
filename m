Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69112355C50
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbhDFTja (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:39:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:56448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234417AbhDFTj3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:39:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 255DA613CF;
        Tue,  6 Apr 2021 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617737961;
        bh=ts9JtR3quosQkuNpl4wcpdEuY8gfyNZlGdGooLlEDjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MszAd2yl+VtKM08rPZTgARBfIOs7LAgwmvxyYmyZNuTyVvIv9n+tkf0ebowIGj4Ww
         N0LUD7cAMp8EnZAWOIuhHLhus+tNy1Zr4JiPQg+LELHib0JS+ZojFYlLkf0TyQX4Ol
         +KaAg/IKeeY0wqVQxK0Ii2jeRwV5ktGQcFYJuSFi5ZtVBrvTA9IBxhmo9kkaEp4nDV
         pyHBke9DkrVLiB7CGrkHvF6inPXs1Ruc5Ehxi8whh+q3u3w1A0ZLlbSayPtLqkqhJ8
         SZJxDqfaRi1B39kzMK1lEYr9ojNyIhZCbZWRrmgs0FzPIyiE+qqZKLYzo9XhAQSSD+
         ZUZrBVtJKpMcA==
Date:   Tue, 6 Apr 2021 21:39:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@cam.ac.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 04/12] ARM: pxa: stargate2: Constify the software node
Message-ID: <20210406193917.GC3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Cameron <jic23@cam.ac.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-5-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <20210329105047.51033-5-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 01:50:39PM +0300, Heikki Krogerus wrote:
> Additional device properties are always just a part of a
> software fwnode. If the device properties are constant, the
> software node can also be constant.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Jonathan Cameron <jic23@cam.ac.uk>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>

I like to apply it soon. Can we get an ack, please?


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuOUACgkQFA3kzBSg
KbbrDQ/+Nr6QyRue2/UUBbJkyRdE3opr8kpatSpVt68js9AlYEMDsZX+V4Y1/EsO
uv5+abnNH6iHiHTr0bNgCrml+elknmmYM4cs3ozahvxjoo/bbvjPsBgQZfRfDfC3
Jh5DedUBXLHKf6wZmB3M1VSoGI1KN6D8yz+wl0sGhy6VoEcqNnUM19jdZrGXcAEl
FI7eTwC1YX4fg1L2TrK199DA7JI0Cr+HPWHSNmF4FUacKBAPm7S9a+QBTLjrM9TC
5RPEazK16VvibjFdhPIJjRRcUateC114i/j4tqGPwBfBeX1x9juZQj3GLn9A8dz9
7o2mM8xf+M+CzEslcW5coY7WYqLn+WPYN9s3Iiu+tjP6IbaPXjHysCbiQxrk3bYH
dBv6CW0n9ggW5Q/NuSkvmrF7cFNqFoY/O9HfJmOwN8fVYp2dQC/V8AHb9C9aFTKf
7tuCClUsD8xMadr21rOab0E1cBzX/SlM/FIjNmQ4QrSB1GqjI6MF9Bc6+qVnMpVs
EXvQdvE6W/80m2jqXB5NOQAQml73CxNqUZLo9SSX1qr61NsDOQ8ijR0Cqf8T51ZV
2JPykhhzrleELLgEK0iGKsKlFBi5A67SqmY5m/bmv5iX9YkPDDDo2e2dwuuvHT+d
z0odSNnDSBzoV4fJKcAJ13beYLi+Q/oLfwOIDbYPyKOemqAe2vI=
=xBWT
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
