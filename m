Return-Path: <linux-i2c+bounces-11324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C096AD3044
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E9D162D59
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 08:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D35280008;
	Tue, 10 Jun 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5DY7We+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A0482EB;
	Tue, 10 Jun 2025 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544098; cv=none; b=HuYOW/KICshrevZpDMoG1gEKl8r99C5gGWwqoAzv/BAYxjc5q2XBTwNN65hHoGH59cgHpnwNndAcHwnuXa6dLC+qmD3mV8NuUJUQWRcTWGYS88SsD7V37iv/X67X4/DOgc4XBYEH0GPQoxdqtxbqh9eNB+ZidMVt2hPQOBOtrHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544098; c=relaxed/simple;
	bh=/fRyzCVQCiFEDkQInhIowcouSEKQgag8GXH2jYiOinE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiCP7ZBVY3cg3ube5QzK3TxSFRQHyHRZUfVqfeNjeQvAXjIZSdBeuJXPUM6RLh9KVlCz2pQBwhb6aBeCZckFh4YEYNNPSnGTMAPPGW8cn+Aa8Ddqctjn3Q7A9VJtzZD3iyD75uQ3pu1TaYNgshlOkg5uxT5Tvm1BRTuRNZWY7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5DY7We+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1281278f8f.2;
        Tue, 10 Jun 2025 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749544094; x=1750148894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSc2ejrxwbqoW48QeuL4dH/UMS/dbklDTegGTuVuC18=;
        b=T5DY7We+TzTa7wotukb0Mdc5eC1BETrR0lzhTNZTGd/++MJdlTqf77pj+YxHyTjDDn
         bvWF9JjlCDoYznyLcZmKRnf6HQyfuWwuCTTbMyI0fxb7+X8HQqjiXgPGdHR4k6VXn1Gm
         J7/IRAORfSJ4w7Ium9clUOIn+DN/fzJk1Zc+EumMEtqkOYNR0yU2rMGuCj1uhGFwrjgC
         Dsp9k5xJoyYKMIYrAzvufhP4zkZnKr9NezuuGyIyR3ZgxqrHQvUI20dIKGL+M5ULEe2U
         hLhcFkeyU9KOVPDWMI/P3OSXjNmvCTIJMsS9g5xY9myRysdf3djMQcN5T6YGYhw8v47s
         WCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544094; x=1750148894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSc2ejrxwbqoW48QeuL4dH/UMS/dbklDTegGTuVuC18=;
        b=btGHwPq/lrjC3rboomzcSEOQhxGhUuHrdSCAbko9ukuf6qa/AfvnfcXGEMe8l6Eun1
         nomJWatugLK5W/wm0k5ZD3lgAhOJduGlP5QqXTGy/5PdyxUCQYZePGMhMBrFN8cPlm0q
         3WzjZebNap6pEquKhSLrvXxt1EI7ms/Xp+4BYNf6o2oHkVDbDx+fx3AeE02dphDorzMt
         mNJaXWntN0xAMmCAZU6iCYER5QPhLMc3NISVakKjXJVIzlzuxWCuZfjsLQeXr0uSSj61
         M8143k7yGp9YkJVeBO5WuD4LVyMm2AHhH/2M2wzwNw1um16Sc3IdXDfLVCRzJ2u8QGv7
         QLLA==
X-Forwarded-Encrypted: i=1; AJvYcCUZaQKnrhFf1o6/+FwyHPWhguGbR9QedRAu13mZMnNIjsHcdazDybGXZ9UUtjc7R+1SCDb9ocQzpBEip73o@vger.kernel.org, AJvYcCVSm+YtW9iHQRe4GzjhpRaTkzx3u70xEneJPsnzSPTF0KY20Bn6QluCUZyjBh3CiLK9Hpis77M30tmV@vger.kernel.org, AJvYcCVTpp0500/wBfo/d1duBU8Fg+WpDchVHh0lX1At4dAWQSI34cXqoQuaJf10QB7KfgS5DBCuvOHr1sZY+CM=@vger.kernel.org, AJvYcCVaOgyvaE/rX0LDQ4W6Ft051C0B4MviVFA/pGalBNso7EImfbMDr8aczIA7aPyWjftnYGnpPJR02dKN@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkXlmutYi47o3c7tLlsE0pwKE8PZnhC4r+5y3q90y8GduC2N7
	Za5Ol1lGJrDWlRhD9BOVeb7k5ua1Wr4rBIP9sGHlk4ANqRZwu4Fo5hxW
