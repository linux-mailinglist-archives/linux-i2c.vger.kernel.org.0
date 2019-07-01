Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49E365BC02
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2019 14:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfGAMnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jul 2019 08:43:51 -0400
Received: from sauhun.de ([88.99.104.3]:55662 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726912AbfGAMnv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jul 2019 08:43:51 -0400
Received: from localhost (p54B3346F.dip0.t-ipconnect.de [84.179.52.111])
        by pokefinder.org (Postfix) with ESMTPSA id CEEF92C360B;
        Mon,  1 Jul 2019 14:43:48 +0200 (CEST)
Date:   Mon, 1 Jul 2019 14:43:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Eduardo Valentin <eduval@amazon.com>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@intel.com,
        brendanhiggins@google.com, Mark Rutland <mark.rutland@arm.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv7 1/3] dt-bindings: i2c: document bindings for
 i2c-slave-mqueue
Message-ID: <20190701124348.GB4399@kunai>
References: <20190605164651.15991-1-eduval@amazon.com>
 <20190605164651.15991-2-eduval@amazon.com>
 <20190611231425.GA29500@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <20190611231425.GA29500@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Device Tree for I2C slave message queue backend
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Some protocols over I2C/SMBus are designed for bi-directional transfer=
ring
> > +messages by using I2C Master Write protocol. This requires that both s=
ides
> > +of the communication have slave addresses.
>=20
> So the address 0x10 in the example below is the address of the I2C=20
> controller?

Yes.

> > +This I2C slave mqueue (message queue) is used to receive and queue
> > +messages from the remote i2c intelligent device; and it will add the t=
arget
> > +slave address (with R/W# bit is always 0) into the message at the firs=
t byte.
> > +
> > +Links
> > +----
> > +`Intelligent Platform Management Bus
> > +Communications Protocol Specification
> > +<https://www.intel.com/content/dam/www/public/us/en/documents/product-=
briefs/ipmp-spec-v1.0.pdf>`_
> > +
> > +`Management Component Transport Protocol (MCTP)
> > +SMBus/I2C Transport Binding Specification
> > +<https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_=
1.1.0.pdf>`_
> > +
> > +Required Properties:
> > +- compatible		: should be "i2c-slave-mqueue"
>=20
> There is no mention of mqueue (or queue) in these specs. Where does that=
=20
> come from? Perhaps something more closely matching the protocol would be=
=20
> better name.
>=20
> > +- reg			: slave address
> > +
> > +Example:
> > +
> > +i2c {
>=20
> Would there be other slaves?=20
>=20
> The common binding states 'multi-master' property should be present.=20
>=20
> I need a more complete example.

Ack. Either that or a bit more explanation, e.g. if sending
packets is planned from userspace?


--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0aAAQACgkQFA3kzBSg
KbZ/QBAAkSzIqB/uGF/Tr9iNOztFzpvwsxxTiilAetN7QxstgOe3e4oHtQkZ8AEP
/gqs+gGHoUip0F/0BEuG0CHeoRAx0zM86ZxK4vIWQUpbQIzGgdjZvR1Z0ktPOIQW
7FoNRcwKDadsEowvrMefwHs8fR4Z1qWAgxUEd7BkBFSQPu/SxguQII6xbk3wtoj5
iJmYb+X9z9Hv/IjsfDdGh6ExEg+8qFXGftw4ObFD755QjqmoqXwDMiTgv0JRqkHz
tiMZDoSLLYcSwHZ4t2wjAbnX3Ar05svdZCEnpELpV67QXQLlZqJ3CG+rMER6iadh
EI4u6h9LCBG6yM5dW1M9P6c3d50pZ4l9nz0YpeH0yDihX7t91S1h5hNQ6P9n+om1
pR3bcAln7p1TZnM+J4vNezxquA9JfizlPgtcjFyfQiaHAySN6qgQyGfrlhS7rl8P
DBRSKiFbAbzdZAva9YGBI8Mx7exoWTqxseantcRcyuj6hpeiFPekqJOClAdMOEAJ
OdVKP6csDLiD9teNyX264VZt0c8yr9C3a/LMSKB2xsGpm+y1bX/EkQBp/P7pt4oO
g9tuc2KQHfnbRBUJuxX1IBHKTT7IX6eopW1JgwAczMRV6hZ0CyhxS/vcqrRcdEm/
pOVOvz54R9FPmIey6auWqetueEXs1kXYuVwtn2f7KSRUIj7AYfQ=
=OoKw
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
