Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949A61324BF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 12:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbgAGLXO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 06:23:14 -0500
Received: from sauhun.de ([88.99.104.3]:49720 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726937AbgAGLXO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 06:23:14 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id 2DABC2C05BA;
        Tue,  7 Jan 2020 12:23:12 +0100 (CET)
Date:   Tue, 7 Jan 2020 12:23:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
Message-ID: <20200107112311.GC1135@ninjato>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
 <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
 <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com>
 <20200107102557.GA1135@ninjato>
 <CAMuHMdWM0PoqLuAP2qjCjejNQ8FaArnkAT0gnd96xp3yJKLE-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWM0PoqLuAP2qjCjejNQ8FaArnkAT0gnd96xp3yJKLE-A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > https://lore.kernel.org/lkml/20191121135743.GA552517@kroah.com/
> >
> > Huh? This renders WARN completely useless, or? If somebody wants panic
> > on warn, this person should get it?
>=20
> I also have my doubts...

Good to know :)

> What other information will you have in the backtrace, that you don't have
> available inside the function?
> Would printing the i2c_driver name be sufficient?

Yes, but we don't have the client struct, only the adapter and the
address:

+static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short ad=
dr,
+                           int (*probe)(struct i2c_adapter *adap, unsigned=
 short addr))

And even if we had the client struct, it would be empty because for most
cases scanning happens before binding to the driver. We don't even have
the name/type in case of i2c_detect().


--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4UahsACgkQFA3kzBSg
KbYoZQ/9E2SDltI/M1ZR4toIhkQlSB8Pa6YDImGRIhffCcZpYVPNmNArmeaIYCwG
7B0iqn+SCtjIjhB7rr0epvgESUE08NNHQ7rOEMS3uekcz8JvDUTdlj8XoBegN4sH
IBKxzXh6YNlcPbOpC0248ESGAIdkafcW+lH0L6qczbN9DWuXG+ntEI2d6ru5e3sl
ITBtfTqxbNiBWze2xWInmLzSth/b0kXM9SBay5y0TC3109Rd7zXVZjBKXt5tyF7y
eToUnRCszsiBzJUDect87mUTDSTxx8MZ90vDXijglC0NIZ1Dp+BxGyCvfusYDulU
L9eV/8VD+G+UJx+VGDFxqvCSBKpkfT8JZ05VXSFRnftoS8mqa0ztA4tArI+ls1lC
cH7UWrgeKjo7TXuZHD98sCKTJs5feflmFfBXF0dPvEhtoKWIbt05Cz8lkeIGGFUl
SGnM/Kc8ePLMLQz58PB4o/n8e7tIR2j932bIL6gXSXQZdfZlirFxDOMoSRH+nPdA
aOVw1YCEaEXY7BouS3G3bmKE+/fvoTnIej2/B/QwEBLzWT0KnurVcFvpl/gtgAR7
LJBqGqGRqy57cDmLYOse/TrHpbaHUBnnmAq4KZRQKS6pTgTHi4y32sQMSELpMdjZ
cXKX+aOH4SjILDpnwodRhSEYx1rpPxAdZcp2ACS5/gIEjFpt85s=
=l9Fb
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
