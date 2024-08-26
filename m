Return-Path: <linux-i2c+bounces-5817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1495FA29
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 21:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F45284ACF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 19:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9233199940;
	Mon, 26 Aug 2024 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="yMt3jDjC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69552194AF9
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724702212; cv=none; b=c/oVhup3iQ0QJpXrQfK4OUKbc3el5I8PXEYAhS/i/Av2WV65VZADniT+qi6iH9uadXE2wSAeuviXEXRWQzudMXdFTPKSUXPOa8Rn8vFW6ajN4ZqwNl7zToo01l2xmu+YScjAEIhlvdTWbH9khMhZdQTKL+BTFHVtk8oX25imE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724702212; c=relaxed/simple;
	bh=f44u1tmOhjyUpYSb/IUGjf0UFDthWX1iuarJYnkxt8E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=omrd3C55HAeDmAgJEDMwGUvz6MdJdq8R7hchoafLyg6l4nqfrOba/yKPiy4mu/gUf5FZ/1nkiN0Tdsm62IMgo2qjm2+IEc7adkBQd7STuvFnBw9RMhAZftgB9nBzBpV2KGRjja3CuEmu3DGp+maWtCBFDNttmZt/2gzNKsL32nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=yMt3jDjC; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1724702208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSNB16YmTmGtSszFku9OEpzxCSlM3sSnGKMEEle5Jqc=;
	b=yMt3jDjCx/B0z6xC082cVw0HQY4Me/FagDvE50oGlZZXCMF5Jq6LNhf+2Qxm6GxDSPpGhy
	osQCkmyACysyLu+u650VEqjzcGGEzFWl7uD9cGiG2uKMLG+neaKZVbHPdqs4NgFfV9kN36
	F6RecMyRzzHf5tUuKzWLlXy6Zq2aaUrO4Nqz767HIHttvZPw1xfRvEvz1/LRgm5SKRKgW5
	e98Q7S61cpPqJ69fgCnm4wfemUXqHoZmqLDjo7EW4Gn5fu5LKSLz7FsFpc5L1IqLMoKSNw
	zVNkFcO6HzXLN8irNUWL94mMo90EcrTYmktZgOLYwgwJL0BRUy5LS22/0nNbVQ==
Content-Type: multipart/signed;
 boundary=128cfb0fa1f91e2aae272ffecd950e1f386b558b6f3d91eca48fb6bdbb70;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 26 Aug 2024 21:56:34 +0200
Message-Id: <D3Q3WI8AHRJ1.3B8E985JAVVC2@cknow.org>
Cc: <airlied@gmail.com>, <alchark@gmail.com>, <andi.shyti@kernel.org>,
 <andyshrk@163.com>, <broonie@kernel.org>, <cl@rock-chips.com>,
 <conor+dt@kernel.org>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dsimic@manjaro.org>,
 <efectn@protonmail.com>, <finley.xiao@rock-chips.com>,
 <gregkh@linuxfoundation.org>, <heiko@sntech.de>, <honyuenkwun@gmail.com>,
 <jagan@edgeble.ai>, <jamie@jamieiles.com>, <jic23@kernel.org>,
 <jirislaby@kernel.org>, <jonas@kwiboo.se>, <jszhang@kernel.org>,
 <kernel@collabora.com>, <krzk+dt@kernel.org>, <lars@metafoo.de>,
 <lee@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux@roeck-us.net>, <maarten.lankhorst@linux.intel.com>,
 <macromorgan@hotmail.com>, <megi@xff.cz>, <michael.riesch@wolfvision.net>,
 <mripard@kernel.org>, <robh@kernel.org>, <tim@feathertop.org>,
 <tzimmermann@suse.de>, <ulf.hansson@linaro.org>, <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 11/12] arm64: dts: rockchip: Add rk3576 SoC base DT
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>, "Chukun Pan"
 <amadeus@jmu.edu.cn>
References: <23624422.6Emhk5qWAg@trenzalore>
 <20240825140824.200453-1-amadeus@jmu.edu.cn>
 <22403959.EfDdHjke4D@bootstrap>
In-Reply-To: <22403959.EfDdHjke4D@bootstrap>
X-Migadu-Flow: FLOW_OUT

--128cfb0fa1f91e2aae272ffecd950e1f386b558b6f3d91eca48fb6bdbb70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Aug 26, 2024 at 8:28 PM CEST, Detlev Casanova wrote:
> On Sunday, 25 August 2024 10:08:24 EDT Chukun Pan wrote:
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > > ...
> > > +		opp-1416000000 {
> > > +			opp-hz =3D /bits/ 64 <1416000000>;
> > > +			opp-microvolt =3D <725000 725000 950000>;
> > > +			opp-microvolt-L1 =3D <712500 712500 950000>;
> > > +			opp-microvolt-L2 =3D <700000 700000 950000>;
> > > +			opp-microvolt-L3 =3D <700000 700000 950000>;
> > > +			opp-microvolt-L4 =3D <700000 700000 950000>;
> > > +			opp-microvolt-L5 =3D <700000 700000 950000>;
> > > +			clock-latency-ns =3D <40000>;
> > > +		};
> > > ...
> >=20
> > I'm curious if these frequencies work properly. On the bsp kernel,
> > 'opp-microvolt-L<name>' is used by the PVTM driver, I don't know
> > if it works on the upstream kernel.
>
> Which seems to correspond to the set opp-hz value. As mentionned by Alexe=
y,=20
> the opp-microvolt-L.* values are not used by the driver.
>
> I also have not tested any cpufreq settings/driver on this board yet. I c=
an=20
> remove the opp-microvolt-L.* for now.

If you run this command on the upstream kernel:
``grep -r "opp-microvolt" arch/arm64/boot/dts/rockchip/``

you'll see it doesn't use the opp-microvolt-LN variants anywhere,
so this is indeed a downstream/BSP only thing.

--128cfb0fa1f91e2aae272ffecd950e1f386b558b6f3d91eca48fb6bdbb70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZszd+QAKCRDXblvOeH7b
bsPMAP9CORw/HV6VNrTduOL78GjAIEpWxM/M9+0BOgYkBHnzpQEAjK8fuZpW3HrN
ri8LuinsuvlO+D0OMT9SEJJAE8prZQE=
=pQv4
-----END PGP SIGNATURE-----

--128cfb0fa1f91e2aae272ffecd950e1f386b558b6f3d91eca48fb6bdbb70--

