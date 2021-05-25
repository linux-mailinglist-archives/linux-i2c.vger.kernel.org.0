Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0175B390A0B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbhEYT4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:56:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:51866 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232940AbhEYT4l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Mv4JG25a+BXgI2KX+LqI2nqSUGfC
        gG1Sq8y6pwi3gag=; b=auvaGjP5CHFnqjTjFR6kNenyaLF6QrLJ666q/QMBUFlH
        BtkOvawUok9WLH9zWgPRFYFFnaDVkzOO0Ponb+hPFu+w9qnFl4wAYAAscb+jkTKl
        bGAZ5hsZHkjBurvsGu58eGhklqQaFLKPmkY2IuC1eXz3wj4FHgKQbhWA2F6NxLQ=
Received: (qmail 1371109 invoked from network); 25 May 2021 21:55:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 May 2021 21:55:09 +0200
X-UD-Smtp-Session: l3s3148p1@UXhD5yzDgNwgAwDPXxHuAKg5HweM3jRU
Date:   Tue, 25 May 2021 21:55:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: sh_mobile: Use new clock calculation formulas for
 RZ/G2E
Message-ID: <YK1WHQEwXO+aFUwK@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <2a1f0271cc00bf2821aa8b6609c452a9823980f6.1620299581.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dH77TQQIEVD2QOwU"
Content-Disposition: inline
In-Reply-To: <2a1f0271cc00bf2821aa8b6609c452a9823980f6.1620299581.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dH77TQQIEVD2QOwU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 01:15:40PM +0200, Geert Uytterhoeven wrote:
> When switching the Gen3 SoCs to the new clock calculation formulas, the
> match entry for RZ/G2E added in commit 51243b73455f2d12 ("i2c:
> sh_mobile: Add support for r8a774c0 (RZ/G2E)") was forgotten.
>=20
> Fixes: e8a27567509b2439 ("i2c: sh_mobile: use new clock calculation formu=
las for Gen3")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--dH77TQQIEVD2QOwU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtVh0ACgkQFA3kzBSg
KbYS9w//U2MJzz9WE+omEUOrOQYH/ej/jbsTb/+bWTTHcQ0qJlZJSD0w4pA1Fp+/
fATVVnJliJz/tDtxelqCLRhG3TxKqoTzGIVMdTrhyvQ0lVj1palWex450dHTkJB2
iTErSzaInJC02+AubL+MXOBl7aH/s9NPFd3pj58vR0gVFwSqxigEIKmZeblHCC9h
QfdskKnLXpDoAOzozF/QR34qZdPn6yay6uc7YB+/a4Q3WtadOwrH4inByPHHAriZ
NoiGR1g6jH78eW7OIkFr2JNladKahpwMeIo0yMP0+tHTYQztqb0sGcJbny77pKI8
uAgYFFKlB/Tvj2A9M9+VKDZZRSAJGDXUS4fAkSEygo6m8Z1ODcvLFphZFD7tSk/e
r6W4du677CMUv2+9+9ebQ4LtH998Qe4yOpDNoCZEchG5MeshO/tUxN3ZQQYxGAZ+
IJuNyzpmrY2CvqC12Jfc5d2SHG0XnzzbJpIWypAEhYQcINnMVcKLdP20GgfhsLhw
xPbHntB42SHkUzRqu/clypt4ONZgmjq7PcMi5WGHlhRvt5+skZ9+9Ft17RbDZTEo
Ur8FnyUCT3zkZ9g82PvhXvWqJnSuMV8yLj/hQ+vL7K/jALvFUNkokHmQQxAvLd6r
nqKufUM0pxXOFsA6BTjqc9VAIewd+8SDfQNHhZcwvlTnF1mP0fg=
=XLiL
-----END PGP SIGNATURE-----

--dH77TQQIEVD2QOwU--
