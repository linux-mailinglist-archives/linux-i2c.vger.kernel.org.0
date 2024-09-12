Return-Path: <linux-i2c+bounces-6607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E66976195
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 08:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FBB0282EE4
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 06:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D01189530;
	Thu, 12 Sep 2024 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BTh6mtRk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408D188918
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726122932; cv=none; b=eefjj5/S2sS3XjU/A769qMRt7vAwXVsZm0OYAKTTgqF6j2UtImPWBgbCw8KZ2X8UJZMNR3Do7gJfbBmghmf83xVh42sWYKLjjoQe3vQcpffES0AU4xR04Gk+eB0AX+UGwNt13k/nuAjXdUgPTxoGIhvJokt4kFFvAGUHX6BfzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726122932; c=relaxed/simple;
	bh=mnGy8JwASG+Hv1/zsbYu6HTZgvX1VjQ5xqqUFng7TJY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0IvzPe1IxzF9UXxSvu1QrLJEMjJIbthKMHtmVtbXp0QJYtJj98O2ytjHlw3FbH6Zrl03k7FHAlbDDFayrrARtJ4UQJDEALFyiyVQAff1z+ZAltFX6QBcq4Rcp9zGfPyB+NZPiNGpLf4JEiF8MrJn5YvM2BTNUECksH20ZjVj0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BTh6mtRk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vSVN
	PCbeHNknNrnOe/NI4LVWOEozOzy9ZmVugjqJsBU=; b=BTh6mtRkTVS2K1ahhUEt
	3pAe7GhdN0gnJEe/+9lC4FK5+AHrax/AR3MpYkR3DXLBKJT9tuGjpUgpym20QxQQ
	vx8ZkVE7KLrIiUdwbDofzuxCPyox/vXwDWVQSdEn2o/HBlV12/cT/Vq96QQhTrZG
	yBgKZ+2h9A9VQaYgmebRAEX/VSwkv1OeqGcDfoP87MTi9CIhnKRTG9ESbyakj0rg
	SCjuo1QxBYd8T4x3AvOZv0Qha1OKI9FZTolZLGN5OeF9BF9riYgvu+OnZu08956E
	Cqx+kV0cvUq0Sa5mXsLmze83imis2JHlNqtIu4hY3EVfJrx4Iu2YP0/hVdObAhcQ
	gg==
Received: (qmail 788387 invoked from network); 12 Sep 2024 08:35:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2024 08:35:19 +0200
X-UD-Smtp-Session: l3s3148p1@qlprT+Yh8pRQT+F6
Date: Thu, 12 Sep 2024 08:35:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
Message-ID: <ZuKLpilWKCS5k7Kx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
 <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
 <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
 <Zt_3WtlRP_5wt4PN@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/k0KcEJ6kMjctRzk"
Content-Disposition: inline
In-Reply-To: <Zt_3WtlRP_5wt4PN@shikoro>


--/k0KcEJ6kMjctRzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I had this originally in my RFC[1]. I got convinced by Geert's arguments
> because the DT snippet in the board DTS looked kinda ugly. The board
> needs to override the DTSI of the SoC to replace "interrupts" with
> "interrupts-extended":
>=20
> =3D=3D=3D
>=20
>  &i2c3	{
>  	pinctrl-0 =3D <&i2c3_pins>;
>  	pinctrl-names =3D "i2c-pwr";
> +
> +	/delete-property/ interrupts;
> +	interrupts-extended =3D <&gic GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>, <&gpio1=
 26 IRQ_TYPE_EDGE_FALLING>;
> +	interrupt-names =3D "main", "smbus_alert";
> +
> +	smbus;
>  };
>=20
> =3D=3D=3D

I guess my questions here are: is this proper? Is there a better way to
describe it? Is using interrupts still the way to go?

Thanks for the guidance and happy hacking!


--/k0KcEJ6kMjctRzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbii6YACgkQFA3kzBSg
KbbZrQ/+ISHD3cqlO+60QfhsSyi6JOsnODJcQ0GXCMH42/CvwgF9zV8/DiDIZO+H
qvaGq6Czm+OTUp7HkY3FYsS5udF6XcQuZwfeAs70TkP8QAv9zW5HDFgzzfgazeWb
L20ycT1KF/ANUE9yJGGXV72dKaooMw0i03FZ/IjuJNX0J3yHCtgcbbXtme4XKq4D
6wI7peiNLg+uHhK57utE0A4yMsih9rm0ouPzwPjDn8yQhekn7B8jye/ICqAd9uKe
lpMNzJAksPoKu1CGOvML95b5TebachZSKLxzLC28THQ3SdbZ+B0AUYXcB4T+QDBH
/K1PxCte6BVl4/ed6tLaGJlDZ5lDYwYZDLqpSVAu1EnGKpYSvwS7Tv08hoT3yjig
7aXe0Txk0eE1w9Q15gfpedlh0uhp5Er5O/wi3WAdQALZ/zXQxQvqa2vro7aCJwz8
GiMjeJM1dbCLXRopUcWcpP2fM1Bh5YlM+MIHz8FpbY7IsJ8Al94USP5oIVl1pZ/X
WRPYRhCBg4ee8BZ60TQSoACjx8MilKtoSPviMqb/sKwAKsms83YGjJiNs+9uVpE5
iKdR/+95ovcqNnj1Y79fknAaSi6FLItcnIxtdDiNNJMdF/PsnheViZhGjGLiWSzq
adL59XnrU9Bvu86iHBKRnXWnLjYdnZf0OVNAK9FhPUP/gelclN0=
=JKkW
-----END PGP SIGNATURE-----

--/k0KcEJ6kMjctRzk--

