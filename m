Return-Path: <linux-i2c+bounces-3619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 384AA8CAC8D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 12:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D9B282230
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A526757FD;
	Tue, 21 May 2024 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkCGxQgO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682471B3D;
	Tue, 21 May 2024 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716288570; cv=none; b=na+uFEtBXvCGz3qLzHQFwkAdXLG2/i7Lrus5DITJQ2vCtKuxMYsfCz1V6hQSbgsxR1JWVw/nqI2RN1B+mTWQfrgP+Q5y8jXv7OVW91ndsx+Tk7CDzAOpm4D+QQG6nKoefWofRLvCGGzyH49Rn2v6NYPe3nTzPsUjSYPFSF9YcQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716288570; c=relaxed/simple;
	bh=6KPrfDvxePiYqQ+U86QGOtRIQhJqkZNmdPViVsnR34A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+qe6KnFRARArbjdPJq6cwsPu4NKgl3CAjQWdcMIFU9CGY+8XHaqZNO8pgt/gXlkYq15nQeZhwpCe/TSsA8GurPiUHaNTpUI9y6sxvgnTjj6ku3g5QW6l+I0yHS6qBjeYoJf3HPXRT1cOOS4NkPiZaG7UBt06s6JdqiUOhI4J8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkCGxQgO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9034EC32789;
	Tue, 21 May 2024 10:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716288570;
	bh=6KPrfDvxePiYqQ+U86QGOtRIQhJqkZNmdPViVsnR34A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkCGxQgOHgBFCqFIlV4VgKAH9/B6+1F+Do1GmLFKqPl1Igib7uV61Ae3Xkqy7JuLn
	 3cbFhuqfwf58ScdoX0J9/J8vTCOeD5Kip4AIehMr9L2lnevQxOZmoxk2fSjrTxU0Sa
	 tZI+VSdqYEFh9l2Sj7pD5AjLcDfoMHzG+2qKUMaW/PT39BqCr39gGKwjCcqVt49d8n
	 SC/7q0VHuRPRf3/c19Sbj1hHOrIZcEscJEN5EHv30PXm/YrePix9wM+ykthsAxBJcx
	 RF/IsckJu+5LM+j2eELP6rptO7nE223xSnwXI0IxvSPS7oVyMucBQHmH7pks1gSWcC
	 tCtE0o/rXxVtA==
Date: Tue, 21 May 2024 11:49:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
Cc: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 07/13] ASoC: codecs: add AD24xx codec driver
Message-ID: <e2ab39b8-55a3-4afe-9832-b1a780b93831@sirena.org.uk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-7-b8647554c67b@bang-olufsen.dk>
 <e5782aef-d64d-46f3-ab5c-dc01285e08c2@sirena.org.uk>
 <edv5aqfnb5gdxfmrh5nywnzg3tzfdq27kfvpkhg2t2q2jwf7ej@vjqgiw3ssv3b>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IfNqVr8A6eo57Tqb"
Content-Disposition: inline
In-Reply-To: <edv5aqfnb5gdxfmrh5nywnzg3tzfdq27kfvpkhg2t2q2jwf7ej@vjqgiw3ssv3b>
X-Cookie: Eloquence is logic on fire.


--IfNqVr8A6eo57Tqb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 06:46:21AM +0000, Alvin =C5=A0ipraga wrote:
> On Fri, May 17, 2024 at 04:03:50PM GMT, Mark Brown wrote:
> > On Fri, May 17, 2024 at 02:58:05PM +0200, Alvin =C5=A0ipraga wrote:

> > > +static const char *const ad24xx_codec_slot_size_text[] =3D {
> > > +	"8 bits",  "12 bits", "16 bits", "20 bits",
> > > +	"24 bits", "28 bits", "32 bits",
> > > +};
> >=20
> > Why is this configured by the user rather than via set_tdm_slot(), and
> > how would one usefully use this at runtime?
>=20
> This configures the slot size of A2B data slots, not the slot size on
> the TDM interface. Typically one would expect it to be the same, so your
> question is valid. But it is not a strict requirement as far as the A2B
> bus and hardware is concerned.
>=20
> To give a concrete example, the TDM interface might run with a TDM slot
> size of 32 bits, but the PCM data is in reality 24 bits padded to 32
> bits. In this case, A2B bus bandwidth can be saved by configuring the
> "{Up,Down}stream Slot Size" kcontrol to "24 bits".
>=20
> More detailed information can be found in the manual in [1] section 3-22
> "I2S/TDM Port Programming Concepts", where an analogous example is
> given.

That still doesn't sound like something that should be configured
dynamically by the user.  Based on that description it sounds like it's
just the sample size so should cope from hw_params.

--IfNqVr8A6eo57Tqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZMfDAACgkQJNaLcl1U
h9ACLgf9F/4Hlcaz6ms2pQ1jUz65htj1EgnNuZtgs/G5QOQR/dSlJToXp1Fsk0+B
LX+uL2Bi+Va82Rv/PoN/GXymodv97hPrbFvwmyNHUaDncUXdlZSBVzo0h/3uk9Hf
P2yvFxZLGkFVMrCxAaA+/C75nwRoftdmd/DbxGCtmcfy9VCO95LVf9jP6pHmAWk6
JGJ+VUBmwqZZ3NDyFqRvujjpE1uFgWrvgracm1PAujirj0hcYbhXwVpOTxh8HWBL
1WhXTof/JrHLwVWAWFEE2nuh2ZziHMiq1sWYA6tCxhdtQZSc4z2EJnI+qXJfrd2b
ZHe0aWB3mYxQ+jN2cq3QGaG2KR7PUA==
=Woy1
-----END PGP SIGNATURE-----

--IfNqVr8A6eo57Tqb--

