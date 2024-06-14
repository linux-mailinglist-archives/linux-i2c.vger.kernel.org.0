Return-Path: <linux-i2c+bounces-4031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA34908968
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 12:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00DDE28F59D
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4A7193092;
	Fri, 14 Jun 2024 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djDQ6xvM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22790192B7A;
	Fri, 14 Jun 2024 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359770; cv=none; b=SYqHyY4vAJZ/4K0zE1IJeHkzLKohu1ZDJF+fHFQZd+QH2muzuir6srX6BsGCINaJch/0HisLDw/mwq6wcLW8g9Eq89/wL1GsVxUYGweYxP/X2yYz0Ryk4UN7umoeg8HC9EzkYyayrockkP8rLvlIrHoL+0zAT+bCTtM/1vNXKqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359770; c=relaxed/simple;
	bh=v4F28CZ7Q1szKsWq5+Gh8c3sdOlAPghSCP3m/R+zW1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzPjg9a5TbtGUl8VRmjqmipCy+G8BqagfjmumOqvTpGO0gBM6ssLFFoyszS2+AZW1RyuzCN9mO3PQsFZx2UUkbNRACTjhdEEzFF0uKQI0V0RkXyERW0+NQ0XiPQYlgbCfrmMEwND9BjyuD+/dK3YFLQfgup41z5lQqaJcPn18X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djDQ6xvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E58CC2BD10;
	Fri, 14 Jun 2024 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718359769;
	bh=v4F28CZ7Q1szKsWq5+Gh8c3sdOlAPghSCP3m/R+zW1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djDQ6xvMsW2ObL+7HR1nKHGs3RtHIujfq60rfpHaxg+RaC7QZXYhENSABPQTnIjl1
	 PiHy9qctakh65tG4Xy4yydkFCf4sGFTcazHaoaZH3+IZ5tTD7tUL5Z1WiuaOiaY6fR
	 b4gwsTWi2PdowlPxv3IBaNwg5Rus7+z2bmkLRzux/cJwFU5iQX3JsQc/C8s3ZljvqC
	 mZVeMNI+IhUEoVa1DKGWxJeNqPMjV1lKJK1y2X4X279ZMvaBZTMhdk9Rfza1QBmGcU
	 kb0NQBaiCQayr3kfSqxkp9OBFpm//uh5QAkq2/+O+KxuYylttsJROCiD3rKPtD4FGk
	 hmlrfy4XKcIxw==
Date: Fri, 14 Jun 2024 12:09:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <mqxt2dygm5trfa2dtdl57o4yo5gxqppkvfuzah3no7uxesyqcs@klnejal4npp3>
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvb5uafbtlbt24pu"
Content-Disposition: inline
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>


--jvb5uafbtlbt24pu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 14, 2024 at 11:59:27AM +0200, Krzysztof Kozlowski wrote:
>  Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml        | 4 +++-
>  Documentation/devicetree/bindings/pwm/mxs-pwm.yaml            | 1 -
> [...]
> diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Doc=
umentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
> index 8bef9dfeba9a..ac0a35bf8648 100644
> --- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Freescale i.MX TPM PWM controller
> =20
>  maintainers:
> -  - Anson Huang <anson.huang@nxp.com>
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Fabio Estevam <festevam@gmail.com>
> =20
>  description: |
>    The TPM counter and period counter are shared between multiple
> diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documen=
tation/devicetree/bindings/pwm/mxs-pwm.yaml
> index 8f50e23ca8c9..a9d3a41ac5b9 100644
> --- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
> @@ -8,7 +8,6 @@ title: Freescale MXS PWM controller
> =20
>  maintainers:
>    - Shawn Guo <shawnguo@kernel.org>
> -  - Anson Huang <anson.huang@nxp.com>
> =20
>  allOf:
>    - $ref: pwm.yaml#

Fine for me. For the purpose of merging that via arm-soc:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

for Documentation/devicetree/bindings/pwm/*.

Best regards
Uwe

--jvb5uafbtlbt24pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZsFtIACgkQj4D7WH0S
/k4EHAf+NhFz4jBrYHkmJSlCa+y/zpFunECUX9/prffCWwkuDkMys9XVT+QCXyrR
GUfWrfUmCrjohnZXgVOES5bNUtgG6kieF2TIqKsi5zqrK4PMmu2PO0M4R1vmN0p1
zclZFy0XA6BKT0wUFKryJdf7SkZFIZqu1vuREDWzwwF2KuXquvqbhaGCkOEMqGMk
Wt3rcNS3JvR0pUkfoTW92eOm7DguVmpC9VpBdX8lacwCffZVAgzyyu1HCOFFb6Ip
b+uOVSbot7CQRaD0bzjfyozsVSAF94ytwUjuMIwsUFAJxltXdjeS9OxGU21YL2Jn
HVjXuqBgwCBQYOTK0cP7OyF9VBYd4w==
=EWbs
-----END PGP SIGNATURE-----

--jvb5uafbtlbt24pu--

