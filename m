Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A994F209A2F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 08:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390058AbgFYG7v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 02:59:51 -0400
Received: from sauhun.de ([88.99.104.3]:42214 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389958AbgFYG7u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jun 2020 02:59:50 -0400
Received: from localhost (p54b332a0.dip0.t-ipconnect.de [84.179.50.160])
        by pokefinder.org (Postfix) with ESMTPSA id 402892C207C;
        Thu, 25 Jun 2020 08:59:48 +0200 (CEST)
Date:   Thu, 25 Jun 2020 08:59:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200625065944.GA970@ninjato>
References: <20200618150532.2923-1-uli+renesas@fpond.eu>
 <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
 <CAMuHMdVcfE9MRB-wh6Op-Juhhd1XG4vmf4eVNhBcUvQs1Zz8AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcfE9MRB-wh6Op-Juhhd1XG4vmf4eVNhBcUvQs1Zz8AA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> >     static inline bool i2c_in_atomic_xfer_mode(void)
> >     {
> >             return system_state > SYSTEM_RUNNING && irqs_disabled();
>=20
> So i2c atomic transfers are really meant to be used during late system su=
spend
> only, and not in atomic context before, when irqs_disabled() is true?

Yes. It is all some time ago, I recall we agreed that there shouldn't be
any other I2C communication at irqs_disabled() stage.

> Perhaps we need a checker config option, to make sure the atomic transfer
> operation is exercised at least once during boot?

Testing I2C controllers (in various ways) is a well-desired feature :/

> Do we need a way to let i2c slaves indicate they plan to use atomic
> transfers later, so the i2c core can keep the i2c controller resumed?

I wanted to have this originally, but in the end I gave up on it. IIRC,
you don't want to whitelist a client in general, but only the very late
messages it sends. However, if a message needs to be flagged may be
board specific. It all looked messy and hard to configure, so we ended
up with what we have now.

Take all this with a grain of salt, it's been a while since the
discussions happened.

All the best,

   Wolfram


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl70S1wACgkQFA3kzBSg
KbbdGg/8Dt9j40yNf6J0A+TjXQsMmu6/Tkl95p1zg8RMljLbQMYtg+aXpsaYWz2+
jqHMjegg9nlcQLaf+QgjrOVZ1cdIT71gJ97nzWuBoOKpht5q8FpbRHxqsRVioQ1j
RULLfd1Lzhagq/bRl2zHEc8NRcs2uRaz7FPAWy3XOwyz7D6K6Zput5wVkdrir63G
G6bc8fNr9suxAgVUIPJLUZ5Y8gwJkTfqsFqBdQKUyCHbUo9v4ewPxcI2Il2bbWoy
AwhIuZkEvQsejtjVeGgxrPotKdgYVYb0wrbJd0KCrLN0QIeNwViHih0y6ej+YzX2
aq0cL6h6rbgCfCl6HTgqzPp7CdOeqAwVLBGXVOPcclrBxKVGwX0iWT9P0MA9Tsmv
Nw0kJoPoD3KfgvCmP0Dkt7mXc65c9uvvxD/f7UFXBu+YdskoM9vTOARD7OSRRXPl
KQfXas8DePhvwLPSvtyCCId7o6xP7dv7ag3UUT2nsUHsjoAEUrNkUQQxaRuMp682
mO3hfFJW80DDIb/8oOo1Mu3LG3bMcLqdE7u1eADTqtDGuJR1/sLkYcQqlghLqaG4
Lxv7KS/DW7VaslfVX/+8syf3NPYrIBmIUweuJhQg5E0x2H+0ZcLf2qvKynX/lS64
UJ+TThjClnE23wYSzFN53Vo31h/WwXusIAf3kYPeczyZOVs3oik=
=IBUl
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
