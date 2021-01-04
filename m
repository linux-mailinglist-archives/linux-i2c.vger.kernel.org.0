Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C832A2E9CFB
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 19:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbhADS1H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 13:27:07 -0500
Received: from sauhun.de ([88.99.104.3]:60440 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbhADS1H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Jan 2021 13:27:07 -0500
Received: from localhost (p54b33105.dip0.t-ipconnect.de [84.179.49.5])
        by pokefinder.org (Postfix) with ESMTPSA id E8D352C04DF;
        Mon,  4 Jan 2021 19:26:24 +0100 (CET)
Date:   Mon, 4 Jan 2021 19:26:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Fix the i2c-mux gpiod_lookup_table not being
 properly terminated
Message-ID: <20210104182624.GB935@ninjato>
References: <20201221134225.106728-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline
In-Reply-To: <20201221134225.106728-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 02:42:25PM +0100, Hans de Goede wrote:
> gpiod_add_lookup_table() expects the gpiod_lookup_table->table passed to
> it to be terminated with a zero-ed out entry.
>=20
> So we need to allocate one more entry then we will use.
>=20
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-current, thanks!


--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zXdAACgkQFA3kzBSg
KbYjnBAAsolNLdBINdsMFNPb67+PBmrwsh3+Hxd5JPoXuaueoqm3FM49scMOfHTK
HTM/7Z0WWBZXeagRNJ97ft9JxNKm8qKbdV+w1dsq/WuGjndk1NHvMJJ82pAA2AbB
fXgRVhHO0imSS/QPSHimLg0sm9YayRS9M56InDhmenMh+B85cYrjAnRn7H7/n05Z
vPiM6r9g46cYTxEW6InVnLA1EEGrD1bsMpoKwbvq63TAZjxWogLjDmBD+ovOb5ra
Ga0NS5geN1JwV8tYVh8nCmoPDy74n5nu3IIV6NonutQ/xN/uF/O0vkWi8+zRu5IR
xHmEAIeHRWdlqbwLqni+dtLuyBfqoDVjnTV+hzW5x6jj3ZCxESJkZsdvjbQ4ZMZk
8OtVBtLKYdavOnVsO4MQ/n4KFuvUywsRNe+RbJhxXub9EalbPmBJ9PQeyFt0bxTx
Hz6d9WRswqXh4TfS9Afx8ZK5ieE2X44R9h1hLoC6fvqaaUvVFOizjh2cg7RRhnwn
jcbgQFtL8pWkPkieWpA4MEp1esKbzdl4ViIsxhk+KZFbGfJZ+TApcKykhpY1d7H1
bSclFS/iOxdALbWIsVZ8iPJI1DxMtKO92zuqk5Qg5STaLX5doZAJ3+y2nsMfrMW9
nlld2s6dAKXDvbm/qqQkOu9m6j52NdBFdc+cn9DDn1Fs80phTxQ=
=wznx
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
