Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED2745D51
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 15:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfFNNAv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 09:00:51 -0400
Received: from sauhun.de ([88.99.104.3]:53146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727654AbfFNNAv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 09:00:51 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id 942252CF690;
        Fri, 14 Jun 2019 15:00:49 +0200 (CEST)
Date:   Fri, 14 Jun 2019 15:00:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Francois Cartegnie <fcvlcdev@free.fr>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] decode-dimms: display MAC from DDR3 SPD
Message-ID: <20190614130043.GA2831@kunai>
References: <20190614125814.22260-1-fcvlcdev@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20190614125814.22260-1-fcvlcdev@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 02:58:14PM +0200, Francois Cartegnie wrote:
> JEDEC Standard No. 21-C, Annex K, Release 6
>=20
> Byte 41 is specified, the lower part containing
> the MAC value, identical as DDR4.

Adding Jean (the maintainer to CC)...

> ---
>  eeprom/decode-dimms | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/eeprom/decode-dimms b/eeprom/decode-dimms
> index b976442..2c33f0b 100755
> --- a/eeprom/decode-dimms
> +++ b/eeprom/decode-dimms
> @@ -1703,6 +1703,12 @@ sub decode_ddr3_sdram($)
>  		tns3($bytes->[27] * $mtb));
>  	printl("Minimum Four Activate Window Delay (tFAW)",
>  		tns3(((($bytes->[28] & 15) << 8) + $bytes->[29]) * $mtb));
> +# other information
> +        my @mac =3D ("Untested",
> +                   "700 K", "600 K", "500 K", "400 K", "300 K", "200 K",
> +                   undef, "Unlimited");
> +        my $mac =3D $bytes->[41] & 0x0f;
> +        printl_cond(defined $mac[$mac], "Maximum Active Count (MAC)", $m=
ac[$mac]);
> =20
>  # miscellaneous stuff
>  	prints("Optional Features");
> --=20
> 2.20.1
>=20

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0DmncACgkQFA3kzBSg
Kbayqw/9H6tO4zMVYqcPYyKMZvLgKfk3lc5OsmweU9IZn0PEqsB6FvNSGT49WipJ
MWZ0C99zBifBJCa1LvyJLQYvmcqSKhlv9aCrEtNbL+eF3QjIMK602EosygrP8Dvj
pR1ibINOWwbQoqV4ALPJlt9z6ryUxVUtmosRpDpupi8+rqLky4sPMub4Uy0RRRLA
Y5kvsTx4aTqWNdBnNZPCJYlDghn+bToFG+1VB5RPovyoIuNXZ8YaD6QPeGBAifFO
cqVQHZQjUum6Xhc1h1RMKk5E2nZdh1evPotPBIVVhMFTBu6zWwYsUYwt+BuzpKLu
Gv53VUcvpJwY+otqTPUd9jyuelBZlSkaJqOxwb5agjVb/6kKc4SsBadjXA4bIkVX
JIX/b9eykmmaPIzvJpGWgHF7OmfRa519OJBWtReQRJv3ntXGt9NEJE2wGwyRzApP
Pfcg142r4LiHIYHQAiqwpkVdUOrP3vx6h8njABEU1tj9EwrpGcNLg0T+4duRZ/M0
9T17WPwunwyVEdWEVbGkuGq+cXgELjxu5T3Qq+N5u/IrWI7h0d/KEmNyI8vWwQ5y
nBabNvQG9h9ednANln0d304BwdvJIZxcnOF/f6VFTQ/egZBgpXcpG4Bg2fBG9EnM
E6MMRwZHZ6NteHRaOPCm746McGzX3u63zIceG2LlQuJxTitryCY=
=jVUR
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
