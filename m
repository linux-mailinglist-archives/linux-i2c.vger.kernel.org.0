Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3FD47F60
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 12:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFQKOO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 06:14:14 -0400
Received: from sauhun.de ([88.99.104.3]:55646 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbfFQKOO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 06:14:14 -0400
Received: from localhost (p5486CE69.dip0.t-ipconnect.de [84.134.206.105])
        by pokefinder.org (Postfix) with ESMTPSA id EFD722C35BF;
        Mon, 17 Jun 2019 12:14:12 +0200 (CEST)
Date:   Mon, 17 Jun 2019 12:14:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v4] dt-bindings: i2c: i2c-mt7621: Add bindings for
 MediaTek MT7621/28/88 I2C
Message-ID: <20190617101412.GF3502@kunai>
References: <20190617083117.1690-1-sr@denx.de>
 <20190617101113.GE3502@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline
In-Reply-To: <20190617101113.GE3502@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 12:11:13PM +0200, Wolfram Sang wrote:
> On Mon, Jun 17, 2019 at 10:31:16AM +0200, Stefan Roese wrote:
> > Add bindings for the I2C controller that can be found in the MediaTek
> > MT7621/7628/7688 SoCs.
> >=20
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> CCing the DT mailing list.

Since the driver has now clock support, don't we need bindings for this?

>=20
> > ---
> > v4:
> > - No change
> >=20
> > v3:
> > - New patch
> >=20
> >  .../devicetree/bindings/i2c/i2c-mt7621.txt    | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt b/Doc=
umentation/devicetree/bindings/i2c/i2c-mt7621.txt
> > new file mode 100644
> > index 000000000000..bc36f0eb94cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
> > @@ -0,0 +1,25 @@
> > +MediaTek MT7621/MT7628 I2C master controller
> > +
> > +Required properties:
> > +
> > +- compatible: Should be one of the following:
> > +  - "mediatek,mt7621-i2c": for MT7621/MT7628/MT7688 platforms
> > +- #address-cells: should be 1.
> > +- #size-cells: should be 0.
> > +- reg: Address and length of the register set for the device
> > +- resets: phandle to the reset controller asserting this device in
> > +          reset
> > +  See ../reset/reset.txt for details.
> > +
> > +Optional properties :
> > +
> > +Example:
> > +
> > +i2c: i2c@900 {
> > +	compatible =3D "mediatek,mt7621-i2c";
> > +	reg =3D <0x900 0x100>;
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> > +	resets =3D <&rstctrl 16>;
> > +	reset-names =3D "i2c";
> > +};
> > --=20
> > 2.22.0
> >=20



--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0HZ/QACgkQFA3kzBSg
KbZnPRAAnuBSKxJaVuY64vcDnfmg7ejJ8QWp19DSE/pVqxg/fzQelY19C4WhrReX
zDceBoAgUL86XDhFQ49BDof4PYhglDgU42zd2zF2z8zeNI6BOD9hz1HgPuHzbkBZ
a/kiJRulPMHrtrgoI4pzzZ81+gJsH9kOZrf1GYUBCO21uaxMHXuZYDNekIy+XsME
9xK5YD1/WLx0G+IZTenKoRaaVkWqKOYdEzByGNIbqrBydEnG+wclNcUvopV5QrWK
B/D2xmwCol379kxwRvXLZZwk3U+pFcf8AL3CT8C4AnselSj8DGqXPicuJEY8tG2D
jBRtPsJddaKAGliuzcKVSOwfck4oBBit3vFmFoI1xHgaXQkDBTFkml/C4VZDA3vt
L37lK0qmS1X7iLKaMZQcl7gnWibbCQCo6Y1ZO9DC6nFj0lZVuCXqRV1OrbuodHdC
hKHZHdL/QXWUDXLoHdhyxqDKnsfSWeEiRoV7n4odqQs7VFjsireqREZ+ONR+pOXt
YIaI+3Rd9vpZIQuN/vr89ePc1WuqiLFHr+V3znu4eMiuET4n0DnoorJ5x5DkqSWn
9b3xRhlBtYCTkPJi3lUh091QgqbepjTbJTRIaXc3qOgrjxJGcx7bOMpUoKrU1m/G
abgnqEGAkTFM8u07nIkyT35u7Usk05jMcjxLd0i29emeH+kc2g8=
=qPw1
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--
