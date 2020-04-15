Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A511A9A75
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405945AbgDOK2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:28:41 -0400
Received: from sauhun.de ([88.99.104.3]:51858 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408616AbgDOK2d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 06:28:33 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 67FD02C1FF1;
        Wed, 15 Apr 2020 12:28:24 +0200 (CEST)
Date:   Wed, 15 Apr 2020 12:28:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Adam Honse <calcprogrammer1@gmail.com>
Cc:     jdelvare@suse.de, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Detect secondary SMBus controller on AMD AM4
 chipsets
Message-ID: <20200415102823.GI1141@ninjato>
References: <20200410204843.3856-1-calcprogrammer1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CD/aTaZybdUisKIc"
Content-Disposition: inline
In-Reply-To: <20200410204843.3856-1-calcprogrammer1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CD/aTaZybdUisKIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 03:48:44PM -0500, Adam Honse wrote:
> The AMD X370 and other AM4 chipsets (A/B/X 3/4/5 parts) and Threadripper =
equivalents have a secondary SMBus controller at I/O port address 0x0B20.  =
This bus is used by several manufacturers to control motherboard RGB lighti=
ng via embedded controllers.  I have been using this bus in my OpenRGB proj=
ect to control the Aura RGB on many motherboards and ASRock also uses this =
bus for their Polychrome RGB controller.
>=20
> See this kernel bug report: https://bugzilla.kernel.org/show_bug.cgi?id=
=3D202587
>=20
> I am not aware of any CZ-compatible platforms which do not have the secon=
d SMBus channel.  All of AMD's AM4- and Threadripper- series chipsets that =
OpenRGB users have tested appear to have this secondary bus.  I also notice=
d this secondary bus is present on older AMD platforms including my FM1 hom=
e server.
>=20
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
>=20

Reformatted the patch description, added Sebastians tags and applied to
for-next, thanks!


--CD/aTaZybdUisKIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W4ccACgkQFA3kzBSg
KbaKZw//eHfOiu4gIuuWMDcPzWEcRPPuLWH5/f/7ytR74JLO9Ckps9zb5LfmlTsl
NbrxLPKLigODkhhj3r/opkNAeRcROnYlXkEyJDUiGoMfPohzbo/t5LNHM7tBQxm9
JKAn+O8l7ju0bnButE6O2ziS8SZgM0fnT2sC0x4P27uGPCjBayvNGP3TpPyzlwht
Ez21ezIh8Jt/ugYvMKq4lix4Uyk7qW5W0fwXm1OOYMMpjwaLuP2dO2QQC7Tf7T5k
mDITw7t4ICLZX9oY+fOWBIf6rWHKsdFCI0wOrKP+lpGRHH2C4eGPgOlexcsCrETv
NN17Ptyj/TrsCKbGz9VeGssrrrOgK/BEof0myT5uG1G/4clLU6QRv10O5hmo8WOO
l0DG0RzlQIsnjmWJOF0wZSBpQDbFe5Oa9Td7v2QjShZykJmV5FBnMookFqBof0j2
ngVjjxADUEzlFI/VsZWZWeWUmlFI0N18gaWTQ0EONZk9OeU7czFGOmsjR9rDDFJH
C40kMOvYJ1WUiinpNqmwAt0Ma6l3LfXSQbE9bdiH0+jnoXhRSeexGFWt9+25UH68
cm31m/xDJzjUmwA2oaPKUUIzFDbFHHA+I+ii900/DO4U88kFr6803y+7xECtpKQI
WVMl85kd0Uu3xLGI/FBCi4qoFU9dReco2HZpy4xJketHBVoPPSs=
=4vKg
-----END PGP SIGNATURE-----

--CD/aTaZybdUisKIc--
