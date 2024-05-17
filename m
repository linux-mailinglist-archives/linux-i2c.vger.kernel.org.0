Return-Path: <linux-i2c+bounces-3573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DF78C88F5
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 17:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0249BB22E91
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2024 15:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59BB67A0D;
	Fri, 17 May 2024 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNF4CVWG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C837149;
	Fri, 17 May 2024 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715958238; cv=none; b=iq2ym5I8oDxxNj7RLTr3BEBy1qMwb3wCLP9rPaYDoozZUjUpK9OgdgQ7krwDFN0kTPEWL6PPLNO2F/RAX11jlT07GbcURGYvLDC6ybvQiovWUGsGx/Fdi2xAmnMGTgZgV6+wahE0tnLsEtzhqbCFnDY2dpDhxQ2owXx+7ZhYzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715958238; c=relaxed/simple;
	bh=ows2zNDPZTSEXPPVIIdIEYEbYQxQQ5Em7kepFx0r25E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XR5OjhJCAdpu/Lb/qZoh/og8UeTo1j5DgWSxqzJwFGWmC4uYyidr9jWbl3NrFzSz8rSyr+roHVxKg4XSGMCJWjItJGCFoCV61X69ftPlXpNZ7mjs5LR0+BlSuP9k8Mebuolw4tk77MTBY7FYgq/qsfacpfkE1ITI5d0tps5j+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNF4CVWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A19C2BD10;
	Fri, 17 May 2024 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715958238;
	bh=ows2zNDPZTSEXPPVIIdIEYEbYQxQQ5Em7kepFx0r25E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNF4CVWGtKc6iIOYp3g1LWKKBE1c2KJenyE9HXOHCRjKtXOeY+OzwO9VeYLzxM2Lh
	 wK9/ar0Au/ImNeJigUkICKaXfl8oFOxRNfVY7NofT4C9tPu6+z6EDGVctbjClhs8XF
	 U3aANBZrX8VBqW/GXcKvcv3w/l0Fi5DeaPRPdN1EwTP5X/gR6K18WQTe9EW0Jb4k4e
	 kgN8ntW2UiiBi/D5Gd7DFkBW3eAADgys4DbMVqcE/3kFUkKY9xOPM1qED6o6/mLMcA
	 2f8CI+oJsQdy0hzims9EATeSxIqmLFpvXoXcOf1JcIa13JXK/CK1wVTRHDVYHto4OD
	 gO0lhNytwliAw==
Date: Fri, 17 May 2024 16:03:50 +0100
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
Subject: Re: [PATCH 07/13] ASoC: codecs: add AD24xx codec driver
Message-ID: <e5782aef-d64d-46f3-ab5c-dc01285e08c2@sirena.org.uk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-7-b8647554c67b@bang-olufsen.dk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="skuonK/bS9x9MsEH"
Content-Disposition: inline
In-Reply-To: <20240517-a2b-v1-7-b8647554c67b@bang-olufsen.dk>
X-Cookie: Function reject.


--skuonK/bS9x9MsEH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 02:58:05PM +0200, Alvin =C5=A0ipraga wrote:

> +++ b/sound/soc/codecs/ad24xx-codec.c
> @@ -0,0 +1,665 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AD24xx codec driver

Please make the whole comment a C++ comment.

> +static const char *const ad24xx_codec_slot_size_text[] =3D {
> +	"8 bits",  "12 bits", "16 bits", "20 bits",
> +	"24 bits", "28 bits", "32 bits",
> +};

Why is this configured by the user rather than via set_tdm_slot(), and
how would one usefully use this at runtime?

> +static int ad24xx_codec_slot_config_put(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_value *ucontrol)
> +{

> +	} else if (priv =3D=3D &ad24xx_codec_up_slot_format_enum ||
> +		   priv =3D=3D &ad24xx_codec_dn_slot_format_enum) {
> +		if (val >=3D ARRAY_SIZE(ad24xx_codec_slot_format_text))
> +			return -EINVAL;
> +		slot_config->format[direction] =3D val;
> +	} else
> +		return -ENOENT;

If one side has {} both sides should, see coding-style.rst.

> +
> +	return 0;
> +}

This won't flag changes by returning 1 which will mean no events are
generated and break some UIs.  Please show the output of the mixer-test
selftest on new submissions, it will check for this and other issues.

> +	/* Main node must be BCLK/FSYNC consumer, subordinate node provider */
> +	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) !=3D
> +	    (is_a2b_main(adc->node) ? SND_SOC_DAIFMT_CBC_CFC :
> +				      SND_SOC_DAIFMT_CBP_CFP))
> +		return -EINVAL;

Please don't use the ternery operator like this, it just makes things
harder to read.

> +	val =3D bclk_invert ? A2B_I2SCFG_RXBCLKINV_MASK :
> +			    A2B_I2SCFG_TXBCLKINV_MASK;

Similarly, please use normal conditional statements.

> +static int ad24xx_codec_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)

> +
> +	/* Finally, request slots */
> +	ret =3D a2b_node_request_slots(adc->node, &slot_req);
> +	if (ret)
> +		return ret;

Note that hw_params() can be called multiple times before starting the
audio stream, will this leak?

> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct ad24xx_codec *adc =3D snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret =3D a2b_node_free_slots(adc->node);
> +	if (ret)
> +		return ret;

What if we close without having called hw_params()?

> +static const struct snd_soc_dai_driver ad24xx_codec_dai_drv[] =3D {
> +	[AD24XX_DAI_I2S] =3D {
> +		.name =3D "ad24xx-i2s",
> +		.playback =3D {
> +			.stream_name =3D "I2S Playback",
> +			.channels_min =3D 1,
> +			.channels_max =3D 32,
> +		},
> +		.capture =3D {
> +			.stream_name =3D "I2S Capture",
> +			.channels_min =3D 1,
> +			.channels_max =3D 32,
> +		},
> +		.ops =3D &ad24xx_codec_dai_ops,
> +		.symmetric_rate =3D 1,
> +	},
> +};

Why is this an array?

> +static const struct regmap_config ad24xx_codec_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.cache_type =3D REGCACHE_RBTREE,
> +};

New code should use _MAPLE unless there's a strong reason to use
something else.

--skuonK/bS9x9MsEH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHcdUACgkQJNaLcl1U
h9ABtwf9HncflXNFY8QIXgA4cSV8pllWbpngmZChE9+u+sfBWesth1fTKTC9ejk+
lvIb3qtIDq9BorlQlfdfX8/arFQYpgrXcEhDIpGccNO2OrNZXHSNxnbz90q70XNX
MEil8c3aa9ciM2+g8z3855vKmv+pRCB+GZNbfW/zlmr4pTyumWRIjWI+RWCa5CeV
7w5xGqfedug4xGxlplhyM8Yyu9YDbY5C9GELhAlz0zPBJ+W8yCclZJSsJNYI+jcs
pPPel76R4NsKy7UGqOLoDgFDUFs1Ps5N0wxkeXg3lTUpsLHdu0JH0uifkz8evQ9L
u9RBNxjmWhezCSsPkWCgUbwzjSdCTQ==
=QFB6
-----END PGP SIGNATURE-----

--skuonK/bS9x9MsEH--

