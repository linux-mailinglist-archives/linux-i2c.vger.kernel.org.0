Return-Path: <linux-i2c+bounces-5604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80C958C92
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 18:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8361F1C21F7B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 16:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B51A1BD00C;
	Tue, 20 Aug 2024 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlEUuVk8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4762C1BBBE4;
	Tue, 20 Aug 2024 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172303; cv=none; b=n2SI4vRqnfFMcSb6VG3mttVEcV+lG5aaC5TiIOxpD8Lb0IqbgEjBiErmQOUUmCUo+FE9HpaUtmjS4V9PosfgvwibH6ynPhsktfGa8SRMGwGvedYAJ3xKn7riY7Wb+CF9GnTcrGX51pNJNGHh9lsvkepmvHvO3C4Ku7IWXzatR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172303; c=relaxed/simple;
	bh=ho6JjNvEWuP+RY0IE/9AanBGhiT9wEqvz0ePooctFh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVgoWhQoovfiApHXsMeUHTvrI67ByWc1CMMvIijasGna4Sdb0N4WcFLQOmfyKKcjHFaZ4x4aKeZbKiuPOLzjq0pq+z4sKjCaaBHSsDQrk2Z97rM/intPC3kOMtGsMy56p31pW+K1hwnVvVip+BIz/nrI6oj4fIlcouD1huHUxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlEUuVk8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB2FC4AF0B;
	Tue, 20 Aug 2024 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724172303;
	bh=ho6JjNvEWuP+RY0IE/9AanBGhiT9wEqvz0ePooctFh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlEUuVk8K602CDJGNrteapJppPpyHPEnqiANWmQH2veRVn6NztdMZjuN6WvwznFGr
	 zDG6+xOqv7Pqt7ghohnjBT5k4GPhhFPcQI6P9p0lfdoCFBkWbDzNMoDWMWnsBh9SbP
	 DZqft6bGQ5I7YUm1kRg7t5/bFaCEoa+7J8vQY9GonAt7Pw5I4TOMIl5wkCo68AMHE6
	 5lbx+KhK/obomN73kG/L/YingDlCyNhuJRrMe5b61uh+epiFaba05Opdask0+0bF1H
	 cxg44OOBBTL1au/h3A/E4zqFu913DquVunsb82w9esDg1ZZ/gY66hbqAZM5X9w+63z
	 Ha/foAvvOseMA==
Date: Tue, 20 Aug 2024 17:44:57 +0100
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <20240820-skinning-submersed-855e69f5e3bc@spud>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-8-claudiu.beznea.uj@bp.renesas.com>
 <gxjlmdjicwzlexitsx673beyn7ijuf47637nao2luc5h6h6hvi@qstobttin7dw>
 <e6377448-9af3-4807-a8fd-197f5b2b4aa4@tuxon.dev>
 <56204f92-d1d4-4681-8a9d-f28925919ef4@kernel.org>
 <20240819-sizing-devouring-17b74473d1a1@spud>
 <709ddcee-637d-49d3-915b-0872b3c67f30@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1gDvInbFoz39wjDu"
Content-Disposition: inline
In-Reply-To: <709ddcee-637d-49d3-915b-0872b3c67f30@tuxon.dev>


--1gDvInbFoz39wjDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 10:45:43AM +0300, claudiu beznea wrote:
>=20
>=20
> On 19.08.2024 19:39, Conor Dooley wrote:
> > On Mon, Aug 19, 2024 at 01:22:39PM +0200, Krzysztof Kozlowski wrote:
> >> On 19/08/2024 13:10, claudiu beznea wrote:
> >>>
> >>>
> >>> On 19.08.2024 14:05, Krzysztof Kozlowski wrote:
> >>>> On Mon, Aug 19, 2024 at 01:23:44PM +0300, Claudiu wrote:
> >>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>
> >>>>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible=
 with
> >>>>> the version available on Renesas RZ/V2H (R9A09G075).
> >>>>>
> >>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>> ---
> >>>>>
> >>>>> Changes in v4:
> >>>>> - added comment near the fallback for RZ/G3S; because of this
> >>>>>   dropped Conor's tag
> >>>>
> >>>> That's not a reason to request a re-review.
> >=20
> > FWIW, I don't care about how many binding patches I do or do not get
> > credit for reviewing.=20
>=20
> I had no intention to drop your credit for reviewing this. In the past I

That comment was meant for Krzysztof, so that he wouldn't feel like he
should avoid acking so that I could re-ack in similar situations in the
future.

> went though situations where reviewer complained due to keeping the tag a=
nd
> doing very simple adjustment on the next version. I dropped your tag to
> avoid that situation here too and mentioned it in the change log.

Ye, I did note that you'd not dropped it confusingly :)

--1gDvInbFoz39wjDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsTICQAKCRB4tDGHoIJi
0umDAP98mMrlkJcnJlOU7ydEwjrI6uMCdk1ivrabenaRSFg/4wEAmHFDk5RqGg/m
htTGLITqSN6O52orO7nzj3xxLdB5VAI=
=byR0
-----END PGP SIGNATURE-----

--1gDvInbFoz39wjDu--

