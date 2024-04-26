Return-Path: <linux-i2c+bounces-3220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3728B3A3E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403A61C22546
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 14:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFC1144D2E;
	Fri, 26 Apr 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCbWI8A+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B3034CD8;
	Fri, 26 Apr 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714142542; cv=none; b=oEmhBUkhHw7I8hDJocCq5Du5iAcCqL6/TYymvw3ZIClCHAjEDs/vZfz20BiRwi2r9HdtI0eNe4HBHxz3uGJLoCPapAHQapbtmrNgj83zH/hQZfROYD7uICWqmTj/WhSSadWmK9zW/7LGPO69OopaLESUSNuXdqEp9gxKUTXdbfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714142542; c=relaxed/simple;
	bh=2taC0FbVINV/Pfa20kvrVfsK3Rx9kry5R3sfqmV0PUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V64v/+9Xv+aWyKgSsJm3lALQjHMdhmaYXC5uqSqHO+aE0DtUTxvIvoek0stF4KlC67gYfO9vcUNoUZwKmamXnFew7rm0SlCbysGpfWcOcomTajtIcrWZqEdtTnNWXayjqtDYMELzFxB9xeSwznwWc1Yv2yGRkV+Ue2NGLwHqvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCbWI8A+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E445CC113CD;
	Fri, 26 Apr 2024 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714142542;
	bh=2taC0FbVINV/Pfa20kvrVfsK3Rx9kry5R3sfqmV0PUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCbWI8A+jISuOv0mZ+DcLmk+vP3iNpg4+yWdV4NfEKb9/8K0swgIHUKW6NMaNGlym
	 /Z9/cMghRk/r+yS58kPcjq7HfIYDE7jSIkCRKZGBKiMmttlf27eHOoVUUwTUCK0HBh
	 OXpWajgdBA39Q2xiv7XnV1B5yxGTouLZG9mdwgyuIl+DtAas+pKe9n9pLJ0oJKIoJf
	 0BajOXAcx4WEk2NhL0j5A3w7AkIIKFgIcqLyoqMOjbcQ7ydkljQsNYJ4O3BgGQLnUi
	 DlSCrCTHd7lR4Jig1SrbtawkJB+VtSYSNnYMZs+nWFHsGBf3jMFK02OfOShnYBPa7A
	 k0KgVahADwIvg==
Date: Fri, 26 Apr 2024 15:42:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, andi.shyti@kernel.org,
	jszhang@kernel.org, miquel.raynal@bootlin.com,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	thomas.petazzoni@bootlin.com, guoren@kernel.org, wefu@redhat.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	aou@eecs.berkeley.edu, krzk+dt@kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <20240426-patchy-grievance-e7103a344c82@spud>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
 <20240425-script-fondness-0e80bfa31615@spud>
 <3eb27570-4a53-47f6-8e36-e25fc1063124@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jc7O/HQugX9deMnA"
Content-Disposition: inline
In-Reply-To: <3eb27570-4a53-47f6-8e36-e25fc1063124@bootlin.com>


--Jc7O/HQugX9deMnA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 04:12:00PM +0200, Thomas Bonnefille wrote:
>=20
>=20
> On 4/25/24 6:35 PM, Conor Dooley wrote:
> > On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
> > >=20
> > > On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> > > > This adds I2C support in the device tree of the T-Head TH1520 RISCV=
-SoC
> > > > and a default configuration for the BeagleV-Ahead. It appears that =
the
> > > > TH1520 I2C is already supported in the upstream kernel through the
> > > > Synopsis Designware I2C adapter driver.
> > > > As there is no clock driver for this board as of today, this patch
> > > > series uses a fixed-clock named i2c_ic_clk.
> > > > There is also no pinctrl driver yet so pinmux must be handled manua=
lly
> > > > for now.
> > > > It also fixes the order of the nodes in the device tree to comply w=
ith
> > > > device-tree coding-style.
> > > >=20
> > > > Thomas Bonnefille (4):
> > > >    dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
> > > >    riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
> > > >    riscv: dts: thead: Add TH1520 I2C nodes
> > > >    riscv: dts: thead: Enable I2C on the BeagleV-Ahead
> > > >=20
> > > >   .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
> > > >   .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
> > > >   arch/riscv/boot/dts/thead/th1520.dtsi         | 120 +++++++++++++=
+----
> > > >   3 files changed, 127 insertions(+), 27 deletions(-)
> > > >=20
> > > > --
> > > > 2.44.0
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > >=20
> > > My bot found new DTB warnings on the .dts files added or changed in t=
his
> > > series.
> > >=20
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the warni=
ngs
> > > are fixed by another series. Ultimately, it is up to the platform
> > > maintainer whether these warnings are acceptable or not. No need to r=
eply
> > > unless the platform maintainer has comments.
> > >=20
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt-schema is up to date:
> > >=20
> > >    pip3 install dtschema --upgrade
> > >=20
> > >=20
> > > New warnings running 'make CHECK_DTBS=3Dy thead/th1520-beaglev-ahead.=
dtb' for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
> > >=20
> > > arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-=
frequency:0:0: 50000000 is greater than the maximum of 5000000
> >=20
> > The bot is not freaking out here, 50 MHz is indeed more than 5 MHz :)
>=20
> 5MHz is the maximum clock-frequency, ie. the I2C bus frequency.
> This is actually set to 100kHz for I2C0 in the DT:
>=20
> &i2c0 {
>     status =3D "okay";
>     clock-frequency =3D <100000>; <----
> ...
> };
>=20
> 50MHz is the "fixed-clock" frequency, that is the clock feeding the I2C
> IP block:
>=20
> i2c_ic_clk: i2c-clock {
>     compatible =3D "fixed-clock";
>     clock-frequency =3D <50000000>; <-----
>     #clock-cells =3D <0>;
> };
>=20
> My guess is that the bot confused the clock-frequency parameter for the b=
us
> clock (SCL) with the i2c-ic-clock value for the controller itself during =
the
> checks.
>=20
> Do you agree with this or am I misunderstanding the error ?
>=20
> If I lower the fixed-clock frequency to eg. 100kHz, the error is gone. Bu=
t I
> guess the 5MHz limit should probably not apply to the input clock?

Heh, I know why that's happening - it's your node name.
The pattern for i2c controllers is "^i2c(@.*)?":
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/=
i2c-controller.yaml

Rob co-incidentally (or maybe not) put out a patch for fixed-frequency
clock names, suggesting using clock as a prefix:
https://lore.kernel.org/all/20240425183810.3079069-1-robh@kernel.org/
If we switched to that format, I believe your problem goes away.

Cheers,
Conor.

--Jc7O/HQugX9deMnA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiu9SAAKCRB4tDGHoIJi
0nLnAQCECEfc78RXxXpCNNDudKkhw+shCzwB7WRgYXqgv327zgEA0OHduv5XJhqr
P/HzRFwkJyBZfvmgYqKH2EPtxsIfmwA=
=GWVt
-----END PGP SIGNATURE-----

--Jc7O/HQugX9deMnA--

