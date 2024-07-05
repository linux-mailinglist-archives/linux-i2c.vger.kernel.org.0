Return-Path: <linux-i2c+bounces-4660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5890928718
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 12:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15DE2825A0
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 10:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FBE149003;
	Fri,  5 Jul 2024 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTGgEA5H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08641148844;
	Fri,  5 Jul 2024 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176693; cv=none; b=XAs55txlRRbKjPKdh47G/P5HgH8qnktO+LUbsB69QdD/96hrE6gcpKcWYr3rDYV8gwx9/c7cSgMteiYyg0a8md1SR/t6gsjHPdmt6RnsOJFZvTMnTanHc4UKyVSKBLSRh138vb3ejG7/KmSrBjJuTZ4+QW32UsvpY9o33xvxnmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176693; c=relaxed/simple;
	bh=AJORAJt9fiLAKgFuj43ReMllSSzMOpQ76O1O1Hy/3gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwCABQJ0iX82mvEgz/kKM8L1rfQlOVVG5CXK3uEF1SQlgCKQsOQ6nX0sD8iCFFLcQTgIonCg06F6u8xPuu5XgtMa4NFbS5f7atctc8DTeWkp8aFHMOGi22zUAL7V5qV8ka/w8ZYdO1B9OHgWSly4ygonYRwSbGGdKQy5xeQtr9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTGgEA5H; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-367963ea053so1136518f8f.2;
        Fri, 05 Jul 2024 03:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720176690; x=1720781490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJORAJt9fiLAKgFuj43ReMllSSzMOpQ76O1O1Hy/3gA=;
        b=BTGgEA5HqmAOdW3KHJI6pwysUG2UuaWHjI373dcJjUmYvlB1uTN/u2Wyosco6nL3q2
         Dfvah/yDQ6gNtqTacMAjie6ZOTNB8F+r2T6K+5dgFvcwUthjreoVuHzuPSKr4szRaDeR
         KUyv4xnMC3PjvP1c/GOhdsWQEVFDdkZfTGmKKDFGlKnW6wQgDYpo/NJVHMV5gqVotS6d
         NG7nN7DqjVmawnFzfkt2cRnVU8iA3xxhgjFWRZytJrnZFBQt3MpVAJl+5zf29ecotjIg
         CkXcb2Z+9006HxjAzESM6Krx5IC8DOZvTuONTWWCFc3USInPE3ruI042A3C7/t81/U8J
         73gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720176690; x=1720781490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJORAJt9fiLAKgFuj43ReMllSSzMOpQ76O1O1Hy/3gA=;
        b=gBz6/NyBy4JxLmVslp+6iERYRNwo9uHBkDttJKzrpIxlIpxql1Dc+msi1GYkfRWX2Y
         LWeiw1xU3XGCmC+R7dhv0N/9uCi1b/INE4Bxqkha07+si/ia5+fGm9PJZzidE7RSO+aF
         QrjCv3hgAQ2Ey9Rg4A9r03rCYH3iO94pytlPHZc6drPN7eSGSzuq8KpvBJ4CPvgB9T27
         5dOzIGM/FkzQ7QtLKHJGiyrQU/LBrFeX5iUSmU0NthdXORMl44AcfhfWTGvB6s2qlmKy
         oK/Uqf5ZJ+J6XELoNLc8nX+0i98Gpd29YDrz6hbCNBJs/3+cXA9c9hZw+JrW/w8BYhQK
         kuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXX1XhWkx0gs1bvpd+SYoujBkM08G3Eq8WEiTX8eO5QM3jfh1Yh/l6IyIvmSJveEL/IQESU2khYVvj8hV+FmNg0LbHCV7sG2N3xbjqtGdg4pxSYwTpfcRHJwnbGAeukHmc1F/FSxul5Yq1kEvyx/6W7Gp17n3XT+ozgMFD6HypTNY82Me29M2j+dQ89TneA2nClqKppwmD91IgTv4LvIBJpA2XnEb8iIV8VeVWIsL4WP0fxam30bQB/bSlP9xSKMRFRpJ9gD0JDrdtzq8ul5UBDi1cPJG1
X-Gm-Message-State: AOJu0Yzl71BNvTMhF7AoIv8lXWhfrNmJlqArrN8UhV6vdmeu1L6Q+C3M
	9WwaTu6POTo69lL6K1QIzxfyW7xFkmXn51wuxsLhf5+xlXV8Vy2z
X-Google-Smtp-Source: AGHT+IG34mbke5IJo5cR/e8+OiQhSsIhfKjKH4QYsroO50LYMy0yaGverM7QDVIx2MHrrvn7/LDdLQ==
X-Received: by 2002:a5d:4ace:0:b0:366:e9f9:3d1b with SMTP id ffacd0b85a97d-3679dd10557mr3837762f8f.9.1720176689607;
        Fri, 05 Jul 2024 03:51:29 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367938a6e97sm6252663f8f.109.2024.07.05.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:51:29 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:51:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krishna Yarlagadda <kyarlagadda@nvidia.com>, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jonathanh@nvidia.com, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org, 
	adrian.hunter@intel.com, digetx@gmail.com, ldewangan@nvidia.com, mkumard@nvidia.com
