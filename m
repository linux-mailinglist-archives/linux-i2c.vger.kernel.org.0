Return-Path: <linux-i2c+bounces-3671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546D8CE1C7
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 09:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385271C20E57
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 07:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F2C839FC;
	Fri, 24 May 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5WqQ140"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F50B273FD;
	Fri, 24 May 2024 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716537129; cv=none; b=YXl1fd/mABPEEFe7HW+bEoAgdC9LdlihOTSA+Tl3LNXdbohUNYZRjfWTDmSsai+ZdzP/Rov6DH8sKtWSgSVPBYeBZ4tbjcZxfOoIS/3hRufxTmQPKEPgEy1J20MXa1YgJL9zJythYaGs2TaXwpEy3Pgg8FmYSfXltVOFfrnoLnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716537129; c=relaxed/simple;
	bh=MjBK2+dYLp1CdY6g8R/OhSJwEQPIK/CNCRXCuJFMwzE=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Wdw2sXdt2cG5IY4Cx3g0DMUNH+EGOLxkNPhYSuf+PRQdnkag7ZudVnJzgzOGCY6epLbpelR6wZYKBMZ3WdzxzJOuImuALOrBxpIRXoqmWZK15NiDt57siK7qWgyj9TJpCkX8Xs2ZGFJJ32TKXQtx4agKrRTqwnmDuQsN+mKtozk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5WqQ140; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so59553855e9.2;
        Fri, 24 May 2024 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716537127; x=1717141927; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xpOH0pit2ctvVAA8aW14MWUGNwzhLD66U+MeS8Uxcgo=;
        b=W5WqQ1402OjaOTTBnQxXuTUStnJvMh7CCmWmC2vW1Sv5z3NlVJG8sja3eA9047kDaI
         kX8p8olgs3ULf/BdyxAOvcmYOYtlpvbq+MgXurwNb8qhLUwcQfnWNM8Ro1JJq1vf/BiQ
         h4gdsvrcdKJR99twNgAogGBXPgMh9b6p8Dv2pD7jr1EegtxXSfBuczW8p8Wwxl9KrsMZ
         u2lDVKnNHDdXBWL9CuAitmXtudUYgmXcC43423O+8ZGaJxSnze8UvNrycAlbJbFn14o8
         yArS1kiePLiy3GsX2OvHjozCYQmtr4hPmugBG7Nn8uH1tIjmtKiPNq864GoZedSfGe1s
         Y1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716537127; x=1717141927;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpOH0pit2ctvVAA8aW14MWUGNwzhLD66U+MeS8Uxcgo=;
        b=cEAUMtz5/EWJCGAh2nKtdJVxtyrKXnri0JUyWYc4pyLJGE6k0ROUWN3ZXY3IN+SHnp
         txU3Vk1JjjdBXZSNm93NA3TJtRLngxLxckEUWa3IiViK32Ha8DPqF2TtwU3y3ZpXn3zd
         ZG7pU8cV5ErKcjjXhSn/NoSi2zqO0kl4a3u598JDBmrZK29w9hBtECQikZif745nlgLH
         l8c0l8slJ7NI5xUpnIjFBTrKmA5ghjnf/sbdQ4B8K4BYkqXHIpNWULgAWWk88bs/9EVo
         KTaz0Z6kITeVf3ipu6oZ0lgP01J01Gwwl9HdBe6QxOjwUaqM1N2jZjsWG6fJR28CaUxs
         UpZg==
X-Forwarded-Encrypted: i=1; AJvYcCWJtXvV2yzvHmxger/bS3vGpatMATlkpqcwsJAXMnb+oiLRkzFD7J/X81MiFjYKgmgrOhQxOejmSyk/FU2Khh3bvGH0xKPCNNSEWXlOkZMStRqzhj3wjMyIIP35LBg2HWd8htPQRpDUFifsyZOvZi/iG1E0lc0v/F6zEkCZCNkSNeEgr8XDVAesX4d970dZd7ebWcIfbkStspiJPuDc4p0rHgYF4154z0k0O/3RxF5u0Bjat2QQWBC+OpS9cpPjZ9WfZcSsD5aUJQ8RYVnsLjKBZYTST0aT
X-Gm-Message-State: AOJu0Yy4IU9+eI2OIegBXMl0D8M/5SeCNoKNz7mf3Nho3WOoWW2IGzDd
	Zh3UN7k4EEcEGVokHh3DLYSDZm+EIrmijx4D6WEdrUIuufLOf67K
X-Google-Smtp-Source: AGHT+IHycvDZr6CKJKqSZlsIR32lGvACNpCEm+RbcTm7UzKj3bS3g4IDhMzUmN0QDCQrfDu0crtpLA==
X-Received: by 2002:a7b:cd94:0:b0:41a:f76f:3362 with SMTP id 5b1f17b1804b1-421089d3927mr10273385e9.21.1716537126410;
        Fri, 24 May 2024 00:52:06 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fad7ecsm45907975e9.36.2024.05.24.00.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 00:52:05 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=814b05467eb5fb3d1194dffe0bcc9ad51fe1c1889dcbffafdae7b5a67172;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 24 May 2024 09:52:04 +0200
