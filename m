Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BBD35B041
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJUBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:01:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:50934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234439AbhDJUBe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 16:01:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23C3C61027;
        Sat, 10 Apr 2021 20:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618084879;
        bh=Dfnt/I6DHHgURH/pF9272uXqRBUHHEnrkuZSfWpHwIE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ajaW3yLKzNFm+9Da8PFALTK+EpIN3jHsfOreeOaSm0p+YvoY55roCFE9dNMc+6Pcd
         dhE7C5geLwoRQQN9lclc2duyvLCYo/4KeeuSA2rg0CEu8giitjKFXYSoD1/DvMwBRT
         VX70rXdKLfZyqEQWZwMOjzsPAnSx0arF1B0AfDh2D7o/Iey5JFMlXAYnm9NzIWVE+P
         Ihaa260nkjd4LOtorG3Ttxo27krUNX9bH3o/hR/2xZY9TfDbpGoLvkNNzYsedxUnIM
         lovIFZ043S5d76hM3aodQUUzsfDXQPNrXFV35qPXzouudm2uYoMSlAXHxMqERNfr31
         XngJ2SBD57b1g==
Date:   Sat, 10 Apr 2021 22:01:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ensure timely release of driver-allocated resources
Message-ID: <20210410200115.GB2471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <YFf1GFPephFxC0mC@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <YFf1GFPephFxC0mC@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 21, 2021 at 06:38:32PM -0700, Dmitry Torokhov wrote:
> More and more drivers rely on devres to manage their resources, however
> if bus' probe() and release() methods are not trivial and control some
> of resources as well (for example enable or disable clocks, or attach
> device to a power domain), we need to make sure that driver-allocated
> resources are released immediately after driver's remove() method
> returns, and not postponed until driver core gets around to releasing
> resources. To fix that we open a new devres group before calling
> driver's probe() and explicitly release it when we return from driver's
> remove().
>=20
> Tested-by: Jeff LaBundy <jeff@labundy.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied to for-next, thanks!


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmByBAsACgkQFA3kzBSg
KbauZxAAjcRBkdW4Lc0IijFOdj9xoz7//roNdrkOYFPdJyzUZVIXX3TT+n74ntJ7
UuXsvgyI2e3WF46rBzGU5tlueTmR1WCGFkBSMqWlNSIgm0uQgI4oQUGkOoD/kYq5
+qS/BsrHMH4eTbb9+j+c5VZ7lfgtPRtW7cr5IfpIn/XwAZHXx6WhkFg609gKoWN5
mEOdN548uWXpPbSljeyv8r3MTKTkbMzTTuTGg8XgMU0R7ese67F+ZXdBK2bt5DlN
ItdPZaEggKaldCaai08YYmSmCrlduCBPmI+pzqeVPA09Y+X7uxwu1xiuEK6AX416
Z935Wrv8khkFVUzixI/ZjVzRnit9d6rbyKsmz3qSo3AaR3ESSsVNG1mO5kIcq1U/
16siuNuKvnkohKUrkV2KVpypdf6pA6jZrRj5Gtbkpup0uPvzXovD1ptks9CHYC66
sWGc56Yw0VmVJFk6rdQpcmosDDhofbT4/oOFwxQXKgRVeLGgNYxcnlb9cbhTgCSG
u60OksrblDtqhF3Cy/CtAChuCdEn/HVy4BLiX8AGdVyoYleL8L1N4eA0MdMJtBz+
+i8LWZEcHEa54O3kp4ev4AA2LBddsOKt31D7yoSBSUURuWwyCfGNEC2Wn3/v25N8
wnGTWAOGq/9/bK1W4n0PxwAHZMEXhLGoj61A+INWCY+rRoGV3+s=
=rX4P
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