Subject: Re: [RFC PATCH V2 04/12] dt-bindings: misc: tegra-i2c: config
 settings
Message-ID: <qg7epd5xmwefp7kimlgummlktnonrd3pd7obnq3chgzrceg3lv@t4iyccqn2zdt>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-5-kyarlagadda@nvidia.com>
 <20240701174227.GA148633-robh@kernel.org>
 <hqlckp6hxvxwkkbiagdb5pm4eo5efu55hwuupdal6lojxj2xu5@5zibskqdbdju>
 <CAL_Jsq+hzbHKeKM9UnJ=VK8_rKs5HJpZRGH2YYWAvjtf9SbPRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2yfry5sotijauhey"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+hzbHKeKM9UnJ=VK8_rKs5HJpZRGH2YYWAvjtf9SbPRw@mail.gmail.com>


--2yfry5sotijauhey
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 02:21:04PM GMT, Rob Herring wrote:
> On Tue, Jul 2, 2024 at 4:29=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Mon, Jul 01, 2024 at 11:42:27AM GMT, Rob Herring wrote:
> > > On Mon, Jul 01, 2024 at 08:42:22PM +0530, Krishna Yarlagadda wrote:
> > > > I2C interface timing registers are configured using config setting
> > > > framework. List available field properties for Tegra I2C controller=
s.
> > >
> > > How is I2C bus timing parameters specific to NVIDIA? Just because you
> > > have more controls? No. That's no reason to invent a whole new way to
> > > specify parameters. Extend what's already there and make it work for
> > > anyone.
> >
> > This may be applicable to a subset of this, and yes, maybe we can find
> > generalizations for some of these parameters.
> >
> > However, we're also looking for feedback specifically on these config
> > nodes that go beyond individual timing parameters. For example in the
> > case of I2C, how should parameters for different operating modes be
> > described?
>=20
> Like what? It all looks like timing to me.

The problem here isn't the individual properties but rather how to group
them. More generally the problem is that we have a set of settings that
need to be applied in different variants. Yes, they are all timings, but
the values differ based on what mode a given controller operates at.

Take for example I2C where we have things like start-hold time or stop-
setup time, which we could describe in a more generic way (i.e. leave
out the vendor prefix). However, depending on the mode that the I2C
controller runs at (could be standard mode, fast mode or fastplus mode)
these values need to be adjusted.

So it's the same set of properties but with different values for each
different operating mode. As far as I can tell there's no good construct
to describe this in DT currently.

> > Would you agree with something along the lines provided in this series?
>=20
> When there are multiple users/vendors of it, maybe.
>=20
> In general, it goes against the DT design of properties for foo go in
> foo's node. This looks more like how ACPI does things where it's add
> another table for this new thing we need.

Well, that's what Krishna had proposed in the first version of the
series, which you guys rejected. The problem with that is that we cannot
easily group these settings using nodes because subnodes of I2C
controllers are considered to be clients by default. This applies to SPI
and other busses as well.

This approach avoids these issues and can be more easily optimized since
settings could be shared between multiple instances of the controllers.
I have a slight preference of putting this into the controllers' device
tree nodes, but I can't think of a good way of avoiding the above child
node problem other than what we had in v1.

Thierry

--2yfry5sotijauhey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaH0C8ACgkQ3SOs138+
s6ElSBAAm6OJyI/B+iIOpmlkdlzG7L2zx/a8cXmzetbdsb5pIpZW1oED1gURbiYJ
YLp50cUtKcBt+sQWpmf0FWUOCJaoN/151zj4ECK4ptlWRdoaiLm+mC9kG4du+ppz
p5OSGjhHqva85PR4D1jQLOxPZOY2fDyA5tg4HpdoN9TzgrpZtFRawAUJun5f3lXL
XdyXai7qCiYrGTAOHthRSzp/HyROYmYqZkku2cNsudgJa1KDlit5VvQzv2JJDA9/
7mVLHI29v4Fj+OpFgiVnXUDtGLkeUBLCkcNOsKQP9NuTHt6dDMlTCv4BKCA+epIT
mQeYkYkzyT2FpFWiQqPRsaMzJmNArjGgX2vBSsciU5o9VwF8+a+pYg+s7PiwT1aw
4hz8HA7MpQeUWktOoaIY0pLrw7D0zCHAsVaRvq4uEOvdFPlefYyo12jP8fLgLK8s
5I2+Z2qDYuJYPFW87Mco9AjopJe+J25a2L/weVUdyj8a5QvAjrPyiOaS+A6ycnnb
aaKCL3XEWHyIwC95R2QBXqa0bnCiL8eqIyUF7Mwjg6khLJW4pETth9E5eKCPaq9i
RWKwlvlGKkIedXqFJ/hchK54treZG14Tcdc3Jpm8ky59zZQWQ19zQMJwsfYThwFQ
kkL+pOqr/LWSgdrIKDUhZalHjT83nQxOD/cWXs6nww1+M5eeV54=
=6Nt4
-----END PGP SIGNATURE-----

--2yfry5sotijauhey--

