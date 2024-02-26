Return-Path: <linux-i2c+bounces-2013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151268682F2
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 22:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCE21C25C23
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 21:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0CD131732;
	Mon, 26 Feb 2024 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htjkCQYF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090C21CA91;
	Mon, 26 Feb 2024 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708982697; cv=none; b=dMHCP3JLo4tu2UVidCljDv8qOpeN5Z0MyRxsmxBa5V0izGS9etOXrspW/pLfnJRB8IKLXCEOq84XPuBEz9OuqLixEtlSUpYCKSNn9pLjuT8WYVHzASELbnYzu+tcKvYsH54eROVlKTXiJDhjG4EaHyYwocnHdIJ05xWXuT8TJSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708982697; c=relaxed/simple;
	bh=J8rnf5NHkC26worjsY8jvbTZZZ7pAOtwnba2Nt05aqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3W4yLX3zpItUy4VOQCqdcipgJY1rW0iK49dhGwLnfH8K7DID0P39UxXwPZq7oRXdU7bnAzeFjQ/0dSDry/WliN576X3pniZXS3heT8L6TcF9DSjhijVMtqcGj7bgjSOcDtp3fPCLuW+YwrtZ46UK2eq4XyeaNDcqIgqwah+K6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htjkCQYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A73C433F1;
	Mon, 26 Feb 2024 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708982696;
	bh=J8rnf5NHkC26worjsY8jvbTZZZ7pAOtwnba2Nt05aqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htjkCQYFx/AxoxJBMHA/AkBnVJXJr8BMNkuGK/1PZYsxmemAATJUDM7vQsqd3C528
	 4CRZT+Afp1edyQccyjwn03zj2rJfr5/ZvTSe4fEZKXbh8sr+aNTRY0wT0XJwj6TMUC
	 yOM+zQSOCctcY1rJoSMyWDPpK5oNw6Sq/zOmKVKTMXOrudE/wIWIgsujmFtSzIxjfQ
	 etJGysq3WYwD9ibeRwtC8U7j6KWf0CdTYIWawQyVo7Hxg18Yez4C5Z0IRDh9HqAulh
	 WEyshJcBIz6YthDxq0w0vpSbjxIGeXpknhFW0PJPaITdoVKaICyyiJXRGveFL6sxFy
	 7YuHHN3XlNjSw==
Date: Mon, 26 Feb 2024 22:24:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: dtschema: i2c: messy situation about timeouts
Message-ID: <Zd0Bpa2ciMHmSQrS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <ZdxjGwvGXlDGkYs0@shikoro>
 <ccb58633-5981-4b91-a6ca-a57ea1ce5e40@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sAM/eDtNldzBf9Nw"
Content-Disposition: inline
In-Reply-To: <ccb58633-5981-4b91-a6ca-a57ea1ce5e40@alliedtelesis.co.nz>


--sAM/eDtNldzBf9Nw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

> > - "i2c-scl-has-clk-low-timeout"
> >
> > AFAIU this binding tells that the controller can do clock stretching.
> > But what for? I don't see why this is important for clients. If
> > anything, then it would be interesting if the *client* can do clock
> > stretching and if the controller can actually handle that. But no need
> > to describe it in DT, we have this as an adapter quirk already
> > 'I2C_AQ_NO_CLK_STRETCH'.
>=20
> Hmm I know of a few adapters that should probably set=20
> I2C_AQ_NO_CLK_STRETCH based on some Errata. Probably just a=20

That would be helpful if you could add that. I always guessed there
should be more controllers needing the flag but never encountered them
personally.

> documentation exercise. It would be nice to reject clients that need to=
=20
> do clock stretching but often it happens as a side effect rather than=20
> being intentional (I've seen this with i2c clients implemented in=20
> microcontrollers).

I guess the way forward with that is we add a flag like
I2C_CLIENT_CLK_STRETCH and let the core figure out if controller and
client are compatible. Dunno what to do if not, though. Reject? Throw a
warning that there might be problems? Probably reject by default unless
overridden by something-meaning-i-know-the-risks.

> > Suggestion: let's remove this binding and conver i2c-mpc to
> > "i2c-transfer-timeout-us". Yes, not nice to have two deprecated
> > bindings, but things happened.
>=20
> Sounds like a good idea. We'd obviously need to keep support for the=20
> existing property but it wouldn't be hard to add=20
> "i2c-transfer-timeout-us". I'll try to whip up a patch for that sometime=
=20
> this week, just need to dust off my Freescale boards.

Please wait a little with the implementation. I want to try Rob's idea
to let the core set the timeout flag initially. Dusting off the boards
for testing would be awesome, though :)

Happy hacking,

   Wolfram


--sAM/eDtNldzBf9Nw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXdAaUACgkQFA3kzBSg
KbZPyA//XSbRCB1slX3Xmfov7xqA8M6nGOeSvzxmYQOi3xrus0GTAtNocz9YveSb
BGeC4cRDqb1G2l7vJWDkkhAxImlHZfDA3nIg+04ch9VacrpQsisHR7yoTwCURxm5
VtMnCh+2l4/fPTMAZS/l0IHwxsBKZRocP2QG7kEGRkMA58HvTfW97kYzqYorumX0
spzXl+3uqsC4hj1IBY6xNxOBz7Vg8GH1hmcXxX1siLQNoOAenpiIzyn6gZicgQYU
tB1TwMHj4PDVsXKuMG5oEXIuXPThPXqH2gHUzHq/g0iXOESxOIavNS7wbFFrZAyG
ix3xksfRrEw+h4gD91K3OXPGxc5pCB4zM8g9mY7PFsV7ezbZd6XCE7lgORembH2M
gaTL/L3srqfdr/EaPiOzayvzteEYpCSusk3Sp2ZTDC36TKmWJlorJSRhtqKC+iif
yFqEFo1j8XfeBuLUNXc8mP2M5IuPYelzPt/PCN2yoy8BA3OST0+tkMky6XG5PHMP
5yywSbcEqsRyt9hJZ17ClYSoKKriPU9OuvpffjJrmmOHKSjX0JB2PZXuAlgEyGEF
RG/1lpbC0ksXvbzwTZwgTMK+gcAsxEUfHRV5jr5AhxH8Z3RpT0oAmVEzhZqTBCZd
eQAh6RyEzp2udlJWwUIJgLkHMtpPPLA4XFkfDi1kpIzcsAnjES4=
=ifnO
-----END PGP SIGNATURE-----

--sAM/eDtNldzBf9Nw--

