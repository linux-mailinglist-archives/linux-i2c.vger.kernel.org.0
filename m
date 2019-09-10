Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55E3AF056
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2019 19:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394223AbfIJRQe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Sep 2019 13:16:34 -0400
Received: from sauhun.de ([88.99.104.3]:50016 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387433AbfIJRQe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Sep 2019 13:16:34 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 1A4A42C0095;
        Tue, 10 Sep 2019 19:16:31 +0200 (CEST)
Date:   Tue, 10 Sep 2019 18:16:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Peter Rosin <peda@axentia.se>, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Message-ID: <20190910171629.GA5581@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <aedad45b-16d6-d189-b045-329727440ca5@mleia.com>
 <20190909072232.GA990@kunai>
 <8af9a049-06b9-dbe8-827b-5134d20e9435@mleia.com>
 <152384b8-c0a8-e6fe-9a1f-52caf00533de@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <152384b8-c0a8-e6fe-9a1f-52caf00533de@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Here i2c-0 is the "local" bus, i2c-4 and i2c-5 are the remote busses on
> ports 0 and 1. As you can see the eeproms are accessed using a name like
> "4-0050", meaning physical slave address 0x50 on bus 4. No alias is neede=
d.
>=20
> Should you want to know the alias, perhaps for debugging (it's the
> address you'll see on your logic analyzer), they are shown in the kernel
> log.

And to add to that: The aliases on i2c-0 will be marked busy and show up
as used if you run i2cdetect. So, you'd need a force-flag if you'd want
to access them from userspace.


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl132mkACgkQFA3kzBSg
KbY7KA//dTGgRdQZxIRRuFmdxhZR6aCLbnLiEuCcMagiQ2aa/EP1vhN8qPrUaucL
Jf+XXPeFbx9q1ycOa/tOuI7CZbK9jXKDfMPQtP/gTx3MuHzv4MlHgTIWpEm8YMfr
CgblrDzIKZqaeR3PGdu7AD6gSWDorwh/Rq4tt8hxqVi+KMiXgQBjiQFb2F5h2g5z
nKjONcRnItlAnieSUnnzYzEs5jtLTHfaioMpAyrVXVRBr1uvRsQAxqUvN7bV+ThA
mwmJfUOCrNf6gk596ug3SrHow7rgZxaNds6kEqiSY7Kib9MEfvkUj8q9yfBz8wCk
YB052AdefuREt64vShJtmgbSjj+wRvBNkTB+/fdZptFL6CxORGhw+GKgkQnssqyQ
W0Arjte++VEG3jGMtCx7I4GxDOdp2FqjSnBHDW9u1piPYBZOaxMeknBLhrrxiyfa
Vrr3ZRgKTdz+70h1lQsQ5udADUxq6DhhGfoouGDlvk1JP6aLMXUr7PSNpjpYpZ0V
N4qx2eJMRLkYrcNbbyDe+GWwFp3b1j859nk0jmi5M2zDTkqVji11DBkb0p1zrT1j
7pvW9Us/V2i1jCLBHED2CSSQIaBs8StDnkPFvbeezoCUDxDeBz7ePDXO2asDYu9+
jWDqFrb/qOTkZZdhvcurGUF3lL1SEgLR6gvWutjx1B5hQTHTE8g=
=vLj2
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
