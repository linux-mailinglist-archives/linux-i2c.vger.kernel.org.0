Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0576B1343D0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgAHN1M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:27:12 -0500
Received: from sauhun.de ([88.99.104.3]:35074 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgAHN1K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 08:27:10 -0500
Received: from localhost (p54B332C6.dip0.t-ipconnect.de [84.179.50.198])
        by pokefinder.org (Postfix) with ESMTPSA id D6CE02C05CE;
        Wed,  8 Jan 2020 14:27:08 +0100 (CET)
Date:   Wed, 8 Jan 2020 14:27:08 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108132708.GC834@kunai>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
 <20200107171357.GO4871@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline
In-Reply-To: <20200107171357.GO4871@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > It would be nice, but I'm not sure this is really doable. Say the DT for
> > board X lists all the used slave addresses. Then the kernel would assume
> > all the other addresses are available. But then somebody includes the DT
> > of board X in the DT for product Z, based on board X + add-on board Y.
> > Add-on board Y has 2 I2C chips, but only one is described in DT. Now the
> > kernel still thinks it knows all the used address, but this is wrong.
>=20
> That's the fault of the system integrator though. We can't prevent
> people from making incorrect DT, and we shouldn't go to great length to
> still support them.

Currently, there is no paradigm that all I2C busses must be fully
described. Enforcing it now all of a sudden is not too user-friendly,
or? Especially since calling read_byte once is not necessarily "great
length" in my book. If you have 8 cameras on a 400kHz bus, the 8 * 18
bits should take 360us if I am not mistaken?


--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4V2KwACgkQFA3kzBSg
KbYc6A//clREGfV+3ngdxoXUQHbE1cQlQ7+nwFe1i7Iu7YFPVHS5qJ/+YmA8/HPS
qNlHZlQJUCUrCuarIpHScSWzlOkJAr76K+u6WT5hVHkzSxP7NLIGRLdM35xwhDxe
G0kFrc94Nb0HpaKJfE9l4chECaTl7e0iJ8vV/aSfzS+ftZOTRAIJDxDjDCezjvvC
HojYRv58dS/6tySa4le95Zy7bG1VVyAZixmhT6I8IX+wRsr63VAsOQggda+Z73dz
MnC2KpBodyIj4e8yYHQbeXCR/VDti1waZvLgJL3htnfGnFuO5syyAUmgRy5hVDcy
Vq3apMlUkI6i3NCpYMrww/MZTSlp4jw7lF1W4Y9ZMUFzeWWxfGO9TiFcXxIF5jly
skdTI2e3+A+W34mOMLQ28zlZ2C1TRPnI/beZ62bkjDAE/hTSmwSDAvt8+zf17+N1
pV3bimDQLSGKkQIsAwgpCUiLml0ZEioYioMD6L/uSM3DMlBvGi7ySgF97NCzXhqf
IWeRjDRO/JDwvgC5JxBjnk3qtD/815g9b2eGtMhtfGqsGm6qIbgEV33ZrjkW0QOp
JwpoEWtK/NZJ5N7PAgYPd3Im6DP1NoCh7sNShU4TVaqIcjltac9jDAZ5MtmWCA79
bT6RKumFoNUG9N5gN5W7oXmi06A9ieBab4sipKY7lzhEl/3sAIQ=
=L83f
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
