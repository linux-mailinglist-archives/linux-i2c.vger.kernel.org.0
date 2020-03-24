Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51A6190BC5
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 12:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgCXLB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 07:01:26 -0400
Received: from sauhun.de ([88.99.104.3]:49164 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727455AbgCXLBY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 07:01:24 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 3CDE72C08EF;
        Tue, 24 Mar 2020 12:01:23 +0100 (CET)
Date:   Tue, 24 Mar 2020 12:01:22 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, sean@mess.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: A bit confused on i2c communication between modules
Message-ID: <20200324110122.GG1134@ninjato>
References: <55204992-9060-6008-31c7-c2855f712e70@gmail.com>
 <20200324082236.2c4d2ae4@coco.lan>
 <bc91be3d-802c-a58c-bd27-740e15516180@ideasonboard.com>
 <20200324095810.GC1134@ninjato>
 <63742e62-d0b6-9d7a-b491-d7969f8ea7e2@ideasonboard.com>
 <20200324102704.GD1134@ninjato>
 <7d82a76f-5165-5e7c-bcde-552f527da0d2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline
In-Reply-To: <7d82a76f-5165-5e7c-bcde-552f527da0d2@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:49:55AM +0000, Kieran Bingham wrote:
> +cc: linux-i2c@vger.kernel.org
> Moving /this/ to the linux-i2c list ;-)
>=20
> Thanks Wolfram,
>=20
> On 24/03/2020 10:27, Wolfram Sang wrote:
> >=20
> >> Maybe we should have a whole virtual I2C bus for virtual devices :-)
> >>
> >> (Hrm, that started out as a joke, and now I'm not sure if it's a real
> >> option or not...)
> >=20
> > Just one final thought: I think this is actually the best option. Zero
> > chance of address collisions (which could happen if you have a not
> > perfectly-described real HW bus). No RPM mangling of real and virtual
> > devices. A clear seperation what is real and what is virtual. Plus, you
> > can implement it right away, no need to wait for the dynamic address
> > assignment.
>=20
> Agreed - even better all round! But I presume we don't yet have a
> 'virtual' i2c bus? So it's a patch-set to do first? Or is it already
> feasible?

=46rom what I understand, you won't need an API for that. What I
understand:

There will be a master device (a DVB or something). This will register
its own i2c_adapter with a dummy .xfer callback. The sub-devices will be
i2c_clients, then. I don't know how you want communication between
those. Maybe the .xfer callback will need to do some message parsing?


--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl556IIACgkQFA3kzBSg
Kbbh4g/+KPuDQYNNYUVKgy7H5CEvmsbci2DhZjh6rAOv9AHlVxiU25wo7PYeb1aL
CO3b2IUVGkz1N4Z1V57lTxwfkL54Jq35mTt5DITQwB8u71cKmmTLZKsez3TIR61x
70sHXcgdYKzvMX6WI0QdoDbqjPLVHLZfMD0Igj3Gx6DXx03PlUlcq5XLbiMY5yPe
ssKqGhONe8DDUbcNU1O7Av22EmlTCZdw9IOX8EdygRuttFXLxlYfcN61HvknrJWQ
/e4UQjh6FDd7v03ShiVaEg5uENLvlUd3ewPnALWaE99at6BazX16vfACws43nLHi
NO+B5MTbEY2vcsktxi3LNzJRQRVjfJcNTHN4ZP+M2YjcqMl41zpsVs0CGq+vToQm
ShA78aio7gmRXiDQlSRf6bC3xCHq4A1Oxw0s3mlDa0rnenVi/plEexwSex+YgSit
3dtNb/UJKSuUgwMfhMDweXm6wP27Vp1zA5c7Ruuhir60RhlrdAsT3h72J8Zbo03Y
0AWBGgXonThOtrNqPLVSfR64ZnjjFBcDRtvk+yY747qKpziRjy+AqsWSJzGX/fuv
izw9KniEsdcjMrNDgaJz3qCoij/U8Foeo1BuwBtcdqsexgthBkAbh8AqNsTEaAgt
VoZWBxWH02VbaZs8rjcOF69YKexkDsXZlztOl7osPhstX4tqWGo=
=hEhi
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