Message-Id: <D1HPMKUW9LW5.2UGOGXXTNBB52@gmail.com>
Cc: <jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <andi.shyti@kernel.org>,
 <wsa+renesas@sang-engineering.com>, <ulf.hansson@linaro.org>,
 <adrian.hunter@intel.com>, <digetx@gmail.com>, <ldewangan@nvidia.com>,
 <mkumard@nvidia.com>
Subject: Re: [RFC PATCH 00/11] Introduce Tegra register config settings
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Krishna Yarlagadda"
 <kyarlagadda@nvidia.com>, <linux-tegra@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
 <71c52a0d-b788-4bbd-b409-6e62e6aff222@kernel.org>
In-Reply-To: <71c52a0d-b788-4bbd-b409-6e62e6aff222@kernel.org>

--814b05467eb5fb3d1194dffe0bcc9ad51fe1c1889dcbffafdae7b5a67172
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 7, 2024 at 8:38 AM CEST, Krzysztof Kozlowski wrote:
> On 07/05/2024 00:51, Krishna Yarlagadda wrote:
> > =20
> >  Patch 01: Documentation about the device tree binding for common confi=
g framework.
> >  Patch 02: Common parser of the device tree config setting node for Teg=
ra SoC.
> >  Patch 03: Device tree binding documentation for config setting.
> >  Patch 04: Device tree binding documentation for the I2C config setting=
.
> >  Patch 05: Avoid config settings child node to be treated as I2C device=
.
> >  Patch 06: Move clock initialization code into new methods
> >  Patch 07: Using config settings in Tegra I2C driver for interface timi=
ng registers.
> >  Patch 08: Add Tegra234 I2C config settings in DT.
> >  Patch 09: Device tree binding documentation for the SDHCI config setti=
ng.
> >  Patch 10: Using config settings in Tegra SDHCI driver for tuning itera=
tion.
> >  Patch 11: Add Tegra234 SDHCI config settings in DT.
> >=20
> > Known Issues:
> >  - DTC warning for config 'missing or empty reg property for I2C nodes'
>
> Which should stop you from sending buggy code, till you fix it.

Okay, so this RFC series was meant to solicit comments on the general
approach of this. Fixing this known issue is fairly complicated and
involves patching DTC, which we would be prepared to do if this was
generally deemed acceptable, but doesn't seem like a worthwhile
undertaking until we know we can move ahead with this.

So rather than categorically NAKing something that was sent out as a
proposal looking for feedback on how to improve and turn this into
something acceptable, it'd be great to get constructive feedback on how
we can get there.

Thierry

--814b05467eb5fb3d1194dffe0bcc9ad51fe1c1889dcbffafdae7b5a67172
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZQRyUACgkQ3SOs138+
s6EYPRAApKj6TZ45ihKFbdihmJOaY25HqHqqAOmw/WIDGwBEJMrVVW41xioiMLzp
k32CEAFP5kxE3WPay97YquvQn7Vh4qhe64qYPr/UaTsr3TeklU2e/G/E1xfsTTAt
8jjR5dfSPG2uoCaHgQ5R+nOF1UTH5+1BLLPNF0rKacaFe90o/rLpH0YZG7lSH7Te
jOU8AinN/cd68weuz1aRdVcylA/XSUOy62QU6uJKAPSVNgfYMp5P1RE+drnyP15V
H5Xx9Y9QhWSfIoDVepJXLfZkz/l8MowjLxFVFg0P3On0A/rHTDilHHOntZoj1x3d
n2xFR35NZo7DdkewHcbMHUyrUrsSzTQC4JvjD7Ecx1HmpQTjo079AabM/mFdI9te
czUUPCzwlqr/GOyW8sIz00POG0+jzVLNXJKWKJOkbTJepXkR95EVSYS53wpcAUp0
oOW5dHWbl64xDCZa4BFoIJZ3N8tYnPEetfGdPxFklNnjKwvGWuFqmuHyKQb9O+Js
/bpmc+xjo4kghNnoU55N2pDzizeDahkutILnSY2pd/MdttXlfD9C7xQAYjVFPs6y
gPPHNZ9Cz8AjV3HN8N87CqB1plGzLpF9MnXZgyPS84PYDwG+G2bJAaT4vUHznr8/
RtYG3PwbFX06/nGAkYDQOmpkaK0A7L4Sz0sAdw+MkRS/xElALp4=
=AtSK
-----END PGP SIGNATURE-----

--814b05467eb5fb3d1194dffe0bcc9ad51fe1c1889dcbffafdae7b5a67172--

