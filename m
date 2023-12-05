Return-Path: <linux-i2c+bounces-621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8C80544B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 13:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923C62818A9
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 12:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8815C90B;
	Tue,  5 Dec 2023 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfFvdOgq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C801A5;
	Tue,  5 Dec 2023 04:36:09 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso31063675e9.0;
        Tue, 05 Dec 2023 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701779768; x=1702384568; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vi/+U1S70zCpRCmtolwQMMJpjEnLtDmB7aIF6AJ1vQ4=;
        b=VfFvdOgq00qRsq2xMcSXTxyqeNGdDJ4MXA7bx8Lncy8x4MH6a4ZkaHW9uG2miWHLBz
         SJO1zcZCj+ejBfp2ijjBwDMhdZfkn07Zse5u1tdpIYli4mJul83mbChpmo6wLridTU6V
         lDoZaGfMeYDC0jfGOUvhLxRMzpBMHxHf6hk7gI/hWNtr7rmBepxe3kt0k2RQQU8JKrSP
         +juKAwkUFIEru4q1t2QEJ5vgiORWFOqXuikJARSr1KftCJL2Mf5+X8QWOr4FcPq3Kibd
         su/m5ds+2LMEOdXpzWp620ef1iBXBi9KUkMUPGqFEAS4+0XtepApqcFqqONBG+WaCkI1
         cbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701779768; x=1702384568;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vi/+U1S70zCpRCmtolwQMMJpjEnLtDmB7aIF6AJ1vQ4=;
        b=AH0l64I/0OV8tm5OLHi724nq7uub2NVc3rtQCLEs0XnJXiCr4KD/cgZbUWiTbr80Cr
         rWli7rhPf7mizG3/gQimvoYFWNSQi766nMWC47FdturbmniMjp+Nm/7dmMfKIHPhUMgm
         fYPDg1tTnoSmVH24+cYj9pujgvTFpGV4Nk5w5cxLM90RHyWV0e7OriPHzE+JRw3lSyRH
         0qBN0TxCBEVhDFRQiuqsJRi7zVynY63yHrCzSm3H6I7px68COXk9Ujy7tU/iNZixqQd4
         ZqsYkjHieCReFL+aTbi5wle5hckT5K5OccK1PokHUbPjYZG7aQ0OZzSBHK0jHaCtZvkc
         kCXg==
X-Gm-Message-State: AOJu0YzFeUYPG6/K0+VPLPudXbHqSNLonSQ0TQcycLWHOfL+pDh5m/r9
	slTlwjsYba45AEVUVEu7lsY=
X-Google-Smtp-Source: AGHT+IFRXDtzFmX4tYMMU5n5XaYJrLQWKmuFyEOl3CF2puX317iplwOttL32TpsSZhFHKXsaDUn0Zw==
X-Received: by 2002:a05:600c:3007:b0:40b:5e21:dd2c with SMTP id j7-20020a05600c300700b0040b5e21dd2cmr431012wmh.90.1701779767917;
        Tue, 05 Dec 2023 04:36:07 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906251500b009ff1997ce86sm6715307ejb.149.2023.12.05.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 04:36:07 -0800 (PST)
Date: Tue, 5 Dec 2023 13:36:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific
 compatibles for existing SoC
Message-ID: <ZW8ZNZ_FJSV8fq-U@orome.fritz.box>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <170119374454.445690.515311393756577368.b4-ty@gmail.com>
 <20231128205841.al23ra5s34rn3muj@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tgq7dxd4jwke8dPo"
Content-Disposition: inline
In-Reply-To: <20231128205841.al23ra5s34rn3muj@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)


--Tgq7dxd4jwke8dPo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 09:58:41PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Nov 28, 2023 at 06:49:23PM +0100, Thierry Reding wrote:
> >=20
> > On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> > > Merging
> > > =3D=3D=3D=3D=3D=3D=3D
> > > I propose to take entire patchset through my tree (Samsung SoC), beca=
use:
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> > > 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAut=
ov920), so
> > >    they will touch the same lines in some of the DT bindings (not all=
, though).
> > >    It is reasonable for me to take the bindings for the new SoCs, to =
have clean
> > >    `make dtbs_check` on the new DTS.
> > > 2. Having it together helps me to have clean `make dtbs_check` within=
 my tree
> > >    on the existing DTS.
> > > 3. No drivers are affected by this change.
> > > 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus ex=
pect
> > >    follow up patchsets.
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
> >=20
> > [12/17] dt-bindings: pwm: samsung: add specific compatibles for existin=
g SoC
> >         commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f
>=20
> You didn't honor (or even comment) Krzysztof's proposal to take the
> whole patchset via his tree (marked above). Was there some off-list
> agreement?

I had read all that and then looking at patchwork saw that you had
marked all other patches in the series as "handled-elsewhere" and only
this one was left as "new", so I assumed that, well, everything else was
handled elsewhere and I was supposed to pick this one up...

I'll drop this one.

Thierry

--Tgq7dxd4jwke8dPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVvGTUACgkQ3SOs138+
s6FxSg/9GYBUdx6f/ahQ2fBXUlTXv4ykvHBiRJGfUuGbx8MJaPoRIbAl2gcTnwnB
fRuGMlQD0DbWYLVejy/wzASn//gvqYVp3sjPDSKFuFoUMSVNRBAJJy+DmdHcb7ia
ZnhU2k/meHpKnCP8Y3im5k1MEbiexQ8OShzyVx8ARU/Y4BXrj2SfODDI/KGVYFa9
Wfv2b1eoatUBHcDzYbjxow+qyza8E9Ym2b06HRhzQOotMSxLdBF5z1KP/29i4IWj
WGwsIEbPMmM4rLFmQ45IRWz7GwZL8Fh3afeaUijl2cytKINUgBSkvqPsQPx25FdO
xKMJHxcPjtERjnHorOGLNpotMNldbw2VRtQDD57QcqqqDBagcqpHfXwsOfuyK6v/
r9p9gAFCFjF/bpQlKZdwLZ/+khDrkH+UH3cR0OBq/mN1Sb4JcSKbLwv8pGE/F+v6
NXrlp9Xwx/gIyrRL6yijGCW50TXnE06/w4NDhHwi0tdio//f1BhQTWWYVKOArw0B
Dpsrq/yDC2xJ7afiBdfKs+nTFuujmcTS1OguA5v+Ww/8a8Bp5bsBJj5p2GkbJa/3
dChdDhsGy9As2KbUN2WYE+VIYUudcMiXbB8oKf+/kxhgwhSNgP+nirXkV422hKQs
0w+Dee6JI0kKyL3S8AjiEW3ZmbKqJpV30pgyRVUlSIXRjoljdzA=
=cbqG
-----END PGP SIGNATURE-----

--Tgq7dxd4jwke8dPo--

