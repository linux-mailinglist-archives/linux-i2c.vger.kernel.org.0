Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B076619AE31
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 16:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733138AbgDAOmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 10:42:02 -0400
Received: from sauhun.de ([88.99.104.3]:57822 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733083AbgDAOmB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Apr 2020 10:42:01 -0400
Received: from localhost (p54B33220.dip0.t-ipconnect.de [84.179.50.32])
        by pokefinder.org (Postfix) with ESMTPSA id F04C62C1EEC;
        Wed,  1 Apr 2020 16:41:59 +0200 (CEST)
Date:   Wed, 1 Apr 2020 16:41:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
Message-ID: <20200401143254.GA2409@ninjato>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
 <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <AM0PR06MB5185E501349E06428093B62FD4F70@AM0PR06MB5185.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The multi-master -binding is documented here as boolean and encodes a
> Boolean by either existing or not existing in device tree. It is also
> used in other drivers so I couldn't do much about it missing meaning
> False.
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/i2c/i2c.txt
> I originally had a custom device tree entry where the default was for
> multi-master to be enabled before I noticed the pre-existing binding.
>=20
> Maybe if the multi-master binding was changed from Boolean to for
> example a string property (multi-master =3D "ON" / multi-master =3D
> "OFF"), code could still just check the existence with
> "of_property_read_bool()" first, where property missing means "OFF"
> and property existing means "ON"(like before) if there is no text
> associated. Xiic driver would then only disable multimaster, if device
> tree explicitly contains multi-master =3D "OFF".
>=20
> This should be able to maintain driver backwards compatibility with
> old device trees, but requires binding documentation change and all
> drivers should likely be updated to also accept the new style of
> multi-master property to be consistent. This is also not as clean as
> the old Boolean property in my opinion.

I agree. I don't want to change the old "multi-master" binding like
above because that would be quite intrusive for other drivers and
confusing when trying to understand the binding.

My best bet is to introduce another binding "single-master" which says
clearly that we are the only bus master on that bus.

Both bindings missing means then "unclear".

I think this matches reality best.

Opinions?


--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6EqDcACgkQFA3kzBSg
KbbF6g//ca5Zr0fqlMxxbB0GPUdCqBey97V9YduvQi9tCkt5ufyg12ypS3iSTUFq
v/0+sDd2J7zidl4TXfwlMrn7fiWOHENsJLX++78dSK1o+d1nx4MXpgBDhQaOu3+q
MjAspDeQPquTY4wPbMQCprVkDhTpSANRUvTwD5FdTmOJt+YA8luySNaWL/nQmWKj
8UqAQyn1vgmNWaAv1ch1jr8+vuE+YV+i4opSd3wEQcXXEy3v0hYNSONyFf1WlRul
T1ITLRaVBgY9uJNhIbqfi/khS3VV/Mtp/GIaGHgl+vkGtf0Uv3cLvednYmNUP/lx
y0PcaIXobivy6iKHNpIUJ0J8Xi2aL5d0VSABBrHuqi3GoOQM6hfkbOqhxHb4QgYS
RMfhUAYztM/AdHcss5xb/oC3hPCZgzqPQg1rxDI+IGOOQoJfx+3vpM/fpp4oqCKJ
fwSxC0rF2OQsWXCc9rIRyuvVrKaXfAE43uysyATYC6zMPTH+fmd8trREk2W7nitF
xxD+7UypFDmSZlhZf1v9csUIeWve/gjjvhvtnYlTJHc1bC62dpc/6UR+6NEtEM+0
F5Tttow5S+jwY36zJwIkFrhmqsgpPPrUWEYPSXAdgb30B5VMRaMcwMGkYUaVOGBn
ue2kmuU3euXXpBMjbAObF6bRfuwq7ce0Hqg47NGJQj0lvlJc1AY=
=LbAj
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
