Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D7E1D4768
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 09:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgEOHxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 03:53:13 -0400
Received: from sauhun.de ([88.99.104.3]:32928 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbgEOHxN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 03:53:13 -0400
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
        by pokefinder.org (Postfix) with ESMTPSA id 371972C1F6B;
        Fri, 15 May 2020 09:53:10 +0200 (CEST)
Date:   Fri, 15 May 2020 09:53:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?Q?Adamski=2C_Krzysztof_=28Nokia_-_PL=2FWroc=C5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Cc:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Two separate i2c transfers
Message-ID: <20200515075303.GA1083@ninjato>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> A diagram might be good indeed as it seems to be hard to explain. I don't=
 use two masters from one Linux, both masters
> are own two separate, independent systems and each of them needs access t=
o the target device. BMS is a commonly
> available chip - PCA9641 2-channel I2C-bus master arbiter but the problem=
 is not related to any specific arbitrator
> device. The target device is also a physical commonly available chip and =
it is designed in a way that the operation we
> are performing might not be interrupted by other transfers except reading=
 status register. The arbitrator device is
> there to temporary block access from the other system if the first one is=
 doing its transactions so it gives us a
> possibility to do a mutex lock on the bus.
>=20
> Here's my try to draw this, hopefully this clears things up:
>=20
>                           +---------------+
>                           | Target device |
>                           +---------------+
>                                   |
>                       +-----+-----|----+------+
>                       |     | Upstream |      |
>                       |     +----------+      |
>                       |   Bus Master Arbiter  |
>                       |       PCA9641         |
>                       |    +---+   +---+      |
>                       |    |Ch0|   |Ch1|      |
>                       +----+---+---+---+------+
>                                |   |
> +--------------------------+   |   |   +--------------------------+
> | System 1   +------------+|   |   |   |+------------+  System 2  |
> |            | I2C Master |+---+   +---+| I2C Master |            |
> |            +------------+|           |+------------+            |
> |            +-----+       |           |       +-----+            |
> |            | CPU |       |           |       | CPU |            |
> |            +-----+       |           |       +-----+            |
> +--------------------------+           +--------------------------+
>=20
> I was thinking that maybe a lock like this could be expressed by i2c_lock=
_bus with some special flag that would make
> sure no deselect is called in i2c_mux_master_xfer() (and would be ignored=
 if our parent is not an arbiter)? We already
> have the I2C_MUX_ARBITRATOR flag and the i2c_mux_core does have an arbitr=
ator bool so it is just a matter of allowing to
> do this kind of deeper lock on the bus.

Thanks for this explanation. Much more clear to me now.

However, Peter might have way more insight than me because he was
already working on PCA9641 driver a year ago and I don't know how the
arbitration was designed there.

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D95793

(Do you use this driver or a custom one?)

I'd think that the PCA9641 driver should return -EBUSY if another master
is active, so we'd have the lock on that level. But I may be totally
missing some detail here.


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+SlsACgkQFA3kzBSg
KbbhTA//XO2kcWl8VkDImjJTWrkthS6TrLH/idlJQt1TYSB6aj8XZmjvHfY6JkiJ
9BHs7vcGQ2J3JEwwogP8ilcU53Ad18ec7uQ3BZusAnZZbbkfCbmH307ar5Ycsspb
j8k1dmCZBbikCFaEUKSKhY/uMkk4BxheI9PAE0pbg93haNzucpw8pF6Tk0ihx/cO
P1zj8LWY2U/H0MoXeOT9J45CP61s7J0NVYNwsu9DsZ0/qmPgoLbhPVP6jmIRsOvc
7vDpMithe3/7Qe8ei7oapEiWSGBuE1rlL1l6s2M+m9J60KWuJnU0HpTeCEt/r7M6
O/repXd/aVmE62FcL8jresgRDlWVNK0vBRuO4un+C06ECyRWIBXxkYMSfagzH37G
L7ch4FBvjcweBiBxLifLgUpt/hQ4z5mOrtpOsrAKXb036n5JogqozLoA7V5s/GqP
8FL5p0bb2viN03krpL1PyhAWifVZ6WyfPQlYP0ofSdAxxM4y9vhf3WPm6Ck/LKVP
TfdHos85BZFPAvBip1QcFNmDcE8W5fXu/e7ZTngwcyW/fdcY7wI+ZCO5HTCDQYGP
Ae2mkf7d0riE1eivydnPE3RPHuhZGPkKSg1SRXw6iPNaVDZz3PGaygJRanCz2uz/
zHzB9EAJGOOiBKX1muDTKdF6Pz/NYTlGQNUZ0ktu42B67ffGblE=
=/A6s
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
