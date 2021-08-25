Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1B3F7D77
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Aug 2021 23:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhHYVGV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Aug 2021 17:06:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230477AbhHYVGV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Aug 2021 17:06:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30E406108E;
        Wed, 25 Aug 2021 21:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629925534;
        bh=/XXR8btWeA5gaHUZTg+ZhLMEz63HwBH4QWrWOtn7jxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RzRbYiur3kvNTZjI9kKBSWThtlvbMKKOMDQXx1bHt6zoEGyRhmWQ46+xnRtm0aEgr
         UiWnhSoRU8jxmYCh1pJpLyii2TiMtbK/jqXB31aXpCGpTsgN+uzniVdKeUIakT7E+n
         VEeWHRMCaE/Tn74Ax+lkXbYRQJtTGFKvVNB3ZKpd40Rgjzj3FwNgcLEl73jHJAhKL4
         TjPr/lWe0JjLDckB/ZRI144DZZymfqC7rUkbSy5UHM4VQqmZzAvIa9DaQZn3evO0td
         DFv9Z/QHLQ9qXqOWZGcSRhwMMBQc+O2UmJhRWoGzAWE7XKanow57NF8QigGyeu79z1
         OnIRte9HaJ+rA==
Date:   Wed, 25 Aug 2021 23:05:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, George Cherian <gcherian@marvell.com>
Subject: Re: [PATCH v2 5/5] i2c: xlp9xx: fix main IRQ check
Message-ID: <YSawm4O5cMffck3M@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        George Cherian <gcherian@marvell.com>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <88b0915b-de45-1ef3-0b03-ec9c2ff3ce88@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F1bk0huWrYGccCxy"
Content-Disposition: inline
In-Reply-To: <88b0915b-de45-1ef3-0b03-ec9c2ff3ce88@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F1bk0huWrYGccCxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:47:54PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0 for the main IRQ, the driver's probe()
> method will return 0 early (as if the method's call was successful).
> Let's consider IRQ0 valid for simplicity -- devm_request_irq() can always
> override that decision...
>=20
> Fixes: 2bbd681ba2b ("i2c: xlp9xx: Driver for Netlogic XLP9XX/5XX I2C cont=
roller")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20

Applied to for-next, thanks!


--F1bk0huWrYGccCxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEmsJsACgkQFA3kzBSg
KbZIWg//U344yuA65iXqInupqZaTaFk2u43E+2M6oNWKs0bkAwbmJzSaDOrIVITX
V5N+4NwGnrg6X9gzv4aSlsMxpTEesOOqafCbQ2LX8C1np110+XBTzvYmKKFgmCI+
YgHlO7NvUs72Y69xFLeqY0+hX6lxVsOXDJPVtS4irJIcuaKZnrO16SLy65sjgi+D
lkHiesDoat0L+ocwuLo0R0ltK//b3K32/of2m/mHwDNDAQwLvj5QcnYBnqYA/emE
8dRndZyc59PxFEXiY03nhaLX/OWIYoXury82nX9/Dra1wQFV3osZG0JAUpLe1GHK
QDJ1/V4mc3DPyayYiLU9a4qEUzP3YIV7LWyM1Tu69m/1kMyUdzXh+D7pkpK6SBCr
sS6VbQn0cwtzUYL33vUN6+ZnUtrNNFQ65nxkPq2SkDUGzFyEdUUDoqVNQuwzQDoY
SXazEqX94Z50Qj1GZ6Li9p2mucnW2MawUgKi/Z0fwmbuoKG9KZXk1AEoXJc6GYX/
o/xV8fiNxnDd18w4OoBGEPePdpgm6G73ErNWMlgTLbN8cuYUJs/11FaAcwzz0f+K
gE7JnqeUYQhyFXYogEu2LqOQaJ589NBQpTsXMe9o8G8rfGlUgqKomYXHe6uMIGmX
u5dSiKR0TKE9L9CDOodAeBF1o4UY1OZUNLHXqXgEAaDU+n8qC40=
=jg0q
-----END PGP SIGNATURE-----

--F1bk0huWrYGccCxy--
