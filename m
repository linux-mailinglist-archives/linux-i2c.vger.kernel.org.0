Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70769344C0
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 12:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfFDKvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 06:51:07 -0400
Received: from sauhun.de ([88.99.104.3]:45604 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727242AbfFDKvH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 06:51:07 -0400
Received: from localhost (p5486CF7A.dip0.t-ipconnect.de [84.134.207.122])
        by pokefinder.org (Postfix) with ESMTPSA id 6F6053E43B3;
        Tue,  4 Jun 2019 12:51:03 +0200 (CEST)
Date:   Tue, 4 Jun 2019 12:51:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Message-ID: <20190604105103.GA3598@kunai>
References: <20190506105746.16397-1-sr@denx.de>
 <20190603200139.GA2383@kunai>
 <702927e9-6821-8241-6839-3ea248d2a9ab@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <702927e9-6821-8241-6839-3ea248d2a9ab@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> > ... and this into the for-loop? I'd think it is a tad more readable, but
> > it is a minor nit.
>=20
> Do you mean this way:
>=20
> 		for (len =3D pmsg->len; len > 0; len -=3D 8, j +=3D 8) {
>=20
> ?

with 'j =3D 0' added, yes.

> > > +
> > > +static const struct i2c_algorithm mtk_i2c_algo =3D {
> > > +	.master_xfer	=3D mtk_i2c_master_xfer,
> > > +	.functionality	=3D mtk_i2c_func,
> > > +};
> > > +
> > > +static const struct of_device_id i2c_mtk_dt_ids[] =3D {
> > > +	{ .compatible =3D "mediatek,mt7621-i2c" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, i2c_mtk_dt_ids);
> > > +
> > > +static void mtk_i2c_init(struct mtk_i2c *i2c)
> > > +{
> > > +	i2c->clk_div =3D 40000000 / i2c->cur_clk - 1;
> >=20
> > What is 40000000? Maybe a define for this magic value?
>=20
> Seems to be the clock input frequency. I'll add a define.

Ah, I got confused because I thought cur_clk was the input clock and did
not double check. Renaming 'cur_clk' to 'bus_clk' or better
'bus_freq' seems like a good idea?

> > And no protection if cur_clk is 1 and thus the divider is 0!
>=20
> The divisor is "cur_clk" and not "(cur_clk - 1)".

Uhm, yes :)

> > > +	adap->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
> >=20
> > Why do you want the classes?
>=20
> No idea, sorry. I have no clue what the intention of the original
> authors might have been. Perhaps just some copy-and-paste? SPD is
> very unlikely as there surely are no DIMM's installed on any
> MT76xx platforms.

Then remove it. This is to *limit* potential clients and I don't see a
reason why to limit here. I guess you want to allow all.

> Many thanks for the review. Very much appreciated.

You are welcome. Thanks for keeping at it.

Kind regards,

   Wolfram


--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz2TRMACgkQFA3kzBSg
KbYBvQ//emDViqXqerBhOrkFCEBkqCUA8ycaFZKthVMKQrchzRdAnBHInMOvr8Zn
ac8P/vZ0WPJoC+eglsuhPBFOWo6Vg5Vui3DYI1UUPoPzw960LmURDWxw32y+wSmT
LDjQrBVUoN9SzSzzLhyD5CqdTXnAUkouChIhLkK+hvaRTS7nhfzFwS3ZHnIUy0VV
hRQ3ZIW9ponLRaRA/7o/s2oZtNnf/jkX9Pp8hSbcOdh0ITkeGGMw/dOXg+q+KRGO
AjryOqk7a9VEeloVk48prCMbCX91ca2zjh2WihUPcu8w3i86f+cdCz3gfYEqrWiD
uOEV5KrTp8VHmFQam1mxNphUqOrGQnZdZiEswoN6pXZo+1qSM6gGItiItwHm9bU9
14dmPcRk0VGpYRgRvAuiFFawWPTTEqy1Efr9p95Ufq7SrJE+aJjYAtdvcNXZS9y8
I6WyH/LTDc90O5IdAynbmP0yRiGNpQbgNw/tuJ1MUfiG9VjRufYfnV+MnftT4dkE
csYvDmsW/timg2K72yuAoBG7KiN0OVvWDvo0eBo5qDX85nC2lSZAt15BbFSsGobJ
xg6uDx3vjI3J8vNRbGHiRAkxyf43kUuHBy/jrQS83P2GSBKB4MN/eKizvfKkwDAw
NA4Yxy6jSxz2F0S4DOEN+q9aIDNnwZ91bjzyX9c+obi8FWz3h2I=
=BbXt
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
