Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F40FA656E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbfICJe6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:34:58 -0400
Received: from sauhun.de ([88.99.104.3]:51696 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726062AbfICJe6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 05:34:58 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id CA4802C4F2F;
        Tue,  3 Sep 2019 11:34:55 +0200 (CEST)
Date:   Tue, 3 Sep 2019 11:34:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
Message-ID: <20190903093455.GD1020@kunai>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net>
 <20190902204841.GB7253@kunai>
 <63d99d6d-ecdd-7dd8-0dcb-126bfd89b258@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <63d99d6d-ecdd-7dd8-0dcb-126bfd89b258@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Not if you define enough addresses in the pool. E.g. the DS90UB954
> hardware can have 8 aliases per port, so if you have (n_ports * 8)
> addresses in the pool the problem is solved.

And then you plug-in somewhere another board with another need for ATR
and you are out of addresses.

> > And another add-on module with
> > non-repogrammable devices may occupy addresses from the defined pool
> > above.
>=20
> You mean a new device on the local (SoC-to-ATR) bus? Well, it could as
> well occupy a non-described address that the ATR has already picked as
> an alias.

Nope, I mean a seperate add-on which has a hardcoded I2C address on the
bus of the ATR parent. Then this hardcoded address needs to be removed
=66rom the pool if it is in the wrong range.

> > I am not perfectly happy with the assumption that all undescribed
> > addresses are automatically free. That also might need DTS updates to
> > describe all clients properly. But this change only needs to be done
> > once, and it will improve the description of the hardware.
>=20
> Right, but I still suspect some users won't do their homework and
> discover address conflicts at runtime, maybe months later, in a painful
> way. Also a chip might be undocumented on a given board, so they could
> do their homework and still have problems.

Yes, we probably need a binding to mark an address as used even though
we don't know the device or don't have a driver for it.

Don't get me wrong, I know what you mean. One of my boards has a client
soldered in a way so that it is still in debug mode. That means it
listens to addresses 0x03-0x07 to provide debug information. Took me a
while to find out what is happening there.

But still, 'i2cdetect' showed all of these.

> Despite my comments, I'm not strongly against your proposal. To me it
> doesn't seem to solve any problem, while it does introduce some degree
> of risk. Could you elaborate more on but what benefit it introduces?

I'd think the risk of running out of defined addresses is somewhere
equal to running into (after a while) an unexpectedly used address.
I like the fix for the latter better because describing what is on the
bus is more helpful and generic than updating the pool-property every
time you need it. Plus, as mentioned above, other add-on hardware may
disturb your pool allocation.

I expect this topic to be one of the discussion points of the BoF.


--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uM78ACgkQFA3kzBSg
KbbX1g/9HFI+lf/0NsEaIJ2l6AiV3rF+wNU6EPfD86WhO7kPV2GG6Pv+M8+dpzvz
ikq7miByyan8yRTbxtDXcmlHFUVDyb19owQdFl8xX1j6Ow317KKrIQKe/TFCof7c
sqKI7x38aJQKdi0Xn+3aFQ7mIb5JME4ZkKfK+etgE3sZtqrA6GGVod37r9Mmmr/E
1ZhcJg5DW+X0z76rEHG9TbzwP2OcIssPJXVUcOszng7HYTlxhlR0T3f5s6nnFu3G
b1qfuTkj+BbTCJDN7KExB9gfah/CSUGvzHxOnNQQvyCfBgsu+ZP4oGYf5rJnwxug
Z1Wz0VDE3H9N0WjOajc5bPmjyJFjMGbGcpyBKGR7tHvph2M2ASQm/ItYqMsSghCL
wqk+mFLQr3dFDSsdcqF0fD1zEqsIoIyjbsi50XYAjuxUE3KbtxYFiQ85TceiAefI
QwCPCmkUFQTZmyiYzdva4Qhs0FPpZ0gEgR/2x71Vp2CFrPxLnw9wdis68rfSo13a
IDVgqyG2WVJNC2OWHBWdmUMLXKFHrpP/iZa32fb9xzZjZrk1fEkxAE2Boh0Bkr2d
Z/0CbCSE6wU6H8WscoQw4va8z4ST8GzPSxxAe310UW8fmOSvVtAQnLdsnRYPrZla
zZFtf3zSO0rvIYu0dvKLSvhDwWbtPXFqTubPkFC/FVSN14mSpws=
=ZAhE
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
