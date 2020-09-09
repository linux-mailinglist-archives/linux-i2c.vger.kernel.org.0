Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A10262AAE
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgIIIoH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:44:07 -0400
Received: from www.zeus03.de ([194.117.254.33]:57400 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgIIIoG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=OoxtnzkZoIupkBbAG0Kzm95pAccL
        XvwPVa0TP2vBwYk=; b=TEswa85p+WsbEgR0+6Ny0R9qnJN4wf10Uh+cqJLBSd46
        buFEjwODHNRLCy4YWlEewNFkEGPgzIKTXoBBEHd7ePBtDL6+9xfJJGCsoiLv+Qb6
        iZ8llHxNlIEXOw7KPyK0qlVU4Z3qkORgp7SvTyGORujGnpquj9bIQuAeXe96OmY=
Received: (qmail 234804 invoked from network); 9 Sep 2020 10:44:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2020 10:44:04 +0200
X-UD-Smtp-Session: l3s3148p1@9Y0zdN2u+oQgAwDPXwesAAPl1NpCEY8B
Date:   Wed, 9 Sep 2020 10:44:03 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: rcar: improve bus busy detection
Message-ID: <20200909084403.GH2272@ninjato>
References: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
 <20200829203810.1467-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline
In-Reply-To: <20200829203810.1467-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2020 at 10:38:09PM +0200, Wolfram Sang wrote:
> I2C doesn't define a timeout for bus busy, so an arbitrary value like
> LOOP_TIMEOUT is not a good idea. Let's use the timeout value in struct
> adapter which is meant for such cases and is user-configurable (via
> IOCTL). To reduce the load, wait 10us instead of 1us which is good
> enough for the slow frequencies used by I2C. Finally, use the
> poll_timeout helper instead of open coding it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YldMACgkQFA3kzBSg
KbY5tA//XIbXI1M9OoKOrgVDiRn78CBfnhF8VF/kKOYMMAH42wyd10GOYPtBVuS1
7fkpq99K4iYH0517zN+fPm6k+U9wItcjrDjWAzhqzZkmxN/c9+5WWTAEA9Cat67l
/mcUiE8hiu6K/wCBBtwHyRRPtHOaRZj7HXqhshoapCCyCRnKwEwM5CR3lpIHd9Ul
XQ5y/9nh/ZFO0fF0gNtAkTHOc3GdKQGSDATNFR+Rmf5P2QHUKkT+D3VEf2cCuC5P
EE+wtioeyb/n0SB9U5thfRtsVs8HGyj7nggrd3SlyYYORZ+F8q8qS/jMAd5NF2HG
8cEnSH18b+IVxHTQj+5FDqD0PIX7/XY3Q3GBduJCGlWM9eqRvBHIeuIUM+PgRN6i
eBYclFgLFnB+Z49bTCbQfzcFTAbgvfamimpFyE01RLXBRM6wAz3NoEn2CkgTDSy8
K+xDwM6bm2D9I25jljQpVZWq2XcawXbttnPLsNzw9kbG5ZbcHnWsmMYxcv3Q4SCt
3l0QqdmuT25IDPLa0ViZQNLySrNw6LrHy+XLnMhQ/PUklN9jNHayTYShQp/wZGZ5
W/Z9/N/ovqq3TbQSNv45+J0C9vQNLsX6lKA+G6nErq2E89ju1rajGZFYtpDzMwff
qXxlavwVSuNzt5yOnQmFjOvhj/rayW/0gYIMQNAdKvCzGSngIrQ=
=Jgji
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
