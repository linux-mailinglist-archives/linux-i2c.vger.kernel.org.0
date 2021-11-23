Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C912B45A0B1
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 11:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbhKWK6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:58:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:51268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235659AbhKWK6W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:58:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D405A60C4A;
        Tue, 23 Nov 2021 10:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637664913;
        bh=eqhK+BfzLKIaN05mKnLZSc5X1B6hXWBkWuce6lyOyBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ry4bOjq4kxKuIwVnncrZTrqLqckPoAjYZhlJJxw61F7B7gFExhWinEcpHt4MB5Tdh
         B1W1mTE4dcdFcBp+d0U++buajL9qlDyNBBaYMdB5fMOhYjBDw5w6h2xg1DpV/KuOKB
         /YSRuIgJyZgAiu+wdmbjwKx9NO9fCcWK1BlbUzF6lH2+2X74YJKncOXcB88PF6gArr
         ZAXZLA4BpT5fLrduP8Gu3uEVpAC2t+/0lGDUlVxFvRd41liv1QSZZ4mksqbBuEGozF
         LdvLVfmPGg2YxkmGHVEsvkEUY9E/s9VksgJENCsbY/AR02a41ueTrmZr9DU6AMfdcg
         4kRmxW/DrcO4Q==
Date:   Tue, 23 Nov 2021 11:55:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 1/3] i2c: mux: =?utf-8?Q?gpi?=
 =?utf-8?B?bzrCoFJlcGxhY2U=?= custom acpi_get_local_address()
Message-ID: <YZzIjQ/2InzXrNUJ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aGOO3k+AcxE+C/GK"
Content-Disposition: inline
In-Reply-To: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aGOO3k+AcxE+C/GK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 05:41:59PM +0200, Andy Shevchenko wrote:
> Recently ACPI gained the acpi_get_local_address() API which may be used
> instead of home grown i2c_mux_gpio_get_acpi_adr().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--aGOO3k+AcxE+C/GK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcyI0ACgkQFA3kzBSg
KbavDg/+PJUarACP3mbZue/S5aI1tey08A5XvV48cEM1DwqhVc1eGPViSExx1ji8
SmwerqBWWV0a1FGkA+eqL7AiQdsRG3jS/dOKlqZ+1BkZiSaDd5DPL8qTB3Heli4Z
4bzsdnEAETxhHV4IeR47DDmL65vai8ncvjQdFbzKOOTAIkm0+iHHYq4e+ykzeSyq
SBZGCPmqBoCtaBjVWF8wwp3n6IAlm/B4IUxdblL72hm6huLyBloK/k5PNeqgopEK
aIGFZjCSmT15lwkSwKzDXH7pmI0PVW59VNzdllQ3oYexHIYr/XeTShH9z5V0nGg3
rIZ8T4BfSSw/4g5zljloYYVkHgfW2L/9oYboZVKyYrUiHzq0W7rLh1LkSyIX/R7o
QnLl8Dg0MMHhkX3g83PYCMKiyCMsLykOcMJyZy/RXE5Qn/eeWayJ4Wv/tJ2QcuQx
FtXe6kYtszO80+/cE2KlvQt5H9c9OHDLcIo1vVHfkm85wkpQMxeBVkRjH0K4+uXg
RURBi7FXT/ZH20gyFzGZDRus2yt1r3lDA1l9LtZ5PKFRWzIFoejYQwE81X4P7TXJ
FjSV9Eq8JdeDp2lZEPbL6UDRpdcL0nSJ+Xztn5rAWvyCYGOAHsngehhEy90n6Sxl
r2uZdTKMOlJyFTaFNgRzgDPtXPXKCAWSqBplXEw2VJqqiz6WcAI=
=Tt1c
-----END PGP SIGNATURE-----

--aGOO3k+AcxE+C/GK--
