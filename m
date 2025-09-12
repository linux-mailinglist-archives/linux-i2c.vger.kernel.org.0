Return-Path: <linux-i2c+bounces-12916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C3B547EB
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E533B2ECE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F66286885;
	Fri, 12 Sep 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDl2A0LO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9E2848B4;
	Fri, 12 Sep 2025 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669507; cv=none; b=UKZIA24I3cgOiR5xHITFq3td6ODh/lt5xPLFJQ++49ANkIiaOES2EGOgDtfIJxTJriAkU6LLZwARKPefdt67vDKXDrhTqxPpY3ugHqeflgWfPnZKe7FmJvt82CstGHTy22fUV5daefjy7tqFoncbF+Tl8qDLxo7JYYFNN1KR/fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669507; c=relaxed/simple;
	bh=cZZSj/PLAmvPikniIesMdJfhqh3VOpUH71TpGrecZ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIUScZ6Gzx9bxdDLH7qle5FByA8HOy260Awo0S7Oxp4PHfo+Ao6tQmigQBbIokDw0n6b0hp6GeL5M5lk5HzJ2BvuStC1kygrHoCX5vof//FsXAzmY+OrKjvhDBl4NyqVaa0zCR/EMPEbydokKZyLJO15Mdm+U2v+NSDoqSEsKsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDl2A0LO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB683C4CEF1;
	Fri, 12 Sep 2025 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757669506;
	bh=cZZSj/PLAmvPikniIesMdJfhqh3VOpUH71TpGrecZ8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDl2A0LOXO/1X2zNKv7aRnP0NHdkbAsbDDgwtZzvwmo12fpeFM2E3/tK2+Vtp6jDf
	 LtHjqH3FhqX9XCd49ZEoi9d2wFua1A1xl2NpXDXII2TJgNe2FaEGcY3H9R3K+d/kSk
	 i5GbpzjLt0Me2HD69Wbc5uGIc3TwgDS6JZFlUf4XXoZCI/2uPJn9w8cEPAn3NjkatI
	 mrNqigkcd6DbPU1UEsK3MA+M2bqLjMfjb8ArXgRSIyAq3CjGnxkE8s7LGICh/mIf7j
	 5pUu4Qe144CAGGymifmDXQ3yvwNpleByOIrvrEZ2XoQVUNyLe8+LbR96tJeBNXKw/y
	 Se8H2lBXfymbQ==
Date: Fri, 12 Sep 2025 11:31:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 20/37] dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm
 compatible
Message-ID: <ahxdf3l6zvmjp2nlgklg3go7biaimuz7qh5upnhohrrbrg62e6@gmi3pmbccwwe>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-20-507ba4c4b98e@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hd4ybrkt7tr5jevb"
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-20-507ba4c4b98e@jannau.net>


--hd4ybrkt7tr5jevb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 20/37] dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm
 compatible
MIME-Version: 1.0

Hello,

On Thu, Aug 28, 2025 at 04:01:39PM +0200, Janne Grunau wrote:
> The PWM controller on Apple's M2 Pro/Max SoCs behaves in the same way as
> on previous M1 and M2 SoCs. Add its per SoC compatible.
>=20
> At the same time fix the order of existing entries. The sort order logic
> is having SoC numeric code families in release order, and SoCs within
> each family in release order:
>=20
> - t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
>   - t8103 (Apple H13G/M1)
>   - t8112 (Apple H14G/M2)
> - t6xxx (Apple HxxJ series, "desktop" chips)
>   - t6000/t6001/t6002 (Apple H13J(S/C/D) / M1 Pro/Max/Ultra)
>   - t6020/t6021/t6022 (Apple H14J(S/C/D) / M2 Pro/Max/Ultra)
>=20
> Note that SoCs of the t600[0-2] / t602[0-2] family share the
> t6000 / t6020 compatible where the hardware is 100% compatible, which is
> usually the case in this highly related set of SoCs.
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/=
Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> index 142157bff0cd851c85fbf0132d734d470c5a0761..04519b0c581d0e9fb1ae6aa21=
9a4e850027de6a2 100644
> --- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> @@ -17,8 +17,9 @@ properties:
>      items:
>        - enum:
>            - apple,t8103-fpwm
> -          - apple,t6000-fpwm
>            - apple,t8112-fpwm
> +          - apple,t6000-fpwm
> +          - apple,t6020-fpwm
>        - const: apple,s5l-fpwm
> =20
>    reg:

The patch is fine for me. There was no merge plan sketched out in the
cover letter and I don't spot any dependencies this patch is a part of.
So I applied this patch to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

as 6.18-rc1 material.

Best regards
Uwe

--hd4ybrkt7tr5jevb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjD6HwACgkQj4D7WH0S
/k5dDwf/ZhdoZ04wcFscsQjfQPV9sY5Kzs8OxPgL+m4AV85SDwzSuZybeACCfsL2
U+r2uMlK/Q21DJwXbTJjmnyAe19XWYtcvtUfKd50OAsoPnpijd6XN/VzkpPwSI1v
MM1rZmYLCNhucLOPo87uqSwtHmOGOiHGefUgolr3pa9kl2VjNfe2U9byQTQegxaK
CxeDN6bZEPo8n7PoU1mmnwFDouEZD1xzQt3FdvPpL2XORk2Ye5r89n1q02uTLbkj
EsQ7IOSbpp2UDyIkxF0ESV6nWtpLn7AIB0rNABUH7JZA9FQ29vzAc9a3FRiLJsUa
2cvxXsdWOdhpncFiR4L1mRq39BoLAQ==
=7x/6
-----END PGP SIGNATURE-----

--hd4ybrkt7tr5jevb--

