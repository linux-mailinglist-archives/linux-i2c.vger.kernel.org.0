Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC62931F8EB
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 13:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhBSMDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 07:03:30 -0500
Received: from sauhun.de ([88.99.104.3]:59144 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhBSMC1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Feb 2021 07:02:27 -0500
Received: from localhost (p5486cca1.dip0.t-ipconnect.de [84.134.204.161])
        by pokefinder.org (Postfix) with ESMTPSA id 799572C0561;
        Fri, 19 Feb 2021 13:01:42 +0100 (CET)
Date:   Fri, 19 Feb 2021 13:01:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: implement atomic transfers
Message-ID: <20210219120142.GA32306@ninjato>
References: <20210212164541.8986-1-uli+renesas@fpond.eu>
 <20210218104936.GA890@ninjato>
 <1817984199.148366.1613664221431@webmail.strato.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <1817984199.148366.1613664221431@webmail.strato.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 05:03:41PM +0100, Ulrich Hecht wrote:
>=20
> > On 02/18/2021 11:49 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > Implements atomic transfers. Tested by rebooting an r8a7790 Lager boa=
rd
> > > after connecting the i2c-rcar controller to the PMIC in
> > > arch/arm/boot/dts/r8a7790-lager.dts like so:
> > >=20
> > > 		compatible =3D "i2c-demux-pinctrl";
> > > 		pinctrl-names =3D "default";
> > > 		pinctrl-0 =3D <&pmic_irq_pins>;
> > > -		i2c-parent =3D <&iic3>, <&i2c3>;
> > > +		i2c-parent =3D <&i2c3>, <&iic3>;
> > > 		i2c-bus-name =3D "i2c-pwr";
> > > 		#address-cells =3D <1>;
> > > 		#size-cells =3D <0>;
> > >=20
> > > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> >=20
> > Doesn't apply against 5.11 or i2c/for-next. What is the base here?
>=20
> renesas-drivers-2021-02-09-v5.11-rc7

Ok, now it applies, good. Testing went also fine, works nicely.

=46rom a maintaining perspective, I think, though, we should have only one
master_xfer() function and use 'atomic_xfer' in there to skip stuff etc.
Otherwise fixes in one function might be forgotten in the other one. Or?


--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAvqKUACgkQFA3kzBSg
KbYZwRAAn6RVBo5McI5BYoUNDcp5vlt12am8I7iWkhr/09ME4Oza9ErBVnvKU7BA
tYodkcpQHTdRpXIBizy1BJrNZ1hC/Q7qIOoZwqo7OBk/V6dOAdOI8buToWXVSrlj
g9p3iT4IrdAMawrC+K/9aT2eOxRvi3dbWek2WhT2z/TwHmOosO+2xVcO8uRyr4Vr
khFyGAjyfqXA1/9JmzbHPPq1tWx/rzG7juCwXHErOpPmZeQirye4zo7LVPJ8Xcpp
VZsAZPD45CluCfXXP5mN43BbqM0ck+SSidNf5nt7vWg1aqDaCfSXfrAAxti40GlT
WkdfKgpzd98motNXuLm3KXmcx7W8556z6YPvUw9RdxKmmKs3pHf6aNQRiYRg0ehE
R+XmiIUCWVNHGKxk5y4J+CWdEHZg2cfz9c8k0Vt1cvoBCpHLeNQ9RIkI1nCGqyC2
GLiVG/JYz5Tr9r7OP/cX7YIeMqPeVpqEfKuEZLQZKFcxqs0ldVq+pISTfRWIeAbm
4+1+yW2d4Ty/Kg5Ote8g2oRH/I+Rji6DdmPfn8NbXnfP/50Y9dS3Ee93u9ENTQPR
fpaz3EECCzLavuBbHmX4ilNgBypDLB5dbrV3H4yMoGk9LqoE7sCl0Gyr1DPb2sgw
xCeCYpzGs1pfW/hNi6Tp2FNkX9c4XmpKsEhhAezaDgi9vNs+bvg=
=4PHl
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
