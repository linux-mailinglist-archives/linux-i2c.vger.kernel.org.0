Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77DC518D4C0
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 17:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgCTQo7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 12:44:59 -0400
Received: from sauhun.de ([88.99.104.3]:50234 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbgCTQo7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 12:44:59 -0400
Received: from localhost (p54B33339.dip0.t-ipconnect.de [84.179.51.57])
        by pokefinder.org (Postfix) with ESMTPSA id 9347C2C08E7;
        Fri, 20 Mar 2020 17:44:57 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:44:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i2c: core: Allow override timing properties with 0
Message-ID: <20200320164454.GE1282@ninjato>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-2-andriy.shevchenko@linux.intel.com>
 <20200320144357.GA1282@ninjato>
 <20200320162326.GD1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline
In-Reply-To: <20200320162326.GD1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 06:23:26PM +0200, Andy Shevchenko wrote:
> On Fri, Mar 20, 2020 at 03:43:57PM +0100, Wolfram Sang wrote:
> >=20
> > > +	struct i2c_timings i2c_t =3D {0};
> >=20
> > Simply '... =3D { }'?
>=20
> I prefer C standard over GCC extension.

Okay. I don't care too much. But '{ 0 }' then, with kernel style spacing?


--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl508wIACgkQFA3kzBSg
KbbmRg//Sco4S9iCvJmETLTIjy/Q625xBjaTANmO3AxBDNYwPN54X5/9Tq3huFrO
AUkoU2SApyh+nQTXmsuBFhGtdKTtXcWkVmJYIUNbpxAd029luCK79ya9FMd0IfIU
6EPOXBXtat3hqEsASbbYSJQ2sAKhZwOG8EyL3En1RjMcuzzp2xZCI3bb6Vd55eLz
VDfXU8EFoQWuu+9WLp+ot02ZjlENxe32DjI7gaeU+VnZHGLlZm+GwdcmMG09cw5P
28xSeOoayZu0UuxOZfBn7a2ewifiVXByS0GxOww0/S/AlG3mqh45fZY2HBHp14li
RsjEhmzu2wekI4ZxbNM4PL9IHs6pg/INZIkgb//Tuejo6XZwuJ0GPZhih4Ogu8XT
NF2P9AYr6t8QHbT7Ft4y/44Yz1I+UJXKboRJ7qwAzIgPLtTouv3qjdBgG23r39cR
CJyYQFqVrqdhdrXeGguePjogvaUM6kx8154hsqbw8cs9o7rCCgoNX3jqIZqbQT8I
sh4FcJ2fPvClCd80qTSQT7NYyl1LxtWWGuLA5kNq5vu8gv0MW80KtqnLrIEyq4uy
W8hfjmcyCrc8F8QUlMGyIyMS9y3fZspJ8fkxzAOgR7NIaSxDopUw+bmYc60YDGlb
dDlV1medvx9CyB7fq8C+VszRYJZ8OfnOBgWf7pRreYNVqkOApCs=
=xd8B
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
