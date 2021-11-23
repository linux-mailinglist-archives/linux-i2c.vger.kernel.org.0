Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D778645A0B5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 11:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbhKWK6l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:58:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:51442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235715AbhKWK6l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:58:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 951CC60C4A;
        Tue, 23 Nov 2021 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637664933;
        bh=epXNXCSHR16BQf4WBgeJBD8d2zKMDdY0hplRa0Rzgqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IfWtv8dh/AxAXKTcffPx69DbYl9+zXLza17EE6Wchy8871C83Wy2d+wg0RHVTHoXk
         FNuWX4G/1lNs3LfdCvlB/KVp0i9bp+Bm1kEtkwTHVHqo7vVD0Py/TuUc7GSQcworIL
         5r7/YYYldPJJUbHKVNMWswlpJkTEuEF2CB/aEBcI3kCFa4EhbY0miU5zJHMmRloG8V
         e5JAqZJRp12rPv1UZuFdfKwYh8/FzBYlzXlDOWHROhE07ZB56YxSXWLjBevO+tb9PQ
         yjSwRIstnp/bi5x05rBDTulGi6r6iiE138Tp6spLGzIPB9Kdhbk6jXYje4bKeJjbj8
         mEDEaq0mabIbg==
Date:   Tue, 23 Nov 2021 11:55:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 3/3] i2c: mux: gpio: Use array_size() helper
Message-ID: <YZzIoneNgoADf9Ok@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
 <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5BLKk/XWK7YWwAEr"
Content-Disposition: inline
In-Reply-To: <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5BLKk/XWK7YWwAEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 05:42:01PM +0200, Andy Shevchenko wrote:
> Use array_size() helper to aid in 2-factor allocation instances.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--5BLKk/XWK7YWwAEr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcyKIACgkQFA3kzBSg
KbYhYQ//U84V4+ux4DePprp6CnbTIDFVeSTniYdRijWArK4O91uwE2BtZiC08aSN
sburnTB7TyAzxuk8Be7yJRFcM9LNf+OHOaTD/p3RF1XkxDLZZxbVXS/D9hYXMgzp
E6R7S2oUZsTbc8tz1PdRDTrFM+91N3MBw8QB1/wMvzrBpQHARq8iTGwHIy46O/X1
GJ82CufA4F04ODDjgM/KXE8GoD8ffHMu43+i4g3Rm4XJzz1/kdT2g8ev+JXV3mpm
eu8XeWvRn2INhQSV+jat2yLgCfCHozToSk8djfv3YUd136o6ViXXUJbWmIc+/ekW
3VhNWds2QWtlihGA3y0lHpgoSrrmPP54L0Sycx4AbKLppsKNwUOoof3y4+Nc/rCo
OKD+RqxQoBkny/ca5akdJB5vvcuYJiF4UiaqjlOnPJOplQXLinhfCWHI1NKshMT1
5Zoq41AChNwPJXZi/XsSBvl5NT6RYldfyJYI9hj/dQbCbCNu4/6XkO5Oq+0xKOJR
QFykjANIGxFteYCL7opTNZUs+JDVJl8wo9K5OHdP5+klOgQKeh1kyk4SqSB4nyU+
JX/EDmpuOJxdIVS5eO4UVpQV2ss1GTYBxeDECOTL7OwASBr+2aIt5r4PzRFps2Ca
wid3jEub/In3C1hWuNLOZKUsr/hbUlXk9vAUe8R7/d+EARn7HBs=
=8dMr
-----END PGP SIGNATURE-----

--5BLKk/XWK7YWwAEr--
