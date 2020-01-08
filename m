Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A592C1343A9
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgAHNTc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:19:32 -0500
Received: from sauhun.de ([88.99.104.3]:34940 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgAHNTc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 08:19:32 -0500
Received: from localhost (p54B332C6.dip0.t-ipconnect.de [84.179.50.198])
        by pokefinder.org (Postfix) with ESMTPSA id 9DACA2C05CE;
        Wed,  8 Jan 2020 14:19:29 +0100 (CET)
Date:   Wed, 8 Jan 2020 14:19:29 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108131929.GA834@kunai>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <20200103001056.GJ4843@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > As I said to Laurent, too, I think the risk that a bus is not fully
> > > described is higher than a device which does not respond to a read_by=
te.
> > > In both cases, we would wrongly use an address in use.
>=20
> I don't fully agree with this, I think we shouldn't impose a penalty on
> every user because some device trees don't fully describe the hardware.

I haven't decided yet. However, my general preference is that for a
generic OS like Linux, saftey comes first, then performance. If you have
a fully described DT, then the overhead will be 1 read_byte transaction
per requested alias at probe time. We could talk about using quick_read
to half the overhead. You could even patch it away, if it is too much
for $customer.

> I think we should, at the very least, skip the probe and rely on DT if
> DT explicitly states that all used addresses are listed. We discussed a
> property to report addresses used by devices not described in DT, if
> that property is listed I would prefer trusting DT.

Yeah, we discussed this property and I have no intentions of dropping
it. I haven't though of including it into this series, but it probably
makes sense. We don't have to define much anyhow, just state what
already exists, I guess.

=46rom Documentation/devicetree/bindings/i2c/i2c-ocores.txt:

	dummy@60 {
		compatible =3D "dummy";
		reg =3D <0x60>;
	};

I think "dummy" is generic enough to be described in i2c.txt.


--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4V1twACgkQFA3kzBSg
KbbzSRAAiuALUdJOg3tKldF65q6HmHIJ6tCA7sLUgy3dPEw0kyKedtbIRFpiWDox
7bjYE3i6uOVxY2OLmLar8JKhnUHJUUjuVKkE7XLMMUtnt6cx/mlHdB77NGC/2sB0
WacCezXiESG4ZbKdRWhBW77/qpqbUgU6MJ9J1+I9oAWnvqGjVZyPLug09koutHZH
JJUa90lVok00aoWva8I6ZAG3b2zmyhi62u4gr+JIet4JptOhzwBIW3jYKvWZkDHe
+TGFxC2tnoXzhDfW8cRrrKgacZ4dOvRtLh4FtDokqTThX/MyNssL/JPn7jrMeYbZ
7sCy1u9AAo/QaU6+UsqyIEdVoG4vNGN9AbHeJHT+z8OfKAN9xpEcra+GLz3cDXC3
id+swyMCbe9iHADkLS3/d5E+7RX2OJARiKL3yff7DC/7KFMLHMpAlXewuigrt+uG
cxRw372i8GZT7nIl4g9reufXwLoSwXRi6hYpEHr8sov72um0SKmY68HGgrjOlnMM
tsrmZQOmSk4FhXJrsX6tXo8D/ExRty/w/g3n+KApzsNpAhLaeRlDr81lZPD76Jfw
BqSdcyvfOjAKJNb9ag3N+GIXUldeNIZE0HPwV6SZtcUPlbdOy7I8F4qKIiS6ni/N
bpp42rEZdntGbT2hA4GRgcIHdbprlSHlwgaPxjoD10BaLbtXJjM=
=NLtL
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
