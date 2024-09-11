Return-Path: <linux-i2c+bounces-6565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24737975600
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A9A1C26762
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193CF1ABECE;
	Wed, 11 Sep 2024 14:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VH/SF1r+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202B8F6C;
	Wed, 11 Sep 2024 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726066178; cv=none; b=sfD1XziVX7pAz6dXmIV/ve6wDk1jpRjpNRTTwr/GPCbnUDKhBCMqaf0Rj0441Ravkt5nh3l78neN0EA2ykW8PRG5b/aWdM1SN6slJjm/FzY+T5IjyVZjwJ8Yfm/f21mOGkJITmKVvGFqPvMoXn8JkcketyYAomtxEcL+u1vAPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726066178; c=relaxed/simple;
	bh=2JdHIhcBYlO+XznGW1xNfxUvSnrmZ68daqxqk4z1Tx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql/r9ng1cId0pT+4e0EguIk1j+dwmENlYQ0kUE78+WpR9eJAO+kaXTbAotAIGAbvSzMGggMYsOH4hPy8ji06hq45DHCqGYzjRhFnek/ayhQZpE2NXNklUGaYAgtk0Nht+xx/e7ce/6vlX+hAlVV4f8Vya4dHYaQJzUb8ea4dUIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VH/SF1r+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A9C4CEC0;
	Wed, 11 Sep 2024 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066177;
	bh=2JdHIhcBYlO+XznGW1xNfxUvSnrmZ68daqxqk4z1Tx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VH/SF1r+qzueFeFY91a/5Ugk2cBwOm1vAdHvoXS2owgWYZ0bvPhqQ5OENtkbgJqpT
	 jMZM8l52luP0ltqb8TwjWwaN8rdL0KCviRwk11e2ukUdcjSgBQFrY8tycF5XHeSyaQ
	 o/fIEyXjbmS3Yg1uj4pVs9q+ML+8Esi/zKI8F48nWX95awjMSJD2VgPp64pRx0651x
	 ErqzO7JUsmENZhAFGj4YNZjeJf13GaoNIs1sTiqjfSwnao0Lyp3RnicUgjtmmdoOXK
	 c9igHap2/BslYVdPGeLYo8jgcI83wRP3PsoQimPfM965LX0tihSEUuquYQvU9Y8gkZ
	 tX2jM2ddx+RkQ==
Date: Wed, 11 Sep 2024 15:49:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Doug Anderson <dianders@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <04704b5d-ae3f-488f-91a5-acdbc993efc6@sirena.org.uk>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
 <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
 <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
 <ZuGrX67LzMe9S6ce@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0YYjs5cw/PRZRTra"
Content-Disposition: inline
In-Reply-To: <ZuGrX67LzMe9S6ce@smile.fi.intel.com>
X-Cookie: No Canadian coins.


--0YYjs5cw/PRZRTra
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 05:38:23PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 10, 2024 at 05:30:07PM -0700, Doug Anderson wrote:
> > On Thu, Sep 5, 2024 at 8:45=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org=
> wrote:

> > > At least for one Chromebooks it's a bit more tricky because that one
> > > HID-over-I2C component shares the same address as a non-HID one. We
> > > currently have different SKU IDs and thus different device trees for
> > > them, but we could make the prober work with this. It just has be able
> > > to tell if the component it's currently probing needs the special
> > > prober and is it responding correctly. This bit I need to think about.

> > I guess Mark Brown also thought that there wouldn't be some magic
> > register, but my gut still tells me that most i2c devices have some
> > way to confirm that they are what you expect even if it's not an
> > official "vendor" or "version" register. Some type of predictable
> > register at a predictable location that you could use, at least if you
> > knew all of the options that someone might stuff.

> "most" is way too optimistic to say, I believe that not even close to maj=
ority
> of I=C2=B2C target devices they are not reliably discoverable.

> That's the downside of non-discoverable busses like I=C2=B2C. Maybe I=C2=
=B3C has
> a mechanism for that, but I am not an expert, just wondering.

There's no standard mechanism for I2C, however it is relatively common
for devices to have some kind of ID registers.  This is especially true
if you're confining yourself to a particular class of device, bigger and
more modern devices are more likely to have this - if you want to pick
your audio CODEC or touchscreen controller it's a lot more likely
that'll work than something like a simple DAC or ADC for example.  You
also have the different I2C addresses that vendors pick to help out.
It's not an actual specified discovery mechanism, but practically
speaking you probably can generalise some of the ID register probing.
Though equally it's good practice for drivers to check this anyway so
it's not clear how much benefit there is over just trying to run probe().

--0YYjs5cw/PRZRTra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbhrfoACgkQJNaLcl1U
h9CmRwf/VSzg1giqNuZPz5GoiuFRE5wHodDTSi786A/EN8dxvsAsG1ssePbuaBXk
aO6EZG/ZWCFSvhHSt21PAqohQTFpQu+WAplJXngeufmeq6oPwGAGNRnSs/eaBByC
NXANkH0haNf3iB4QxpVUmdNH2IApfpYzw++kDzZNP6TPnyfcmnSbWREl9qqird32
b3PKovhh+VYtDavqXpT6PeQ9Ovl39KAD/wq3WyMzJo2Kjr8JPDZ6cmFj1BBnfUHg
Ca6F0hXH0jyPfVDJQ8j7eeOXsRNpTK786YcsaGuRbSNetxZjYsYRY8UFzN1trP90
i52gDob4jcrCTRHr5HUhK+SmvtMggw==
=MIYK
-----END PGP SIGNATURE-----

--0YYjs5cw/PRZRTra--

