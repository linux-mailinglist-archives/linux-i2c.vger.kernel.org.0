Return-Path: <linux-i2c+bounces-13127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56504B9781A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 22:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4461B2056E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 20:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D3130AAD0;
	Tue, 23 Sep 2025 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dybI6Wp2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C12F3626
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758659837; cv=none; b=FOy+slnJuMtyo5uOFPHBrMkmORjFYWC/lV/681sE38IItBsQmdFLTBpO7z75trUnLUjfDReaaUQBng97lcnoGpkO3dY+ga3Tt/ScH049AqMNHpPkdEfoWR8V+rA7bFXgXPm2ZIvHYmDpsCkQIwyGe2+o2zEeHil68lkfULEOSQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758659837; c=relaxed/simple;
	bh=1viEaWfVyp3fkGNWYKwrh6oVsyqNSfzkKujQIb0ZQOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPtwLZTfZBfnBt/t3xRADnnATDKBvvasHpZDPABo+opjWmtWy6zOhAao9Jrs4IMNi7U18R2DoaqhLYJq57DtbzlcVxnZ06kFPq8fKHJEvdgZu6G7LQlxKJT82eh6dMneXq4jq5K+zHbh0cCGlNVrnC1jKPkRCwLpzJY+WCwP7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dybI6Wp2; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-36639c30bb7so38642391fa.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758659834; x=1759264634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sdlu20rBCmLHD/cmCz6jZNQZ7hsZ/+Qk91a/GIE2IBQ=;
        b=dybI6Wp2RS41hnDZQeXfibfRRux5Dh0ds8yEsf0A/zKQxeXelQggkfMcSvmxU6bl8m
         bmPdzeHaAG/Dz3NMA1Q3oLQ8UK5IoBEbfrysFqM3ouP9oSWCfA5Nj5JT8PNc8EvLMNY9
         IuwVuju4jFPDBYYemDGI6zv10l92YvZEoUxez8yVyBaHBgX0r3uFMxVI07JyYKfrthNE
         4cZl59GumcqNWzFL8rwi9njOWeKuQpiFNxBsnczqOteFfwrHHU49xKmJuV04WZlF0WSX
         JpTnneabA0HiIzE3kegsx//XEd7AGmRSwM7aNjg2jPk5OZeMeCNYi5twiUxQT0PHXVpO
         hgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758659834; x=1759264634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdlu20rBCmLHD/cmCz6jZNQZ7hsZ/+Qk91a/GIE2IBQ=;
        b=gqhIm5CrQEpTFW4yQt0Q/OJXhEdnhgegaTmM1bLHq7eH5CVthw8kcI+JYyst5fmR2n
         DDvW0jRIm1BaBxAqohJBq+I+RzFBk++i13TawjIYZEBAPfkTCjHvK/bZm8rF2YEizBxZ
         WEaneDKUyRyseATciaCKnzkDFNtdKyWC/AtS9mKumSd9XaEqmJ/F9VLZhZ5OIpbcspGZ
         RJfIp9dolUTaLgZk6mV1eg5mfCyeZtTLEEDOGAbZ8uiVk7btsOxbvO+B4pZRCxlAqH9j
         uE36+K5crB2eG/yu0nUmNWGqLa+YPLb3dyoHyO1t/1q8lq+rAah8MnhFRD/+X44j0Jvw
         qo5w==
X-Forwarded-Encrypted: i=1; AJvYcCUG2KwksQdteY8LpwiHJiZReqJk5DGY26eBdeoEg0QxEpSmX3JoX844Z9ilztmg9JqpdblBDqdEe7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykhaSmafIHWyW9kLqOsMBkCxFGygXGiz8ZCiN8w/i2LltuBgd
	x0IXTwQRkcceimolye8uxdg3GZrc86pTODNSVz27NdmBW54n3OugE0JPnbDtcw==
X-Gm-Gg: ASbGncvDXOH3zkbVCV37sDoTH+IO4gHRrX8etY6M8xuzm7FcOPMnkQxf5XQXtBu2WBx
	95mmCGBIjXEDF4Zzh10Ol+l/05hlzR2RWLuKHOqL2mmu1mYJzBmmkjvBzkmw5/TMumEHUvtzFlK
	KxaG4Iqw9nfzdyjyVNqCxCYOQ/RRhCjIsTJqBpulQnhvJn7HtmVR+26t9wJLACHyfas4MMfbdY1
	49BeJ/713EOcDsTl7d/HZBYFwkzjKmrKinY8w0yEIxcUZ50NCB3x4TrcolhqwFnDE/hrnTGYH2Y
	eFgXsvDGs72Qm1g7umkvgng6bcS0/hgq258x2YHO82rptXOisli+MsE3stSfzrFHt+GOaFJ1AMA
	FJac4vidmJPQqsSe2X05gmB0CDyqg4N3I0KUUjqfGw/Q8nOcig7BhiJybW5c=