X-Gm-Gg: ASbGncs9lDyqpTa+hWp72RIWyMRivncHiC3tpVE78C2+d5YIvErsiK+eFbCglg4Hmkl
	9NSmzl8iO7OzBkoQVYh8xIGFREy4NRa6sokTk8PnCisuFpGjuamWY8auIwlLqkYqWriBh+tLwyy
	Okd5Gh/LXnELlFTJKFDDX0C1aOFePh6rQlW99xcjVBfOll5/fYiFqu5nNhBEAjayEhX3Ru/gzEr
	XbDKVMky42a9oV2bF/uxD/VOs6SZI1CJty3SBMVT6w9UYKxTqY49TtwzIUtpESoBewsrf2XyFwV
	4nWI/WPFjW/tYYUkkRozntXTFvK/N9XPeezBhv1zmnwIOR/P4CccX53Z2NVrqS0eplQVj8nulb6
	SoIRY5ATRcqNLkYJ5dmgqLpx930/qeuEXWhYBW9UmLahuclglzP3iiA0+9+M=
X-Google-Smtp-Source: AGHT+IGym2uDPn67i56Q4gRKCTF1Pq14CJwDdfPHVy4xpa4B/IUkGHpA4PhRj8/8Xv7nveP1ajMo9w==
X-Received: by 2002:a05:6000:2893:b0:3a5:2575:6b45 with SMTP id ffacd0b85a97d-3a531cb899fmr12589503f8f.48.1749544094252;
        Tue, 10 Jun 2025 01:28:14 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324360a3sm11750965f8f.50.2025.06.10.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:28:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:28:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
Message-ID: <z3evk6j53hbgf426kc4ltdv4dbisoqnwkfwhapyenpadhey6v7@zvbljg5svppi>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
 <20250609093420.3050641-3-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dme36rf6gwp73n2r"
Content-Disposition: inline
In-Reply-To: <20250609093420.3050641-3-kkartik@nvidia.com>


--dme36rf6gwp73n2r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/5] i2c: tegra: Do not configure DMA if not supported
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 03:04:17PM +0530, Kartik Rajput wrote:
> On Tegra264, not all I2C controllers have the necessary interface to
> GPC DMA, this causes failures when function tegra_i2c_init_dma()
> is called.
>=20
> Ensure that "dmas" device-tree property is present before initializing
> DMA in function tegra_i2c_init_dma().
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v1 -> v2:
> 	* Update commit message to clarify that some I2C controllers may
> 	  not have the necessary interface to GPC DMA.
> ---
>  drivers/i2c/busses/i2c-tegra.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index ebd51165c46b..c7237d26b813 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -448,6 +448,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i=
2c_dev)
>  	if (IS_VI(i2c_dev))
>  		return 0;
> =20
> +	if (!device_property_present(i2c_dev->dev, "dmas"))
> +		return 0;

I know that you use the OF-independent variant here, but has this been
tested on ACPI?

Originally the intention behind this code was to get some sort of
validation of the DT (i.e. dmas property is desired, so we want to flag
if it isn't provided) with the fallback existing mostly just so things
can operate in the absence (or if APB/GPC DMA isn't available for some
reason).

If we now solely make this depend on the availability of the DT (or
ACPI) property, then we loose all of that validation. I suppose we have
DT schema to check for these kinds of things now, but since we're not
marking these properties as required, there's really no validation at
all anymore.

My concern is that if somebody's left out the dmas/dma-names properties
by accident, they may not get what they were asking for and we have no
hints to provide whatsoever. Maybe that's okay if we provide the base
DT, which has been unmodified for a while.

If that's what we want to do, it no longer makes sense to keep the
IS_VI() check above, though, because that's just redundant now.

Thierry

--dme36rf6gwp73n2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH7JcACgkQ3SOs138+
s6G0fRAArMsGVATba0A4EvRyeLCGBYaQjICk09syX5VL65IABICLYMcmNCPCUKC/
hFqmUvswVXuCfe2FeOdvISnITTN3fcqY1Hsp82jBVmvEmCFP6USleSYGAc+Qvn5o
rtIUJI4BTTjm9p3G1dy/4IG92uSIIaXhwpo0P6Ras7rzVoPnqFi/0vIHnemoAeFX
NfDpnYeapDcvOWiJCxtxhTRLWo5A9L46m2i0S27cYzJWr85Kna1buYutJWfSun1v
zrdiSs6hA5SBEV2Sp/Pm52LuAgLDj0GGFFj6so7XhSvxnUAi13VjInNXA9DLEIJo
toR0BLzWH3pIMT0pmGw/X/ztvbuoch+WFJMmAmcyR5mTya4wSd+V3lrBIFZPy2rk
mwM5EXUwr6AMBb03dAE2ALIH/ECPnA062KTMaI9dLeWZFglWgoUDmX/jxDeU1YRG
Mlp3tkHnlYd2Q6Q9IjKYh34Wk12TESoY/5kkTGZg6i9PYBy8xN6LTDrw0AExUphY
EBzA22vX056uQ5llqXPGKdKbmrGAKKUG71gR/E3NdgbvxrCNKu7QeSA0aMTfSJBe
H8Z45PTPHgphire57LHajB2l00zLfH3BSkyW8z2q+AxnqAbYEqvRMhg8HyDDlWF6
RvR4E2ugPIKqNmiMHVtnrdSUt7ZlRalD/xBgB4RZI71ljVXdOME=
=yWqp
-----END PGP SIGNATURE-----

--dme36rf6gwp73n2r--

