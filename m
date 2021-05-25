Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBEA390A1D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhEYT5d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:57:33 -0400
Received: from www.zeus03.de ([194.117.254.33]:52230 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231840AbhEYT5d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RTERJTAUGz55gohxy1sQFWVxiYXg
        l3wS8wA9sEQUOek=; b=Q68aPfxw0kVsAWGmjbm1ujGnhBExXXsLUGnrtC70FZCp
        /mBrB7oiFNr3CKBnY5L8yyOFmW7e1GKwM3AUnRH4tbFUEALhcUGoK7+KRU9w8UfR
        x0w9f3ti5LnbPHDiIPL4kt5EXCLN+e3aPmOwY7e1VMXTkSrRho4KLSz/4xWXmmQ=
Received: (qmail 1371509 invoked from network); 25 May 2021 21:56:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2021 21:56:01 +0200
X-UD-Smtp-Session: l3s3148p1@fgRe6izDgtwgAwDPXxHuAKg5HweM3jRU
Date:   Tue, 25 May 2021 21:56:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: sh_mobile: Use new clock calculation formulas for
 RZ/G2E
Message-ID: <YK1WUY5WRxwIUrx5@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <2a1f0271cc00bf2821aa8b6609c452a9823980f6.1620299581.git.geert+renesas@glider.be>
 <YK1WHQEwXO+aFUwK@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="81aOl7oPFZ/tLSM9"
Content-Disposition: inline
In-Reply-To: <YK1WHQEwXO+aFUwK@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--81aOl7oPFZ/tLSM9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 09:55:09PM +0200, Wolfram Sang wrote:
> On Thu, May 06, 2021 at 01:15:40PM +0200, Geert Uytterhoeven wrote:
> > When switching the Gen3 SoCs to the new clock calculation formulas, the
> > match entry for RZ/G2E added in commit 51243b73455f2d12 ("i2c:
> > sh_mobile: Add support for r8a774c0 (RZ/G2E)") was forgotten.
> >=20
> > Fixes: e8a27567509b2439 ("i2c: sh_mobile: use new clock calculation for=
mulas for Gen3")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Applied to for-next, thanks!

Geez, too fast again; applied to for-current.


--81aOl7oPFZ/tLSM9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtVlEACgkQFA3kzBSg
KbZLrQ/8DFecIhypieNqzva7DiQsQcFTnUl+3chGRs3OLqwH2Phx6oSJjuXSgClo
HEgUr0ZeeDAF8Kn4GovdPmsliyPOOzsBmQp5CY8BK9MI+VyBXIOM3FWpvPq7wTAf
fpc4L6EsTICryY830brBiivWbQi77FTtSIGKwg1E5Y807e3Wm2rb+du5AORSYp3s
6d0qHkr4I3VYaCYd7CUvm4VqiIgHq+ERUjVeU6e7o2I88x0Qs7arrFt/nWFyPild
KFxs0BICo517v6eLzjUgmEQMV8rrlLAsqcBoQrxbhWO7SQKsF4PHq4+oUFtOhANH
vLaM9Lj0bMI94m+EKAUMlQn4JHJxHEoen6YjS2LdEGBHdSuHL8yY/OK4+bWyzMtD
gEPmxjZ+iR4ypbZdvQWFTkJxNi79AJq6LRbzDa1N1wD4Kus/uFMw3TcaL8JTC+p7
cHBbvKo+i5AMZcRTv1nQg82r773+pRZsdWtxrZDxdDQZihY1N1qDUlRXxceFOmcK
cfRHEdkpP25jnwkTqr1CyJ7JV3adgxWjZDPQrxb01LUwE1NBcXQFRheryiMzyUKI
EsaOJ1mJecI/AJFXga7y/Ud/wxY0Aae0Ar7X+OIPYXRZD87M/EQawIe9Rw+dHI/t
ChDBUrSHgDlhcDP/HiXoNlnPjhHfD1dNAQb/4HAn4B1u4YerJKU=
=4cag
-----END PGP SIGNATURE-----

--81aOl7oPFZ/tLSM9--
