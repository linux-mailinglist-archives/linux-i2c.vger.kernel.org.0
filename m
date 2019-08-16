Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E198FDB5
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 10:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfHPIXR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 04:23:17 -0400
Received: from letterbox.kde.org ([46.43.1.242]:36654 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbfHPIXQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 04:23:16 -0400
Received: from archbox.localdomain (unknown [203.187.238.17])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id B6752288870;
        Fri, 16 Aug 2019 09:23:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1565943794; bh=R+mo2BGavCwf8Mztq2UzfRe5LGcuCVb+205qaTnZVtI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kr98yFWLu1zfwT7VtWyOw/fahFFRPdXW+MlNuqGfbct+aMHVojSxkWWHfh3DF2HiU
         g94g6LL8JSox9npC0r6JkcyJTVd2XZTHyAdswwXfYEJucEFRpZdWK0TRz/mnMAhalH
         BLFZCkfgIINs6VdaIeYsettvt1ZPkRlpo0TLF8MlDchMDswqf4nHC92bmpj2g1chao
         q2lc3VjQhjiFAKLqzW+OMUD/3P29ossSwxjJvEos1S5dv/wdCvUT/0WAAr57UMt26i
         Ki5vyKJ8tIc+vPDGypIkbdwCYJTuo8F6KQ4m6CgzfP8r8XsjwiZFkSoAbvKcz/BbL4
         eafiysNJHUpBQ==
Date:   Fri, 16 Aug 2019 13:53:11 +0530
From:   Bhushan Shah <bshah@kde.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Bhushan Shah <bshah@kde.org>, Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, Wolfram Sang <wsa@the-dreams.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: allwinner: h6: add I2C nodes
Message-ID: <20190816082311.GB18236@pyxis>
References: <20190811090503.32396-1-bshah@kde.org>
 <20190816064710.18280-1-bshah@kde.org>
 <20190816064710.18280-3-bshah@kde.org>
 <20190816075031.zw4bjunn4hfoaq3e@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <20190816075031.zw4bjunn4hfoaq3e@flea>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 09:50:31AM +0200, Maxime Ripard wrote:
> On Fri, Aug 16, 2019 at 12:17:09PM +0530, Bhushan Shah wrote:
> > Add device-tree nodes for i2c0 to i2c2, and also add relevant pinctrl
> > nodes.
> >
> > Suggested-by: Icenowy Zheng <icenowy@aosc.io>
> > Signed-off-by: Bhushan Shah <bshah@kde.org>
> > ---
> > Changes in v2:
> >   - Add the SoC specific compatible string instead of re-using a31 one.
> >
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 56 +++++++++++++++++++-
> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index bcecca17d61d..a1a329926540 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -329,6 +329,21 @@
> >  				function =3D "hdmi";
> >  			};
> >
> > +			i2c0_pins: i2c0-pins {
> > +				pins =3D "PD25", "PD26";
> > +				function =3D "i2c0";
> > +			};
> > +
> > +			i2c1_pins: i2c1-pins {
> > +				pins =3D "PH5", "PH6";
> > +				function =3D "i2c1";
> > +			};
> > +
> > +			i2c2_pins: i2c2-pins {
> > +				pins =3D "PD23", "PD24";
> > +				function =3D "i2c2";
> > +			};
> > +
> >  			mmc0_pins: mmc0-pins {
> >  				pins =3D "PF0", "PF1", "PF2", "PF3",
> >  				       "PF4", "PF5";
> > @@ -464,6 +479,45 @@
> >  			status =3D "disabled";
> >  		};
> >
> > +		i2c0: i2c@5002000 {
> > +			compatible =3D "allwinner,sun50i-h6-i2c";
>=20
> This isn't going to work if you don't patch the driver to add the
> compatible. And this isn't what you described in the binding patch.

oops, I will correct this in next patch series. Sorry.

>=20
> Maxime
>=20
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Bhushan Shah
http://blog.bshah.in
IRC Nick : bshah on Freenode
GPG key fingerprint : 0AAC 775B B643 7A8D 9AF7 A3AC FE07 8411 7FBC E11D

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEs8s2ZVJUC+Bu6a2XEZaMRJKMrvwFAl1WZ+4ACgkQEZaMRJKM
rvxqAQgAjTTOPqp4IbGW4/nDm8BBmNiePwfg57R8R49Uy4uEW2aWag5VAObJy66F
cWkU8CtYUYXWPvnke18zDyH+EqqgJgraUnNyU1Slj3e6kylEvREKRsM4W9u8m4ti
r88PZiTtWmPLmAYOrzIUVckEwDau21Apeqjf1+Tqq2Q3xCGx2vRPBsm59972SGVY
yT8k1SWABM5m42rko8rQh+XZ9u0niBliD1u4+KY8zQ9Uu/g8T/t7JcCu+ysy8U+W
esnMrLdwMChMpjDzAX1vdkAexCAo5E6/NeDbcQWJqxjqCDX5oy/vIXlydKl1Sczx
DrysSQzkyw8rbwv9OGMC+YtpVHjAYA==
=gJ/S
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
