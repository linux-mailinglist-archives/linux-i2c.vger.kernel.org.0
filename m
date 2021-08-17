Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259813EF2B2
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 21:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhHQThG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 15:37:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhHQThF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 15:37:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 459506023F;
        Tue, 17 Aug 2021 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629228991;
        bh=lVa/cd8lqAuqi9Xb46n1dPF4Die4VhK2NzXYomfF1F8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MpJqbMTJoY9HiVSZCsZrCWmeFiwYxVmy4mvIkY/TJff233HbXI+HI8emvSQdhDnJm
         cldRNM3O2aVw8yw8aqyKfCfpGEkKLJfWa0n1ky2BpCQvl1h4jRXohis0wYuD75rLGe
         3fFg/KGIBqfqYC2g3Wtr+cv06xJFYMt5tkSsofOZap6dXiPj+KYJjn8xMBuUWr90xO
         y007nNsP0lBUpseo1WG1MmFBr1gMygd03q+3kwknYO/3PNTOFzt6CjYnhWl2hT99v0
         +jm3vyqtQmwLjH0Rg08PmYb4Kpd7SftftL4pCMPmyUGrpz80BgkA8xzCjEcD2XlFRj
         XXwP/Yym/QKdA==
Date:   Tue, 17 Aug 2021 21:36:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Len Baker <len.baker@gmx.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-pw2i: Prefer strscpy over strlcpy
Message-ID: <YRwPvKZm8i47xFXP@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Len Baker <len.baker@gmx.com>, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210817165859.5429-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zfDDtb3v1My09Y6o"
Content-Disposition: inline
In-Reply-To: <20210817165859.5429-1-len.baker@gmx.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zfDDtb3v1My09Y6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 06:58:59PM +0200, Len Baker wrote:
> strlcpy() reads the entire source buffer first. This read may exceed the
> destination size limit. This is both inefficient and can lead to linear
> read overflows if a source string is not NUL-terminated. The safe
> replacement is strscpy().
>=20
> This is a previous step in the path to remove the strlcpy() function
> entirely from the kernel [1].
>=20
> [1] https://github.com/KSPP/linux/issues/89
>=20
> Signed-off-by: Len Baker <len.baker@gmx.com>

Applied to for-next, thanks!


--zfDDtb3v1My09Y6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcD7wACgkQFA3kzBSg
KbbAshAAqzwcYf+sCrGC16fOCkh5J4iMfSbWmFFrJB1GzLD+Prabz99WbMT9wTR1
s4E8qEP8AH2l88yhtKcgoT4apvfeZxJi6AWJ52pD3n+noQ3xAZie3ss6dVSI1Bib
6VI/+GeEGLZQZkM5rUXWWkYeugOJClYyj2g1aulpW4vLDa9G7rd3/FjEsMk/cMH8
a3yyTm8tRhMGJOIiMTIhxZybdvEzQuyHMNWkhDHrjt+H+KnkQmhqBImmfijEM+HM
uS639QWzCTw1d5mwK9VFcM0Kd4f6rrZUFLq2qw8sMB2jVgN7ZchOLnw7JhXM73ok
SEETZe5RsaUupDkvhm9+hygBH+1klK+ZDz/G081yyPqJYXtHkYcArDPO1ZnjGNr2
RirCAQokAa/Nly4vJWiRMGNyckLWcx2teYK9t2RTUqwtXC9ivK9b7DtmyGkLX8d1
maIlre3Cy1DeQRuqKGBFC4/xZ9RSP+B8fsrcjnKjur3gUJaNWSCZb+Ub7F2fhiNL
QGmzyxqUU7oGNruxICTiNniJ2qm5yNgXQwwWwCRzKt/psap1Kh1jbjgWAQ6uBAgu
NRRrVtkw5G1s8UMtThS8Hi4BdTMwTy1klt7R+qeuqE3f/87hBHfOUCQM8mJHp12F
RzlRw/o2bBGOlb6OMV5nDH1o/ME8c6rwmGieMXDaN4kfoJWGIn0=
=/o4W
-----END PGP SIGNATURE-----

--zfDDtb3v1My09Y6o--
