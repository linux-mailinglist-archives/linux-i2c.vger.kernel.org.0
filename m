Return-Path: <linux-i2c+bounces-3154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C958B269A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 18:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546BC1F21BB9
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 16:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596D014D446;
	Thu, 25 Apr 2024 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv060Knj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F4D2B9D9;
	Thu, 25 Apr 2024 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714062927; cv=none; b=qk9trdCf/W5V+JjbkfGxg7244faqivoz2a5NtS7N5NFMLmdPvgAbvSxkOkcTVACqtCwrynuyqIox2mQzpggi5Tek5tyJjsdU6hjGsoMTVP6ZufCXShrM/Qz4byj7YxYqCRq7WRLAlzuxnTqrcHeRpYVhvcLKvU5AEEd5YCwtBdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714062927; c=relaxed/simple;
	bh=eKZlsQ9ssnVdmKeVleGh1NSZKulcJ3+HKLLsNghHnu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2xGlWfH1B51sEMSsIg3E2qKW2BJRJm4c2Efbhmpeya17PcbW8ZLayx8qU/LP7nZqg/JoDxKUIMwVbFhn1b3dk1qqkiDPcHgr5o6LlHGNdaw+LDleRJMpqdsaYR32cMzt3pCaqx4Y8gyB03kRD2zjJMUDG4qNhmqmALJO/bDxKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv060Knj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9264BC113CC;
	Thu, 25 Apr 2024 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714062925;
	bh=eKZlsQ9ssnVdmKeVleGh1NSZKulcJ3+HKLLsNghHnu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv060KnjxmA7fLWlZ2OQqxD7BnIl9ihl3lADBe/dGP51maPHYJo7imXVbeqPDvpzJ
	 2G3Ep0+sM2DU69wnd8nHJY3w2xPWuZgVisM/bOtj3Swu+twTrlc/JueteQeeb0P1hI
	 U2nOi1q5rEN3K45PVwKP4GUw2YKlxWq89J77quWGlEs+ktazNFFWT7D4XcFC0d/tIj
	 zJ7eHL4DL0CQL8gV+CvB+z43sKJPU+ck8PorLRM44rVHGI+EhmKZTIaEKkLV/A6iKr
	 IZrsOcOphJ6SFxRarvCFpiuIc3Iht/UoAoIf8nerhHEbe7eNqtNvBa6p2r5AaSZlOX
	 ln+faTFS950NQ==
Date: Thu, 25 Apr 2024 17:35:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	andi.shyti@kernel.org, jszhang@kernel.org,
	miquel.raynal@bootlin.com, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, thomas.petazzoni@bootlin.com,
	guoren@kernel.org, wefu@redhat.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <20240425-script-fondness-0e80bfa31615@spud>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LvUcHBMg/ZVHkvhr"
Content-Disposition: inline
In-Reply-To: <171405653346.2527762.16827325392956038580.robh@kernel.org>


--LvUcHBMg/ZVHkvhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
>=20
> On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> > This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> > and a default configuration for the BeagleV-Ahead. It appears that the
> > TH1520 I2C is already supported in the upstream kernel through the
> > Synopsis Designware I2C adapter driver.
> > As there is no clock driver for this board as of today, this patch
> > series uses a fixed-clock named i2c_ic_clk.
> > There is also no pinctrl driver yet so pinmux must be handled manually
> > for now.
> > It also fixes the order of the nodes in the device tree to comply with
> > device-tree coding-style.
> >=20
> > Thomas Bonnefille (4):
> >   dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
> >   riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
> >   riscv: dts: thead: Add TH1520 I2C nodes
> >   riscv: dts: thead: Enable I2C on the BeagleV-Ahead
> >=20
> >  .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
> >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
> >  arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
> >  3 files changed, 127 insertions(+), 27 deletions(-)
> >=20
> > --
> > 2.44.0
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy thead/th1520-beaglev-ahead.dtb'=
 for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
>=20
> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-freq=
uency:0:0: 50000000 is greater than the maximum of 5000000

The bot is not freaking out here, 50 MHz is indeed more than 5 MHz :)

--LvUcHBMg/ZVHkvhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiqGSAAKCRB4tDGHoIJi
0o+gAQD9y0YVzRTF8HegZu1SkndMW+2UKrW5hDZMBdhYKLCsJgEA2lS/uw7PcBKt
sur9daO8spSl/mTvxgKzvuVTXvZQqAk=
=kJRE
-----END PGP SIGNATURE-----

--LvUcHBMg/ZVHkvhr--