X-Google-Smtp-Source: AGHT+IFuA8I9VNhcD2Q41OOz3JJ/4CvcKHsvlANmcOu/VUqlfohOjCTLqnQUny7hlksdlQImrup3GA==
X-Received: by 2002:a05:651c:4395:10b0:338:735:8a79 with SMTP id 38308e7fff4ca-36d150a49ecmr11764551fa.1.1758659833515;
        Tue, 23 Sep 2025 13:37:13 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36c7a76d202sm10325501fa.19.2025.09.23.13.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:37:12 -0700 (PDT)
Date: Tue, 23 Sep 2025 22:37:10 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 0/7] I2C Mux per channel bus speed
Message-ID: <aNME9gWzazXTWtzw@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
 <0186ebba-958b-8076-3706-1edc75b6c6d3@axentia.se>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="otWbKmgQiAM7SsCc"
Content-Disposition: inline
In-Reply-To: <0186ebba-958b-8076-3706-1edc75b6c6d3@axentia.se>


--otWbKmgQiAM7SsCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Peter,

Thanks for your input!

On Tue, Sep 23, 2025 at 05:10:16PM +0200, Peter Rosin wrote:
> Hi!
>=20
> 2025-09-22 at 08:20, Marcus Folkesson wrote:
> > This is an RFC on how to implement a feature to have different bus
> > speeds on different channels with an I2C multiplexer/switch.
> >=20

[...]

> > Patch #1 Introduce a callback for the i2c controller to set bus speed
> > Patch #2 Introduce idle state to the mux core.
> > Patch #3 Introduce functionality to adjust bus speed depending on mux
> >          channel.
> > Patch #4 Set idle state for an example mux driver
> > Patch #5 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> > Parch #6 Implement set_clk_freq for the i2c-davinci driver
> > Parch #7 Update documentation with this feature
> It seems excessive to add idle_state to struct i2c_mux_core for the sole
> purpose of providing a warning in case the idle state runs on lower speed.
> Especially so since the default idle behavior is so dependent on the mux.
>=20
> E.g. the idle state is completely opaque to the driver of the pinctrl mux.
> It simply has no way of knowing what the idle pinctrl state actually mean=
s,
> and can therefore not report back a valid idle state to the i2c-mux core.
>=20
> The general purpose mux is also problematic. There is currently no API
> for the gpmux to dig out the idle state from the mux subsystem. That
> can be fixed, of course, but the mux susbsystem might also grow a way
> to change the idle state at runtime. Or some other consumer of the "mux
> control" used by the I2C gpmux might set it to a new state without the
> I2C gpmux having a chance to prevent it (or even know about it).
>=20
> You can have a gpio mux that only muxes SDA while SCL is always forwarded
> to all children. That might not be healthy for devices not expecting
> overly high frequencies on the SCL pin. It's probably safe, but who knows?
>=20
> The above are examples that make the warning inexact.
>=20
> I'd prefer to just kill this idle state hand-holding from the code and
> rely on documentation of the rules instead. Whoever sets this up must
> understand I2C anyway; there are plenty of foot guns, so avoiding this
> particular one (in a half-baked way) is no big help, methinks.
>=20
> This has the added benefit of not muddying the waters for the idle state
> defines owned by the mux subsystem.

I pretty much buy everything you say here.=20

I later saw that, as you pointed out, e.g. pca954x let you set the idle
state at runtime which would have increased the complexity a bit.

So, I think it is better to do as you suggest; remove idle_state and
keep the rules in the documentation.

>=20
> Cheers,
> Peter

Best regards,
Marcus Folkesson

--otWbKmgQiAM7SsCc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjTBO8ACgkQiIBOb1ld
UjIwfA//Rz23XygcpF0dwlGWKA/FBtIORJthioBHmNmVWREax7GLJ/h8ziRohWL3
kTW9O/vVbYdJe3LhvBazB9KL2JjRh1A0p5ijLiuI0Gw6WYy9sqroZV7SzmP3P8WE
PzLR41O9IVVEVvBcWSmh/0Rcm+cYAeLwZ2F1O4yiplpiP+Id7f378pCPPxaFtN2g
Ea9J0o09LccZC4nERdvrI9QUrfxxiPUBF71+VMrX/Wlc1gUI6JsmGgqpIiz97kiC
IibpcKgNocQgA7YWCbL16EvFkX4k+HF2L7UQqGtijV0OSNxFtsC2woavw2qJFBjl
IZtS8aLXdx9DevdcUuYXscf6mwGVFZQDNahDS2KGknsHj3DMvEFO9AMEcIb7995j
j6SPF6l9/23SqC5mYxQ8t2PSnbgTvfZN8HqycI8oiV0y4QHNrJ1dK6S/BaHcInRw
C4IKNyMZGclPFreGDD7JdxRu/XgQb3ZfJi156LEfuMSMXQkUPCLWbGjT6DOcy+Pw
tHAiEr50HWxVwpt/TUfualMNd2ldXQQDTW7Iyz2tTlQn78BZU/Ku37YXKg9vPe2r
wURBzM/VUk+ToGhH4lI14vqTVlOFi1keu6dnae7Bb7yAf9W372JnVhwwNiU3HXbf
FXnOTa4MlQjThE+eerYrSTnDu0bViq4w8wsg9hlSXp7w0+A+4Ec=
=av5T
-----END PGP SIGNATURE-----

--otWbKmgQiAM7SsCc--

