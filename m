Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066F2252DB9
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 14:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbgHZMFR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 08:05:17 -0400
Received: from sauhun.de ([88.99.104.3]:59392 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729683AbgHZMFM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 08:05:12 -0400
Received: from localhost (p54b33436.dip0.t-ipconnect.de [84.179.52.54])
        by pokefinder.org (Postfix) with ESMTPSA id 097D02C0829;
        Wed, 26 Aug 2020 14:05:08 +0200 (CEST)
Date:   Wed, 26 Aug 2020 14:05:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Message-ID: <20200826120506.GD1081@ninjato>
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
 <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
 <20200825132427.GB991@kunai>
 <AM0PR06MB51855B0C24B5D1F938A9C18ED4540@AM0PR06MB5185.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Content-Disposition: inline
In-Reply-To: <AM0PR06MB51855B0C24B5D1F938A9C18ED4540@AM0PR06MB5185.eurprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jaako,

> > You could even initiate a recovery procedure if it is a device pulling
> > SDA low.
>=20
> In the case we actually observed xiic got permanently stuck, when I2C bus
> was temporarily and indirectly affected by external voltage pulse. This c=
an
> happen in single-master or multi-master bus. It does seem that no extra
> recovery behavior is needed in this case. If we are able to determine tha=
t bus
> is not actually busy, we can start using it. Indicating that bus is singl=
e-master
> was a handy way to determine that. This issue was bad for us because
> even if SDA was not grounded anymore, bus was still indicated to be busy =
by
> FPGA register and driver would not continue.

Okay, it was just a suggestion, definately not something I will require
to be added in this patch. Your reasoning makes sense to me.

> In multi-master case you would need some kind of timeout after which bus
> bus_is_busy is ignored and recovery attempted. This is ugly since it woul=
d be
> a non-standard behavior and intrusive to other masters on bus.

Yes, this is an issue. My best bet is to use the adapter->timeout value
for that because it is configurable and already used as kind-of I2C
timeout otherwise as well.

> In single-master case, if some slave device on bus would spontaneously
> pull SDA to ground when clock line is not pulsed, bus_is_busy could be tr=
iggered.
> In this case we could attempt some kind of recovery behavior. I guess thi=
s often
> means attempting to pulse the clock line to get the slave to release SDA.

Yes, as defined in the I2C specification even.

> In my knowledge pulsing the clock line can help if slave device on bus ha=
s missed
> some clock signal edges (or is answering with more bits than expected for=
 some reason)
> and is holding SDA down in an attempt to communicate a data bit to i2c -m=
aster.
> Extra pulses in clock line can then allow the slave to finish transmissio=
n and stop
> pulling SDA low. I however doubt that this type of recovery would be like=
ly to help
> if I2C -slave spontaneously pulls SDA low. This would however be a very b=
adly
> misbehaving slave -device, so it=C2=B4s hard to speculate what it will do=
 and what specific
> recovery might help.

As the above standard says, you can try sending pulses but if that does
not help, then you should reset the device. In my experience, most I2C
devices are not wired to be reset externally, so we have the pulse
toggling mechanism in the I2C core to try as much as we can.

> There is too much speculation for me to attempt or test bus recovery in t=
his case,
> so I would leave it out of this change. If somebody notices and is able t=
o test  a case,
> where some specific extra recovery would be helpful, I would suggest to c=
onsidered it
> later.

Totally fine with me.

Thanks,

   Wolfram


--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9GT+4ACgkQFA3kzBSg
KbbKZw//bKBriwc2/Kz/3AFpHgyzYwpqULiOY/gfwsg3y9BgL+XAxzL+jOGPIH5u
Zfgkz0A03bNbnmPaIfqPOPgr58tRDb+1fbZeGOrVUHZv2bcOBYzzg62MbHwENm3F
jaUYgxOcOgpQ7rfmHM4AZ99eZU92/VDZE/doe+T51VV/7okl/nfoGR+8O9U38RgD
rA4B7IzzOW55LQnqs0wYI6fZR7CoHO9Nogd3Cp8E0vam2nze7vHjRGweNDmzwBzy
8Cheg8hUWL3cUdaHH7JHD4wgI7wA5JvgD44U+aEJfV4WR4SL7Q89L1a3iekVbnL/
QOI8Ie5Ik1h4xOQW90PaaUGBM0+BDuNDJqRXIURh1QhjonOYfrNsdeNcPNJ9zINO
NNMDe0CPnNvlUclqed8JW4RR8zjjSTzJBqT+6qYi10EC7BYtj5E9vf6hOQG4aEu9
XFHQHJBcHgHKC3mmQvczUDw1xl92gAXJXWkzTJTZlfoeEP6kOa6xs/VvT2O+ghgs
UJZlFZYMNzU+ZFOGcu+crMn7RujjkOjfBGgV/Km3weJGGJ1zmR3pwGq6OEsD47Zl
lSWykEOT2ImiS6Xj2ccIhMOUAWwn77FG7Ni0CJfctk6nLF6lEuEaKrxCTVexHCNC
t2GEwqLQUPpXCDOZNrWmItGC4Pwry3SmLeCTW64NtGyVhHYFiSA=
=Fc1T
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--
