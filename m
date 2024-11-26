Return-Path: <linux-i2c+bounces-8229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 621939D9D21
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 19:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21A4161B9B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 18:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E061DD88E;
	Tue, 26 Nov 2024 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqFjblAH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA611187;
	Tue, 26 Nov 2024 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732644590; cv=none; b=nr18EGvAbUFZYtcw/JgbWYQXqtZirtK8OJ3fxUaHLvCyACt4iw/Tau1yhmuK6w6Ss2HFAFrzX/hnGaoJs5u+2ol4pBOYu0GURJbLqQS/LBgv9AS72i8rF8rI8LtG0unGZpN9jPQSrnwBH/WPD4BFhtyANAlECzDlIyeSCoRS2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732644590; c=relaxed/simple;
	bh=Dn68kwfusM/F6PFzcK9RRMgIKLG8Q2p95XVK2fHrCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdOb3CRsqfe9fYx8NLvdSWQtqA9LkkEO+B9/qVDmz4PC4Y5th0HlDAIA6e+i1PvExQYncUdHqwQSt14MftlBHKY3W7BCpgBc5dryCfvpWsxGJMbxGWa9vpJ/WcjYVKySLUL34scJqwIZcRtQQrWsWc3lJTdzQcJXAiLfYrbyG1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqFjblAH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27BBC4CECF;
	Tue, 26 Nov 2024 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732644589;
	bh=Dn68kwfusM/F6PFzcK9RRMgIKLG8Q2p95XVK2fHrCpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqFjblAHK+acST9EGdraw8bb/dxcuETdMlcHHy2i1lRe1YVc5tLv+qNV31V6Ab/fU
	 IcrBVFs5YMywsHEUWNBWXWYDqHdQLGadZVOxLIoo+npNxHP62hOvbpPxwvC6jr1dDZ
	 b1gy3AwfIi0HyO7znaTYGuIS92IrJUuIfkAg3fiiPVBlgoOnO8DfZqLoHtqYBXeqTS
	 W+mUh9K6EAxwZLXGOyDtqxWVScl7Opw9Ms4Seyj8uidgfsZSRQ0HXA9GZNALdX/3EN
	 PEdlmZsoef3RyvyalQg2Nm6tJfL2C9jEk6dNSRQdz5PidL7KZOgVxjhzxzD9ADbsee
	 yb2EMIaRpeYog==
Date: Tue, 26 Nov 2024 18:09:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: misc: Describe TI FPC202 dual port
 controller
Message-ID: <20241126-precinct-corrode-516d3a476479@spud>
References: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <20241125-fpc202-v3-1-34e86bcb5b56@bootlin.com>
 <20241125-overhand-economist-5a3fc6339265@spud>
 <2072150.UuDqf3iUMg@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hkZzaXn6Nj+Xev9H"
Content-Disposition: inline
In-Reply-To: <2072150.UuDqf3iUMg@fw-rgant>


--hkZzaXn6Nj+Xev9H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 09:05:42AM +0100, Romain Gantois wrote:
> Hello Conor,
>=20
> On lundi 25 novembre 2024 19:26:35 heure normale d=E2=80=99Europe central=
e Conor Dooley wrote:
> > On Mon, Nov 25, 2024 at 09:45:15AM +0100, Romain Gantois wrote:
> > > The FPC202 dual port controller serves as a low speed signal aggregat=
or
> > > for
> ...
> > > +
> > > +required:
> > > +  - compatible
> > > +  - gpio-controller
> > > +  - "#gpio-cells"
> > > +  - reg
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +  - i2c@0
> > > +  - i2c@1
> >=20
> > btw, why are both downstream ports required?
>=20
> It's because both downstream ports are always present in an FPC202 unit
> so in my opinion, it doesn't make sense to describe an FPC202 with only o=
ne
> downstream port.
>=20
> I suppose you could also consider that ports would only be described in t=
he DT
> if they were connected to something in the hardware, but I don't think it=
 would
> make sense to use an FPC202 in this way. After all, the whole point of th=
is
> component is to act as an I2C ATR and low-speed signal aggregator for
> downstream devices which would have address collisions if you placed them
> on the same I2C bus.
>=20
> But then again, you could consider that DT bindings should only describe =
what is
> possible, and not only what makes sense as a use case. I don't really kno=
w how to
> answer this question myself, so I'll refer to the maintainers' opinions.

I don't really know what how this device works, which is why I am asking
questions. If there is no use case were someone would only wire up one
of the downstream ports then making both required is fine. I was just
thinking that someone might only hook devices up to one side of it and
leave the other unused entirely. Seemed like it could serve its role
without both sides being used based on the diagram in
https://docs.kernel.org/i2c/i2c-address-translators.html
unless it is not possible for the atr to share the "parent" i2c bus with
other devices?

--hkZzaXn6Nj+Xev9H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YO5wAKCRB4tDGHoIJi
0peVAP0Tx4IuAFRG1f+DIwASl/6j0oDlZVMHvalzkyIQp7Ma4QD/WL2qSBDyyW3P
hTovWdSEjm5sUQSwdUr2MU+1r5AGpgo=
=Hc1y
-----END PGP SIGNATURE-----

--hkZzaXn6Nj+Xev9H--

