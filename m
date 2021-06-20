Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A14A3AE06B
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhFTUsN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:57538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230031AbhFTUsN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:48:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DC596108E;
        Sun, 20 Jun 2021 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624221960;
        bh=naTIKEbPfHq0PGsbC0nXabesWxO/GoVYUNgYk01R+ms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H/4aEpgPRQ47y5roOIfnGdkeQsCs02zox8cuM2obPM4tUaJjQZHdOYNlyRJCByGy8
         dV1sPsLReNjfaOuA+pr3r7CqgmZ7O3ghQ2yT14+zjgPgRtMioi/rbjF1cHoN3Imwqd
         6uHQhJZP9kckV17uXqUkKjKe6N3Fy/DaTrKxlPCG2l6ZRCXw7AtRkYhJt3W4SWxNte
         3cgsEgXhgNdY6cd+AmIX8apDnPL/LPWtf6uMDcA2lifJhpIGVTsOuEWShfknbm8+sE
         bt/VImy0hXdUdZTrTjS1GLG/gwIBKZGFI3RM630BzuyYUJ2GO62zCOEKjZHhQenjRB
         SyaHvDBi77b8w==
Date:   Sun, 20 Jun 2021 22:45:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH] i2c: qcom-cci: add sm8250 compatible
Message-ID: <YM+pBQzIO27FPKVt@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>
References: <1623659341-21954-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IAGS9dtNf0nmirDq"
Content-Disposition: inline
In-Reply-To: <1623659341-21954-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IAGS9dtNf0nmirDq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:29:01AM +0200, Loic Poulain wrote:
> From: Jonathan Marek <jonathan@marek.ca>
>=20
> SM8250 CCI is the same as SDM845, add an equivalent compatible for SM8250.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>

This patch is in -next since 2021-05-25. But I forgot to send the mail
saying so. Sorry!


--IAGS9dtNf0nmirDq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqQQACgkQFA3kzBSg
KbYIlw//Yx85vOuXCRtMZvdsMKBAJRnfW7um/NRfQAhyqr4GC5bCwPxQRHtF8O8N
O/qZjWg9Om1wgS7EwtqjqKF4Ytiag2+CqpHDCI6ksvXfmsZP/85pTTA//qXHm99P
tpxu9x1iRl/GqYoVTu7nCCJDWwJq9XcyLTVnjUZgM5S7u7GLAaw8s2B/6K5GHPCu
DXdBMDN/L+v+iLaXLYFUrbABLZlqC61nf3iL0I95dg72Uz8weRr5QDV1e6Jw493t
InRKkt3lMf5fKdOkrQFII27ECDb0zbMdEi1hdGzwHEEwwe+lcluv6sk8IJsAvaoX
DiGVqruaUMwxiLJudZZm0ipvYJaBZO7Cdo7nWs3LHUko9Gmfvz+d3IxBenzz4AMF
4BP64R76u8EAwoEosk3xNvzWQQTGg4wSZ7EUlns6YTOZ+R3tpZxt3L7Sbpbjz4tc
5ULYjOQcNzCYEiM7m2tk3CiWk9gc1n0dCo3OCgh2sb1REfN3u4MO5U1atBdQWS3e
othz/xMTCOMhOXCbNdn+tpa3w4bPmkdUqM90N0dQgdbvclXoKnYugvcneIVzOcsE
GpHGoA6gvOf6wswIQUbzGNkRr0AcGOQIWWtwVkzMoMkXTU3aVLpegsBCwXeNDwfY
o06nyWhkkBr0NYZ3xu0Vg4Ii4I8q2CHBvUICpF0KxzZtjTpPHkc=
=F6fK
-----END PGP SIGNATURE-----

--IAGS9dtNf0nmirDq--
