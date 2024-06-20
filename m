Return-Path: <linux-i2c+bounces-4137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DA910B1C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 18:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48CF61C23602
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 16:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256881B142E;
	Thu, 20 Jun 2024 16:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKmk0EwT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAE1AF697;
	Thu, 20 Jun 2024 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899577; cv=none; b=PNertmLfAzZCfE+A85Nxo2KD2WnYXlAi6yN35hLj0LulhzPKwdbPg1i9eGdhqt7x5xE5emZaCg3UlMIQkty+7zvAObCL1NJ2vQjiKooKabt9oWz54C4mWgna10o1bRNnNli5jnSpmAw/PMC5smOHWwtiKzTVRNKM/GfVgbjDdDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899577; c=relaxed/simple;
	bh=i2WiRp5EABtITG9AK2TqTOt26g3jSkXUUxnTNfCVMq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMMihh1QZo2lRHG+MoYsdiYXQVSR/oEQCN985p2uUytjZIVBeZY9DUIIcX2FWINm7NdEM8UYrcuHKfdEOCgNFbOeBvrd+Noq/wfdDda1CjwkArlE30n2G6mvWo+PeoSiPZu/iqAtItR+u8nsI4MkqBimI3vLNlVDayBvR+mCwJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKmk0EwT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40576C2BD10;
	Thu, 20 Jun 2024 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899577;
	bh=i2WiRp5EABtITG9AK2TqTOt26g3jSkXUUxnTNfCVMq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKmk0EwTNoxOWGlH2v07DF2unWqqSgPHL2w7MXJlzVc9I7chXRxKjQe/L2NGXZupG
	 UNj4Vdtd58q5X7sr7M7bQwWpAATyud7JONka7ePDgfbmS4QS6aHv/1H6Jea/GI0wsr
	 cS0oovA/BCovyaDtviZt7P0g0xC7oi/OBJURoHgtNJ41/tMbhmix7alKH5eaGDTlHU
	 UwqsvgNkb/rDdwiBSIajxDLFHk4/sZT9zybz22d88QbqxxQuLNaoA+GhVKq8RnSMhr
	 mC/1CYGO5Jsc3hEeYRYiCS6eTAAxYwlu4yaXaLbn7VzvQAhu5uu1p1Ksh0gjdKr41x
	 MFzAKhEG/iZlA==
Date: Thu, 20 Jun 2024 17:06:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sergiu Moga <sergiu.moga@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Doug Anderson <dianders@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct
 path to i2c-controller schema
Message-ID: <20240620-reggae-caucasian-11dcb3244161@spud>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
 <20240620-dt-bindings-i2c-clean-v1-2-3a1016a95f9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K6ixJu9bGXFv18P9"
Content-Disposition: inline
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-2-3a1016a95f9d@linaro.org>


--K6ixJu9bGXFv18P9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 01:34:50PM +0200, Krzysztof Kozlowski wrote:
> The referenced i2c-controller.yaml schema is provided by dtschema
> package (outside of Linux kernel), so use full path to reference it.
>=20
> Cc: <stable@vger.kernel.org>

I'd question whether this needs to go to stable (given the validation
seems to work anyway) but it'll get picked up automagically so why
not...

> Fixes: 1acd4577a66f ("dt-bindings: i2c: convert i2c-cros-ec-tunnel to jso=
n-schema")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml | 2=
 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tun=
nel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.=
yaml
> index ab151c9db219..580003cdfff5 100644
> --- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> +++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> @@ -21,7 +21,7 @@ description: |
>    google,cros-ec-spi or google,cros-ec-i2c.
> =20
>  allOf:
> -  - $ref: i2c-controller.yaml#
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> =20
>  properties:
>    compatible:
>=20
> --=20
> 2.43.0
>=20

--K6ixJu9bGXFv18P9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRTcAAKCRB4tDGHoIJi
0kXLAQCZRJ/FW5eVYlFgLQVwdTw60zRLbB5U2phtfe/39Y26eQD/aIyvkdWib7L7
pxarPTgkzcG7Mkqn187N9Xy+9dcxJgc=
=MMCH
-----END PGP SIGNATURE-----

--K6ixJu9bGXFv18P9--

