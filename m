Return-Path: <linux-i2c+bounces-3570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C138C883D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 16:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 142E5B24B9D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 14:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD2D8BEE;
	Fri, 17 May 2024 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjGwxqiz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC6399;
	Fri, 17 May 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715956960; cv=none; b=Y5HY1uKDYV9554fQw0Txjkj5jAw4dZr5w5rANp3BejILai62atWoax9h/HIuGcbi1oXLDkR1jTFzPmxsDilMttz7YJBmsILPCs1MA6oBqFfeLQcArrdeuOPIGB3+KCkgy8AeWHcowmuWudzundc7Q4c7SutTc3i6gJ1XoI4vymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715956960; c=relaxed/simple;
	bh=jKRgN0QD9wRM4aUvZG8JXovQYD/wGll0Cdifvs5S1b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbqOsqSVWDXRP2vKxJfCKf7K5KCX9A9xO3ulGhSTDxw6Kcapng3LWiW6tCUvz0HssSOjMxoLuvrt07uTOebcJHiqA3P8wi7Ejix9tymgpu6jWEAPEMOyTxQwg4PEh3iD3VX1uHOhE0Fsnydse6tf+0RKi+E5f8ZthhYbhGbMhUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjGwxqiz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32D5C2BD10;
	Fri, 17 May 2024 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715956959;
	bh=jKRgN0QD9wRM4aUvZG8JXovQYD/wGll0Cdifvs5S1b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjGwxqizbfMy/89nLYJd7BTwYgtKI+YKReedplRu+ebvikohESEJ4mNl/EVFV6PH1
	 k/n35Tu7ytDaWdmUDDV1Q0ne99h0qszV0pEl0ZT+/Xh9OProXD2gN4QsqNEIZdI1Rw
	 1K4zMSuS5Nt4j1LF+hBRqR1buTcgJ6HdEiBayh3vMPwDWhsI4K3xKxvVBCtAqCBb3B
	 2nWhT0jF/nyqtiOJx+mWzL6Ha4ldnVgSj0JiecEVj1D8Dc+AoIhYR6LsV8i/PwXN1N
	 YXdYXgo4YurdqCHEpfBRTszB+kULbJQtxh43prQkSSM4w9JHfvtj1yh55hxPqFFCAn
	 dAyaXe/ts0v2g==
Date: Fri, 17 May 2024 15:42:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH 02/13] regmap: add A2B support
Message-ID: <49cd7b8e-d104-4136-bf7d-7eb45725c596@sirena.org.uk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-2-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qt8EKyDk+1Qw4HPv"
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-2-b8647554c67b@bang-olufsen.dk>
X-Cookie: Function reject.


--Qt8EKyDk+1Qw4HPv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 02:58:00PM +0200, Alvin =C5=A0ipraga wrote:

> +static int regmap_a2b_write(void *context, const void *data, size_t coun=
t)
> +{

> +	for (i =3D 0; i < count - 1; i++) {
> +		ret =3D bus->ops->write(bus, node, reg + i, d[i + 1]);
> +		if (ret)
> +			return ret;
> +	}

Just force single_read and single_write (looks like you'll need to add
the hook for the bus there).

> +struct regmap *__devm_regmap_init_a2b_node(struct a2b_node *node,
> +					   const struct regmap_config *config,
> +					   struct lock_class_key *lock_key,
> +					   const char *lock_name)
> +{
> +	return __devm_regmap_init(&node->dev, &regmap_a2b, node, config,
> +				  lock_key, lock_name);
> +}
> +EXPORT_SYMBOL_GPL(__devm_regmap_init_a2b_node);

Should there be validation of val_bits?

--Qt8EKyDk+1Qw4HPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHbNcACgkQJNaLcl1U
h9DP5Af+OAUcNbSUZNsBiGMNoWWL9BqTN9x5hsblj8pit+bjIa6k4Un5NW4To/Tz
lpxrs+5G210GiKB/Pce3ysC61iSyxxAEtYi+WxNbUTNgMXcEcxXlA7REku4GaqUB
aBg6LevsX756RuU7lTJaIyYZigD0X5a8s1MOqFbRVsTI9cMRvDM/65Gxvp61+ea3
IrLkn49TOwHAfk66W7il6diBi4ZLseiGII8I+i0wanPqNauRyXFN9l4pnZW4AtLt
HI64kfng1cRujCp9NSDUwYoo5xabgTY1129pRNHsy+qr0alqiTt0GMabpNRqiAxl
pqz9+CYAZjxgLgtP7zyeEuFFmao9wg==
=hWRE
-----END PGP SIGNATURE-----

--Qt8EKyDk+1Qw4HPv--

